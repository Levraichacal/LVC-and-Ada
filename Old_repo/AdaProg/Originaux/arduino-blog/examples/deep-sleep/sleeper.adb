with Interfaces;

with AVR.Timer2;
with AVR.MCU;
with AVR;
with AVR.Interrupts;
with AVR.Sleep;
with AVR.Watchdog;

use AVR;

package body Sleeper is
   use type Interfaces.Unsigned_8;
   use type Interfaces.Unsigned_16;

   Elapsed_Seconds : aliased Interfaces.Unsigned_16;
   pragma Volatile (Elapsed_Seconds);

   procedure Tick;
   pragma Machine_Attribute (Entity         => Tick,
                             Attribute_Name => "signal");
   pragma Export (C, Tick, MCU.Sig_WDT_String);

   procedure Tick is
      use type Interfaces.Unsigned_16;

      Adjustment : constant := 1;
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
      ADCSRA := 0;
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

      if False  then
         Timer2.Init_CTC (Timer2.Scale_By_1024, Overflow => 249);

         AVR.Interrupts.Enable;
      else
         -- AVR.Watchdog.Enable(AVR.Watchdog.WDT_512K);
         AVR.Interrupts.Enable;
         Watchdog.Disable;
      end if;
   end Init;

   procedure Sleep_Instr;
   pragma Inline_Always (Sleep_Instr);
   pragma Import (Intrinsic, Sleep_Instr, "__builtin_avr_sleep");

   procedure Wdr;
   pragma Import (Intrinsic, Wdr, "__builtin_avr_wdr");

   procedure Sleep (Seconds : Interfaces.Unsigned_16) is
      use MCU;

      procedure Do_Sleep;
      pragma Import (C, Do_Sleep, "dosleep");
   begin
      Slow_CPU;
      Elapsed_Seconds := 0;

      Interrupts.Disable;
      Wdr;
      MCUSR_Bits (WDRF_Bit) := False;
      WDTCSR := WDTCSR or WDCE_Mask or WDE_Mask;

      -- Wake up once per second
      WDTCSR_Bits := (WDP3_Bit => False,
                      WDP2_Bit => True,
                      WDP1_Bit => True,
                      WDP0_Bit => False,
                      others => False);
      -- Enable watchdog interrupt
      WDTCSR_Bits (WDIE_Bit) := True;

      -- ..and interrupts globally
      Interrupts.Enable;

      loop
         exit when Elapsed_Seconds >= Seconds;

         if False then
            AVR.Sleep.Set_Mode (AVR.Sleep.Power_Down);
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
