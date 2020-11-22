with Interfaces;
with LVC.TIME;
with LVC.BUTTONS;
with AVR.MCU;
with AVR.Interrupts;
with AVR;

use LVC.BUTTONS;
use LVC.TIME;
use AVR.MCU;
use AVR;
use Interfaces;

package body LVC.BUTTONS.INTERRUPTS is

   GAP : constant Unsigned_32 := 16#01F4#;

   Previous_D02_Time : Unsigned_32 := 0;
   Previous_D03_Time : Unsigned_32 := 0;
   Previous_D04_Time : Unsigned_32 := 0;
   Previous_D05_Time : Unsigned_32 := 0;
   Previous_D06_Time : Unsigned_32 := 0;
   Previous_D07_Time : Unsigned_32 := 0;
   Previous_D08_Time : Unsigned_32 := 0;
   Previous_D09_Time : Unsigned_32 := 0;
   Previous_D10_Time : Unsigned_32 := 0;
   Previous_D11_Time : Unsigned_32 := 0;

   procedure Button_Interrupt_On_PortD;
   pragma Machine_Attribute (Entity         => Button_Interrupt_On_PortD,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_On_PortD, MCU.Sig_PCINT2_String);

   procedure Button_Interrupt_On_PortD is
      Current_Value : Unsigned_8 := MCU.PIND;
      Current_Time : Unsigned_32 := LVC.TIME.Millis;
   begin
      if ((Current_Value = 2) and then ((Previous_D02_Time - Current_Time) < GAP)) then
         LVC.BUTTONS.Toilette := True;
         Previous_D02_Time := Current_Time;
      elsif ((Current_Value = 3) and then ((Previous_D03_Time - Current_Time) < GAP)) then
         LVC.BUTTONS.Entree := True;
         Previous_D03_Time := Current_Time;
      elsif ((Current_Value = 4) and then ((Previous_D04_Time - Current_Time) < GAP)) then
         LVC.BUTTONS.Cuisine := True;
         Previous_D04_Time := Current_Time;
      elsif ((Current_Value = 5) and then ((Previous_D05_Time - Current_Time) < GAP)) then
         LVC.BUTTONS.Cuisine := True;
         Previous_D05_Time := Current_Time;
      elsif ((Current_Value = 6) and then ((Previous_D06_Time - Current_Time) < GAP)) then
         LVC.BUTTONS.Salon := True;
         Previous_D06_Time := Current_Time;
      elsif ((Current_Value = 7) and then ((Previous_D07_Time - Current_Time) < GAP)) then
         LVC.BUTTONS.Salon := True;
         Previous_D07_Time := Current_Time;
      end if;
      -- MCU.PCIFR_Bits (MCU.PCIF2_Bit) := False;
   end Button_Interrupt_On_PortD;

   procedure Button_Interrupt_On_PortB;
   pragma Machine_Attribute (Entity         => Button_Interrupt_On_PortB,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_On_PortB, MCU.Sig_PCINT0_String);

   procedure Button_Interrupt_On_PortB is
      Current_Value : Unsigned_8 := MCU.PINB;
      Current_Time : Unsigned_32 := LVC.TIME.Millis;
   begin
      if ((Current_Value = 0) and then ((Previous_D08_Time - Current_Time) < GAP)) then
         LVC.BUTTONS.Bureau := True;
         Previous_D08_Time := Current_Time;
      elsif ((Current_Value = 1) and then ((Previous_D09_Time - Current_Time) < GAP)) then
         LVC.BUTTONS.Bureau := True;
         Previous_D09_Time := Current_Time;
      elsif ((Current_Value = 2) and then ((Previous_D10_Time - Current_Time) < GAP)) then
         LVC.BUTTONS.SalleDeBain := True;
         Previous_D10_Time := Current_Time;
      elsif ((Current_Value = 3) and then ((Previous_D11_Time - Current_Time) < GAP)) then
         LVC.BUTTONS.Chambre := True;
         Previous_D11_Time := Current_Time;
      end if;
      -- MCU.PCIFR_Bits (MCU.PCIF0_Bit) := False;
   end Button_Interrupt_On_PortB;





   -- Peharps change this, instead of enable all here
   -- it should be better to have a proper method
   -- whcih do this using DigitalPort
   --  and assume taht the compilator will optimize
   -- the code during building or we are not at
   -- some bytes counting
   procedure Init is
   begin
      -- Stop Interrupts
      AVR.Interrupts.Disable;

      -- Toilette -D2
      MCU.PCMSK2_Bits (MCU.PCINT18_Bit) := True;
      MCU.DDRD_Bits (2) := DD_Output;
      MCU.PORTD_Bits (2) := False;
      LVC.BUTTONS.Toilette := False;

      -- Entree -D3
      MCU.PCMSK2_Bits (MCU.PCINT19_Bit) := True;
      MCU.DDRD_Bits (3) := DD_Output;
      MCU.PORTD_Bits (3) := False;
      LVC.BUTTONS.Entree := False;

      -- Cuisine 1 -D4
      MCU.PCMSK2_Bits (MCU.PCINT20_Bit) := True;
      MCU.DDRD_Bits (4) := DD_Output;
      MCU.PORTD_Bits (4) := False;
      LVC.BUTTONS.Cuisine := False;

      -- Cuisine 2 -D5
      MCU.PCMSK2_Bits (MCU.PCINT21_Bit) := True;
      MCU.DDRD_Bits (5) := DD_Output;
      MCU.PORTD_Bits (5) := False;

      -- Salon 1 -D6
      MCU.PCMSK2_Bits (MCU.PCINT22_Bit) := True;
      MCU.DDRD_Bits (6) := DD_Output;
      MCU.PORTD_Bits (6) := False;
      LVC.BUTTONS.Salon := False;

      -- Salon 2 -D7
      MCU.PCMSK2_Bits (MCU.PCINT23_Bit) := True;
      MCU.DDRD_Bits (7) := DD_Output;
      MCU.PORTD_Bits (7) := False;

      -- Bureau 1 -D8
      MCU.PCMSK0_Bits (MCU.PCINT0_Bit) := True;
      MCU.DDRB_Bits (0) := DD_Output;
      MCU.PORTB_Bits (0) := False;
      LVC.BUTTONS.Bureau := False;

      -- Bureau 2 -D9
      MCU.PCMSK0_Bits (MCU.PCINT1_Bit) := True;
      MCU.DDRB_Bits (1) := DD_Output;
      MCU.PORTB_Bits (1) := False;

      -- Salle de bain -D10
      MCU.PCMSK0_Bits (MCU.PCINT2_Bit) := True;
      MCU.DDRB_Bits (2) := DD_Output;
      MCU.PORTB_Bits (2) := False;
      LVC.BUTTONS.SalleDeBain := False;

      -- Chambre -D11
      MCU.PCMSK0_Bits (MCU.PCINT3_Bit) := True;
      MCU.DDRB_Bits (3) := DD_Output;
      MCU.PORTB_Bits (3) := False;
      LVC.BUTTONS.Chambre := False;

      -- Enable interrupts on Port
      MCU.PCICR_Bits (MCU.PCIE0_Bit) := True;
      MCU.PCICR_Bits (MCU.PCIE2_Bit) := True;
      MCU.PCIFR_Bits (MCU.PCIF0_Bit) := False;
      MCU.PCIFR_Bits (MCU.PCIF2_Bit) := False;
      MCU.SREG_Bits(MCU.I_Bit) := True;

      -- Enable General interrupts
      AVR.Interrupts.Enable;
   end Init;

end LVC.BUTTONS.INTERRUPTS;
