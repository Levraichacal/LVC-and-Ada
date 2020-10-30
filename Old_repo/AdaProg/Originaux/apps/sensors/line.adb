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

with AVR;                          use AVR;
with AVR.MCU;
with AVR.UART;
with AVR.ADC;

procedure Line is

   Port_Dig    : Bits_In_Byte renames MCU.PIND_Bits;
   Port_Dig_DD : Bits_In_Byte renames MCU.DDRD_Bits;
   Port_Ana_DD : Bits_In_Byte renames MCU.DDRC_Bits;

   Signal_D_Pin : constant := 2;
   Signal_A_Pin : constant := 3;

   Sig_D : Boolean renames Port_Dig(Signal_D_Pin);

   Val : Nat8;

begin

   Port_Ana_DD (Signal_A_Pin) := DD_Input;
   Port_Dig_DD (Signal_D_Pin) := DD_Input;

   UART.Init (UART.Baud_19200_16MHz);
   ADC.Init (Scale => ADC.Scale_By_128, Ref => ADC.Is_Vcc);

   loop
      Val := ADC.Convert_8bit (Signal_A_Pin);
      UART.Put ("Sig: ");
      if Sig_D then
         UART.Put ('x');
      else
         UART.Put ('0');
      end if;
      UART.Put ("  Val: ");
      UART.Put (Val);
      UART.New_Line;

   end loop;
end Line;
