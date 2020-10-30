---------------------------------------------------------------------------
-- The AVR-Ada Library is free software;  you can redistribute it and/or --
-- modify it under terms of the  GNU General Public License as published --
-- by  the  Free Software  Foundation;  either  version 2, or  (at  your --
-- option) any later version.  The AVR-Ada Library is distributed in the --
-- hope that it will be useful, but  WITHOUT ANY WARRANTY;  without even --
-- the  implied warranty of MERCHANTABILITY or FITNESS FOR A  PARTICULAR --
-- PURPOSE. See the GNU General Public License for more details.         --
--                                                                       --
-- As a special exception, if other files instantiate generics from this --
-- unit,  or  you  link  this  unit  with  other  files  to  produce  an --
-- executable   this  unit  does  not  by  itself  cause  the  resulting --
-- executable to  be  covered by the  GNU General  Public License.  This --
-- exception does  not  however  invalidate  any  other reasons why  the --
-- executable file might be covered by the GNU Public License.           --
---------------------------------------------------------------------------


with AVR;
with AVR.MCU;
with AVR.UART;

use AVR;

procedure Motor is
   use AVR.MCU;

   IN_1 : Boolean renames MCU.PORTB_Bits (0);
   IN_2 : Boolean renames MCU.PORTB_Bits (3);
   IN_3 : Boolean renames MCU.PORTB_Bits (4);
   IN_4 : Boolean renames MCU.PORTB_Bits (5);
   -- EA_1 : Boolean renames MCU.PORTB_Bits (1);
   -- EB_1 : Boolean renames MCU.PORTB_Bits (2);

   procedure M1_Forward is
   begin
      IN_1 := False;
      IN_2 := True;
   end M1_Forward;

   procedure M1_Stop is
   begin
      IN_1 := False;
      IN_2 := False;
   end M1_Stop;

   procedure M1_Backward is
   begin
      IN_1 := True;
      IN_2 := False;
   end M1_Backward;

   procedure M2_Forward is
   begin
      IN_3 := False;
      IN_4 := True;
   end M2_Forward;

   procedure M2_Stop is
   begin
      IN_3 := False;
      IN_4 := False;
   end M2_Stop;

   procedure M2_Backward is
   begin
      IN_3 := True;
      IN_4 := False;
   end M2_Backward;

   procedure All_Forward is
   begin
      M1_Forward;
      M2_Forward;
   end All_Forward;

   procedure All_Backward is
   begin
      M1_Backward;
      M2_Backward;
   end All_Backward;

   procedure All_Stop is
   begin
      M1_Stop;
      M2_Stop;
   end All_Stop;

   procedure Turn_Left is
   begin
      M1_Forward;
      M2_Backward;
   end Turn_Left;

   procedure Turn_Right is
   begin
      M1_Backward;
      M2_Forward;
   end Turn_Right;

   C : Character;

begin
   AVR.UART.Init (AVR.UART.Baud_9600_16MHz);

   MCU.DDRB_Bits (0) := DD_Output;
   MCU.DDRB_Bits (1) := DD_Output;
   MCU.DDRB_Bits (2) := DD_Output;
   MCU.DDRB_Bits (3) := DD_Output;
   MCU.DDRB_Bits (4) := DD_Output;
   MCU.DDRB_Bits (5) := DD_Output;

   All_Stop;

   MCU.PRR_Bits (MCU.PRTIM1_Bit) := Low;
   TCCR1A_Bits := (COM1A1_Bit => True, -- COM1A1 + A0 => motor 1
                   COM1A0_Bit => False,
                   COM1B1_Bit => True, -- COM1B1 + B0 => motor 2
                   COM1B0_Bit => False,
                   WGM10_Bit  => True,
                   WGM11_Bit  => False,
                   others => False);
   TCCR1B_Bits := (WGM12_Bit => True,
                   WGM13_Bit => False,
                   CS10_Bit => True,
                   CS11_Bit => False,
                   CS12_Bit => False,
                   others => False);

   MCU.OCR1A := 16#A2#;
   MCU.OCR1B := 16#A2#;

   AVR.UART.Put ("BEGIN");
   AVR.UART.CRLF;
   loop
      C := AVR.UART.Get;
      if C = 'F' then
         All_Forward;
         AVR.UART.Put (C);
         AVR.UART.Put (" OK");
         AVR.UART.CRLF;
      elsif C = 'D' then
         Turn_Left;
         AVR.UART.Put (C);
         AVR.UART.Put (" OK");
         AVR.UART.CRLF;
      elsif C = 'G' then
         Turn_Right;
         AVR.UART.Put (C);
         AVR.UART.Put (" OK");
         AVR.UART.CRLF;
      elsif C = 'S' or C = 'C' then
         All_Stop;
         AVR.UART.Put (C);
         AVR.UART.Put (" OK");
         AVR.UART.CRLF;
      elsif C = 'V' then
         All_Backward;
         AVR.UART.Put (C);
         AVR.UART.Put (" OK");
         AVR.UART.CRLF;
      end if;
   end loop;
end Motor;
