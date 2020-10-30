--
--  MOD-LCD3310 Code for AVR-Ada
--  Copyright (C) 2005 OLIMEX  LTD.
--  Copyright (C) 2013  Tero Koskinen <tero.koskinen@iki.fi>
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
--
--
-- Ada code converted from Olimex example.
-- See
-- https://github.com/OLIMEX/OLINUXINO/tree/master/SOFTWARE/iMX233/MOD-LCD3310
-- for the original code.

with AVR;
with AVR.Config;
with AVR.MCU;
with AVR.Wait;
with AVR.Programspace;
with Soft_SPI;
with System;

package body LCD3310 is
   use AVR;
   procedure Wait_1ms is
     new AVR.Wait.Generic_Wait_Usecs
       (Crystal_Hertz => AVR.Config.Clock_Frequency,
        Micro_Seconds => 1000);
   pragma Inline_Always (Wait_1ms);

   LCD_Memory : array (Unsigned_16 range 1 .. X_Resolution, Row_Index)
     of Unsigned_8;

   -- uext pin 10 = D10/SS (PB2) or D7 (PD7)
   LCD_CS_Pin : Boolean renames AVR.MCU.PORTD_Bits (7);
   LCD_CS_DD  : Boolean renames AVR.MCU.DDRD_Bits (7);

   -- uext pin 5 = A5/SCL (PC5)
   LCD_RESET_Pin : Boolean renames AVR.MCU.PORTC_Bits (5);
   LCD_RESET_DD  : Boolean renames AVR.MCU.DDRC_Bits (5);

   -- uext pin 6 = A4/SDA (PC4)
   LCD_DC_Pin : Boolean renames AVR.MCU.PORTC_Bits (4);
   LCD_DC_DD  : Boolean renames AVR.MCU.DDRC_Bits (4);

   SEND_CMD : constant Boolean := False;
   SEND_CHR : constant Boolean := True;

   Fonts : constant array (Unsigned_8 range 0..93, Unsigned_8 range 0..4) of
     Unsigned_8 :=
      (
         ( 16#00#, 16#00#, 16#00#, 16#00#, 16#00# ),   -- sp
         ( 16#00#, 16#00#, 16#2f#, 16#00#, 16#00# ),   -- !
         ( 16#00#, 16#07#, 16#00#, 16#07#, 16#00# ),   -- "
         ( 16#14#, 16#7f#, 16#14#, 16#7f#, 16#14# ),   -- #
         ( 16#24#, 16#2a#, 16#7f#, 16#2a#, 16#12# ),   -- $
         ( 16#c4#, 16#c8#, 16#10#, 16#26#, 16#46# ),   -- %
         ( 16#36#, 16#49#, 16#55#, 16#22#, 16#50# ),   -- &
         ( 16#00#, 16#05#, 16#03#, 16#00#, 16#00# ),   -- '
         ( 16#00#, 16#1c#, 16#22#, 16#41#, 16#00# ),   -- (
         ( 16#00#, 16#41#, 16#22#, 16#1c#, 16#00# ),   -- )
         ( 16#14#, 16#08#, 16#3E#, 16#08#, 16#14# ),   -- *
         ( 16#08#, 16#08#, 16#3E#, 16#08#, 16#08# ),   -- +
         ( 16#00#, 16#00#, 16#50#, 16#30#, 16#00# ),   -- ,
         ( 16#10#, 16#10#, 16#10#, 16#10#, 16#10# ),   -- -
         ( 16#00#, 16#60#, 16#60#, 16#00#, 16#00# ),   -- .
         ( 16#20#, 16#10#, 16#08#, 16#04#, 16#02# ),   -- /
         ( 16#3E#, 16#51#, 16#49#, 16#45#, 16#3E# ),   -- 0
         ( 16#00#, 16#42#, 16#7F#, 16#40#, 16#00# ),   -- 1
         ( 16#42#, 16#61#, 16#51#, 16#49#, 16#46# ),   -- 2
         ( 16#21#, 16#41#, 16#45#, 16#4B#, 16#31# ),   -- 3
         ( 16#18#, 16#14#, 16#12#, 16#7F#, 16#10# ),   -- 4
         ( 16#27#, 16#45#, 16#45#, 16#45#, 16#39# ),   -- 5
         ( 16#3C#, 16#4A#, 16#49#, 16#49#, 16#30# ),   -- 6
         ( 16#01#, 16#71#, 16#09#, 16#05#, 16#03# ),   -- 7
         ( 16#36#, 16#49#, 16#49#, 16#49#, 16#36# ),   -- 8
         ( 16#06#, 16#49#, 16#49#, 16#29#, 16#1E# ),   -- 9
         ( 16#00#, 16#36#, 16#36#, 16#00#, 16#00# ),   -- :
         ( 16#00#, 16#56#, 16#36#, 16#00#, 16#00# ),   -- ;
         ( 16#08#, 16#14#, 16#22#, 16#41#, 16#00# ),   -- <
         ( 16#14#, 16#14#, 16#14#, 16#14#, 16#14# ),   -- =
         ( 16#00#, 16#41#, 16#22#, 16#14#, 16#08# ),   -- >
         ( 16#02#, 16#01#, 16#51#, 16#09#, 16#06# ),   -- ?
         ( 16#32#, 16#49#, 16#59#, 16#51#, 16#3E# ),   -- @
         ( 16#7E#, 16#11#, 16#11#, 16#11#, 16#7E# ),   -- A
         ( 16#7F#, 16#49#, 16#49#, 16#49#, 16#36# ),   -- B
         ( 16#3E#, 16#41#, 16#41#, 16#41#, 16#22# ),   -- C
         ( 16#7F#, 16#41#, 16#41#, 16#22#, 16#1C# ),   -- D
         ( 16#7F#, 16#49#, 16#49#, 16#49#, 16#41# ),   -- E
         ( 16#7F#, 16#09#, 16#09#, 16#09#, 16#01# ),   -- F
         ( 16#3E#, 16#41#, 16#49#, 16#49#, 16#7A# ),   -- G
         ( 16#7F#, 16#08#, 16#08#, 16#08#, 16#7F# ),   -- H
         ( 16#00#, 16#41#, 16#7F#, 16#41#, 16#00# ),   -- I
         ( 16#20#, 16#40#, 16#41#, 16#3F#, 16#01# ),   -- J
         ( 16#7F#, 16#08#, 16#14#, 16#22#, 16#41# ),   -- K
         ( 16#7F#, 16#40#, 16#40#, 16#40#, 16#40# ),   -- L
         ( 16#7F#, 16#02#, 16#0C#, 16#02#, 16#7F# ),   -- M
         ( 16#7F#, 16#04#, 16#08#, 16#10#, 16#7F# ),   -- N
         ( 16#3E#, 16#41#, 16#41#, 16#41#, 16#3E# ),   -- O
         ( 16#7F#, 16#09#, 16#09#, 16#09#, 16#06# ),   -- P
         ( 16#3E#, 16#41#, 16#51#, 16#21#, 16#5E# ),   -- Q
         ( 16#7F#, 16#09#, 16#19#, 16#29#, 16#46# ),   -- R
         ( 16#46#, 16#49#, 16#49#, 16#49#, 16#31# ),   -- S
         ( 16#01#, 16#01#, 16#7F#, 16#01#, 16#01# ),   -- T
         ( 16#3F#, 16#40#, 16#40#, 16#40#, 16#3F# ),   -- U
         ( 16#1F#, 16#20#, 16#40#, 16#20#, 16#1F# ),   -- V
         ( 16#3F#, 16#40#, 16#38#, 16#40#, 16#3F# ),   -- W
         ( 16#63#, 16#14#, 16#08#, 16#14#, 16#63# ),   -- X
         ( 16#07#, 16#08#, 16#70#, 16#08#, 16#07# ),   -- Y
         ( 16#61#, 16#51#, 16#49#, 16#45#, 16#43# ),   -- Z
         ( 16#00#, 16#7F#, 16#41#, 16#41#, 16#00# ),   -- [
         ( 16#55#, 16#2A#, 16#55#, 16#2A#, 16#55# ),   -- 55
         ( 16#00#, 16#41#, 16#41#, 16#7F#, 16#00# ),   -- ]
         ( 16#04#, 16#02#, 16#01#, 16#02#, 16#04# ),   -- ^
         ( 16#40#, 16#40#, 16#40#, 16#40#, 16#40# ),   -- _
         ( 16#00#, 16#01#, 16#02#, 16#04#, 16#00# ),   -- '
         ( 16#20#, 16#54#, 16#54#, 16#54#, 16#78# ),   -- a
         ( 16#7F#, 16#48#, 16#44#, 16#44#, 16#38# ),   -- b
         ( 16#38#, 16#44#, 16#44#, 16#44#, 16#20# ),   -- c
         ( 16#38#, 16#44#, 16#44#, 16#48#, 16#7F# ),   -- d
         ( 16#38#, 16#54#, 16#54#, 16#54#, 16#18# ),   -- e
         ( 16#08#, 16#7E#, 16#09#, 16#01#, 16#02# ),   -- f
         ( 16#0C#, 16#52#, 16#52#, 16#52#, 16#3E# ),   -- g
         ( 16#7F#, 16#08#, 16#04#, 16#04#, 16#78# ),   -- h
         ( 16#00#, 16#44#, 16#7D#, 16#40#, 16#00# ),   -- i
         ( 16#20#, 16#40#, 16#44#, 16#3D#, 16#00# ),   -- j
         ( 16#7F#, 16#10#, 16#28#, 16#44#, 16#00# ),   -- k
         ( 16#00#, 16#41#, 16#7F#, 16#40#, 16#00# ),   -- l
         ( 16#7C#, 16#04#, 16#18#, 16#04#, 16#78# ),   -- m
         ( 16#7C#, 16#08#, 16#04#, 16#04#, 16#78# ),   -- n
         ( 16#38#, 16#44#, 16#44#, 16#44#, 16#38# ),   -- o
         ( 16#7C#, 16#14#, 16#14#, 16#14#, 16#08# ),   -- p
         ( 16#08#, 16#14#, 16#14#, 16#18#, 16#7C# ),   -- q
         ( 16#7C#, 16#08#, 16#04#, 16#04#, 16#08# ),   -- r
         ( 16#48#, 16#54#, 16#54#, 16#54#, 16#20# ),   -- s
         ( 16#04#, 16#3F#, 16#44#, 16#40#, 16#20# ),   -- t
         ( 16#3C#, 16#40#, 16#40#, 16#20#, 16#7C# ),   -- u
         ( 16#1C#, 16#20#, 16#40#, 16#20#, 16#1C# ),   -- v
         ( 16#3C#, 16#40#, 16#30#, 16#40#, 16#3C# ),   -- w
         ( 16#44#, 16#28#, 16#10#, 16#28#, 16#44# ),   -- x
         ( 16#0C#, 16#50#, 16#50#, 16#50#, 16#3C# ),   -- y
         ( 16#44#, 16#64#, 16#54#, 16#4C#, 16#44# ),   -- z
         ( 16#08#, 16#6C#, 16#6A#, 16#19#, 16#08# ),   -- { (gramotevichka)
         ( 16#0C#, 16#12#, 16#24#, 16#12#, 16#0C# ),   -- | (sarce)
         ( 16#7E#, 16#7E#, 16#7E#, 16#7E#, 16#7E# )     -- kvadratche
      );
   pragma Linker_Section (Fonts, ".progmem");
   Fonts_W : constant := 5;


   procedure LCD_Send (Data : Unsigned_8; DC : Boolean) is
   begin
      LCD_CS_Pin := Low;
      LCD_DC_Pin := DC;

      Soft_SPI.Send_Byte (Data);
      LCD_CS_Pin := High;
   end LCD_Send;

   procedure Init is
      use AVR;
   begin
      Soft_SPI.Init;

      LCD_CS_DD := DD_Output;
      LCD_DC_DD := DD_Output;
      LCD_RESET_DD := DD_Output;

      LCD_CS_Pin := High;

      LCD_RESET_Pin := Low;
      Wait_1ms;
      LCD_RESET_Pin := High;
      Wait_1ms;

      LCD_Send (2#11#, SEND_CMD); -- reset
      LCD_Send (16#21#, SEND_CMD); -- extended commands
      LCD_Send (16#EF#, SEND_CMD); -- contrast
      LCD_Send (16#04# or 1, SEND_CMD);
      LCD_Send (16#40# or 2#000000#, SEND_CMD);
      LCD_Send (16#12#, SEND_CMD); -- bias 1:68
      LCD_Send (16#20#, SEND_CMD); -- standard cmds, horiz addr mode
      LCD_Send (16#08#, SEND_CMD); -- blank
      LCD_Send (16#0C#, SEND_CMD); -- normal mode

      Clear;
      Update;
   end Init;

   procedure Update is
   begin
      for Y in Row_Index loop
         LCD_Send (16#80#, SEND_CMD);
         LCD_Send (16#40# or Unsigned_8 (Y - 1), SEND_CMD);

         for X in Unsigned_16 range 1 .. X_Resolution loop
            LCD_Send (LCD_Memory (X, Y), SEND_CHR);
         end loop;
      end loop;
   end Update;

   procedure Clear is
   begin
      for Y in Row_Index'Range loop
         for X in Unsigned_16 range 1 .. X_Resolution loop
            LCD_Memory (X, Y) := 0;
         end loop;
      end loop;
   end Clear;

   procedure Draw_Char (Ch : Character;
                        X_Pos : Column_Index;
                        Y_Pos : Row_Index) is
      use type System.Address;

      Offset : Unsigned_8;
      Index : Unsigned_16 := Unsigned_16 ((Unsigned_8 (X_Pos) - 1) * 8) * 6 +
                             Unsigned_16 ((Unsigned_8 (Y_Pos) - 1)) * X_Resolution;
      Place : System.Address;
   begin
      for I in Unsigned_8 range 0 .. 4 loop
         if Character'Pos (Ch) < 32 or Character'Pos (Ch) > 93 then
            Place := Fonts (0, I)'Address;
         else
            Place := Fonts (Character'Pos (Ch) - 32, I)'Address;
         end if;
         Offset := Programspace.Get_Byte (Place);
         LCD_Memory (Unsigned_16 (X_Pos) * 8 + Unsigned_16 (I), Y_Pos) :=
            Offset;
         Index := Index + 1;
      end loop;
      LCD_Memory (Unsigned_16 (X_Pos) * 8 + 5, Y_Pos) := 0;
   end Draw_Char;

   procedure Draw_Pixel (X_Pos : X_Coords; Y_Pos : Y_Coords) is
      Y : Row_Index := Row_Index (Y_Coords'First + (Y_Pos - Y_Coords'First) / 8);
      Extra : Natural := Natural ((Y_Pos - Y_Coords'First) mod 8);
   begin
      LCD_Memory (Unsigned_16 (X_Pos), Y) :=
         LCD_Memory (Unsigned_16 (X_Pos), Y) or (2 ** Extra);
   end Draw_Pixel;

   procedure Draw_Line (X1 : X_Coords; Y1 : Y_Coords;
                        X2 : X_Coords; Y2 : Y_Coords) is
      X : X_Coords := X1;
      Y : Y_Coords := Y1;
      DX : X_Coords := abs (X2 - X1);
      DY : Y_Coords := abs (Y2 - Y1);
      Err, E2 : Integer;
      SX : Integer;
      SY : Integer;
   begin
      if X1 < X2 then
         SX := 1;
      else
         SX := -1;
      end if;
      if Y1 < Y2 then
         SY := 1;
      else
         SY := -1;
      end if;

      Err := Integer (DX) - Integer (DY);

      loop
         Draw_Pixel (X, Y);

         exit when X = X2 and Y = Y2;
         E2 := 2 * Err;

         if E2 > 0 - Integer (DY) then
            Err := Err - Integer (DY);
            X := X_Coords (Integer (X) + SX);
         end if;
         if E2 < Integer (DX) then
            Err := Err + Integer (DX);
            Y := Y_Coords (Integer (Y) + SY);
         end if;
      end loop;
   end Draw_Line;


   procedure Put_Line (Str : AVR.Strings.AVR_String; Y_Pos : Row_Index) is
   begin
      for I in Str'Range loop
         Draw_Char (Ch => Str (I),
                    X_Pos => Column_Index (I),
                    Y_Pos => Y_Pos);
      end loop;
   end Put_Line;
end LCD3310;
