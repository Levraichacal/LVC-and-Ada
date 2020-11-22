with Interfaces;
with AVR;
with AVR.MCU;
with AVR.Interrupts;
with AVR.Timer0;

use AVR;
use Interfaces;


PACKAGE BODY Button IS

   procedure Button_Interrupt_1;
   pragma Machine_Attribute (Entity         => Button_Interrupt_1,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_1, MCU.Sig_PCINT2_String);

   procedure Button_Interrupt_1 is
   begin
         MCU.PCMSK2_Bits (MCU.PCINT16_Bit) := False;
         MCU.PORTB_Bits (7) := not MCU.PORTB_Bits (7);
         MCU.PCMSK2_Bits (MCU.PCINT16_Bit) := True;
   end Button_Interrupt_1;

   procedure Button_Interrupt_2;
   pragma Machine_Attribute (Entity         => Button_Interrupt_2,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_2, MCU.Sig_PCINT1_String);

   procedure Button_Interrupt_2 is
   begin
         MCU.PCMSK1_Bits (MCU.PCINT9_Bit) := False;
         MCU.PORTB_Bits (6) := not MCU.PORTB_Bits (6);
         MCU.PCMSK1_Bits (MCU.PCINT9_Bit) := True;
   end Button_Interrupt_2;

   procedure Button_Interrupt_3;
   pragma Machine_Attribute (Entity         => Button_Interrupt_3,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_3, MCU.Sig_PCINT0_String);

   procedure Button_Interrupt_3 is
   begin
         MCU.PCMSK0_Bits (MCU.PCINT0_Bit) := False;
         MCU.PORTB_Bits (6) := not MCU.PORTB_Bits (6);
         MCU.PCMSK0_Bits (MCU.PCINT0_Bit) := True;
   end Button_Interrupt_3;

   procedure Run is
   begin
      MCU.DDRF_Bits (0) := DD_Input; -- A8
      MCU.DDRJ_Bits (0) := DD_Input; -- D15
      MCU.DDRB_Bits (0) := DD_Input; -- D53
      MCU.DDRB_Bits (7) := DD_Output; -- D13
      MCU.DDRB_Bits (6) := DD_Output; -- D12
      MCU.DDRB_Bits (5) := DD_Output; -- D11

      MCU.PORTB_Bits (7) := False;
      MCU.PORTB_Bits (6) := False;
      MCU.PORTB_Bits (5) := False;

      MCU.PCICR_Bits (MCU.PCIE2_Bit) := True;
      MCU.PCMSK2_Bits (MCU.PCINT16_Bit) := True;

      MCU.PCICR_Bits (MCU.PCIE1_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT9_Bit) := True;

      MCU.PCICR_Bits (MCU.PCIE0_Bit) := True;
      MCU.PCMSK0_Bits (MCU.PCINT0_Bit) := True;

      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Button;