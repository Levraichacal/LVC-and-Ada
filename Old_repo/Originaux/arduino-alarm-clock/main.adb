--
-- DS1307-based alarm clock for AVR-Ada
--
-- Copyright (C) 2013  Tero Koskinen <tero.koskinen@iki.fi>
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


with AVR;
with AVR.MCU;
with AVR.UART;
with Interfaces;
with AVR.Int_Img;
with AVR.Strings;
with AVR.Real_Time;
with AVR.Real_Time.Delays;
with AVR.Real_Time.Clock;
with AVR.EEprom;

with LCD;
with DS1307;

use AVR;

procedure Main is
   use Interfaces;
   use AVR.Strings;

   Input_Buffer : aliased AVR.Nat8_Array := (0, 0, 0, 0);

   I_Ptr : UART.Buffer_Ptr := UART.Buffer_Ptr'(Input_Buffer'Unchecked_Access);

   function Char_To_Int (C : Character) return Interfaces.Unsigned_8 is
   begin
      if C >= '0' and C <= '9' then
         return Character'Pos (C) - Character'Pos ('0');
      else
         return 0;
      end if;
   end Char_To_Int;

   function Str_To_Int (S : AVR.Strings.AVR_String)
     return Interfaces.Unsigned_8
   is
      V : Interfaces.Unsigned_8 := 0;
      Multiplier : Interfaces.Unsigned_8 := 1;
   begin
      for A in reverse S'Range loop
         V := V + Char_To_Int (S (A)) * Multiplier;
         Multiplier := Multiplier * 10;
      end loop;

      return V;
   end Str_To_Int;

   procedure Wait_Input (Got_Input : out Boolean) is
      use type AVR.Real_Time.Time;
      use type AVR.Real_Time.Duration;
      Start_Time : AVR.Real_Time.Time;
   begin
      Start_Time := AVR.Real_Time.Clock;
      Got_Input := False;
      loop
         exit when AVR.Real_Time.Clock - Start_Time > 5.0;
         delay 0.5;
         AVR.UART.Put (".");
         if AVR.UART.Have_Input then
            AVR.UART.CRLF;
            Got_Input := True;
            declare
               Ch : Character := AVR.UART.Get;
            begin
               loop
                  exit when not UART.Have_Input;
                  Ch := AVR.UART.Get;
               end loop;
            end;
            exit;
         end if;
      end loop;
   end Wait_Input;

   function Format_U8 (V : Unsigned_8) return AVR.Strings.AStr3 is
      I : AVR.Strings.AStr3 := (others => ' ');
      R : AVR.Strings.AStr3 := (others => ' ');
      L : Unsigned_8;
   begin
      AVR.Int_Img.U8_Img (Data => V,
                          Target => I,
                          Last   => L);
      if V < 10 then
         R (1) := '0';
         R (2..3) := I (1..2);
      else
         return I;
      end if;

      return R;
   end Format_U8;

   procedure Print_U8 (V : Unsigned_8) is
   begin
      AVR.UART.Put (Format_U8 (V));
   end Print_U8;

   procedure Print_Time (T : DS1307.Date_Time) is
      use AVR.UART;
   begin
      Put ("T:");
      Print_U8 (T.Year);
      Put ('-');
      Print_U8 (T.Month);
      Put ('-');
      Print_U8 (T.Day);
      Put (' ');
      Print_U8 (T.Hours);
      Put (':');
      Print_U8 (T.Minutes);
      Put (':');
      Print_U8 (T.Seconds);
      CRLF;
   end Print_Time;

   procedure Print_Time_LCD (T : DS1307.Date_Time;
                             Alarm_HH : Unsigned_8;
                             Alarm_MM : Unsigned_8;
                             Alarm_On : Boolean) is
      I : AVR.Strings.AStr3;
      Line  : AVR.Strings.AVR_String (1..16) := (others => ' ');
      Line2 : AVR.Strings.AVR_String (1..16) := (others => ' ');
      L : Unsigned_8;
   begin
      I := Format_U8 (T.Hours);
      Line (3..4) := I (1..2);
      I := Format_U8 (T.Minutes);
      Line (6..7) := I (1..2);
      I := Format_U8 (T.Seconds);
      Line (9..10) := I (1..2);

      Line2 (1..7) := "Alarm: ";

      I := Format_U8 (Alarm_HH);
      Line2 (8..9) := I (1..2);
      I := Format_U8 (Alarm_MM);
      Line2 (11..12) := I (1..2);
      Line2 (10) := ':';

      if Alarm_On then
         Line2 (14..15) := "on";
      else
         Line2 (14..16) := "off";
      end if;

      -- LCD.Clear_Screen;
      LCD.GotoXY (1,1);
      LCD.Put (Line);
      LCD.GotoXY (1,2);
      LCD.Put (Line2);
      -- LCD3310.Clear;
      -- LCD3310.Put_Line (I (1..L), 1);
      -- LCD3310.Update;
   end Print_Time_LCD;

   procedure Play_Alarm is
      C : Unsigned_8 := 0;
   begin
      MCU.DDRB_Bits (1) := DD_Output;
      MCU.PORTB_Bits (1) := False;
      loop
         for A in Unsigned_8 range 1 .. 100 loop
            MCU.PORTB_Bits (1) := True;
            delay 0.002;
            MCU.PORTB_Bits (1) := False;
            delay 0.002;
         end loop;
         delay 0.5;

         C := C + 1;
         exit when C > 5;
      end loop;
   end Play_Alarm;

   HH_EEPROM_Address : constant := 1;
   MM_EEPROM_Address : constant := 2;
   Alarm_On_EEPROM_Address : constant := 0;

   procedure Load_Alarm (HH, MM : out Unsigned_8; Alarm_On : out Boolean) is
   begin
      HH := EEprom.Get (EEprom.EEprom_Address (HH_EEPROM_Address));
      MM := EEprom.Get (EEprom.EEprom_Address (MM_EEPROM_Address));
      Alarm_On :=
        (EEprom.Get (EEprom.EEprom_Address (Alarm_On_EEPROM_Address)) and 1) = Unsigned_8 (1);
   end Load_Alarm;

   procedure Save_Alarm (HH, MM : Unsigned_8; Alarm_On : Boolean) is
   begin
      EEprom.Put (EEprom.EEprom_Address (HH_EEPROM_Address), HH);
      EEprom.Put (EEprom.EEprom_Address (MM_EEPROM_Address), MM);
      if Alarm_On then
         EEprom.Put (EEprom.EEprom_Address
                    (Alarm_On_EEPROM_Address), Unsigned_8 (1));
      else
         EEprom.Put (EEprom.EEprom_Address
                    (Alarm_On_EEPROM_Address), Unsigned_8 (0));
      end if;
   end Save_Alarm;

   Ask_Time : Boolean;
   Current_Time : DS1307.Date_Time;
   Read_Ok : Boolean;
   C : Character;

   Alarm_HH, Alarm_MM : Unsigned_8;
   Alarm_On : Boolean := False;
   Alarm_Done : Boolean := False;
begin
   DS1307.Init;
   LCD.Init;
   LCD.Clear_Screen;
   LCD.Put ("Initializing");
   -- LCD3310.Draw_Char ('X', 5, 5);
   -- LCD3310.Update;
   UART.Init_Interrupt_Read (UART.Baud_9600_16MHz, False, I_Ptr);
   Wait_Input (Ask_Time);

   if Ask_Time then
      declare
         Line : AVR.Strings.AVR_String (1..17);
         L : Unsigned_8;
         YY, MM, DD, Hours, Minutes, Seconds : Unsigned_8;
      begin
         UART.Put("Enter time in YY-MM-DD HH:MM:SS format and press enter:");
         UART.CRLF;
         UART.Get_Line (Line, L);
         if L < 17 then
            UART.Put ("Not enough input");
            UART.CRLF;
         else
            AVR.UART.Put ("Got: ");
            AVR.UART.Put (Line (1..L));
            AVR.UART.CRLF;
            YY := Str_To_Int (Line (1..2));
            MM := Str_To_Int (Line (4..5));
            DD := Str_To_Int (Line (7..8));
            Hours := Str_To_Int (Line (10..11));
            Minutes := Str_To_Int (Line (13..14));
            Seconds := Str_To_Int (Line (16..17));

            AVR.UART.Put ("Setting time");
            AVR.UART.CRLF;

            DS1307.Set_Time (DS1307.Date_Time'
               (Seconds => Seconds,
                Minutes => Minutes,
                Hours   => Hours,
                Day     => DD,
                Month   => MM,
                Year    => YY)
              );

         end if;
      end;
   end if;

   Load_Alarm (Alarm_HH, Alarm_MM, Alarm_On);

   if DS1307.Is_Running then
      UART.Put("Clock is running"); UART.CRLF;
   else
      UART.Put("Clock NOT running"); UART.CRLF;
   end if;

   LCD.Clear_Screen;
   DS1307.Read_Time (Current_Time, Read_Ok);
   if Read_Ok then
      Print_Time (Current_Time);
      Print_Time_LCD (Current_Time, Alarm_HH, Alarm_MM, Alarm_On);
   else
      AVR.UART.Put ("DS1307: Read_Time error");
      AVR.UART.CRLF;
   end if;

   loop
      delay 0.3;
      DS1307.Read_Time (Current_Time, Read_Ok);
      if Read_Ok then
         Print_Time (Current_Time);
         Print_Time_LCD (Current_Time, Alarm_HH, Alarm_MM, Alarm_On);
      end if;

      if UART.Have_Input then
         declare
            C : Character := UART.Get;
            Line : AVR.Strings.AVR_String (1..5);
            L : Unsigned_8;
         begin
            if C = 'A' then
               UART.Put ("Enter alarm time (HH:MM):");
               UART.CRLF;
               UART.Get_Line (Line, L);

               Alarm_HH := Str_To_Int (Line (1..2));
               Alarm_MM := Str_To_Int (Line (3..5));
               UART.CRLF;

               if Alarm_HH > 23 or Alarm_MM > 59 then
                  UART.Put ("Alarm disabled");
                  Alarm_On := False;
               else
                  UART.Put ("Alarm set to ");
                  Print_U8 (Alarm_HH);
                  UART.Put (":");
                  Print_U8 (Alarm_MM);

                  Alarm_On := True;
                  Alarm_Done := False;
               end if;

               Save_Alarm (Alarm_HH, Alarm_MM, Alarm_On);
               UART.CRLF;
            end if;
         end;

         loop
            exit when not UART.Have_Input;
            C := UART.Get;
         end loop;
      end if;

      if Current_Time.Hours = Alarm_HH and
         Current_Time.Minutes = Alarm_MM and
         not Alarm_Done then

         Alarm_Done := True;
         AVR.UART.Put ("ALARM");
         AVR.UART.CRLF;
         Play_Alarm;
      elsif (Current_Time.Hours /= Alarm_HH
          or Current_Time.Minutes /= Alarm_MM) and Alarm_Done then
         Alarm_Done := False;
      end if;

   end loop;
end Main;
