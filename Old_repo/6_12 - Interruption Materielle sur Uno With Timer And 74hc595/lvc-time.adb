with AVR;
with AVR.MCU;
with Interfaces;
with AVR.Interrupts;
with LVC.UTILS;

use Interfaces;
use AVR;
use AVR.MCU;
use LVC.UTILS;
------------------------------------------------------------------------
-- This package provide micros and millis functions --
-- There are two using:
--   - Prescale 8
--   - Prescale 64
-- The prescale 8 is precise with 2 tic = 1 us but run only 1h...
-- The presacale 64 precise with 1 tics = 8 us so it can run 24 h...
-- It depends what you need or if your code assume the overflow...

package body LVC.TIME is

   timer_0_micros : Unsigned_32 := 0;


   procedure Start_Timer is
   begin
      AVR.Interrupts.Disable;
      -- Activation du timer
      MCU.PRR_Bits (MCU.PRTIM0_Bit) := False;
      -- Mettre le timer à sa valeur initiale = 6
      MCU.TCNT0 := 16#06#;
      -- Start the timer0 with /8 prescaler
      -- ie 2 ticks = 1 us
      MCU.TCCR0B_Bits := (MCU.CS01_Bit  => True,
                          others => False);
      MCU.TCCR0A_Bits := (others => False);
      MCU.TIMSK0_Bits(TOIE0_Bit) := True;
      AVR.Interrupts.Enable;
   end Start_Timer;

   procedure Timer0_Interrupt;
   pragma Machine_Attribute (Entity         => Timer0_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Timer0_Interrupt, MCU.Sig_TIMER0_OVF_String);

   procedure Timer0_Interrupt is
   begin
      MCU.TCNT0 := 16#06#;
      timer_0_micros := timer_0_micros + 250;
   end Timer0_Interrupt;

   function Millis return Unsigned_32 is
   begin
      return Micros/1000;
   end Millis;

   function Micros return Unsigned_32 is
      micros : Unsigned_32 ;
      old_sreg : Unsigned_8 := MCU.SREG;
   begin
      -- Disable Interrupt.
      AVR.Interrupts.Disable;
      micros := timer_0_micros + Unsigned_8_To_Unsigned_32(MCU.TCNT0 /2);
      MCU.SREG := old_sreg;
      AVR.Interrupts.Enable;
      return micros;
   end Micros;

end LVC.TIME;

