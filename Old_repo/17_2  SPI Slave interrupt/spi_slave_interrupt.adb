with Interfaces;
with AVR.MCU;
with AVR;
with AVR.Interrupts;
--with AVR.Real_Time.Delays;
with LVC.PINS;
with System.Machine_Code;
use System.Machine_Code;
--                  ___    ___
--        RST--PC6 -   \__/   - PC5--CH6
--         RX--PD0 -          - PC4--CH5
--         TX--PD1 -          - PC3--CH4
--        CH7--PD2 -          - PC2--CH3
--        CH8--PD3 -          - PC1--CH2
--             PD4 -          - PC0--CH1
--             VCC -          - GND
--             GND -          - AREF
--       OSC1--PB6 -          - AVCC
--       OSC2--PB7 -          - PB5--LEDSTATUS
--             PD5 -          - PB4
--             PD6 -          - PB3
--             PD7 -          - PB2--LED1
--             PB0 -__________- PB1--INTER1
--

use Interfaces;
use AVR;
use LVC.PINS;


package body Spi_slave_interrupt is

-----------------------------------------------------------------------------------------------------------
--  LES CONSTANTES
-----------------------------------------------------------------------------------------------------------
   MAX7219_MODE_DECODE       : constant := 16#09#;
   MAX7219_MODE_INTENSITY    : constant := 16#0A#;
   MAX7219_MODE_SCAN_LIMIT   : constant := 16#0B#;
   MAX7219_MODE_POWER        : constant := 16#0C#;
   MAX7219_MODE_TEST         : constant := 16#0F#;
   MAX7219_MODE_NOOP         : constant := 16#00#;

-----------------------------------------------------------------------------------------------------------
--  LES VARIABLES
-----------------------------------------------------------------------------------------------------------

   etape : Unsigned_8 := 1;

-----------------------------------------------------------------------------------------------------------
--  LES FONCTIONS ET PROCEDURES UTILES
-----------------------------------------------------------------------------------------------------------

   function U8_To_U16(W : Unsigned_8) return Unsigned_16 is
   begin
      return Unsigned_16 (W and 16#00FF#);
   end U8_To_U16;

   procedure write_SPI (data : Unsigned_8) is
   begin
      digitalWrite(D10,High_lvl);
      -- MCU.SPSR_Bits(MCU.SPIF_Bit):= True;
      -- MCU.SPSR_Bits(MCU.SPIF_Bit):= False;
      MCU.SPDR := data;
      digitalWrite(D10,Low_lvl);
   end write_SPI;

-----------------------------------------------------------------------------------------------------------
--  Les procédures d'initialisation
-----------------------------------------------------------------------------------------------------------
   procedure init_SPI is
   begin
      pinMode(D11, Output); -- MOSI
      pinMode(D13, Output); -- SCK
      pinMode(D10, Output); -- SS
      -- SPI enable Master mode
      MCU.SPCR_Bits := (MCU.SPE_Bit => True,
                        MCU.MSTR_Bit => True,
                        MCU.SPR0_Bit => True,
                        --MCU.CPHA_Bit => True,
                        others => False);
      MCU.PRR_Bits(MCU.PRSPI_Bit) := True;
   end init_SPI;


----------------------------------------------------------------------------------
-- Les fonctions d'initialisation des interruptions                             --
----------------------------------------------------------------------------------

   procedure init_SPI_Interrupt is
   begin
      MCU.SPSR_Bits(MCU.SPIF_Bit):= False;
      MCU.SPCR := +(MCU.SPIE_Bit => True,
                    others => False);
   end init_SPI_Interrupt;


   procedure SPI_Interrupt;

   pragma Machine_Attribute (Entity         => SPI_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, SPI_Interrupt, MCU.Sig_SPI_STC_String);

   procedure SPI_Interrupt is
   begin
   digitalWrite(D2,High_lvl);
      case etape is
         when 1 =>
            etape := 2;
            digitalWrite(D10,High_lvl);
            write_SPI(MAX7219_MODE_DECODE);
         when 2 =>
            etape := 3;
            write_SPI(16#00#);
            digitalWrite(D10,Low_lvl);
         when 3 =>
            etape := 4;
            digitalWrite(D10,High_lvl);
            write_SPI(MAX7219_MODE_SCAN_LIMIT);
         when 4 =>
            etape := 5;
            write_SPI(16#07#); --(8-1);
            digitalWrite(D10,Low_lvl);
         when 5 =>
            etape := 6;
            digitalWrite(D10,High_lvl);
            write_SPI(MAX7219_MODE_INTENSITY);
         when 6 =>
            etape := 7;
            write_SPI(16#08#);
            digitalWrite(D10,Low_lvl);
         when 7 =>
            etape := 8;
            digitalWrite(D10,High_lvl);
            write_SPI(MAX7219_MODE_POWER);
         when 8 =>
            etape := 9;
            write_SPI(16#01#);
            digitalWrite(D10,Low_lvl);
--              byte a[5]={B01111110,B10001000,B10001000,B10001000,B01111110};
         when 9 =>
            etape := 10;
            digitalWrite(D10,High_lvl);
            write_SPI(16#01#);
         when 10 =>
            etape := 11;
            write_SPI(16#7E#);-- A
            digitalWrite(D10,Low_lvl);
         when 11 =>
            etape := 12;
            digitalWrite(D10,High_lvl);
            write_SPI(16#02#);
         when 12 =>
            etape := 13;
            write_SPI(16#88#);
            digitalWrite(D10,Low_lvl);
         when 13 =>
            etape := 14;
            digitalWrite(D10,High_lvl);
            write_SPI(16#03#);
         when 14 =>
            etape := 15;
            write_SPI(16#88#);
            digitalWrite(D10,Low_lvl);
         when 15=>
            etape := 16;
            digitalWrite(D10,High_lvl);
            write_SPI(16#04#);
         when 16 =>
            etape := 17;
            write_SPI(16#88#);
            digitalWrite(D10,Low_lvl);
         when 17 =>
            etape := 18;
            digitalWrite(D10,High_lvl);
            write_SPI(16#05#);
         when 18 =>
            etape := 19;
            write_SPI(16#7E#);
            digitalWrite(D10,Low_lvl);
         when 19 =>
            etape := 20;
            digitalWrite(D10,High_lvl);
            write_SPI(16#06#);
         when 20 =>
            etape := 21;
            write_SPI(16#00#);
            digitalWrite(D10,Low_lvl);
         when 21 =>
            etape := 22;
            digitalWrite(D10,High_lvl);
            write_SPI(16#07#);
         when 22 =>
            etape := 23;
            write_SPI(16#00#);
            digitalWrite(D10,Low_lvl);
         when 23 =>
            etape := 24;
            digitalWrite(D10,High_lvl);
            write_SPI(16#08#);
         when 24 =>
            etape := 25;
            write_SPI(16#00#);
            digitalWrite(D10,Low_lvl);
         when others =>
            null;
      end case;
   end SPI_Interrupt;


-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      AVR.Interrupts.Disable;
      pinMode(D2, Output);
      init_SPI;
      etape := 2;
      init_SPI_Interrupt;
--      MCU.SPSR_Bits(MCU.SPIF):= True := 0;
      AVR.Interrupts.Enable;
      --digitalWrite(D10,High_lvl);
      write_SPI(MAX7219_MODE_DECODE);
      loop
         null;
      end loop;
   end Run;
end Spi_slave_interrupt ;
