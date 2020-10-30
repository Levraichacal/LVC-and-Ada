--with Interfaces;
with AVR;
with AVR.MCU;
with AVR.Interrupts;
with LVC.PINS;

use AVR;
--use Interfaces;
use LVC.PINS;

package body Button is


   procedure Button_Interrupt;
   pragma Machine_Attribute (Entity         => Button_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt, MCU.Sig_INT4_String);

   procedure Button_Interrupt is
      PINE_Stat : Bits_In_Byte;
   begin
      AVR.Interrupts.Disable;
      PINE_Stat := MCU.PINE_Bits;
      MCU.EIMSK_Bits (MCU.INT4_Bit) := False;
      AVR.Interrupts.Enable;
      if (PINE_Stat(4)) then
         digitalWrite(D13, High_lvl);
      else
         digitalWrite(D13, Low_lvl);
      end if;
      MCU.EIMSK_Bits (MCU.INT4_Bit) := True;
   end Button_Interrupt;

   procedure Run is
   begin
      pinMode(D2, Input);
      pinMode(D13, Output);

      digitalWrite(D13, Low_lvl);
      MCU.EICRB_Bits(MCU.ISC40_Bit) := False;
      MCU.EICRB_Bits(MCU.ISC41_Bit) := True;      
      MCU.EIFR_Bits (MCU.INTF4_Bit) := True;
      MCU.EIMSK_Bits (MCU.INT4_Bit) := True;

      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Button;
