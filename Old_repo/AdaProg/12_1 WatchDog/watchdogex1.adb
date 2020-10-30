-- Ce programme permet de faire clignoter une LED, la D13 qui est celle connectée par défaut,
-- à l'aide d'un watchdog 
--                  ___    ___
--             PC6 -   \__/   - PC5
--             PD0 -          - PC4
--             PD1 -          - PC3
--             PD2 -          - PC2
--             PD3 -          - PC1
--             PD4 -          - PC0
--             VCC -          - GND
--             GND -          - AREF
--             PB6 -          - AVCC
--             PB7 -          - PB5 
--             PD5 -          - PB4
--             PD6 -          - PB3
--             PD7 -          - PB2
--             PB0 -__________- PB1
--
-- Le principe de fonctionnement est le suivant :
--  - Le watchdog déclenche une intérruption logicielle
--  - Dans l'intérruption, on change le status de la LED.
-- et on boucle...
with AVR;
with AVR.MCU;
with AVR.Interrupts;
with LVC.PINS;

use AVR;
use AVR.MCU;
use LVC.PINS;

package body WatchDogEx1 is

   niveauLed : LVC.PINS.lvcLevel := High_lvl;

   procedure init_Watchdog is
   begin
      AVR.Interrupts.Disable;
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
      -- Set the prescaler 4.0 s and the WatchDog Timer Configuration: just in Interrupt Mode
      MCU.WDTCSR :=  +(MCU.WDIE_Bit => True,
                       MCU.WDE_Bit => False,
                       MCU.WDP3_Bit => True,
                       others => False);
      -- WatchDog Timer Configuration: just in Interrupt Mode
--      MCU.WDTCSR_Bits(MCU.WDIE_Bit) := True;
--      MCU.WDTCSR_Bits(MCU.WDE_Bit) := False;
      -- Enable WatchDog Interruption

      AVR.Interrupts.Enable;
   end init_Watchdog;



   procedure WatchDog_Interrupt;

   pragma Machine_Attribute (Entity         => WatchDog_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, WatchDog_Interrupt, MCU.Sig_WDT_String);

   procedure WatchDog_Interrupt is
   begin
      AVR.Interrupts.Disable;
      niveauLed := not niveauLed;
      LVC.PINS.digitalWrite(D13,niveauLed);
      AVR.Interrupts.Enable;
   end WatchDog_Interrupt;

-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      init_Watchdog;
      LVC.PINS.pinMode(D13,Output);
      LVC.PINS.digitalWrite(D13,niveauLed);
      loop
         null;
      end loop;
   end Run;

end WatchDogEx1;
