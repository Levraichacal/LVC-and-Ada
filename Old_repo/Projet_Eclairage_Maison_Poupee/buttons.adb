with Interfaces;
with LVC.TIME;
with AVR.MCU;
with AVR.Interrupts;
with AVR;
with LIB_74HC595;
with LVC.PINS;

use LVC.TIME;
use AVR.MCU;
use AVR;
use Interfaces;
use LIB_74HC595;
use LVC.PINS;

package body BUTTONS is

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

   Register : T_Register := (others => False);

   procedure Button_Interrupt_On_PortD;
   pragma Machine_Attribute (Entity         => Button_Interrupt_On_PortD,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_On_PortD, MCU.Sig_PCINT2_String);

   procedure Button_Interrupt_On_PortD is
      -- Current_Value : Unsigned_8 := MCU.PIND;
      Current_Time : Unsigned_32 := LVC.TIME.Millis;
   begin
      if ( (Current_Time - Previous_D02_Time > GAP) and then ( MCU.PIND_Bits (2) = False) ) then
         Previous_D02_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(1) := not Register(1);
      end if;
      if ( (Current_Time - Previous_D03_Time > GAP) and then ( MCU.PIND_Bits (3) = False) ) then
         Previous_D03_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(2) := not Register(2);
      end if;
      if ( (Current_Time - Previous_D04_Time > GAP) and then ( MCU.PIND_Bits (4) = False) ) then
         Previous_D04_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(3) := not Register(3);
      end if;
      if ( (Current_Time - Previous_D05_Time > GAP) and then ( MCU.PIND_Bits (5) = False) ) then
         Previous_D05_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(3) := not Register(3);
      end if;
      if ( (Current_Time - Previous_D06_Time > GAP) and then ( MCU.PIND_Bits (6) = False) ) then
         Previous_D06_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(4) := not Register(4);
      end if;
      if ( (Current_Time - Previous_D07_Time > GAP) and then ( MCU.PIND_Bits (7) = False) ) then
         Previous_D07_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(4) := not Register(4);
      end if;
   end Button_Interrupt_On_PortD;

   procedure Button_Interrupt_On_PortB;
   pragma Machine_Attribute (Entity         => Button_Interrupt_On_PortB,
                             Attribute_Name => "signal");
   pragma Export (C, Button_Interrupt_On_PortB, MCU.Sig_PCINT0_String);

   procedure Button_Interrupt_On_PortB is
--      Current_Value : Unsigned_8 := MCU.PINB;
      Current_Time : Unsigned_32 := LVC.TIME.Millis;
   begin
      if ( (Current_Time - Previous_D08_Time > GAP) and then ( MCU.PINB_Bits (0) = False) ) then
         Previous_D08_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(5) := not Register(5);
      end if;
      if ( (Current_Time - Previous_D09_Time > GAP) and then ( MCU.PINB_Bits (1) = False) ) then
         Previous_D09_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(5) := not Register(5);
      end if;
      if ( (Current_Time - Previous_D10_Time > GAP) and then ( MCU.PINB_Bits (2) = False) ) then
         Previous_D10_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(6) := not Register(6);
      end if;
      if ( (Current_Time - Previous_D11_Time > GAP) and then ( MCU.PINB_Bits (3) = False) ) then
         Previous_D11_Time := Current_Time;
         MCU.PORTB_Bits (5) := not MCU.PORTB_Bits (5);
         Register(7) := not Register(7);
      end if;
   end Button_Interrupt_On_PortB;

   procedure init_Watchdog is
   begin
      -- Watchdog reset
      Wdr;
      -- Start timed sequence
      MCU.WDTCSR := +(MCU.WDCE_Bit => True,
                      MCU.WDE_Bit => True,
                      others => False);
      -- Set the prescaler 64 ms and the WatchDog Timer Configuration: just in Interrupt Mode
      MCU.WDTCSR :=  +(MCU.WDIE_Bit => True,
                       MCU.WDE_Bit => False,
                       MCU.WDP1_Bit => True,
                       others => False);
   end init_Watchdog;


   procedure WatchDog_Interrupt;

   pragma Machine_Attribute (Entity         => WatchDog_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, WatchDog_Interrupt, MCU.Sig_WDT_String);

   procedure WatchDog_Interrupt is
   begin
      LIB_74HC595.WriteRegister(Register);
   end WatchDog_Interrupt;

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
      MCU.DDRD_Bits (2) := DD_Input;
      MCU.PORTD_Bits (2) := True;

      -- Entree -D3
      MCU.PCMSK2_Bits (MCU.PCINT19_Bit) := True;
      MCU.DDRD_Bits (3) := DD_Input;
      MCU.PORTD_Bits (3) := True;

      -- Cuisine 1 -D4
      MCU.PCMSK2_Bits (MCU.PCINT20_Bit) := True;
      MCU.DDRD_Bits (4) := DD_Input;
      MCU.PORTD_Bits (4) := True;

      -- Cuisine 2 -D5
      MCU.PCMSK2_Bits (MCU.PCINT21_Bit) := True;
      MCU.DDRD_Bits (5) := DD_Input;
      MCU.PORTD_Bits (5) := True;

      -- Salon 1 -D6
      MCU.PCMSK2_Bits (MCU.PCINT22_Bit) := True;
      MCU.DDRD_Bits (6) := DD_Input;
      MCU.PORTD_Bits (6) := True;

      -- Salon 2 -D7
      MCU.PCMSK2_Bits (MCU.PCINT23_Bit) := True;
      MCU.DDRD_Bits (7) := DD_Input;
      MCU.PORTD_Bits (7) := True;

      -- Bureau 1 -D8
      MCU.PCMSK0_Bits (MCU.PCINT0_Bit) := True;
      MCU.DDRB_Bits (0) := DD_Input;
      MCU.PORTB_Bits (0) := True;

      -- Bureau 2 -D9
      MCU.PCMSK0_Bits (MCU.PCINT1_Bit) := True;
      MCU.DDRB_Bits (1) := DD_Input;
      MCU.PORTB_Bits (1) := True;

      -- Salle de bain -D10
      MCU.PCMSK0_Bits (MCU.PCINT2_Bit) := True;
      MCU.DDRB_Bits (2) := DD_Input;
      MCU.PORTB_Bits (2) := True;

      -- Chambre -D11
      MCU.PCMSK0_Bits (MCU.PCINT3_Bit) := True;
      MCU.DDRB_Bits (3) := DD_Input;
      MCU.PORTB_Bits (3) := True;

      -- Pin change indicator
      MCU.DDRB_Bits (5) := DD_Output; -- D13
      MCU.PORTB_Bits (5) := True;

      -- Enable interrupts on Port
      MCU.PCICR_Bits (MCU.PCIE0_Bit) := True;
      MCU.PCICR_Bits (MCU.PCIE2_Bit) := True;

      -- Init Watchdog
      init_Watchdog;

      -- Init 74HC595
      LIB_74HC595.Init(A0, A1, A2);
      LIB_74HC595.EmptyRegister;

      -- Enable General interrupts
      AVR.Interrupts.Enable;
      LVC.TIME.Start_Timer;
   end Init;

end BUTTONS;
