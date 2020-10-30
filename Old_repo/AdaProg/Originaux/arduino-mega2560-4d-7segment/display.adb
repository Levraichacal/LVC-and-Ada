--
-- 4-digit 7-segment control using Arduino MEGA 2560
--
-- Copyright (C) 2012  Tero Koskinen <tero.koskinen@iki.fi>
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
-- USA.
--
-- As a special exception, if other files instantiate generics from this
-- unit,  or  you  link  this  unit  with  other  files  to  produce  an
-- executable   this  unit  does  not  by  itself  cause  the  resulting
-- executable to  be  covered by the  GNU General  Public License.  This
-- exception does  not  however  invalidate  any  other reasons why  the
-- executable file might be covered by the GNU Public License.
--

with Interfaces;
with AVR;
with AVR.MCU;
with AVR.Wait;

use AVR;
use Interfaces;

procedure Display is

   -- pin mapping
   --
   -- 52 = B1 = pin 11 = F
   -- 51 = B2 = pin 13 = C
   -- 50 = B3 = pin 16 = B
   -- 13 = B7 = pin 5  = E
   -- 12 = B6 = pin 3  = D
   -- 11 = B5 = pin 14 = A
   -- 10 = B4 = pin 15 = G
   --
   -- A5 = F5 = pin 8 = DIG 4
   -- A6 = F6 = pin 6 = DIG 3
   -- A7 = F7 = pin 2 = DIG 2
   -- A8 = K0 = pin 1 = DIG 1

   procedure Wait_Some_USecs is new AVR.Wait.Generic_Wait_USecs
     (Crystal_Hertz => 16_000_000, Micro_Seconds => 2_000);

   type Digit_Led is (D1, D2, D3, D4);

   procedure Enable_Led (L : Digit_Led) is
   begin
      case L is
         when D1 =>
            MCU.PORTF_Bits (5) := False;
            MCU.PORTF_Bits (6) := False;
            MCU.PORTF_Bits (7) := False;
            MCU.PORTK_Bits (0) := True;
         when D2 =>
            MCU.PORTF_Bits (5) := False;
            MCU.PORTF_Bits (6) := False;
            MCU.PORTF_Bits (7) := True;
            MCU.PORTK_Bits (0) := False;
         when D3 =>
            MCU.PORTF_Bits (5) := False;
            MCU.PORTF_Bits (6) := True;
            MCU.PORTF_Bits (7) := False;
            MCU.PORTK_Bits (0) := False;
         when D4 =>
            MCU.PORTF_Bits (5) := True;
            MCU.PORTF_Bits (6) := False;
            MCU.PORTF_Bits (7) := False;
            MCU.PORTK_Bits (0) := False;
      end case;
   end Enable_Led;

   type Digit_Type is new Unsigned_8 range 0 .. 9;
   type Digit_Array is array (Digit_Type) of Unsigned_8;

   Segment_Digits : Digit_Array :=
           -- EDAGBCFx
      (0 => 2#00010000#,
       1 => 2#11110010#,
       2 => 2#00000110#,
       3 => 2#10000010#,
       4 => 2#11100000#,
       5 => 2#10001000#,
       6 => 2#00001000#,
       7 => 2#11010010#,
       8 => 2#00000000#,
       9 => 2#11000000#);

   procedure Show_Digit (D : Digit_Type) is
   begin
      MCU.PORTB := Segment_Digits (D);
   end Show_Digit;

begin
   MCU.DDRB_Bits := (others => DD_Output);

   MCU.DDRF_Bits (5) := DD_Output;
   MCU.DDRF_Bits (6) := DD_Output;
   MCU.DDRF_Bits (7) := DD_Output;
   MCU.DDRK_Bits (0) := DD_Output;

   MCU.PORTB_Bits := (others => True);
   MCU.PORTF_Bits := (others => False);
   MCU.PORTK_Bits := (others => False);

   MCU.PORTB_Bits (0) := False;
   MCU.PORTB_Bits (1) := False;
   MCU.PORTK_Bits (0) := True;
   MCU.PORTF_Bits (7) := True;

   loop
      Enable_Led (D4);
      Show_Digit (1);
      Wait_Some_USecs;
      MCU.PORTB := 0;

      Enable_Led (D3);
      Show_Digit (2);
      Wait_Some_USecs;
      MCU.PORTB := 0;

      Enable_Led (D2);
      Show_Digit (3);
      Wait_Some_USecs;
      MCU.PORTB := 0;

      Enable_Led (D1);
      Show_Digit (4);
      Wait_Some_USecs;
      MCU.PORTB := 0;
   end loop;
end Display;
