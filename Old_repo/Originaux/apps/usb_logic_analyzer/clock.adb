---------------------------------------------------------------------------
-- The AVR-Ada Library is free software;  you can redistribute it and/or --
-- modify it under terms of the  GNU General Public License as published --
-- by  the  Free Software  Foundation;  either  version 2, or  (at  your --
-- option) any later version.  The AVR-Ada Library is distributed in the --
-- hope that it will be useful, but  WITHOUT ANY WARRANTY;  without even --
-- the  implied warranty of MERCHANTABILITY or FITNESS FOR A  PARTICULAR --
-- PURPOSE. See the GNU General Public License for more details.         --
--                                                                       --
-- As a special exception, if other files instantiate generics from this --
-- unit,  or  you  link  this  unit  with  other  files  to  produce  an --
-- executable   this  unit  does  not  by  itself  cause  the  resulting --
-- executable to  be  covered by the  GNU General  Public License.  This --
-- exception does  not  however  invalidate  any  other reasons why  the --
-- executable file might be covered by the GNU Public License.           --
---------------------------------------------------------------------------


--  provide a high resolution clock for the logic analyzer.  It
--  consists of the timer1 counter register plus a SW 16bit register.
--
--  The timer1 is scaled by 8 on the internal 16MHz clock of the
--  Arduino. An additional 16bit variable is incremented on timer1
--  overflow. That extends the the measurable time to a bit more than
--  30 Minutes.

with Interfaces;                   use Interfaces;
with AVR;                          use AVR;
with AVR.Timer1;
with AVR.Interrupts;


package body Clock is

   -- upper part of the time stamp
   Clock_High_Part : Unsigned_16;


   function Now return Timestamp
   is
      T : Unsigned_32;
   begin
      Interrupts.Save_And_Disable;
      T := Unsigned_32(Clock_High_Part);
      T := Shift_Left (T, 16);
      T := T + Unsigned_32(Timer1.Counter);
      Interrupts.Restore;
      return Timestamp(T);
   end Now;


   procedure Init
   is
      Overflow_At : Unsigned_16;
   begin
      -- the Arduino runs at 16MHz. Scaling by 8 results in an
      -- increment at 2MHz and an overflow of 2MHz/2^16 = 30.5Hz.
      --  Timer1.Init_Normal (Timer1.Scale_By_8);
      --  Timer1.Counter := 0;
      --  Clock_High_Part := 0;

      --  original runs at 100 MHz, Arduino at 16 MHz
      -- Overflow_At := Unsigned_16 ((Divider + 1) / 100 * 16 - 1);
      Overflow_At := Unsigned_16 ((Divider + 1) / 25 * 4 - 1);
      Timer1.Init_CTC (Timer1.No_Prescaling, Overflow_At);
      Timer1.Counter := 0;
      Timer1.Enable_Interrupt_Overflow;
      Interrupts.Enable;
   end Init;


   procedure Reset is
   begin
      Interrupts.Save_And_Disable;
      Timer1.Counter := 0;
--      Clock_High_Part := 0;
      Interrupts.Restore;
   end Reset;


   --  procedure Extend_Counter;
   --  pragma Machine_Attribute (Entity         => Extend_Counter,
   --                            Attribute_Name => "signal");
   --  pragma Export (C, Extend_Counter, Timer1.Signal_Overflow);

   --  procedure Extend_Counter is
   --  begin
   --     Clock_High_Part := Clock_High_Part + 1;
   --  end Extend_Counter;

end Clock;
