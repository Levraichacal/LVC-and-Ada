with Interfaces;
with AVR;
with AVR.MCU;
with AVR.Interrupts;
with AVR.Timer0;

use AVR;
use Interfaces;


package body Button is
   Counter : Unsigned_8 := 0;

   procedure Timer_Interrupt;
   pragma Machine_Attribute (Entity         => Timer_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Timer_Interrupt, Timer0.Signal_Compare);

   procedure Timer_Interrupt is
   begin
      Counter := Counter + 1;
      if Counter > 20 and MCU.PINC_Bits (3) then
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Timer0.Stop;
         Counter := 0;
         MCU.PCMSK1_Bits (MCU.PCINT11_Bit) := True;
      end if;
   end Timer_Interrupt;

   procedure Button_Interrupt;
   pragma Machine_Attribute (Entity         => Button_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt, MCU.Sig_PCINT1_String);

   procedure Button_Interrupt is
   begin
      if Counter = 0 and MCU.PINC_Bits (3) then
         MCU.PCMSK1_Bits (MCU.PCINT11_Bit) := False;
         Timer0.Init_CTC (Timer0.Scale_By_64, 150);
      end if;
   end Button_Interrupt;

   procedure Run is
   begin
      MCU.DDRC_Bits (3) := DD_Input;
      MCU.DDRB_Bits (5) := DD_Output;

      MCU.PORTB_Bits (5) := False;

      MCU.PCICR_Bits (MCU.PCIE1_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT11_Bit) := True;

      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Button;
