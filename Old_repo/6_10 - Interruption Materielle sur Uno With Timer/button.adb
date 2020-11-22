with AVR;
with AVR.MCU;
with AVR.Interrupts;
with Interfaces;
with LVC.TIME;

use AVR;
use Interfaces;

package body Button is

   GAP : constant Unsigned_32 := 16#01F4#;

   Previous_A0_Time : Unsigned_32 := 0;


   procedure Button_Interrupt;
   pragma Machine_Attribute (Entity         => Button_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt, MCU.Sig_PCINT1_String);

   procedure Button_Interrupt is
      Current_Time : Unsigned_32 := LVC.TIME.Millis;
   begin
      if ( Current_Time - Previous_A0_Time > GAP) then
         Previous_A0_Time := Current_Time;
         MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := False;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := True;
      end if;
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
      LVC.TIME.Start_Timer;
      loop
         null;
      end loop;
   end Run;
end Button;
