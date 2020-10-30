with Interfaces;
with AVR;
with AVR.MCU;
with AVR.Interrupts;
with AVR.Timer0;

use AVR;
use Interfaces;


package body Button is


   procedure Button_Interrupt;
   pragma Machine_Attribute (Entity         => Button_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt, MCU.Sig_PCINT2_String);

   procedure Button_Interrupt is
   begin
      MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := False;
      MCU.PORTB_Bits (7) := not MCU.PORTB_Bits (7);
      MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := True;
   end Button_Interrupt;

   procedure Run is
   begin
      MCU.DDRC_Bits (0) := DD_Input; -- A0 
      MCU.DDRB_Bits (7) := DD_Output; -- D13

      MCU.PORTB_Bits (7) := True;

      MCU.PCICR_Bits (MCU.PCIE1_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := True;

      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Button;
