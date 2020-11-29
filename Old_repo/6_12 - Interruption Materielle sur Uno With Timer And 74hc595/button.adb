with AVR;
with AVR.MCU;
with AVR.Interrupts;
with Interfaces;
with LVC.TIME;
with LIB_74HC595;

use AVR;
use Interfaces;
use LIB_74HC595;
use AVR.MCU;

package body Button is

   GAP : constant Unsigned_32 := 16#01F4#;

   Previous_A0_Time : Unsigned_32 := 0;
   Previous_A1_Time : Unsigned_32 := 0;
   Previous_A2_Time : Unsigned_32 := 0;
   Previous_A3_Time : Unsigned_32 := 0;
   Previous_A4_Time : Unsigned_32 := 0;
   Previous_A5_Time : Unsigned_32 := 0;

   Register : T_Register := (others => false);
   -- Toilette_Status : Boolean := True;
   -- Entree_Status : Boolean := True;
   -- Cuisine_Status : Boolean := True;
   -- Salon_Status : Boolean := True;

   procedure Button_Interrupt;
   pragma Machine_Attribute (Entity         => Button_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt, MCU.Sig_PCINT1_String);

   procedure Button_Interrupt is
      Current_Time : Unsigned_32 := LVC.TIME.Millis;
   begin
      if ( (Current_Time - Previous_A0_Time > GAP) and then ( MCU.PINC_Bits (0) = False) ) then
         Previous_A0_Time := Current_Time;
--         MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := False;
         -- MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         --Toilette_Status := not Toilette_Status;
         -- LIB_74HC595.SetRegisterValue(8, Toilette_Status);
         Register(1) := not Register(1);
         -- Register(8) := Toilette_Status;
         -- LIB_74HC595.SetRegisterValue(7, False);
--         MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := True;
      end if;
      if ( (Current_Time - Previous_A1_Time > GAP) and then ( MCU.PINC_Bits (1) = False) ) then
         Previous_A1_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(2) := not Register(2);
      end if;
      if ( (Current_Time - Previous_A2_Time > GAP) and then ( MCU.PINC_Bits (2) = False) ) then
         Previous_A2_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(3) := not Register(3);
      end if;
      if ( (Current_Time - Previous_A3_Time > GAP) and then ( MCU.PINC_Bits (3) = False) ) then
         Previous_A3_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(3) := not Register(3);
      end if;
      if ( (Current_Time - Previous_A4_Time > GAP) and then ( MCU.PINC_Bits (4) = False) ) then
         Previous_A4_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(4) := not Register(4);
      end if;
      if ( (Current_Time - Previous_A5_Time > GAP) and then ( MCU.PINC_Bits (5) = False) ) then
         Previous_A5_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(4) := not Register(4);
      end if;

   end Button_Interrupt;

   procedure init_Watchdog is
   begin
--      AVR.Interrupts.Disable;
      -- Watchdog reset
      Wdr;
      -- Clear the WatchDog Flag in the MCU Status Register
--      MCU.MCUSR_Bits := (MCU.WDRF_Bit => False,
--                         MCU.PORF_Bit => MCU.MCUSR_Bits(MCU.PORF_Bit),
--                         MCU.EXTRF_Bit => MCU.MCUSR_Bits (MCU.EXTRF_Bit),
--                         MCU.BORF_Bit => MCU.MCUSR_Bits (MCU.BORF_Bit),
--                         others => False);
      -- Start timed sequence
      MCU.WDTCSR := +(MCU.WDCE_Bit => True,
                      MCU.WDE_Bit => True,
                      others => False);
      -- Set the prescaler 64 ms and the WatchDog Timer Configuration: just in Interrupt Mode
      MCU.WDTCSR :=  +(MCU.WDIE_Bit => True,
                       MCU.WDE_Bit => False,
                       MCU.WDP1_Bit => True,
                       others => False);
      -- WatchDog Timer Configuration: just in Interrupt Mode
--      MCU.WDTCSR_Bits(MCU.WDIE_Bit) := True;
--      MCU.WDTCSR_Bits(MCU.WDE_Bit) := False;
      -- Enable WatchDog Interruption

  --    AVR.Interrupts.Enable;
   end init_Watchdog;



   procedure WatchDog_Interrupt;

   pragma Machine_Attribute (Entity         => WatchDog_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, WatchDog_Interrupt, MCU.Sig_WDT_String);

   procedure WatchDog_Interrupt is
   begin
--      AVR.Interrupts.Disable;
  --    niveauLed := not niveauLed;
    --  LVC.PINS.digitalWrite(D13,niveauLed);
      --AVR.Interrupts.Enable;
      LIB_74HC595.WriteRegister(Register);
   end WatchDog_Interrupt;


   procedure Run is
   begin
      AVR.Interrupts.Disable;
      MCU.DDRC_Bits (0) := DD_Input; -- A0
      MCU.PORTC_Bits(0) := True;
      MCU.DDRC_Bits (1) := DD_Input; -- A1
      MCU.PORTC_Bits(1) := True;
      MCU.DDRC_Bits (2) := DD_Input; -- A2
      MCU.PORTC_Bits(2) := True;
      MCU.DDRC_Bits (3) := DD_Input; -- A3
      MCU.PORTC_Bits(3) := True;
      MCU.DDRC_Bits (4) := DD_Input; -- A4
      MCU.PORTC_Bits(4) := True;
      MCU.DDRC_Bits (5) := DD_Input; -- A5
      MCU.PORTC_Bits(5) := True;

      MCU.DDRB_Bits (5) := DD_Output; -- D13
      MCU.PORTB_Bits (5) := True;

      MCU.PCICR_Bits (MCU.PCIE1_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT8_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT9_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT10_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT11_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT12_Bit) := True;
      MCU.PCMSK1_Bits (MCU.PCINT13_Bit) := True;
      init_Watchdog;

      LIB_74HC595.Init;
      LIB_74HC595.EmptyRegister;
      -- LIB_74HC595.SetRegisterValue(1, True);
      -- LIB_74HC595.SetRegisterValue(2, True);
--      LIB_74HC595.WriteRegister;

      AVR.Interrupts.Enable;
      LVC.TIME.Start_Timer;
      loop
         null;
      end loop;
   end Run;
end Button;
