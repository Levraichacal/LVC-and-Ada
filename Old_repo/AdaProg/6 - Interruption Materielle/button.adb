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
      if Counter > 20 and MCU.PINK_Bits (0) then
         MCU.PORTB_Bits (7) := not MCU.PORTB_Bits (7);
         Timer0.Stop;
         Counter := 0;
         MCU.PCMSK2_Bits (MCU.PCINT16_Bit) := True;
      end if;
   end Timer_Interrupt;

   procedure Button_Interrupt;

   pragma Machine_Attribute (Entity         => Button_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt, MCU.Sig_PCINT2_String);

   procedure Button_Interrupt is
   begin
      if Counter = 0 and MCU.PINK_Bits (0) then
         MCU.PCMSK2_Bits (MCU.PCINT16_Bit) := False;
         Timer0.Init_CTC (Timer0.Scale_By_64, 150);
      end if;
   end Button_Interrupt;


   procedure Run is
   begin
      MCU.DDRF_Bits (0) := DD_Input;
      MCU.DDRB_Bits (7) := DD_Output;

      MCU.PORTB_Bits (7) := False;

      MCU.PCICR_Bits (MCU.PCIE2_Bit) := True;
      MCU.PCMSK2_Bits (MCU.PCINT16_Bit) := True;

      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Button;
