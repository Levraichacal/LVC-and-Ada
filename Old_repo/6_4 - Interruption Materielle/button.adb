with Interfaces;
with AVR;
with AVR.MCU;
with AVR.Interrupts;

use AVR;
use Interfaces;


package body Button is


   procedure Button_Interrupt_0;

   pragma Machine_Attribute (Entity         => Button_Interrupt_0,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_0, MCU.Sig_INT0_String);

   procedure Button_Interrupt_0 is
   begin
         MCU.EIMSK_Bits (MCU.INT0_Bit) := False;
         MCU.PORTB_Bits (7) := not MCU.PORTB_Bits (7);
         MCU.EIMSK_Bits (MCU.INT0_Bit) := True;
   end Button_Interrupt_0;


   procedure Run is
   begin
      MCU.DDRD_Bits (0) := DD_Input; -- D21
      MCU.DDRB_Bits (7) := DD_Output; -- D13

      MCU.PORTB_Bits (7) := False;
      
      MCU.EICRA_Bits(MCU.ISC00_Bit) := True;
      MCU.EICRA_Bits(MCU.ISC01_Bit) := False;      
      MCU.EIFR_Bits (MCU.INTF0_Bit) := True;
      MCU.EIMSK_Bits (MCU.INT0_Bit) := True;

      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Button;
