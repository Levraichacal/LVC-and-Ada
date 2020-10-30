-----------------------------------------------------------------------------------------------------------
--                  ___    ___                                                                           --
--        RST--PC6 -   \__/   - PC5                                                                      --
--         RX--PD0 -          - PC4                                                                      --
--         TX--PD1 -          - PC3                                                                      --
--             PD2 -          - PC2                                                                      --
--             PD3 -          - PC1                                                                      --
--             PD4 -          - PC0                                                                      --
--             VCC -          - GND                                                                      --
--             GND -          - AREF                                                                     --
--       OSC1--PB6 -          - AVCC                                                                     --
--       OSC2--PB7 -          - PB5--LEDSTATUS                                                           --
--             PD5 -          - PB4                                                                      --
--             PD6 -          - PB3                                                                      --
--             PD7 -          - PB2                                                                      --
--             PB0 -__________- PB1                                                                      --
--                                                                                                       --
-----------------------------------------------------------------------------------------------------------


with AVR;
with AVR.MCU;
with AVR.Interrupts;
with Interfaces;

use AVR;
use AVR.MCU;
use Interfaces;



package body Serial is


-----------------------------------------------------------------------------------------------------------
--  LES PROCEDURES D'INITIALISATION
-----------------------------------------------------------------------------------------------------------

   procedure init_Serial_Com is
   begin
      -- Set Baud rate Fosc = 16MHz, baud 38400 => UBRR = Fosc/16/baud-1 = 25
      MCU.UBRR0 := Unsigned_16(25);
      MCU.UCSR0A := 0;
      --Set Format bit : 8N1
      MCU.UCSR0C := +(MCU.UCSZ00_Bit => True,
                      MCU.UCSZ01_Bit => True,
                      others => False);
      -- Enable Transmitter
      MCU.UCSR0B := +(MCU.TXEN0_Bit => True,
                      others => False);
   end init_Serial_Com;

--   procedure init_InterruptCom is
--   begin
      -- Interruption sur l'émission
--      MCU.UCSR0B_Bits (MCU.TXCIE0_Bit) := True;
--   end init_InterruptCom;

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
      MCU.WDTCSR_Bits := (MCU.WDCE_Bit => True,
                          MCU.WDE_Bit => True,
                     others => False);
      -- Set the prescaler 16.0 ms and the WatchDog Timer Configuration: just in Interrupt Mode
      MCU.WDTCSR :=  +(MCU.WDIE_Bit => True,
                       MCU.WDE_Bit => False,
                       others => False);
      -- WatchDog Timer Configuration: just in Interrupt Mode
--      MCU.WDTCSR_Bits(MCU.WDIE_Bit) := True;
--      MCU.WDTCSR_Bits(MCU.WDE_Bit) := False;
      -- Enable WatchDog Interruption

      AVR.Interrupts.Enable;
   end init_Watchdog;

-----------------------------------------------------------------------------------------------------------
--  LES INTERRUPTIONS MATERIELLES ET LEURS PROCEDURES
-----------------------------------------------------------------------------------------------------------

   procedure WatchDog_Interrupt;

   pragma Machine_Attribute (Entity         => WatchDog_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, WatchDog_Interrupt, MCU.Sig_WDT_String);

   procedure WatchDog_Interrupt is
   begin
--      MCU.UDR0 := 16#00#;
      MCU.UDR0 := 16#55#;
   end WatchDog_Interrupt;


--   procedure TX_UART_Interrupt;

--   pragma Machine_Attribute (Entity         => TX_UART_Interrupt,
--                             Attribute_Name => "signal");

--   pragma Export (C, TX_UART_Interrupt, MCU.Sig_USART_TX_String);

-- Stop interrupts during writing the register value!
--   procedure TX_UART_Interrupt is
--   begin
--      MCU.UDR0 := 16#00#;
--   end TX_UART_Interrupt;

-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      init_Serial_Com;
--      init_InterruptCom;
--      MCU.UDR0 := 16#00#;-- Send a first to data to start the TX_UART_Interrupt!
      init_Watchdog;
      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;
end Serial ;
