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

   procedure Button_Interrupt_1;

   pragma Machine_Attribute (Entity         => Button_Interrupt_1,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_1, MCU.Sig_INT1_String);

   procedure Button_Interrupt_1 is
   begin
         MCU.EIMSK_Bits (MCU.INT1_Bit) := False;
         MCU.PORTB_Bits (6) := not MCU.PORTB_Bits (6);
         MCU.EIMSK_Bits (MCU.INT1_Bit) := True;
   end Button_Interrupt_1;

   procedure Run is
   begin
      MCU.DDRD_Bits (0) := DD_Input; -- D21
      MCU.DDRD_Bits (1) := DD_Input; -- D20 
      MCU.DDRB_Bits (7) := DD_Output; -- D13
      MCU.DDRB_Bits (6) := DD_Output; -- D12

      MCU.PORTB_Bits (7) := False;
      MCU.PORTB_Bits (6) := False;
      
      MCU.EICRA_Bits(MCU.ISC00_Bit) := True;
      MCU.EICRA_Bits(MCU.ISC01_Bit) := False;      
      MCU.EIFR_Bits (MCU.INTF0_Bit) := True;
      MCU.EIMSK_Bits (MCU.INT0_Bit) := True;

      MCU.EICRA_Bits(MCU.ISC10_Bit) := True;
      MCU.EICRA_Bits(MCU.ISC11_Bit) := True;      
      MCU.EIFR_Bits (MCU.INTF1_Bit) := True;
      MCU.EIMSK_Bits (MCU.INT1_Bit) := True;

      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Button;
