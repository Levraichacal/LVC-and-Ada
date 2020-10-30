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
with AVR.Real_Time.Delays;

package body Spi_max7219 is

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


   procedure write_SPI (data : Unsigned_8) is
   begin
      digitalWrite(D10,High_lvl);
      -- MCU.SPSR_Bits(MCU.SPIF_Bit):= True;
      -- MCU.SPSR_Bits(MCU.SPIF_Bit):= False;
      MCU.SPDR := data;
      loop
         exit when MCU.SPSR_Bits(MCU.SPIF_Bit);
      end loop;
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
      MCU.PRR_Bits(MCU.PRSPI_Bit) := False; -- Mettre à False pour l'activer
   end init_SPI;




-----------------------------------------------------------------------------------------------------------
--  LA PROCEDURE RUN
-----------------------------------------------------------------------------------------------------------

   procedure Run is
   begin
      AVR.Interrupts.Disable;
      init_SPI;
--      MCU.SPSR_Bits(MCU.SPIF):= True := 0;
      AVR.Interrupts.Enable;
      --digitalWrite(D10,High_lvl);
      write_SPI(MAX7219_MODE_DECODE);
      write_SPI(16#00#);
      write_SPI(MAX7219_MODE_SCAN_LIMIT);
      write_SPI(16#07#); --(8-1); Nombre de ligne, en commencant par zéro
      write_SPI(MAX7219_MODE_INTENSITY);
      write_SPI(16#08#);
      write_SPI(MAX7219_MODE_POWER);
      write_SPI(16#01#);
      loop
         --    byte a[5]={B01111110,B10001000,B10001000,B10001000,B01111110};
         write_SPI(16#01#);
         write_SPI(16#7E#);-- A
         delay 0.1;
         write_SPI(16#02#);
         write_SPI(16#88#);
         delay 0.1;
         write_SPI(16#03#);
         write_SPI(16#7E#);
         delay 0.1;
         write_SPI(16#04#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#05#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#06#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#07#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#08#);
         write_SPI(16#00#);
         delay 1.0;
         write_SPI(16#01#);
         write_SPI(16#00#);-- A
         delay 0.1;
         write_SPI(16#02#);
         write_SPI(16#7E#);
         delay 0.1;
         write_SPI(16#03#);
         write_SPI(16#88#);
         delay 0.1;
         write_SPI(16#04#);
         write_SPI(16#88#);
         delay 0.1;
         write_SPI(16#05#);
         write_SPI(16#7E#);
         delay 0.1;
         write_SPI(16#06#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#07#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#08#);
         write_SPI(16#00#);
         delay 1.0;
         write_SPI(16#01#);
         write_SPI(16#00#);-- A
         delay 0.1;
         write_SPI(16#02#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#03#);
         write_SPI(16#7E#);
         delay 0.1;
         write_SPI(16#04#);
         write_SPI(16#88#);
         delay 0.1;
         write_SPI(16#05#);
         write_SPI(16#88#);
         delay 0.1;
         write_SPI(16#06#);
         write_SPI(16#7E#);
         delay 0.1;
         write_SPI(16#07#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#08#);
         write_SPI(16#00#);
         delay 1.0;
         write_SPI(16#01#);
         write_SPI(16#00#);-- A
         delay 0.1;
         write_SPI(16#02#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#03#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#04#);
         write_SPI(16#7E#);
         delay 0.1;
         write_SPI(16#05#);
         write_SPI(16#88#);
         delay 0.1;
         write_SPI(16#06#);
         write_SPI(16#88#);
         delay 0.1;
         write_SPI(16#07#);
         write_SPI(16#7E#);
         delay 0.1;
         write_SPI(16#08#);
         write_SPI(16#00#);
         delay 1.0;
         write_SPI(16#01#);
         write_SPI(16#00#);-- A
         delay 0.1;
         write_SPI(16#02#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#03#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#04#);
         write_SPI(16#00#);
         delay 0.1;
         write_SPI(16#05#);
         write_SPI(16#7E#);
         delay 0.1;
         write_SPI(16#06#);
         write_SPI(16#88#);
         delay 0.1;
         write_SPI(16#07#);
         write_SPI(16#88#);
         delay 0.1;
         write_SPI(16#08#);
         write_SPI(16#7E#);
         delay 5.0;
      end loop;
   end Run;
end Spi_max7219 ;
