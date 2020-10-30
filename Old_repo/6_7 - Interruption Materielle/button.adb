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

   procedure Button_Interrupt_7;

   pragma Machine_Attribute (Entity         => Button_Interrupt_7,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_7, MCU.Sig_INT4_String);

   procedure Button_Interrupt_7 is
   begin
         MCU.EIMSK_Bits (MCU.INT4_Bit) := False;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         MCU.EIMSK_Bits (MCU.INT4_Bit) := True;
   end Button_Interrupt_7;


   procedure Button_Interrupt_4;
   pragma Machine_Attribute (Entity         => Button_Interrupt_4,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_4, MCU.Sig_PCINT2_String);

   procedure Button_Interrupt_4 is
   begin
         MCU.PCMSK2_Bits (MCU.PCINT16_Bit) := False;
         MCU.PORTB_Bits (4) := not MCU.PORTB_Bits (4);
         MCU.PCMSK2_Bits (MCU.PCINT16_Bit) := True;
   end Button_Interrupt_4;

   procedure Button_Interrupt_2;
   pragma Machine_Attribute (Entity         => Button_Interrupt_2,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_2, MCU.Sig_PCINT1_String);

   procedure Button_Interrupt_2 is
   begin
         MCU.PCMSK1_Bits (MCU.PCINT9_Bit) := False;
         MCU.PORTH_Bits (6) := not MCU.PORTH_Bits (6);
         MCU.PCMSK1_Bits (MCU.PCINT9_Bit) := True;
   end Button_Interrupt_2;

   procedure Button_Interrupt_3;
   pragma Machine_Attribute (Entity         => Button_Interrupt_3,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_3, MCU.Sig_PCINT0_String);

   procedure Button_Interrupt_3 is
   begin
         MCU.PCMSK0_Bits (MCU.PCINT0_Bit) := False;
         MCU.PORTH_Bits (5) := not MCU.PORTH_Bits (5);
         MCU.PCMSK0_Bits (MCU.PCINT0_Bit) := True;
   end Button_Interrupt_3;
   

   procedure Run is
   begin
      MCU.DDRF_Bits (0) := DD_Input; -- A8
      MCU.DDRJ_Bits (0) := DD_Input; -- D15
      MCU.DDRB_Bits (0) := DD_Input; -- D53
      MCU.DDRD_Bits (0) := DD_Input; -- D21
      MCU.DDRD_Bits (1) := DD_Input; -- D20
      MCU.DDRE_Bits (4) := DD_Input; -- D2
      MCU.DDRB_Bits (7) := DD_Output; -- D13
      MCU.DDRB_Bits (6) := DD_Output; -- D12
      MCU.DDRB_Bits (5) := DD_Output; -- D11
      MCU.DDRB_Bits (4) := DD_Output; -- D10
      MCU.DDRH_Bits (6) := DD_Output; -- D9
      MCU.DDRH_Bits (5) := DD_Output; -- D8
            
      MCU.PORTB_Bits (7) := False;
      MCU.PORTB_Bits (6) := False;
      MCU.PORTB_Bits (5) := False;
      MCU.PORTB_Bits (4) := False;
      MCU.PORTH_Bits (6) := False;
      MCU.PORTH_Bits (5) := False;
           
--      MCU.EICRA_Bits(MCU.ISC00_Bit) := true;
--      MCU.EICRA_Bits(MCU.ISC01_Bit) := false;      ==> Bloc le proc
--      MCU.EICRA_Bits(MCU.ISC00_Bit) := false;
--      MCU.EICRA_Bits(MCU.ISC01_Bit) := false;      ==> Innefficace?
      MCU.EICRA_Bits(MCU.ISC00_Bit) := True;    -- Pb numéro d'entrée?
      MCU.EICRA_Bits(MCU.ISC01_Bit) := False;      
      MCU.EIFR_Bits (MCU.INTF0_Bit) := True;
      MCU.EIMSK_Bits (MCU.INT0_Bit) := True;

      MCU.EICRA_Bits(MCU.ISC10_Bit) := True;
      MCU.EICRA_Bits(MCU.ISC11_Bit) := True;      
      MCU.EIFR_Bits (MCU.INTF1_Bit) := True;
      MCU.EIMSK_Bits (MCU.INT1_Bit) := True;

      MCU.EICRB_Bits(MCU.ISC40_Bit) := False;
      MCU.EICRB_Bits(MCU.ISC41_Bit) := True;      
      MCU.EIFR_Bits (MCU.INTF4_Bit) := True;
      MCU.EIMSK_Bits (MCU.INT4_Bit) := True;
      
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
