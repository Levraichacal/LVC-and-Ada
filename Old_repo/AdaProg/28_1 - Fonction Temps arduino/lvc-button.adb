with AVR;
use AVR;
with AVR.MCU;
with LVC.TIMER0;
use LVC.TIMER0;
with AVR.Interrupts;
with AVR.UART;

package BODY LVC.BUTTON is

   procedure Button_Interrupt_1;
   pragma Machine_Attribute (Entity         => Button_Interrupt_1,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_1, MCU.Sig_PCINT2_String);

   procedure Button_Interrupt_1 is
   begin
         MCU.PCMSK2_Bits (MCU.PCINT18_Bit) := False;
         if(boolMode) then
            Temp := millis - Temp;
            AVR.UART.Put(Temp);
         else
            Temp := millis;
         end if;
         boolMode := not boolMode;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5); -- D13
         MCU.PCMSK2_Bits (MCU.PCINT18_Bit) := True;
   end Button_Interrupt_1;

   procedure Init_Button_Interrupt is
   begin
      Init;
      AVR.Interrupts.Disable;
      boolMode := True;
      Temp := 0;
      MCU.DDRD_Bits (2) := False;
      MCU.DDRB_Bits (5) := True; -- D13
      MCU.PORTB_Bits (5) := False;
      MCU.PCICR_Bits (MCU.PCIE2_Bit) := True;
      MCU.PCMSK2_Bits (MCU.PCINT18_Bit) := True;
      AVR.Interrupts.Enable;
      AVR.UART.Init(103);
      AVR.UART.Put("Initialisation");
   end Init_Button_Interrupt;
end LVC.BUTTON;
