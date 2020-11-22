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
   pragma Export (C, Button_Interrupt, MCU.Sig_PCINT1_String);

   procedure Button_Interrupt is
   begin
      MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := False;
      MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
      MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := True;
   end Button_Interrupt;

   procedure Run is
   begin
      AVR.Interrupts.Disable;
      MCU.DDRC_Bits (0) := DD_Input; -- A0 
      MCU.PORTC_Bits(0) := True;
      MCU.DDRB_Bits (5) := DD_Output; -- D13

      MCU.PORTB_Bits (5) := True;

      MCU.PCICR_Bits (MCU.PCIE1_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := True;

      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Button;
