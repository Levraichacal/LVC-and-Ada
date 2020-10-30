with Interfaces;

with AVR.Timer2;
with AVR.MCU;
with AVR;
with AVR.Interrupts;
with AVR.Sleep;

use AVR;

package body Sleeper is
   use type Interfaces.Unsigned_8;
   use type Interfaces.Unsigned_16;

   Elapsed_Seconds : aliased Interfaces.Unsigned_16;
   pragma Volatile (Elapsed_Seconds);

   procedure Tick;
   pragma Machine_Attribute (Entity         => Tick,
                             Attribute_Name => "signal");
   pragma Export (C, Tick, Timer2.Signal_Compare);

   procedure Tick is
      use type Interfaces.Unsigned_16;

      Adjustment : constant := 2;
   begin
      Elapsed_Seconds := Elapsed_Seconds + Adjustment;
   end Tick;

   procedure Slow_CPU is
      CPU_125khz : constant := 16#07#;
      Status : Interfaces.Unsigned_8;
   begin
      Status := Interrupts.Save_And_Disable;
      AVR.MCU.CLKPR := 16#80#;
      AVR.MCU.CLKPR := CPU_125khz;
      Interrupts.Restore (Status);
   end Slow_CPU;

   procedure Fast_CPU is
      CPU_16MHz : constant := 16#00#;
      Status : Interfaces.Unsigned_8;
   begin
      Status := Interrupts.Save_And_Disable;
      AVR.MCU.CLKPR := 16#80#;
      AVR.MCU.CLKPR := CPU_16MHz;
      Interrupts.Restore (Status);
   end Fast_CPU;

   procedure Disable_BOD is
      use AVR.MCU;
   begin
      MCUCR_Bits (BODS_Bit) := True;
      MCUCR_Bits (BODSE_Bit) := True;
      MCUCR_Bits (BODS_Bit) := True;
      MCUCR_Bits (BODSE_Bit) := False;
   end Disable_BOD;
   pragma Inline_Always(Disable_BOD);

   procedure Init is
      use AVR.MCU;
   begin
      -- Disable ADC
      ADCSRA_Bits (ADEN_Bit) := False;
      ACSR_Bits (ACD_Bit)     := True;
      PRR_Bits (PRADC_Bit)    := True;
      -- Disable SPI
      PRR_Bits (PRSPI_Bit) := True;
      -- Disable TWI
      PRR_Bits (PRTWI_Bit) := True;
      -- Disable USART0
      PRR_Bits (PRUSART0_Bit) := True;
      -- Disable timers 0 and 1
      PRR_Bits (PRTIM0_Bit) := True;
      PRR_Bits (PRTIM1_Bit) := True;

      Timer2.Init_CTC (Timer2.Scale_By_1024, Overflow => 249);

      AVR.Interrupts.Enable;
   end Init;

   procedure Sleep_Instr;
   pragma Inline_Always (Sleep_Instr);
   pragma Import (Intrinsic, Sleep_Instr, "__builtin_avr_sleep");

   procedure Sleep (Seconds : Interfaces.Unsigned_16) is
      procedure Do_Sleep;
      pragma Import (C, Do_Sleep, "dosleep");
   begin
      Slow_CPU;
      Elapsed_Seconds := 0;
      loop
         exit when Elapsed_Seconds >= Seconds;

         if True then
            AVR.Sleep.Set_Mode (AVR.Sleep.Power_Save);
            MCU.MCUCR_Bits (AVR.MCU.SE_Bit) := True;
            Disable_BOD;
            Sleep_Instr;
            MCU.MCUCR_Bits (AVR.MCU.SE_Bit) := False;
         else
            Do_Sleep;
         end if;
      end loop;
      Fast_CPU;
   end Sleep;
begin
   Elapsed_Seconds := 0;
end Sleeper;
