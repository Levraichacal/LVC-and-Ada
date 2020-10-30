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

with System;                   use System;  --   make Address visible
with Interfaces;               use Interfaces;

package AVR.ATtiny841 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id: avr-attiny841.ads 1 2015-06-09 15:21:01Z Seb_Bardot_LVC $";


   --
   --  memory sizes
   --
   Flash_Size               : constant := 16#1000#;
   Flash_End                : constant := 16#0fff#;
   EEprom_Size              : constant := 16#0200#;
   E2end                    : constant := 16#01ff#;
   Int_SRAM_Start_Addr      : constant := 16#100#;
   Int_SRAM_Size            : constant := 16#200#;

   --
   --  interrupts
   --
   Number_Of_Interrupts     : constant := 17;

   --  External Pin, Power-on Reset, Brown-out Reset,Watchdog Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  External Interrupt Request 0
   Sig_EXT_INT0             : constant        :=  1;
   Sig_EXT_INT0_String      : constant String := "__vector_1";
   --  Pin Change Interrupt Request 0
   Sig_PCINT0               : constant        :=  2;
   Sig_PCINT0_String        : constant String := "__vector_2";
   --  Pin Change Interrupt Request 1
   Sig_PCINT1               : constant        :=  3;
   Sig_PCINT1_String        : constant String := "__vector_3";
   --  Watchdog Time-out
   Sig_WATCHDOG             : constant        :=  4;
   Sig_WATCHDOG_String      : constant String := "__vector_4";
   --  Timer/Counter1 Capture Event
   Sig_TIM1_CAPT            : constant        :=  5;
   Sig_TIM1_CAPT_String     : constant String := "__vector_5";
   --  Timer/Counter1 Compare Match A
   Sig_TIM1_COMPA           : constant        :=  6;
   Sig_TIM1_COMPA_String    : constant String := "__vector_6";
   --  Timer/Counter1 Compare Match B
   Sig_TIM1_COMPB           : constant        :=  7;
   Sig_TIM1_COMPB_String    : constant String := "__vector_7";
   --  Timer/Counter1 Overflow
   Sig_TIM1_OVF             : constant        :=  8;
   Sig_TIM1_OVF_String      : constant String := "__vector_8";
   --  Timer/Counter0 Compare Match A
   Sig_TIM0_COMPA           : constant        :=  9;
   Sig_TIM0_COMPA_String    : constant String := "__vector_9";
   --  Timer/Counter0 Compare Match B
   Sig_TIM0_COMPB           : constant        := 10;
   Sig_TIM0_COMPB_String    : constant String := "__vector_10";
   --  Timer/Counter0 Overflow
   Sig_TIM0_OVF             : constant        := 11;
   Sig_TIM0_OVF_String      : constant String := "__vector_11";
   --  Analog Comparator 0
   Sig_ANA_COMP0            : constant        := 12;
   Sig_ANA_COMP0_String     : constant String := "__vector_12";
   --  ADC Conversion Complete
   Sig_ADC                  : constant        := 13;
   Sig_ADC_String           : constant String := "__vector_13";
   --  EEPROM Ready
   Sig_EE_RDY               : constant        := 14;
   Sig_EE_RDY_String        : constant String := "__vector_14";
   --  Analog Comparator 1
   Sig_ANA_COMP1            : constant        := 15;
   Sig_ANA_COMP1_String     : constant String := "__vector_15";
   --  Timer/Counter2 Capture Event
   Sig_TIM2_CAPT            : constant        := 16;
   Sig_TIM2_CAPT_String     : constant String := "__vector_16";
   --  Timer/Counter2 Compare Match A
   Sig_TIM2_COMPA           : constant        := 17;
   Sig_TIM2_COMPA_String    : constant String := "__vector_17";
   --  Timer/Counter2 Compare Match B
   Sig_TIM2_COMPB           : constant        := 18;
   Sig_TIM2_COMPB_String    : constant String := "__vector_18";
   --  Timer/Counter2 Overflow
   Sig_TIM2_OVF             : constant        := 19;
   Sig_TIM2_OVF_String      : constant String := "__vector_19";
   --  SPI Serial Transfer Complete
   Sig_SPI_STC              : constant        := 20;
   Sig_SPI_STC_String       : constant String := "__vector_20";
   --  USART0, Rx Start
   Sig_USART0_RXS           : constant        := 21;
   Sig_USART0_RXS_String    : constant String := "__vector_21";
   --  USART0, Rx Complete
   Sig_USART0_RXC           : constant        := 22;
   Sig_USART0_RXC_String    : constant String := "__vector_22";
   --  USART0 Data register Empty
   Sig_USART0_DRE           : constant        := 23;
   Sig_USART0_DRE_String    : constant String := "__vector_23";
   --  USART0, Tx Complete
   Sig_USART0_TXC           : constant        := 24;
   Sig_USART0_TXC_String    : constant String := "__vector_24";
   --  USART1, Rx Start
   Sig_USART1_RXS           : constant        := 25;
   Sig_USART1_RXS_String    : constant String := "__vector_25";
   --  USART1, Rx Complete
   Sig_USART1_RXC           : constant        := 26;
   Sig_USART1_RXC_String    : constant String := "__vector_26";
   --  USART1 Data register Empty
   Sig_USART1_DRE           : constant        := 27;
   Sig_USART1_DRE_String    : constant String := "__vector_27";
   --  USART1, Tx Complete
   Sig_USART1_TXC           : constant        := 28;
   Sig_USART1_TXC_String    : constant String := "__vector_28";
   --  Two-wire Interface
   Sig_TWI                  : constant        := 29;
   Sig_TWI_String           : constant String := "__vector_29";



   --
   --  I/O registers
   --

   --  Configuration Change Protection Register
   CCP_Addr                 : constant Address    := 16#71#;
   CCP                      : Unsigned_8 ;
   for CCP'Address use CCP_Addr;
   pragma Volatile (CCP);
   CCP_Bits                 : Bits_In_Byte;
   for CCP_Bits'Address use CCP_Addr;
   pragma Volatile (CCP_Bits);
   --  Configuration Change Protection Register bit 0
   CCP0_Bit                 : constant Bit_Number := 0;
   CCP0_Mask                : constant Unsigned_8 := 16#01#;
   --  Configuration Change Protection Register bit 1
   CCP1_Bit                 : constant Bit_Number := 1;
   CCP1_Mask                : constant Unsigned_8 := 16#02#;
   --  Configuration Change Protection Register bit 2
   CCP2_Bit                 : constant Bit_Number := 2;
   CCP2_Mask                : constant Unsigned_8 := 16#04#;
   --  Configuration Change Protection Register bit 3
   CCP3_Bit                 : constant Bit_Number := 3;
   CCP3_Mask                : constant Unsigned_8 := 16#08#;
   --  Configuration Change Protection Register bit 4
   CCP4_Bit                 : constant Bit_Number := 4;
   CCP4_Mask                : constant Unsigned_8 := 16#10#;
   --  Configuration Change Protection Register bit 5
   CCP5_Bit                 : constant Bit_Number := 5;
   CCP5_Mask                : constant Unsigned_8 := 16#20#;
   --  Configuration Change Protection Register bit 6
   CCP6_Bit                 : constant Bit_Number := 6;
   CCP6_Mask                : constant Unsigned_8 := 16#40#;
   --  Configuration Change Protection Register bit 7
   CCP7_Bit                 : constant Bit_Number := 7;
   CCP7_Mask                : constant Unsigned_8 := 16#80#;


   --  Stack Pointer High
   SPH_Addr                 : constant Address    := 16#5e#;
   SPH                      : Unsigned_8 ;
   for SPH'Address use SPH_Addr;
   pragma Volatile (SPH);
   SPH_Bits                 : Bits_In_Byte;
   for SPH_Bits'Address use SPH_Addr;
   pragma Volatile (SPH_Bits);
   --  Stack pointer bit 8
   SP8_Bit                  : constant Bit_Number := 0;
   SP8_Mask                 : constant Unsigned_8 := 16#01#;
   --  Stack pointer bit 9
   SP9_Bit                  : constant Bit_Number := 1;
   SP9_Mask                 : constant Unsigned_8 := 16#02#;

   --  Stack Pointer Low
   SPL_Addr                 : constant Address    := 16#5d#;
   SP                       : Unsigned_16;
   for SP'Address use SPL_Addr;
   pragma Volatile (SP);
   SPL                      : Unsigned_8 ;
   for SPL'Address use SPL_Addr;
   pragma Volatile (SPL);
   SPL_Bits                 : Bits_In_Byte;
   for SPL_Bits'Address use SPL_Addr;
   pragma Volatile (SPL_Bits);
   --  Stack pointer bit 0
   SP0_Bit                  : constant Bit_Number := 0;
   SP0_Mask                 : constant Unsigned_8 := 16#01#;
   --  Stack pointer bit 1
   SP1_Bit                  : constant Bit_Number := 1;
   SP1_Mask                 : constant Unsigned_8 := 16#02#;
   --  Stack pointer bit 2
   SP2_Bit                  : constant Bit_Number := 2;
   SP2_Mask                 : constant Unsigned_8 := 16#04#;
   --  Stack pointer bit 3
   SP3_Bit                  : constant Bit_Number := 3;
   SP3_Mask                 : constant Unsigned_8 := 16#08#;
   --  Stack pointer bit 4
   SP4_Bit                  : constant Bit_Number := 4;
   SP4_Mask                 : constant Unsigned_8 := 16#10#;
   --  Stack pointer bit 5
   SP5_Bit                  : constant Bit_Number := 5;
   SP5_Mask                 : constant Unsigned_8 := 16#20#;
   --  Stack pointer bit 6
   SP6_Bit                  : constant Bit_Number := 6;
   SP6_Mask                 : constant Unsigned_8 := 16#40#;
   --  Stack pointer bit 7
   SP7_Bit                  : constant Bit_Number := 7;
   SP7_Mask                 : constant Unsigned_8 := 16#80#;


   --  Status Register
   SREG_Addr                : constant Address    := 16#5f#;
   SREG                     : Unsigned_8 ;
   for SREG'Address use SREG_Addr;
   pragma Volatile (SREG);
   SREG_Bits                : Bits_In_Byte;
   for SREG_Bits'Address use SREG_Addr;
   pragma Volatile (SREG_Bits);
   --  Carry Flag
   C_Bit                    : constant Bit_Number := 0;
   C_Mask                   : constant Unsigned_8 := 16#01#;
   --  Zero Flag
   Z_Bit                    : constant Bit_Number := 1;
   Z_Mask                   : constant Unsigned_8 := 16#02#;
   --  Negative Flag
   N_Bit                    : constant Bit_Number := 2;
   N_Mask                   : constant Unsigned_8 := 16#04#;
   --  Two's Complement Overflow Flag
   V_Bit                    : constant Bit_Number := 3;
   V_Mask                   : constant Unsigned_8 := 16#08#;
   --  Sign Bit
   S_Bit                    : constant Bit_Number := 4;
   S_Mask                   : constant Unsigned_8 := 16#10#;
   --  Half Carry Flag
   H_Bit                    : constant Bit_Number := 5;
   H_Mask                   : constant Unsigned_8 := 16#20#;
   --  Bit Copy Storage
   T_Bit                    : constant Bit_Number := 6;
   T_Mask                   : constant Unsigned_8 := 16#40#;
   --  Global Interrupt Enable
   I_Bit                    : constant Bit_Number := 7;
   I_Mask                   : constant Unsigned_8 := 16#80#;


   --  EEPROM Address Register High Byte
   EEARH_Addr               : constant Address    := 16#3F#;
   EEARH                    : Unsigned_8 ;
   for EEARH'Address use EEARH_Addr;
   pragma Volatile (EEARH);
   EEARH_Bits               : Bits_In_Byte;
   for EEARH_Bits'Address use EEARH_Addr;
   pragma Volatile (EEARH_Bits);
   --  EEPROM Read/Write Access Bit 8
   EEAR8_Bit                : constant Bit_Number := 0;
   EEAR8_Mask               : constant Unsigned_8 := 16#01#;

   --  EEPROM Address Register Low Byte
   EEARL_Addr               : constant Address    := 16#3E#;
   EEAR                     : Unsigned_16;
   for EEAR'Address use EEARL_Addr;
   pragma Volatile (EEAR);
   EEARL                    : Unsigned_8 ;
   for EEARL'Address use EEARL_Addr;
   pragma Volatile (EEARL);
   EEARL_Bits               : Bits_In_Byte;
   for EEARL_Bits'Address use EEARL_Addr;
   pragma Volatile (EEARL_Bits);
   --  EEPROM Read/Write Access Bit 0
   EEAR0_Bit                : constant Bit_Number := 0;
   EEAR0_Mask               : constant Unsigned_8 := 16#01#;
   --  EEPROM Read/Write Access Bit 1
   EEAR1_Bit                : constant Bit_Number := 1;
   EEAR1_Mask               : constant Unsigned_8 := 16#02#;
   --  EEPROM Read/Write Access Bit 2
   EEAR2_Bit                : constant Bit_Number := 2;
   EEAR2_Mask               : constant Unsigned_8 := 16#04#;
   --  EEPROM Read/Write Access Bit 3
   EEAR3_Bit                : constant Bit_Number := 3;
   EEAR3_Mask               : constant Unsigned_8 := 16#08#;
   --  EEPROM Read/Write Access Bit 4
   EEAR4_Bit                : constant Bit_Number := 4;
   EEAR4_Mask               : constant Unsigned_8 := 16#10#;
   --  EEPROM Read/Write Access Bit 5
   EEAR5_Bit                : constant Bit_Number := 5;
   EEAR5_Mask               : constant Unsigned_8 := 16#20#;
   --  EEPROM Read/Write Access Bit 6
   EEAR6_Bit                : constant Bit_Number := 6;
   EEAR6_Mask               : constant Unsigned_8 := 16#40#;
   --  EEPROM Read/Write Access Bit 7
   EEAR7_Bit                : constant Bit_Number := 7;
   EEAR7_Mask               : constant Unsigned_8 := 16#80#;

   --  EEPROM Data Register
   EEDR_Addr                : constant Address    := 16#3D#;
   EEDR                     : Unsigned_8 ;
   for EEDR'Address use EEDR_Addr;
   pragma Volatile (EEDR);
   EEDR_Bits                : Bits_In_Byte;
   for EEDR_Bits'Address use EEDR_Addr;
   pragma Volatile (EEDR_Bits);
   --  EEPROM Data Register Bit 0
   EEDR0_Bit                : constant Bit_Number := 0;
   EEDR0_Mask               : constant Unsigned_8 := 16#01#;
   --  EEPROM Data Register Bit 1
   EEDR1_Bit                : constant Bit_Number := 1;
   EEDR1_Mask               : constant Unsigned_8 := 16#02#;
   --  EEPROM Data Register Bit 2
   EEDR2_Bit                : constant Bit_Number := 2;
   EEDR2_Mask               : constant Unsigned_8 := 16#04#;
   --  EEPROM Data Register Bit 3
   EEDR3_Bit                : constant Bit_Number := 3;
   EEDR3_Mask               : constant Unsigned_8 := 16#08#;
   --  EEPROM Data Register Bit 4
   EEDR4_Bit                : constant Bit_Number := 4;
   EEDR4_Mask               : constant Unsigned_8 := 16#10#;
   --  EEPROM Data Register Bit 5
   EEDR5_Bit                : constant Bit_Number := 5;
   EEDR5_Mask               : constant Unsigned_8 := 16#20#;
   --  EEPROM Data Register Bit 6
   EEDR6_Bit                : constant Bit_Number := 6;
   EEDR6_Mask               : constant Unsigned_8 := 16#40#;
   --  EEPROM Data Register Bit 7
   EEDR7_Bit                : constant Bit_Number := 7;
   EEDR7_Mask               : constant Unsigned_8 := 16#80#;

   --  EEPROM Control Register
   EECR_Addr                : constant Address    := 16#3C#;
   EECR                     : Unsigned_8 ;
   for EECR'Address use EECR_Addr;
   pragma Volatile (EECR);
   EECR_Bits                : Bits_In_Byte;
   for EECR_Bits'Address use EECR_Addr;
   pragma Volatile (EECR_Bits);
   --  EEPROM Read Enable
   EERE_Bit                 : constant Bit_Number := 0;
   EERE_Mask                : constant Unsigned_8 := 16#01#;
   --  EEPROM Write Enable
   EEPE_Bit                 : constant Bit_Number := 1;
   EEPE_Mask                : constant Unsigned_8 := 16#02#;
   --  EEPROM Master Write Enable
   EEMPE_Bit                : constant Bit_Number := 2;
   EEMPE_Mask               : constant Unsigned_8 := 16#04#;
   --  EEPROM Ready Interrupt Enable
   EERIE_Bit                : constant Bit_Number := 3;
   EERIE_Mask               : constant Unsigned_8 := 16#08#;
   --  EEPROM Programming Mode Bit 0
   EEPM0_Bit                : constant Bit_Number := 4;
   EEPM0_Mask               : constant Unsigned_8 := 16#10#;
   --  EEPROM Programming Mode Bit 1
   EEPM1_Bit                : constant Bit_Number := 5;
   EEPM1_Mask               : constant Unsigned_8 := 16#20#;


   --  General Purpose I/O Register 2
   GPIOR2_Addr              : constant Address    := 16#35#;
   GPIOR2                   : Unsigned_8 ;
   for GPIOR2'Address use GPIOR2_Addr;
   pragma Volatile (GPIOR2);
   GPIOR2_Bits              : Bits_In_Byte;
   for GPIOR2_Bits'Address use GPIOR2_Addr;
   pragma Volatile (GPIOR2_Bits);
   GPIOR20_Bit              : constant Bit_Number := 0;
   GPIOR20_Mask             : constant Unsigned_8 := 16#01#;
   GPIOR21_Bit              : constant Bit_Number := 1;
   GPIOR21_Mask             : constant Unsigned_8 := 16#02#;
   GPIOR22_Bit              : constant Bit_Number := 2;
   GPIOR22_Mask             : constant Unsigned_8 := 16#04#;
   GPIOR23_Bit              : constant Bit_Number := 3;
   GPIOR23_Mask             : constant Unsigned_8 := 16#08#;
   GPIOR24_Bit              : constant Bit_Number := 4;
   GPIOR24_Mask             : constant Unsigned_8 := 16#10#;
   GPIOR25_Bit              : constant Bit_Number := 5;
   GPIOR25_Mask             : constant Unsigned_8 := 16#20#;
   GPIOR26_Bit              : constant Bit_Number := 6;
   GPIOR26_Mask             : constant Unsigned_8 := 16#40#;
   GPIOR27_Bit              : constant Bit_Number := 7;
   GPIOR27_Mask             : constant Unsigned_8 := 16#80#;


   --  General Purpose I/O Register 1
   GPIOR1_Addr              : constant Address    := 16#34#;
   GPIOR1                   : Unsigned_8 ;
   for GPIOR1'Address use GPIOR1_Addr;
   pragma Volatile (GPIOR1);
   GPIOR1_Bits              : Bits_In_Byte;
   for GPIOR1_Bits'Address use GPIOR1_Addr;
   pragma Volatile (GPIOR1_Bits);
   GPIOR10_Bit              : constant Bit_Number := 0;
   GPIOR10_Mask             : constant Unsigned_8 := 16#01#;
   GPIOR11_Bit              : constant Bit_Number := 1;
   GPIOR11_Mask             : constant Unsigned_8 := 16#02#;
   GPIOR12_Bit              : constant Bit_Number := 2;
   GPIOR12_Mask             : constant Unsigned_8 := 16#04#;
   GPIOR13_Bit              : constant Bit_Number := 3;
   GPIOR13_Mask             : constant Unsigned_8 := 16#08#;
   GPIOR14_Bit              : constant Bit_Number := 4;
   GPIOR14_Mask             : constant Unsigned_8 := 16#10#;
   GPIOR15_Bit              : constant Bit_Number := 5;
   GPIOR15_Mask             : constant Unsigned_8 := 16#20#;
   GPIOR16_Bit              : constant Bit_Number := 6;
   GPIOR16_Mask             : constant Unsigned_8 := 16#40#;
   GPIOR17_Bit              : constant Bit_Number := 7;
   GPIOR17_Mask             : constant Unsigned_8 := 16#80#;


   --  General Purpose I/O Register 0
   GPIOR0_Addr              : constant Address    := 16#33#;
   GPIOR0                   : Unsigned_8 ;
   for GPIOR0'Address use GPIOR0_Addr;
   pragma Volatile (GPIOR0);
   GPIOR0_Bits              : Bits_In_Byte;
   for GPIOR0_Bits'Address use GPIOR0_Addr;
   pragma Volatile (GPIOR0_Bits);
   GPIOR00_Bit              : constant Bit_Number := 0;
   GPIOR00_Mask             : constant Unsigned_8 := 16#01#;
   GPIOR01_Bit              : constant Bit_Number := 1;
   GPIOR01_Mask             : constant Unsigned_8 := 16#02#;
   GPIOR02_Bit              : constant Bit_Number := 2;
   GPIOR02_Mask             : constant Unsigned_8 := 16#04#;
   GPIOR03_Bit              : constant Bit_Number := 3;
   GPIOR03_Mask             : constant Unsigned_8 := 16#08#;
   GPIOR04_Bit              : constant Bit_Number := 4;
   GPIOR04_Mask             : constant Unsigned_8 := 16#10#;
   GPIOR05_Bit              : constant Bit_Number := 5;
   GPIOR05_Mask             : constant Unsigned_8 := 16#20#;
   GPIOR06_Bit              : constant Bit_Number := 6;
   GPIOR06_Mask             : constant Unsigned_8 := 16#40#;
   GPIOR07_Bit              : constant Bit_Number := 7;
   GPIOR07_Mask             : constant Unsigned_8 := 16#80#;


   --  Clock Control Register
   CLKCR_Addr               : constant Address    := 16#72#;
   CLKCR                    : Unsigned_8 ;
   for CLKCR'Address use CLKCR_Addr;
   pragma Volatile (CLKCR);
   CLKCR_Bits               : Bits_In_Byte;
   for CLKCR_Bits'Address use CLKCR_Addr;
   pragma Volatile (CLKCR_Bits);
   --  Clock Select Bit 0
   CKSEL0_Bit               : constant Bit_Number := 0;
   CKSEL0_Mask              : constant Unsigned_8 := 16#01#;
   --  Clock Select Bit 1
   CKSEL1_Bit               : constant Bit_Number := 1;
   CKSEL1_Mask              : constant Unsigned_8 := 16#02#;
   --  Clock Select Bit 2
   CKSEL2_Bit               : constant Bit_Number := 2;
   CKSEL2_Mask              : constant Unsigned_8 := 16#04#;
   --  Clock Select Bit 3
   CKSEL3_Bit               : constant Bit_Number := 3;
   CKSEL3_Mask              : constant Unsigned_8 := 16#08#;
   --  Start-Up Time
   SUT_Bit                  : constant Bit_Number := 4;
   SUT_Mask                 : constant Unsigned_8 := 16#10#;
   --  Clock Output (Copy)
   CKOUTC_Bit               : constant Bit_Number := 5;
   CKOUTC_Mask              : constant Unsigned_8 := 16#20#;
   --  Clock Select Trigger
   CSTR_Bit                 : constant Bit_Number := 6;
   CSTR_Mask                : constant Unsigned_8 := 16#40#;
   --  Oscillator Ready
   OSCRDY_Bit               : constant Bit_Number := 7;
   OSCRDY_Mask              : constant Unsigned_8 := 16#80#;


   --  Clock Prescale Register
   CLKPR_Addr               : constant Address    := 16#73#;
   CLKPR                    : Unsigned_8 ;
   for CLKPR'Address use CLKPR_Addr;
   pragma Volatile (CLKPR);
   CLKPR_Bits               : Bits_In_Byte;
   for CLKPR_Bits'Address use CLKPR_Addr;
   pragma Volatile (CLKPR_Bits);
   --  Clock Prescaler Select Bit 0
   CLKPS0_Bit               : constant Bit_Number := 0;
   CLKPS0_Mask              : constant Unsigned_8 := 16#01#;
   --  Clock Prescaler Select Bit 1
   CLKPS1_Bit               : constant Bit_Number := 1;
   CLKPS1_Mask              : constant Unsigned_8 := 16#02#;
   --  Clock Prescaler Select Bit 2
   CLKPS2_Bit               : constant Bit_Number := 2;
   CLKPS2_Mask              : constant Unsigned_8 := 16#04#;
   --  Clock Prescaler Select Bit 3
   CLKPS3_Bit               : constant Bit_Number := 3;
   CLKPS3_Mask              : constant Unsigned_8 := 16#08#;


   --  Oscillator Calibration Register 0
   OSCCAL0_Addr             : constant Address    := 16#74#;
   OSCCAL0                  : Unsigned_8 ;
   for OSCCAL0'Address use OSCCAL0_Addr;
   pragma Volatile (OSCCAL0);
   OSCCAL0_Bits             : Bits_In_Byte;
   for OSCCAL0_Bits'Address use OSCCAL0_Addr;
   pragma Volatile (OSCCAL0_Bits);
   --  Oscillator Calibration Value Bit 0
   CAL00_Bit                : constant Bit_Number := 0;
   CAL00_Mask               : constant Unsigned_8 := 16#01#;
   --  Oscillator Calibration Value Bit 1
   CAL01_Bit                : constant Bit_Number := 1;
   CAL01_Mask               : constant Unsigned_8 := 16#02#;
   --  Oscillator Calibration Value Bit 2
   CAL02_Bit                : constant Bit_Number := 2;
   CAL02_Mask               : constant Unsigned_8 := 16#04#;
   --  Oscillator Calibration Value Bit 3
   CAL03_Bit                : constant Bit_Number := 3;
   CAL03_Mask               : constant Unsigned_8 := 16#08#;
   --  Oscillator Calibration Value Bit 4
   CAL04_Bit                : constant Bit_Number := 4;
   CAL04_Mask               : constant Unsigned_8 := 16#10#;
   --  Oscillator Calibration Value Bit 5
   CAL05_Bit                : constant Bit_Number := 5;
   CAL05_Mask               : constant Unsigned_8 := 16#20#;
   --  Oscillator Calibration Value Bit 6
   CAL06_Bit                : constant Bit_Number := 6;
   CAL06_Mask               : constant Unsigned_8 := 16#40#;
   --  Oscillator Calibration Value Bit 7
   CAL07_Bit                : constant Bit_Number := 7;
   CAL07_Mask               : constant Unsigned_8 := 16#80#;


   --  Oscillator Temperature Calibration Register A
   OSCTCAL0A_Addr           : constant Address    := 16#75#;
   OSCTCAL0A                : Unsigned_8 ;
   for OSCTCAL0A'Address use OSCTCAL0A_Addr;
   pragma Volatile (OSCTCAL0A);
   OSCTCAL0A_Bits           : Bits_In_Byte;
   for OSCTCAL0A_Bits'Address use OSCTCAL0A_Addr;
   pragma Volatile (OSCTCAL0A_Bits);
   --  Oscillator Temperature Calibration Value Bit 0
   OSCTCAL0A00_Bit          : constant Bit_Number := 0;
   OSCTCAL0A00_Mask         : constant Unsigned_8 := 16#01#;
   --  Oscillator Temperature Calibration Value Bit 1
   OSCTCAL0A01_Bit          : constant Bit_Number := 1;
   OSCTCAL0A01_Mask         : constant Unsigned_8 := 16#02#;
   --  Oscillator Temperature Calibration Value Bit 2
   OSCTCAL0A02_Bit          : constant Bit_Number := 2;
   OSCTCAL0A02_Mask         : constant Unsigned_8 := 16#04#;
   --  Oscillator Temperature Calibration Value Bit 3
   OSCTCAL0A03_Bit          : constant Bit_Number := 3;
   OSCTCAL0A03_Mask         : constant Unsigned_8 := 16#08#;
   --  Oscillator Temperature Calibration Value Bit 4
   OSCTCAL0A04_Bit          : constant Bit_Number := 4;
   OSCTCAL0A04_Mask         : constant Unsigned_8 := 16#10#;
   --  Oscillator Temperature Calibration Value Bit 5
   OSCTCAL0A05_Bit          : constant Bit_Number := 5;
   OSCTCAL0A05_Mask         : constant Unsigned_8 := 16#20#;
   --  Oscillator Temperature Calibration Value Bit 6
   OSCTCAL0A06_Bit          : constant Bit_Number := 6;
   OSCTCAL0A06_Mask         : constant Unsigned_8 := 16#40#;
   --  Oscillator Temperature Calibration Value Bit 7
   OSCTCAL0A07_Bit          : constant Bit_Number := 7;
   OSCTCAL0A07_Mask         : constant Unsigned_8 := 16#80#;


   --  Oscillator Temperature Calibration Register B
   OSCTCAL0B_Addr           : constant Address    := 16#76#;
   OSCTCAL0B                : Unsigned_8 ;
   for OSCTCAL0B'Address use OSCTCAL0B_Addr;
   pragma Volatile (OSCTCAL0B);
   OSCTCAL0B_Bits           : Bits_In_Byte;
   for OSCTCAL0B_Bits'Address use OSCTCAL0B_Addr;
   pragma Volatile (OSCTCAL0B_Bits);
   --  Oscillator Temperature Calibration Value Bit 0
   OSCTCAL0B00_Bit          : constant Bit_Number := 0;
   OSCTCAL0B00_Mask         : constant Unsigned_8 := 16#01#;
   --  Oscillator Temperature Calibration Value Bit 1
   OSCTCAL0B01_Bit          : constant Bit_Number := 1;
   OSCTCAL0B01_Mask         : constant Unsigned_8 := 16#02#;
   --  Oscillator Temperature Calibration Value Bit 2
   OSCTCAL0B02_Bit          : constant Bit_Number := 2;
   OSCTCAL0B02_Mask         : constant Unsigned_8 := 16#04#;
   --  Oscillator Temperature Calibration Value Bit 3
   OSCTCAL0B03_Bit          : constant Bit_Number := 3;
   OSCTCAL0B03_Mask         : constant Unsigned_8 := 16#08#;
   --  Oscillator Temperature Calibration Value Bit 4
   OSCTCAL0B04_Bit          : constant Bit_Number := 4;
   OSCTCAL0B04_Mask         : constant Unsigned_8 := 16#10#;
   --  Oscillator Temperature Calibration Value Bit 5
   OSCTCAL0B05_Bit          : constant Bit_Number := 5;
   OSCTCAL0B05_Mask         : constant Unsigned_8 := 16#20#;
   --  Oscillator Temperature Calibration Value Bit 6
   OSCTCAL0B06_Bit          : constant Bit_Number := 6;
   OSCTCAL0B06_Mask         : constant Unsigned_8 := 16#40#;
   --  Oscillator Temperature Calibration Value Bit 7
   OSCTCAL0B07_Bit          : constant Bit_Number := 7;
   OSCTCAL0B07_Mask         : constant Unsigned_8 := 16#80#;


   --  Oscillator Calibration Register 1
   OSCCAL1_Addr             : constant Address    := 16#77#;
   OSCCAL1                  : Unsigned_8 ;
   for OSCCAL1'Address use OSCCAL1_Addr;
   pragma Volatile (OSCCAL1);
   OSCCAL1_Bits             : Bits_In_Byte;
   for OSCCAL1_Bits'Address use OSCCAL1_Addr;
   pragma Volatile (OSCCAL1_Bits);
   --  Oscillator Calibration Value Bit 0
   CAL10_Bit                : constant Bit_Number := 0;
   CAL10_Mask               : constant Unsigned_8 := 16#01#;
   --  Oscillator Calibration Value Bit 1
   CAL11_Bit                : constant Bit_Number := 1;
   CAL11_Mask               : constant Unsigned_8 := 16#02#;


   --  MCU Control Register
   MCUCR_Addr               : constant Address    := 16#55#;
   MCUCR                    : Unsigned_8 ;
   for MCUCR'Address use MCUCR_Addr;
   pragma Volatile (MCUCR);
   MCUCR_Bits               : Bits_In_Byte;
   for MCUCR_Bits'Address use MCUCR_Addr;
   pragma Volatile (MCUCR_Bits);
   --  Interrupt Sense Control 0 Bit 0
   ISC00_Bit                : constant Bit_Number := 0;
   ISC00_Mask               : constant Unsigned_8 := 16#01#;
   --  Interrupt Sense Control 0 Bit 1
   ISC01_Bit                : constant Bit_Number := 1;
   ISC01_Mask               : constant Unsigned_8 := 16#02#;
   --  Sleep Mode Select Bit 0
   SM0_Bit                  : constant Bit_Number := 3;
   SM0_Mask                 : constant Unsigned_8 := 16#08#;
   --  Sleep Mode Select Bit 1
   SM1_Bit                  : constant Bit_Number := 4;
   SM1_Mask                 : constant Unsigned_8 := 16#10#;
   --  Sleep Enable
   SE_Bit                   : constant Bit_Number := 5;
   SE_Mask                  : constant Unsigned_8 := 16#20#;

   --  Power Reduction Register
   PRR_Addr                 : constant Address    := 16#70#;
   PRR                      : Unsigned_8 ;
   for PRR'Address use PRR_Addr;
   pragma Volatile (PRR);
   PRR_Bits                 : Bits_In_Byte;
   for PRR_Bits'Address use PRR_Addr;
   pragma Volatile (PRR_Bits);
   --  Power Reduction ADC
   PRADC_Bit                : constant Bit_Number := 0;
   PRADC_Mask               : constant Unsigned_8 := 16#01#;
   --  Power Reduction Timer/Counter0
   PRTIM0_Bit               : constant Bit_Number := 1;
   PRTIM0_Mask              : constant Unsigned_8 := 16#02#;
   --  Power Reduction Timer/Counter1
   PRTIM1_Bit               : constant Bit_Number := 2;
   PRTIM1_Mask              : constant Unsigned_8 := 16#04#;
   --  Power Reduction Timer/Counter2
   PRTIM2_Bit               : constant Bit_Number := 3;
   PRTIM2_Mask              : constant Unsigned_8 := 16#08#;
   --  Power Reduction SPI
   PRSPI_Bit                : constant Bit_Number := 4;
   PRSPI_Mask               : constant Unsigned_8 := 16#10#;
   --  Power Reduction USART 0
   PRUSART0_Bit             : constant Bit_Number := 5;
   PRUSART0_Mask            : constant Unsigned_8 := 16#20#;
   --  Power Reduction USART 1
   PRUSART1_Bit             : constant Bit_Number := 6;
   PRUSART1_Mask            : constant Unsigned_8 := 16#40#;
   --  Power Reduction TWI
   PRTWI_Bit                : constant Bit_Number := 7;
   PRTWI_Mask               : constant Unsigned_8 := 16#80#;


   --  MCU Status Register
   MCUSR_Addr               : constant Address    := 16#54#;
   MCUSR                    : Unsigned_8 ;
   for MCUSR'Address use MCUSR_Addr;
   pragma Volatile (MCUSR);
   MCUSR_Bits               : Bits_In_Byte;
   for MCUSR_Bits'Address use MCUSR_Addr;
   pragma Volatile (MCUSR_Bits);
   --  Power-on reset flag
   PORF_Bit                 : constant Bit_Number := 0;
   PORF_Mask                : constant Unsigned_8 := 16#01#;
   --  External Reset Flag
   EXTRF_Bit                : constant Bit_Number := 1;
   EXTRF_Mask               : constant Unsigned_8 := 16#02#;
   --  Brown-out Reset Flag
   BORF_Bit                 : constant Bit_Number := 2;
   BORF_Mask                : constant Unsigned_8 := 16#04#;
   --  Watchdog Reset Flag
   WDRF_Bit                 : constant Bit_Number := 3;
   WDRF_Mask                : constant Unsigned_8 := 16#08#;


   --  Watchdog Timer Control and Status Register
   WDTCSR_Addr              : constant Address    := 16#41#;
   WDTCSR                   : Unsigned_8 ;
   for WDTCSR'Address use WDTCSR_Addr;
   pragma Volatile (WDTCSR);
   WDTCSR_Bits              : Bits_In_Byte;
   for WDTCSR_Bits'Address use WDTCSR_Addr;
   pragma Volatile (WDTCSR_Bits);
   --  Watchdog Timer Prescaler bit 0
   WDP0_Bit                 : constant Bit_Number := 0;
   WDP0_Mask                : constant Unsigned_8 := 16#01#;
   --  Watchdog Timer Prescaler bit 1
   WDP1_Bit                 : constant Bit_Number := 1;
   WDP1_Mask                : constant Unsigned_8 := 16#02#;
   --  Watchdog Timer Prescaler bit 2
   WDP2_Bit                 : constant Bit_Number := 2;
   WDP2_Mask                : constant Unsigned_8 := 16#04#;
   --  Watchdog Enable
   WDE_Bit                  : constant Bit_Number := 3;
   WDE_Mask                 : constant Unsigned_8 := 16#08#;
   --  Watchdog Timer Prescaler Bit 3
   WDP3_Bit                 : constant Bit_Number := 5;
   WDP3_Mask                : constant Unsigned_8 := 16#20#;
   --  Watchdog Timeout Interrupt Enable
   WDIE_Bit                 : constant Bit_Number := 6;
   WDIE_Mask                : constant Unsigned_8 := 16#40#;
   --  Watchdog Timeout Interrupt Flag
   WDIF_Bit                 : constant Bit_Number := 7;
   WDIF_Mask                : constant Unsigned_8 := 16#80#;


   --  General Interrupt Mask Register
   GIMSK_Addr               : constant Address    := 16#5B#;
   GIMSK                    : Unsigned_8 ;
   for GIMSK'Address use GIMSK_Addr;
   pragma Volatile (GIMSK);
   GIMSK_Bits               : Bits_In_Byte;
   for GIMSK_Bits'Address use GIMSK_Addr;
   pragma Volatile (GIMSK_Bits);
   --  Pin Change Interrupt Enable 0
   PCIE0_Bit                : constant Bit_Number := 4;
   PCIE0_Mask               : constant Unsigned_8 := 16#10#;
   --  Pin Change Interrupt Enable 1
   PCIE1_Bit                : constant Bit_Number := 5;
   PCIE1_Mask               : constant Unsigned_8 := 16#20#;
   --  External Interrupt Request 0 Enable
   INT0_Bit                 : constant Bit_Number := 6;
   INT0_Mask                : constant Unsigned_8 := 16#40#;


   --  General Interrupt Flag register
   GIFR_Addr                : constant Address    := 16#5A#;
   GIFR                     : Unsigned_8 ;
   for GIFR'Address use GIFR_Addr;
   pragma Volatile (GIFR);
   GIFR_Bits                : Bits_In_Byte;
   for GIFR_Bits'Address use GIFR_Addr;
   pragma Volatile (GIFR_Bits);
   --  Pin Change Interrupt Flag 0
   PCIF0_Bit                : constant Bit_Number := 4;
   PCIF0_Mask               : constant Unsigned_8 := 16#10#;
   --  Pin Change Interrupt Flag 1
   PCIF1_Bit                : constant Bit_Number := 5;
   PCIF1_Mask               : constant Unsigned_8 := 16#20#;
   --  External Interrupt Flag 0
   INTF0_Bit                : constant Bit_Number := 6;
   INTF0_Mask               : constant Unsigned_8 := 16#40#;


   --  Pin Change Mask Register 1
   PCMSK1_Addr              : constant Address    := 16#40#;
   PCMSK1                   : Unsigned_8 ;
   for PCMSK1'Address use PCMSK1_Addr;
   pragma Volatile (PCMSK1);
   PCMSK1_Bits              : Bits_In_Byte;
   for PCMSK1_Bits'Address use PCMSK1_Addr;
   pragma Volatile (PCMSK1_Bits);
   --  Pin Change Enable Mask Bit 8
   PCINT8_Bit               : constant Bit_Number := 0;
   PCINT8_Mask              : constant Unsigned_8 := 16#01#;
   --  Pin Change Enable Mask Bit 9
   PCINT9_Bit               : constant Bit_Number := 1;
   PCINT9_Mask              : constant Unsigned_8 := 16#02#;
   --  Pin Change Enable Mask Bit 10
   PCINT10_Bit              : constant Bit_Number := 2;
   PCINT10_Mask             : constant Unsigned_8 := 16#04#;
   --  Pin Change Enable Mask Bit 11
   PCINT11_Bit              : constant Bit_Number := 3;
   PCINT11_Mask             : constant Unsigned_8 := 16#08#;


   --  Pin Change Mask Register 0
   PCMSK0_Addr              : constant Address    := 16#32#;
   PCMSK0                   : Unsigned_8 ;
   for PCMSK0'Address use PCMSK0_Addr;
   pragma Volatile (PCMSK0);
   PCMSK0_Bits              : Bits_In_Byte;
   for PCMSK0_Bits'Address use PCMSK0_Addr;
   pragma Volatile (PCMSK0_Bits);
   --  Pin Change Enable Mask Bit 0
   PCINT0_Bit               : constant Bit_Number := 0;
   PCINT0_Mask              : constant Unsigned_8 := 16#01#;
   --  Pin Change Enable Mask Bit 1
   PCINT1_Bit               : constant Bit_Number := 1;
   PCINT1_Mask              : constant Unsigned_8 := 16#02#;
   --  Pin Change Enable Mask Bit 2
   PCINT2_Bit               : constant Bit_Number := 2;
   PCINT2_Mask              : constant Unsigned_8 := 16#04#;
   --  Pin Change Enable Mask Bit 3
   PCINT3_Bit               : constant Bit_Number := 3;
   PCINT3_Mask              : constant Unsigned_8 := 16#08#;
   --  Pin Change Enable Mask Bit 4
   PCINT4_Bit               : constant Bit_Number := 4;
   PCINT4_Mask              : constant Unsigned_8 := 16#10#;
   --  Pin Change Enable Mask Bit 5
   PCINT5_Bit               : constant Bit_Number := 5;
   PCINT5_Mask              : constant Unsigned_8 := 16#20#;
   --  Pin Change Enable Mask Bit 6
   PCINT6_Bit               : constant Bit_Number := 6;
   PCINT6_Mask              : constant Unsigned_8 := 16#40#;
   --  Pin Change Enable Mask Bit 7
   PCINT7_Bit               : constant Bit_Number := 7;
   PCINT7_Mask              : constant Unsigned_8 := 16#80#;


   --  Port Control Register
   PORTCR_Addr              : constant Address    := 16#64#;
   PORTCR                   : Unsigned_8 ;
   for PORTCR'Address use PORTCR_Addr;
   pragma Volatile (PORTCR);
   PORTCR_Bits              : Bits_In_Byte;
   for PORTCR_Bits'Address use PORTCR_Addr;
   pragma Volatile (PORTCR_Bits);
   --  Break-Before-Make Mode Enable
   BBMB_Bit                 : constant Bit_Number := 0;
   BBMB_Mask                : constant Unsigned_8 := 16#01#;
   --  Break-Before-Make Mode Enable
   BBMA_Bit                 : constant Bit_Number := 1;
   BBMA_Mask                : constant Unsigned_8 := 16#02#;


   --  Port High Drive Enable Register
   PHDE_Addr                : constant Address    := 16#6A#;
   PHDE                     : Unsigned_8 ;
   for PHDE'Address use PHDE_Addr;
   pragma Volatile (PHDE);
   PHDE_Bits                : Bits_In_Byte;
   for PHDE_Bits'Address use PHDE_Addr;
   pragma Volatile (PHDE_Bits);
   --  PIN PA5 High Drive Enable
   PHDEA0_Bit               : constant Bit_Number := 0;
   PHDEA0_Mask              : constant Unsigned_8 := 16#01#;
   --  PIN PA7 High Drive Enable
   PHDEA1_Bit               : constant Bit_Number := 1;
   PHDEA1_Mask              : constant Unsigned_8 := 16#02#;


   --  Port B Pull-Up Enable Control Register
   PUEB_Addr                : constant Address    := 16#62#;
   PUEB                     : Unsigned_8 ;
   for PUEB'Address use PUEB_Addr;
   pragma Volatile (PUEB);
   PUEB_Bits                : Bits_In_Byte;
   for PUEB_Bits'Address use PUEB_Addr;
   pragma Volatile (PUEB_Bits);
   --  Pull-Up Enable Bit 0
   PUEB0_Bit                : constant Bit_Number := 0;
   PUEB0_Mask               : constant Unsigned_8 := 16#01#;
   --  Pull-Up Enable Bit 1
   PUEB1_Bit                : constant Bit_Number := 1;
   PUEB1_Mask               : constant Unsigned_8 := 16#02#;
   --  Pull-Up Enable Bit 2
   PUEB2_Bit                : constant Bit_Number := 2;
   PUEB2_Mask               : constant Unsigned_8 := 16#04#;
   --  Pull-Up Enable Bit 3
   PUEB3_Bit                : constant Bit_Number := 3;
   PUEB3_Mask               : constant Unsigned_8 := 16#08#;


   --  Port B Data Register
   PORTB_Addr               : constant Address    := 16#38#;
   PORTB                    : Unsigned_8 ;
   for PORTB'Address use PORTB_Addr;
   pragma Volatile (PORTB);
   PORTB_Bits               : Bits_In_Byte;
   for PORTB_Bits'Address use PORTB_Addr;
   pragma Volatile (PORTB_Bits);
   --  Port B Data Bit 0
   PORTB0_Bit               : constant Bit_Number := 0;
   PORTB0_Mask              : constant Unsigned_8 := 16#01#;
   --  Port B Data Bit 1
   PORTB1_Bit               : constant Bit_Number := 1;
   PORTB1_Mask              : constant Unsigned_8 := 16#02#;
   --  Port B Data Bit 2
   PORTB2_Bit               : constant Bit_Number := 2;
   PORTB2_Mask              : constant Unsigned_8 := 16#04#;
   --  Port B Data Bit 3
   PORTB3_Bit               : constant Bit_Number := 3;
   PORTB3_Mask              : constant Unsigned_8 := 16#08#;


   --  Port B Data Direction Register
   DDRB_Addr                : constant Address    := 16#37#;
   DDRB                     : Unsigned_8 ;
   for DDRB'Address use DDRB_Addr;
   pragma Volatile (DDRB);
   DDRB_Bits                : Bits_In_Byte;
   for DDRB_Bits'Address use DDRB_Addr;
   pragma Volatile (DDRB_Bits);
   --  Port B Data Direction Bit 0
   DDB0_Bit                 : constant Bit_Number := 0;
   DDB0_Mask                : constant Unsigned_8 := 16#01#;
   --  Port B Data Direction Bit 1
   DDB1_Bit                 : constant Bit_Number := 1;
   DDB1_Mask                : constant Unsigned_8 := 16#02#;
   --  Port B Data Direction Bit 2
   DDB2_Bit                 : constant Bit_Number := 2;
   DDB2_Mask                : constant Unsigned_8 := 16#04#;
   --  Port B Data Direction Bit 3
   DDB3_Bit                 : constant Bit_Number := 3;
   DDB3_Mask                : constant Unsigned_8 := 16#08#;


   --  Port B Input Pin
   PINB_Addr                : constant Address    := 16#36#;
   PINB                     : Unsigned_8 ;
   for PINB'Address use PINB_Addr;
   pragma Volatile (PINB);
   PINB_Bits                : Bits_In_Byte;
   for PINB_Bits'Address use PINB_Addr;
   pragma Volatile (PINB_Bits);
   --  Port B Input Data Bit 0
   PINB0_Bit                : constant Bit_Number := 0;
   PINB0_Mask               : constant Unsigned_8 := 16#01#;
   --  Port B Input Data Bit 1
   PINB1_Bit                : constant Bit_Number := 1;
   PINB1_Mask               : constant Unsigned_8 := 16#02#;
   --  Port B Input Data Bit 2
   PINB2_Bit                : constant Bit_Number := 2;
   PINB2_Mask               : constant Unsigned_8 := 16#04#;
   --  Port B Input Data Bit 3
   PINB3_Bit                : constant Bit_Number := 3;
   PINB3_Mask               : constant Unsigned_8 := 16#08#;


   --  Port A Pull-Up Enable Control Register
   PUEA_Addr                : constant Address    := 16#63#;
   PUEA                     : Unsigned_8 ;
   for PUEA'Address use PUEA_Addr;
   pragma Volatile (PUEA);
   PUEA_Bits                : Bits_In_Byte;
   for PUEA_Bits'Address use PUEA_Addr;
   pragma Volatile (PUEA_Bits);
   --  Pull-Up Enable Bit 0
   PUEA0_Bit                : constant Bit_Number := 0;
   PUEA0_Mask               : constant Unsigned_8 := 16#01#;
   --  Pull-Up Enable Bit 1
   PUEA1_Bit                : constant Bit_Number := 1;
   PUEA1_Mask               : constant Unsigned_8 := 16#02#;
   --  Pull-Up Enable Bit 2
   PUEA2_Bit                : constant Bit_Number := 2;
   PUEA2_Mask               : constant Unsigned_8 := 16#04#;
   --  Pull-Up Enable Bit 3
   PUEA3_Bit                : constant Bit_Number := 3;
   PUEA3_Mask               : constant Unsigned_8 := 16#08#;
   --  Pull-Up Enable Bit 4
   PUEA4_Bit                : constant Bit_Number := 4;
   PUEA4_Mask               : constant Unsigned_8 := 16#10#;
   --  Pull-Up Enable Bit 5
   PUEA5_Bit                : constant Bit_Number := 5;
   PUEA5_Mask               : constant Unsigned_8 := 16#20#;
   --  Pull-Up Enable Bit 6
   PUEA6_Bit                : constant Bit_Number := 6;
   PUEA6_Mask               : constant Unsigned_8 := 16#40#;
   --  Pull-Up Enable Bit 7
   PUEA7_Bit                : constant Bit_Number := 7;
   PUEA7_Mask               : constant Unsigned_8 := 16#80#;


   --  Port A Data Register
   PORTA_Addr               : constant Address    := 16#3B#;
   PORTA                    : Unsigned_8 ;
   for PORTA'Address use PORTA_Addr;
   pragma Volatile (PORTA);
   PORTA_Bits               : Bits_In_Byte;
   for PORTA_Bits'Address use PORTA_Addr;
   pragma Volatile (PORTA_Bits);
   --  Port A Data Register bit 0
   PORTA0_Bit               : constant Bit_Number := 0;
   PORTA0_Mask              : constant Unsigned_8 := 16#01#;
   --  Port A Data Register bit 1
   PORTA1_Bit               : constant Bit_Number := 1;
   PORTA1_Mask              : constant Unsigned_8 := 16#02#;
   --  Port A Data Register bit 2
   PORTA2_Bit               : constant Bit_Number := 2;
   PORTA2_Mask              : constant Unsigned_8 := 16#04#;
   --  Port A Data Register bit 3
   PORTA3_Bit               : constant Bit_Number := 3;
   PORTA3_Mask              : constant Unsigned_8 := 16#08#;
   --  Port A Data Register bit 4
   PORTA4_Bit               : constant Bit_Number := 4;
   PORTA4_Mask              : constant Unsigned_8 := 16#10#;
   --  Port A Data Register bit 5
   PORTA5_Bit               : constant Bit_Number := 5;
   PORTA5_Mask              : constant Unsigned_8 := 16#20#;
   --  Port A Data Register bit 6
   PORTA6_Bit               : constant Bit_Number := 6;
   PORTA6_Mask              : constant Unsigned_8 := 16#40#;
   --  Port A Data Register bit 7
   PORTA7_Bit               : constant Bit_Number := 7;
   PORTA7_Mask              : constant Unsigned_8 := 16#80#;


   --  Port A Data Direction Register
   DDRA_Addr                : constant Address    := 16#3A#;
   DDRA                     : Unsigned_8 ;
   for DDRA'Address use DDRA_Addr;
   pragma Volatile (DDRA);
   DDRA_Bits                : Bits_In_Byte;
   for DDRA_Bits'Address use DDRA_Addr;
   pragma Volatile (DDRA_Bits);
   --  Data Direction Register, Port A, bit 0
   DDA0_Bit                 : constant Bit_Number := 0;
   DDA0_Mask                : constant Unsigned_8 := 16#01#;
   --  Data Direction Register, Port A, bit 1
   DDA1_Bit                 : constant Bit_Number := 1;
   DDA1_Mask                : constant Unsigned_8 := 16#02#;
   --  Data Direction Register, Port A, bit 2
   DDA2_Bit                 : constant Bit_Number := 2;
   DDA2_Mask                : constant Unsigned_8 := 16#04#;
   --  Data Direction Register, Port A, bit 3
   DDA3_Bit                 : constant Bit_Number := 3;
   DDA3_Mask                : constant Unsigned_8 := 16#08#;
   --  Data Direction Register, Port A, bit 4
   DDA4_Bit                 : constant Bit_Number := 4;
   DDA4_Mask                : constant Unsigned_8 := 16#10#;
   --  Data Direction Register, Port A, bit 5
   DDA5_Bit                 : constant Bit_Number := 5;
   DDA5_Mask                : constant Unsigned_8 := 16#20#;
   --  Data Direction Register, Port A, bit 6
   DDA6_Bit                 : constant Bit_Number := 6;
   DDA6_Mask                : constant Unsigned_8 := 16#40#;
   --  Data Direction Register, Port A, bit 7
   DDA7_Bit                 : constant Bit_Number := 7;
   DDA7_Mask                : constant Unsigned_8 := 16#80#;


   --  Port A Input Pins
   PINA_Addr                : constant Address    := 16#39#;
   PINA                     : Unsigned_8 ;
   for PINA'Address use PINA_Addr;
   pragma Volatile (PINA);
   PINA_Bits                : Bits_In_Byte;
   for PINA_Bits'Address use PINA_Addr;
   pragma Volatile (PINA_Bits);
   --  Input Pins, Port A bit 0
   PINA0_Bit                : constant Bit_Number := 0;
   PINA0_Mask               : constant Unsigned_8 := 16#01#;
   --  Input Pins, Port A bit 1
   PINA1_Bit                : constant Bit_Number := 1;
   PINA1_Mask               : constant Unsigned_8 := 16#02#;
   --  Input Pins, Port A bit 2
   PINA2_Bit                : constant Bit_Number := 2;
   PINA2_Mask               : constant Unsigned_8 := 16#04#;
   --  Input Pins, Port A bit 3
   PINA3_Bit                : constant Bit_Number := 3;
   PINA3_Mask               : constant Unsigned_8 := 16#08#;
   --  Input Pins, Port A bit 4
   PINA4_Bit                : constant Bit_Number := 4;
   PINA4_Mask               : constant Unsigned_8 := 16#10#;
   --  Input Pins, Port A bit 5
   PINA5_Bit                : constant Bit_Number := 5;
   PINA5_Mask               : constant Unsigned_8 := 16#20#;
   --  Input Pins, Port A bit 6
   PINA6_Bit                : constant Bit_Number := 6;
   PINA6_Mask               : constant Unsigned_8 := 16#40#;
   --  Input Pins, Port A bit 7
   PINA7_Bit                : constant Bit_Number := 7;
   PINA7_Mask               : constant Unsigned_8 := 16#80#;


   --  TOCPMSA1 and TOCPMSA0 - Timer/Counter Output Compare Pin Mux
   --  Selection Registers
   TOCPMSA0_Addr            : constant Address    := 16#67#;
   TOCPMSA0                 : Unsigned_8 ;
   for TOCPMSA0'Address use TOCPMSA0_Addr;
   pragma Volatile (TOCPMSA0);
   TOCPMSA0_Bits            : Bits_In_Byte;
   for TOCPMSA0_Bits'Address use TOCPMSA0_Addr;
   pragma Volatile (TOCPMSA0_Bits);
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC0S0_Bit              : constant Bit_Number := 0;
   TOCC0S0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC0S1_Bit              : constant Bit_Number := 1;
   TOCC0S1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC1S0_Bit              : constant Bit_Number := 2;
   TOCC1S0_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC1S1_Bit              : constant Bit_Number := 3;
   TOCC1S1_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC2S0_Bit              : constant Bit_Number := 4;
   TOCC2S0_Mask             : constant Unsigned_8 := 16#10#;
   -- Timer/counter Output Compare Pin Mux Selection Registers  
   TOCC2S1_Bit              : constant Bit_Number := 5;
   TOCC2S1_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC3S0_Bit              : constant Bit_Number := 6;
   TOCC3S0_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC3S1_Bit              : constant Bit_Number := 7;
   TOCC3S1_Mask             : constant Unsigned_8 := 16#80#;


   TOCPMSA1_Addr            : constant Address    := 16#68#;
   TOCPMSA1                 : Unsigned_8 ;
   for TOCPMSA1'Address use TOCPMSA1_Addr;
   pragma Volatile (TOCPMSA1);
   TOCPMSA1_Bits            : Bits_In_Byte;
   for TOCPMSA1_Bits'Address use TOCPMSA1_Addr;
   pragma Volatile (TOCPMSA1_Bits);
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC4S0_Bit              : constant Bit_Number := 0;
   TOCC4S0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC4S1_Bit              : constant Bit_Number := 1;
   TOCC4S1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC5S0_Bit              : constant Bit_Number := 2;
   TOCC5S0_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC5S1_Bit              : constant Bit_Number := 3;
   TOCC5S1_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC6S0_Bit              : constant Bit_Number := 4;
   TOCC6S0_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC6S1_Bit              : constant Bit_Number := 5;
   TOCC6S1_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC7S0_Bit              : constant Bit_Number := 6;
   TOCC7S0_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/counter Output Compare Pin Mux Selection Registers 
   TOCC7S1_Bit              : constant Bit_Number := 7;
   TOCC7S1_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter  Control Register A
   TCCR0A_Addr              : constant Address    := 16#50#;
   TCCR0A                   : Unsigned_8 ;
   for TCCR0A'Address use TCCR0A_Addr;
   pragma Volatile (TCCR0A);
   TCCR0A_Bits              : Bits_In_Byte;
   for TCCR0A_Bits'Address use TCCR0A_Addr;
   pragma Volatile (TCCR0A_Bits);
   --  Waveform Generation Mode bit 0
   WGM00_Bit                : constant Bit_Number := 0;
   WGM00_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Generation Mode bit 1
   WGM01_Bit                : constant Bit_Number := 1;
   WGM01_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Match Output B Mode bit 0
   COM0B0_Bit               : constant Bit_Number := 4;
   COM0B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Match Output B Mode bit 1
   COM0B1_Bit               : constant Bit_Number := 5;
   COM0B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Compare Match Output A Mode bit 0
   COM0A0_Bit               : constant Bit_Number := 6;
   COM0A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Match Output A Mode bit 1
   COM0A1_Bit               : constant Bit_Number := 7;
   COM0A1_Mask              : constant Unsigned_8 := 16#80#;


   --  Timer/Counter Control Register B
   TCCR0B_Addr              : constant Address    := 16#53#;
   TCCR0B                   : Unsigned_8 ;
   for TCCR0B'Address use TCCR0B_Addr;
   pragma Volatile (TCCR0B);
   TCCR0B_Bits              : Bits_In_Byte;
   for TCCR0B_Bits'Address use TCCR0B_Addr;
   pragma Volatile (TCCR0B_Bits);
   --  Clock Select bit 0
   CS00_Bit                 : constant Bit_Number := 0;
   CS00_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select bit 1
   CS01_Bit                 : constant Bit_Number := 1;
   CS01_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select bit 2
   CS02_Bit                 : constant Bit_Number := 2;
   CS02_Mask                : constant Unsigned_8 := 16#04#;
   --  Waveform Generation Mode bit 2
   WGM02_Bit                : constant Bit_Number := 3;
   WGM02_Mask               : constant Unsigned_8 := 16#08#;
   --  Force Output Compare B
   FOC0B_Bit                : constant Bit_Number := 6;
   FOC0B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare A
   FOC0A_Bit                : constant Bit_Number := 7;
   FOC0A_Mask               : constant Unsigned_8 := 16#80#;


   --  Timer/Counter0
   TCNT0_Addr               : constant Address    := 16#52#;
   TCNT0                    : Unsigned_8 ;
   for TCNT0'Address use TCNT0_Addr;
   pragma Volatile (TCNT0);
   TCNT0_Bits               : Bits_In_Byte;
   for TCNT0_Bits'Address use TCNT0_Addr;
   pragma Volatile (TCNT0_Bits);
   TCNT0_0_Bit              : constant Bit_Number := 0;
   TCNT0_0_Mask             : constant Unsigned_8 := 16#01#;
   TCNT0_1_Bit              : constant Bit_Number := 1;
   TCNT0_1_Mask             : constant Unsigned_8 := 16#02#;
   TCNT0_2_Bit              : constant Bit_Number := 2;
   TCNT0_2_Mask             : constant Unsigned_8 := 16#04#;
   TCNT0_3_Bit              : constant Bit_Number := 3;
   TCNT0_3_Mask             : constant Unsigned_8 := 16#08#;
   TCNT0_4_Bit              : constant Bit_Number := 4;
   TCNT0_4_Mask             : constant Unsigned_8 := 16#10#;
   TCNT0_5_Bit              : constant Bit_Number := 5;
   TCNT0_5_Mask             : constant Unsigned_8 := 16#20#;
   TCNT0_6_Bit              : constant Bit_Number := 6;
   TCNT0_6_Mask             : constant Unsigned_8 := 16#40#;
   TCNT0_7_Bit              : constant Bit_Number := 7;
   TCNT0_7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter0 Output Compare Register A
   OCR0A_Addr               : constant Address    := 16#56#;
   OCR0A                    : Unsigned_8 ;
   for OCR0A'Address use OCR0A_Addr;
   pragma Volatile (OCR0A);
   OCR0A_Bits               : Bits_In_Byte;
   for OCR0A_Bits'Address use OCR0A_Addr;
   pragma Volatile (OCR0A_Bits);
   OCR0A_0_Bit              : constant Bit_Number := 0;
   OCR0A_0_Mask             : constant Unsigned_8 := 16#01#;
   OCR0A_1_Bit              : constant Bit_Number := 1;
   OCR0A_1_Mask             : constant Unsigned_8 := 16#02#;
   OCR0A_2_Bit              : constant Bit_Number := 2;
   OCR0A_2_Mask             : constant Unsigned_8 := 16#04#;
   OCR0A_3_Bit              : constant Bit_Number := 3;
   OCR0A_3_Mask             : constant Unsigned_8 := 16#08#;
   OCR0A_4_Bit              : constant Bit_Number := 4;
   OCR0A_4_Mask             : constant Unsigned_8 := 16#10#;
   OCR0A_5_Bit              : constant Bit_Number := 5;
   OCR0A_5_Mask             : constant Unsigned_8 := 16#20#;
   OCR0A_6_Bit              : constant Bit_Number := 6;
   OCR0A_6_Mask             : constant Unsigned_8 := 16#40#;
   OCR0A_7_Bit              : constant Bit_Number := 7;
   OCR0A_7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter0 Output Compare Register B
   OCR0B_Addr               : constant Address    := 16#5C#;
   OCR0B                    : Unsigned_8 ;
   for OCR0B'Address use OCR0B_Addr;
   pragma Volatile (OCR0B);
   OCR0B_Bits               : Bits_In_Byte;
   for OCR0B_Bits'Address use OCR0B_Addr;
   pragma Volatile (OCR0B_Bits);
   OCR0B_0_Bit              : constant Bit_Number := 0;
   OCR0B_0_Mask             : constant Unsigned_8 := 16#01#;
   OCR0B_1_Bit              : constant Bit_Number := 1;
   OCR0B_1_Mask             : constant Unsigned_8 := 16#02#;
   OCR0B_2_Bit              : constant Bit_Number := 2;
   OCR0B_2_Mask             : constant Unsigned_8 := 16#04#;
   OCR0B_3_Bit              : constant Bit_Number := 3;
   OCR0B_3_Mask             : constant Unsigned_8 := 16#08#;
   OCR0B_4_Bit              : constant Bit_Number := 4;
   OCR0B_4_Mask             : constant Unsigned_8 := 16#10#;
   OCR0B_5_Bit              : constant Bit_Number := 5;
   OCR0B_5_Mask             : constant Unsigned_8 := 16#20#;
   OCR0B_6_Bit              : constant Bit_Number := 6;
   OCR0B_6_Mask             : constant Unsigned_8 := 16#40#;
   OCR0B_7_Bit              : constant Bit_Number := 7;
   OCR0B_7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter0 Interrupt Mask Register
   TIMSK0_Addr              : constant Address    := 16#59#;
   TIMSK0                   : Unsigned_8 ;
   for TIMSK0'Address use TIMSK0_Addr;
   pragma Volatile (TIMSK0);
   TIMSK0_Bits              : Bits_In_Byte;
   for TIMSK0_Bits'Address use TIMSK0_Addr;
   pragma Volatile (TIMSK0_Bits);
   --  Timer/Counter0 Overflow Interrupt Enable
   TOIE0_Bit                : constant Bit_Number := 0;
   TOIE0_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter0 Output Compare Match A Interrupt Enable
   OCIE0A_Bit               : constant Bit_Number := 1;
   OCIE0A_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter0 Output Compare Match B Interrupt Enable
   OCIE0B_Bit               : constant Bit_Number := 2;
   OCIE0B_Mask              : constant Unsigned_8 := 16#04#;


   --  Timer/Counter0 Interrupt Flag Register
   TIFR0_Addr               : constant Address    := 16#58#;
   TIFR0                    : Unsigned_8 ;
   for TIFR0'Address use TIFR0_Addr;
   pragma Volatile (TIFR0);
   TIFR0_Bits               : Bits_In_Byte;
   for TIFR0_Bits'Address use TIFR0_Addr;
   pragma Volatile (TIFR0_Bits);
   --  Timer/Counter0 Overflow Flag
   TOV0_Bit                 : constant Bit_Number := 0;
   TOV0_Mask                : constant Unsigned_8 := 16#01#;
   --  Timer/Counter0 Output Compare Flag A
   OCF0A_Bit                : constant Bit_Number := 1;
   OCF0A_Mask               : constant Unsigned_8 := 16#02#;
   --  Timer/Counter0 Output Compare Flag B
   OCF0B_Bit                : constant Bit_Number := 2;
   OCF0B_Mask               : constant Unsigned_8 := 16#04#;


   --  Timer/Counter1 Control Register A
   TCCR1A_Addr              : constant Address    := 16#4F#;
   TCCR1A                   : Unsigned_8 ;
   for TCCR1A'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A);
   TCCR1A_Bits              : Bits_In_Byte;
   for TCCR1A_Bits'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A_Bits);
   --  Pulse Width Modulator Select Bit 0
   WGM10_Bit                : constant Bit_Number := 0;
   WGM10_Mask               : constant Unsigned_8 := 16#01#;
   --  Pulse Width Modulator Select Bit 1
   WGM11_Bit                : constant Bit_Number := 1;
   WGM11_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Output Mode 1B, bit 0
   COM1B0_Bit               : constant Bit_Number := 4;
   COM1B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode 1B, bit 1
   COM1B1_Bit               : constant Bit_Number := 5;
   COM1B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Compare Output Mode 1A, bit 0
   COM1A0_Bit               : constant Bit_Number := 6;
   COM1A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Output Mode 1A, bit 1
   COM1A1_Bit               : constant Bit_Number := 7;
   COM1A1_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter2 Control Register A
   TCCR2A_Addr              : constant Address    := 16#CA#;
   TCCR2A                   : Unsigned_8 ;
   for TCCR2A'Address use TCCR2A_Addr;
   pragma Volatile (TCCR2A);
   TCCR2A_Bits              : Bits_In_Byte;
   for TCCR2A_Bits'Address use TCCR2A_Addr;
   pragma Volatile (TCCR2A_Bits);
   --  Waveform Genration Mode
   WGM20_Bit                : constant Bit_Number := 0;
   WGM20_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Genration Mode
   WGM21_Bit                : constant Bit_Number := 1;
   WGM21_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Output Mode 2B, bit 0
   COM2B0_Bit               : constant Bit_Number := 4;
   COM2B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode 2B, bit 1
   COM2B1_Bit               : constant Bit_Number := 5;
   COM2B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Compare Output Mode 2A, bit 1
   COM2A0_Bit               : constant Bit_Number := 6;
   COM2A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Output Mode 2A,bit 1
   COM2A1_Bit               : constant Bit_Number := 7;
   COM2A1_Mask              : constant Unsigned_8 := 16#80#;


   --  Timer/Counter1 Control Register B
   TCCR1B_Addr              : constant Address    := 16#4E#;
   TCCR1B                   : Unsigned_8 ;
   for TCCR1B'Address use TCCR1B_Addr;
   pragma Volatile (TCCR1B);
   TCCR1B_Bits              : Bits_In_Byte;
   for TCCR1B_Bits'Address use TCCR1B_Addr;
   pragma Volatile (TCCR1B_Bits);
   --  Clock Select 1 bit 0
   CS10_Bit                 : constant Bit_Number := 0;
   CS10_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select 1 bit 1
   CS11_Bit                 : constant Bit_Number := 1;
   CS11_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select 1 bit 2
   CS12_Bit                 : constant Bit_Number := 2;
   CS12_Mask                : constant Unsigned_8 := 16#04#;
   --  Waveform Generation Mode Bit 2
   WGM12_Bit                : constant Bit_Number := 3;
   WGM12_Mask               : constant Unsigned_8 := 16#08#;
   --  Waveform Generation Mode Bit 3
   WGM13_Bit                : constant Bit_Number := 4;
   WGM13_Mask               : constant Unsigned_8 := 16#10#;
   --  Input Capture 1 Edge Select
   ICES1_Bit                : constant Bit_Number := 6;
   ICES1_Mask               : constant Unsigned_8 := 16#40#;
   --  Input Capture 1 Noise Canceler
   ICNC1_Bit                : constant Bit_Number := 7;
   ICNC1_Mask               : constant Unsigned_8 := 16#80#;


   --  Timer/Counter2 Control Register B
   TCCR2B_Addr              : constant Address    := 16#C9#;
   TCCR2B                   : Unsigned_8 ;
   for TCCR2B'Address use TCCR2B_Addr;
   pragma Volatile (TCCR2B);
   TCCR2B_Bits              : Bits_In_Byte;
   for TCCR2B_Bits'Address use TCCR2B_Addr;
   pragma Volatile (TCCR2B_Bits);
   --  Clock Select 2 bit 0
   CS20_Bit                 : constant Bit_Number := 0;
   CS20_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select 2 bit 1
   CS21_Bit                 : constant Bit_Number := 1;
   CS21_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select 2 bit 2
   CS22_Bit                 : constant Bit_Number := 2;
   CS22_Mask                : constant Unsigned_8 := 16#04#;
   --  Waveform Generation Mode Bit 2
   WGM22_Bit                : constant Bit_Number := 3;
   WGM22_Mask               : constant Unsigned_8 := 16#08#;
   --  Waveform Generation Mode Bit 3
   WGM23_Bit                : constant Bit_Number := 4;
   WGM23_Mask               : constant Unsigned_8 := 16#10#;
   --  Input Capture 2 Edge Select
   ICES2_Bit                : constant Bit_Number := 6;
   ICES2_Mask               : constant Unsigned_8 := 16#40#;
   --  Input Capture 2 Noise Canceler
   ICNC2_Bit                : constant Bit_Number := 7;
   ICNC2_Mask               : constant Unsigned_8 := 16#80#;


   --  Timer/Counter1 Control Register C
   TCCR1C_Addr              : constant Address    := 16#42#;
   TCCR1C                   : Unsigned_8 ;
   for TCCR1C'Address use TCCR1C_Addr;
   pragma Volatile (TCCR1C);
   TCCR1C_Bits              : Bits_In_Byte;
   for TCCR1C_Bits'Address use TCCR1C_Addr;
   pragma Volatile (TCCR1C_Bits);
   --  Force Output Compare for Channel B
   FOC1B_Bit                : constant Bit_Number := 6;
   FOC1B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare for Channel A
   FOC1A_Bit                : constant Bit_Number := 7;
   FOC1A_Mask               : constant Unsigned_8 := 16#80#;


   --  Timer/Counter2 Control Register C
   TCCR2C_Addr              : constant Address    := 16#C8#;
   TCCR2C                   : Unsigned_8 ;
   for TCCR2C'Address use TCCR2C_Addr;
   pragma Volatile (TCCR2C);
   TCCR2C_Bits              : Bits_In_Byte;
   for TCCR2C_Bits'Address use TCCR2C_Addr;
   pragma Volatile (TCCR2C_Bits);
   --  Force Output Compare for Channel B
   FOC2B_Bit                : constant Bit_Number := 6;
   FOC2B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare for Channel A
   FOC2A_Bit                : constant Bit_Number := 7;
   FOC2A_Mask               : constant Unsigned_8 := 16#80#;


   --  Timer/Counter Output Compare Pin Mux Channel Output Enable
   TOCPMCOE_Addr            : constant Address    := 16#66#;
   TOCPMCOE                 : Unsigned_8 ;
   for TOCPMCOE'Address use TOCPMCOE_Addr;
   pragma Volatile (TOCPMCOE);
   TOCPMCOE_Bits            : Bits_In_Byte;
   for TOCPMCOE_Bits'Address use PINA_Addr;
   pragma Volatile (TOCPMCOE_Bits);
   --  Timer/Counter Output Compare Channel Output Enable 0
   TOCC0OE_Bit              : constant Bit_Number := 0;
   TOCC0OE_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter Output Compare Channel Output Enable 1
   TOCC1OE_Bit              : constant Bit_Number := 1;
   TOCC1OE_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter Output Compare Channel Output Enable 2
   TOCC2OE_Bit              : constant Bit_Number := 2;
   TOCC2OE_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter Output Compare Channel Output Enable 3
   TOCC3OE_Bit              : constant Bit_Number := 3;
   TOCC3OE_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter Output Compare Channel Output Enable 4
   TOCC4OE_Bit              : constant Bit_Number := 4;
   TOCC4OE_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter Output Compare Channel Output Enable 5
   TOCC5OE_Bit              : constant Bit_Number := 5;
   TOCC5OE_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter Output Compare Channel Output Enable 6
   TOCC6OE_Bit              : constant Bit_Number := 6;
   TOCC6OE_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter Output Compare Channel Output Enable 7
   TOCC7OE_Bit              : constant Bit_Number := 7;
   TOCC7OE_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter1 High Byte
   TCNT1H_Addr              : constant Address    := 16#4D#;
   TCNT1H                   : Unsigned_8 ;
   for TCNT1H'Address use TCNT1H_Addr;
   pragma Volatile (TCNT1H);
   TCNT1H_Bits              : Bits_In_Byte;
   for TCNT1H_Bits'Address use TCNT1H_Addr;
   pragma Volatile (TCNT1H_Bits);
   --  Timer/Counter1 High Byte bit 0
   TCNT1H0_Bit              : constant Bit_Number := 0;
   TCNT1H0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 High Byte bit 1
   TCNT1H1_Bit              : constant Bit_Number := 1;
   TCNT1H1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 High Byte bit 2
   TCNT1H2_Bit              : constant Bit_Number := 2;
   TCNT1H2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 High Byte bit 3
   TCNT1H3_Bit              : constant Bit_Number := 3;
   TCNT1H3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 High Byte bit 4
   TCNT1H4_Bit              : constant Bit_Number := 4;
   TCNT1H4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 High Byte bit 5
   TCNT1H5_Bit              : constant Bit_Number := 5;
   TCNT1H5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 High Byte bit 6
   TCNT1H6_Bit              : constant Bit_Number := 6;
   TCNT1H6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 High Byte bit 7
   TCNT1H7_Bit              : constant Bit_Number := 7;
   TCNT1H7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter1 Low Byte
   TCNT1L_Addr              : constant Address    := 16#4C#;
   TCNT1                    : Unsigned_16;
   for TCNT1'Address use TCNT1L_Addr;
   pragma Volatile (TCNT1);
   TCNT1L                   : Unsigned_8 ;
   for TCNT1L'Address use TCNT1L_Addr;
   pragma Volatile (TCNT1L);
   TCNT1L_Bits              : Bits_In_Byte;
   for TCNT1L_Bits'Address use TCNT1L_Addr;
   pragma Volatile (TCNT1L_Bits);
   --  Timer/Counter1 Low Byte bit 0
   TCNT1L0_Bit              : constant Bit_Number := 0;
   TCNT1L0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Low Byte bit 1
   TCNT1L1_Bit              : constant Bit_Number := 1;
   TCNT1L1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Low Byte bit 2
   TCNT1L2_Bit              : constant Bit_Number := 2;
   TCNT1L2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Low Byte bit 3
   TCNT1L3_Bit              : constant Bit_Number := 3;
   TCNT1L3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Low Byte bit 4
   TCNT1L4_Bit              : constant Bit_Number := 4;
   TCNT1L4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Low Byte bit 5
   TCNT1L5_Bit              : constant Bit_Number := 5;
   TCNT1L5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Low Byte bit 6
   TCNT1L6_Bit              : constant Bit_Number := 6;
   TCNT1L6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Low Byte bit 7
   TCNT1L7_Bit              : constant Bit_Number := 7;
   TCNT1L7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter2 High Byte
   TCNT2H_Addr              : constant Address    := 16#C7#;
   TCNT2H                   : Unsigned_8 ;
   for TCNT2H'Address use TCNT2H_Addr;
   pragma Volatile (TCNT2H);
   TCNT2H_Bits              : Bits_In_Byte;
   for TCNT2H_Bits'Address use TCNT2H_Addr;
   pragma Volatile (TCNT2H_Bits);
   --  Timer/Counter2 High Byte bit 0
   TCNT2H0_Bit              : constant Bit_Number := 0;
   TCNT2H0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 High Byte bit 1
   TCNT2H1_Bit              : constant Bit_Number := 1;
   TCNT2H1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 High Byte bit 2
   TCNT2H2_Bit              : constant Bit_Number := 2;
   TCNT2H2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 High Byte bit 3
   TCNT2H3_Bit              : constant Bit_Number := 3;
   TCNT2H3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 High Byte bit 4
   TCNT2H4_Bit              : constant Bit_Number := 4;
   TCNT2H4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter2 High Byte bit 5
   TCNT2H5_Bit              : constant Bit_Number := 5;
   TCNT2H5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 High Byte bit 6
   TCNT2H6_Bit              : constant Bit_Number := 6;
   TCNT2H6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter2 High Byte bit 7
   TCNT2H7_Bit              : constant Bit_Number := 7;
   TCNT2H7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter2 Low Byte
   TCNT2L_Addr              : constant Address    := 16#C6#;
   TCNT2                    : Unsigned_16;
   for TCNT2'Address use TCNT2L_Addr;
   pragma Volatile (TCNT2);
   TCNT2L                   : Unsigned_8 ;
   for TCNT2L'Address use TCNT2L_Addr;
   pragma Volatile (TCNT2L);
   TCNT2L_Bits              : Bits_In_Byte;
   for TCNT2L_Bits'Address use TCNT2L_Addr;
   pragma Volatile (TCNT2L_Bits);
   --  Timer/Counter2 Low Byte bit 0
   TCNT2L0_Bit              : constant Bit_Number := 0;
   TCNT2L0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Low Byte bit 1
   TCNT2L1_Bit              : constant Bit_Number := 1;
   TCNT2L1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Low Byte bit 2
   TCNT2L2_Bit              : constant Bit_Number := 2;
   TCNT2L2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 Low Byte bit 3
   TCNT2L3_Bit              : constant Bit_Number := 3;
   TCNT2L3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Low Byte bit 4
   TCNT2L4_Bit              : constant Bit_Number := 4;
   TCNT2L4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter2 Low Byte bit 5
   TCNT2L5_Bit              : constant Bit_Number := 5;
   TCNT2L5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 Low Byte bit 6
   TCNT2L6_Bit              : constant Bit_Number := 6;
   TCNT2L6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter2 Low Byte bit 7
   TCNT2L7_Bit              : constant Bit_Number := 7;
   TCNT2L7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter1 Output Compare Register A High Byte
   OCR1AH_Addr              : constant Address    := 16#4B#;
   OCR1AH                   : Unsigned_8 ;
   for OCR1AH'Address use OCR1AH_Addr;
   pragma Volatile (OCR1AH);
   OCR1AH_Bits              : Bits_In_Byte;
   for OCR1AH_Bits'Address use OCR1AH_Addr;
   pragma Volatile (OCR1AH_Bits);
   --  Timer/Counter1 Output Compare Register High Byte bit 0
   OCR1AH0_Bit              : constant Bit_Number := 0;
   OCR1AH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Register High Byte bit 1
   OCR1AH1_Bit              : constant Bit_Number := 1;
   OCR1AH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Register High Byte bit 2
   OCR1AH2_Bit              : constant Bit_Number := 2;
   OCR1AH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Register High Byte bit 3
   OCR1AH3_Bit              : constant Bit_Number := 3;
   OCR1AH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output Compare Register High Byte bit 4
   OCR1AH4_Bit              : constant Bit_Number := 4;
   OCR1AH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Output Compare Register High Byte bit 5
   OCR1AH5_Bit              : constant Bit_Number := 5;
   OCR1AH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Register High Byte bit 6
   OCR1AH6_Bit              : constant Bit_Number := 6;
   OCR1AH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Output Compare Register High Byte bit 7
   OCR1AH7_Bit              : constant Bit_Number := 7;
   OCR1AH7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter1 Output Compare Register A Low Byte
   OCR1AL_Addr              : constant Address    := 16#4A#;
   OCR1A                    : Unsigned_16;
   for OCR1A'Address use OCR1AL_Addr;
   pragma Volatile (OCR1A);
   OCR1AL                   : Unsigned_8 ;
   for OCR1AL'Address use OCR1AL_Addr;
   pragma Volatile (OCR1AL);
   OCR1AL_Bits              : Bits_In_Byte;
   for OCR1AL_Bits'Address use OCR1AL_Addr;
   pragma Volatile (OCR1AL_Bits);
   --  Timer/Counter1 Output Compare Register Low Byte Bit 0
   OCR1AL0_Bit              : constant Bit_Number := 0;
   OCR1AL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 1
   OCR1AL1_Bit              : constant Bit_Number := 1;
   OCR1AL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 2
   OCR1AL2_Bit              : constant Bit_Number := 2;
   OCR1AL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 3
   OCR1AL3_Bit              : constant Bit_Number := 3;
   OCR1AL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 4
   OCR1AL4_Bit              : constant Bit_Number := 4;
   OCR1AL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 5
   OCR1AL5_Bit              : constant Bit_Number := 5;
   OCR1AL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 6
   OCR1AL6_Bit              : constant Bit_Number := 6;
   OCR1AL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 7
   OCR1AL7_Bit              : constant Bit_Number := 7;
   OCR1AL7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter2 Output Compare Register A High Byte
   OCR2AH_Addr              : constant Address    := 16#C5#;
   OCR2AH                   : Unsigned_8 ;
   for OCR2AH'Address use OCR2AH_Addr;
   pragma Volatile (OCR2AH);
   OCR2AH_Bits              : Bits_In_Byte;
   for OCR2AH_Bits'Address use OCR2AH_Addr;
   pragma Volatile (OCR2AH_Bits);
   --  Timer/Counter2 Output Compare Register High Byte bit 0
   OCR2AH0_Bit              : constant Bit_Number := 0;
   OCR2AH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Output Compare Register High Byte bit 1
   OCR2AH1_Bit              : constant Bit_Number := 1;
   OCR2AH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Output Compare Register High Byte bit 2
   OCR2AH2_Bit              : constant Bit_Number := 2;
   OCR2AH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 Output Compare Register High Byte bit 3
   OCR2AH3_Bit              : constant Bit_Number := 3;
   OCR2AH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Output Compare Register High Byte bit 4
   OCR2AH4_Bit              : constant Bit_Number := 4;
   OCR2AH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter2 Output Compare Register High Byte bit 5
   OCR2AH5_Bit              : constant Bit_Number := 5;
   OCR2AH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 Output Compare Register High Byte bit 6
   OCR2AH6_Bit              : constant Bit_Number := 6;
   OCR2AH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter2 Output Compare Register High Byte bit 7
   OCR2AH7_Bit              : constant Bit_Number := 7;
   OCR2AH7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter2 Output Compare Register A Low Byte
   OCR2AL_Addr              : constant Address    := 16#C4#;
   OCR2A                    : Unsigned_16;
   for OCR2A'Address use OCR2AL_Addr;
   pragma Volatile (OCR2A);
   OCR2AL                   : Unsigned_8 ;
   for OCR2AL'Address use OCR2AL_Addr;
   pragma Volatile (OCR2AL);
   OCR2AL_Bits              : Bits_In_Byte;
   for OCR2AL_Bits'Address use OCR2AL_Addr;
   pragma Volatile (OCR2AL_Bits);
   --  Timer/Counter2 Output Compare Register Low Byte Bit 0
   OCR2AL0_Bit              : constant Bit_Number := 0;
   OCR2AL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 1
   OCR2AL1_Bit              : constant Bit_Number := 1;
   OCR2AL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 2
   OCR2AL2_Bit              : constant Bit_Number := 2;
   OCR2AL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 3
   OCR2AL3_Bit              : constant Bit_Number := 3;
   OCR2AL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 4
   OCR2AL4_Bit              : constant Bit_Number := 4;
   OCR2AL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 5
   OCR2AL5_Bit              : constant Bit_Number := 5;
   OCR2AL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 6
   OCR2AL6_Bit              : constant Bit_Number := 6;
   OCR2AL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 7
   OCR2AL7_Bit              : constant Bit_Number := 7;
   OCR2AL7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter1 Output Compare Register B High Byte
   OCR1BH_Addr              : constant Address    := 16#49#;
   OCR1BH                   : Unsigned_8 ;
   for OCR1BH'Address use OCR1BH_Addr;
   pragma Volatile (OCR1BH);
   OCR1BH_Bits              : Bits_In_Byte;
   for OCR1BH_Bits'Address use OCR1BH_Addr;
   pragma Volatile (OCR1BH_Bits);
   --  Timer/Counter1 Output Compare Register High Byte bit 0
   OCR1BH0_Bit              : constant Bit_Number := 0;
   OCR1BH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Register High Byte bit 1
   OCR1BH1_Bit              : constant Bit_Number := 1;
   OCR1BH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Register High Byte bit 2
   OCR1BH2_Bit              : constant Bit_Number := 2;
   OCR1BH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Register High Byte bit 3
   OCR1BH3_Bit              : constant Bit_Number := 3;
   OCR1BH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output Compare Register High Byte bit 4
   OCR1BH4_Bit              : constant Bit_Number := 4;
   OCR1BH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Output Compare Register High Byte bit 5
   OCR1BH5_Bit              : constant Bit_Number := 5;
   OCR1BH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Register High Byte bit 6
   OCR1BH6_Bit              : constant Bit_Number := 6;
   OCR1BH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Output Compare Register High Byte bit 7
   OCR1BH7_Bit              : constant Bit_Number := 7;
   OCR1BH7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter1 Output Compare Register B Low Byte
   OCR1BL_Addr              : constant Address    := 16#48#;
   OCR1B                    : Unsigned_16;
   for OCR1B'Address use OCR1BL_Addr;
   pragma Volatile (OCR1B);
   OCR1BL                   : Unsigned_8 ;
   for OCR1BL'Address use OCR1BL_Addr;
   pragma Volatile (OCR1BL);
   OCR1BL_Bits              : Bits_In_Byte;
   for OCR1BL_Bits'Address use OCR1BL_Addr;
   pragma Volatile (OCR1BL_Bits);
   --  Timer/Counter1 Output Compare Register Low Byte Bit 0
   OCR1BL0_Bit              : constant Bit_Number := 0;
   OCR1BL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 1
   OCR1BL1_Bit              : constant Bit_Number := 1;
   OCR1BL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 2
   OCR1BL2_Bit              : constant Bit_Number := 2;
   OCR1BL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 3
   OCR1BL3_Bit              : constant Bit_Number := 3;
   OCR1BL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 4
   OCR1BL4_Bit              : constant Bit_Number := 4;
   OCR1BL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 5
   OCR1BL5_Bit              : constant Bit_Number := 5;
   OCR1BL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 6
   OCR1BL6_Bit              : constant Bit_Number := 6;
   OCR1BL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 7
   OCR1BL7_Bit              : constant Bit_Number := 7;
   OCR1BL7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter2 Output Compare Register B High Byte
   OCR2BH_Addr              : constant Address    := 16#C3#;
   OCR2BH                   : Unsigned_8 ;
   for OCR2BH'Address use OCR2BH_Addr;
   pragma Volatile (OCR2BH);
   OCR2BH_Bits              : Bits_In_Byte;
   for OCR2BH_Bits'Address use OCR2BH_Addr;
   pragma Volatile (OCR2BH_Bits);
   --  Timer/Counter2 Output Compare Register High Byte bit 0
   OCR2BH0_Bit              : constant Bit_Number := 0;
   OCR2BH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Output Compare Register High Byte bit 1
   OCR2BH1_Bit              : constant Bit_Number := 1;
   OCR2BH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Output Compare Register High Byte bit 2
   OCR2BH2_Bit              : constant Bit_Number := 2;
   OCR2BH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 Output Compare Register High Byte bit 3
   OCR2BH3_Bit              : constant Bit_Number := 3;
   OCR2BH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Output Compare Register High Byte bit 4
   OCR2BH4_Bit              : constant Bit_Number := 4;
   OCR2BH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter2 Output Compare Register High Byte bit 5
   OCR2BH5_Bit              : constant Bit_Number := 5;
   OCR2BH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 Output Compare Register High Byte bit 6
   OCR2BH6_Bit              : constant Bit_Number := 6;
   OCR2BH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter2 Output Compare Register High Byte bit 7
   OCR2BH7_Bit              : constant Bit_Number := 7;
   OCR2BH7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter2 Output Compare Register B Low Byte
   OCR2BL_Addr              : constant Address    := 16#C2#;
   OCR2B                    : Unsigned_16;
   for OCR2B'Address use OCR2BL_Addr;
   pragma Volatile (OCR2B);
   OCR2BL                   : Unsigned_8 ;
   for OCR2BL'Address use OCR2BL_Addr;
   pragma Volatile (OCR2BL);
   OCR2BL_Bits              : Bits_In_Byte;
   for OCR2BL_Bits'Address use OCR2BL_Addr;
   pragma Volatile (OCR2BL_Bits);
   --  Timer/Counter2 Output Compare Register Low Byte Bit 0
   OCR2BL0_Bit              : constant Bit_Number := 0;
   OCR2BL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 1
   OCR2BL1_Bit              : constant Bit_Number := 1;
   OCR2BL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 2
   OCR2BL2_Bit              : constant Bit_Number := 2;
   OCR2BL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 3
   OCR2BL3_Bit              : constant Bit_Number := 3;
   OCR2BL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 4
   OCR2BL4_Bit              : constant Bit_Number := 4;
   OCR2BL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 5
   OCR2BL5_Bit              : constant Bit_Number := 5;
   OCR2BL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 6
   OCR2BL6_Bit              : constant Bit_Number := 6;
   OCR2BL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter2 Output Compare Register Low Byte Bit 7
   OCR2BL7_Bit              : constant Bit_Number := 7;
   OCR2BL7_Mask             : constant Unsigned_8 := 16#80#;


   --  Timer/Counter1 Input Capture Register High Byte
   ICR1H_Addr               : constant Address    := 16#45#;
   ICR1H                    : Unsigned_8 ;
   for ICR1H'Address use ICR1H_Addr;
   pragma Volatile (ICR1H);
   ICR1H_Bits               : Bits_In_Byte;
   for ICR1H_Bits'Address use ICR1H_Addr;
   pragma Volatile (ICR1H_Bits);
   --  Timer/Counter1 Input Capture Register High Byte bit 0
   ICR1H0_Bit               : constant Bit_Number := 0;
   ICR1H0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Input Capture Register High Byte bit 1
   ICR1H1_Bit               : constant Bit_Number := 1;
   ICR1H1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Input Capture Register High Byte bit 2
   ICR1H2_Bit               : constant Bit_Number := 2;
   ICR1H2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Input Capture Register High Byte bit 3
   ICR1H3_Bit               : constant Bit_Number := 3;
   ICR1H3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Input Capture Register High Byte bit 4
   ICR1H4_Bit               : constant Bit_Number := 4;
   ICR1H4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Input Capture Register High Byte bit 5
   ICR1H5_Bit               : constant Bit_Number := 5;
   ICR1H5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Input Capture Register High Byte bit 6
   ICR1H6_Bit               : constant Bit_Number := 6;
   ICR1H6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Input Capture Register High Byte bit 7
   ICR1H7_Bit               : constant Bit_Number := 7;
   ICR1H7_Mask              : constant Unsigned_8 := 16#80#;


   --  Timer/Counter1 Input Capture Register Low Byte
   ICR1L_Addr               : constant Address    := 16#44#;
   ICR1                     : Unsigned_16;
   for ICR1'Address use ICR1L_Addr;
   pragma Volatile (ICR1);
   ICR1L                    : Unsigned_8 ;
   for ICR1L'Address use ICR1L_Addr;
   pragma Volatile (ICR1L);
   ICR1L_Bits               : Bits_In_Byte;
   for ICR1L_Bits'Address use ICR1L_Addr;
   pragma Volatile (ICR1L_Bits);
   --  Timer/Counter1 Input Capture Register Low Byte bit 0
   ICR1L0_Bit               : constant Bit_Number := 0;
   ICR1L0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 1
   ICR1L1_Bit               : constant Bit_Number := 1;
   ICR1L1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 2
   ICR1L2_Bit               : constant Bit_Number := 2;
   ICR1L2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 3
   ICR1L3_Bit               : constant Bit_Number := 3;
   ICR1L3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 4
   ICR1L4_Bit               : constant Bit_Number := 4;
   ICR1L4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 5
   ICR1L5_Bit               : constant Bit_Number := 5;
   ICR1L5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 6
   ICR1L6_Bit               : constant Bit_Number := 6;
   ICR1L6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 7
   ICR1L7_Bit               : constant Bit_Number := 7;
   ICR1L7_Mask              : constant Unsigned_8 := 16#80#;


   --  Timer/Counter2 Input Capture Register High Byte
   ICR2H_Addr               : constant Address    := 16#C1#;
   ICR2H                    : Unsigned_8 ;
   for ICR2H'Address use ICR2H_Addr;
   pragma Volatile (ICR2H);
   ICR2H_Bits               : Bits_In_Byte;
   for ICR2H_Bits'Address use ICR2H_Addr;
   pragma Volatile (ICR2H_Bits);
   --  Timer/Counter2 Input Capture Register High Byte bit 0
   ICR2H0_Bit               : constant Bit_Number := 0;
   ICR2H0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Input Capture Register High Byte bit 1
   ICR2H1_Bit               : constant Bit_Number := 1;
   ICR2H1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Input Capture Register High Byte bit 2
   ICR2H2_Bit               : constant Bit_Number := 2;
   ICR2H2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 Input Capture Register High Byte bit 3
   ICR2H3_Bit               : constant Bit_Number := 3;
   ICR2H3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Input Capture Register High Byte bit 4
   ICR2H4_Bit               : constant Bit_Number := 4;
   ICR2H4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter2 Input Capture Register High Byte bit 5
   ICR2H5_Bit               : constant Bit_Number := 5;
   ICR2H5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 Input Capture Register High Byte bit 6
   ICR2H6_Bit               : constant Bit_Number := 6;
   ICR2H6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter2 Input Capture Register High Byte bit 7
   ICR2H7_Bit               : constant Bit_Number := 7;
   ICR2H7_Mask              : constant Unsigned_8 := 16#80#;


   --  Timer/Counter2 Input Capture Register Low Byte
   ICR2L_Addr               : constant Address    := 16#C0#;
   ICR2                     : Unsigned_16;
   for ICR2'Address use ICR2L_Addr;
   pragma Volatile (ICR2);
   ICR2L                    : Unsigned_8 ;
   for ICR2L'Address use ICR2L_Addr;
   pragma Volatile (ICR2L);
   ICR2L_Bits               : Bits_In_Byte;
   for ICR2L_Bits'Address use ICR2L_Addr;
   pragma Volatile (ICR2L_Bits);
   --  Timer/Counter2 Input Capture Register Low Byte bit 0
   ICR2L0_Bit               : constant Bit_Number := 0;
   ICR2L0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Input Capture Register Low Byte bit 1
   ICR2L1_Bit               : constant Bit_Number := 1;
   ICR2L1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Input Capture Register Low Byte bit 2
   ICR2L2_Bit               : constant Bit_Number := 2;
   ICR2L2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 Input Capture Register Low Byte bit 3
   ICR2L3_Bit               : constant Bit_Number := 3;
   ICR2L3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Input Capture Register Low Byte bit 4
   ICR2L4_Bit               : constant Bit_Number := 4;
   ICR2L4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter2 Input Capture Register Low Byte bit 5
   ICR2L5_Bit               : constant Bit_Number := 5;
   ICR2L5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 Input Capture Register Low Byte bit 6
   ICR2L6_Bit               : constant Bit_Number := 6;
   ICR2L6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter2 Input Capture Register Low Byte bit 7
   ICR2L7_Bit               : constant Bit_Number := 7;
   ICR2L7_Mask              : constant Unsigned_8 := 16#80#;


   --  Timer/Counter1 Interrupt Mask Register
   TIMSK1_Addr              : constant Address    := 16#2F#;
   TIMSK1                   : Unsigned_8 ;
   for TIMSK1'Address use TIMSK1_Addr;
   pragma Volatile (TIMSK1);
   TIMSK1_Bits              : Bits_In_Byte;
   for TIMSK1_Bits'Address use TIMSK1_Addr;
   pragma Volatile (TIMSK1_Bits);
   --  Timer/Counter1 Overflow Interrupt Enable
   TOIE1_Bit                : constant Bit_Number := 0;
   TOIE1_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Match A Interrupt Enable
   OCIE1A_Bit               : constant Bit_Number := 1;
   OCIE1A_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Match B Interrupt Enable
   OCIE1B_Bit               : constant Bit_Number := 2;
   OCIE1B_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Input Capture Interrupt Enable
   ICE1B_Bit                : constant Bit_Number := 5;
   ICE1B_Mask               : constant Unsigned_8 := 16#20#;


   --  Timer/Counter2 Interrupt Mask Register
   TIMSK2_Addr              : constant Address    := 16#31#;
   TIMSK2                   : Unsigned_8 ;
   for TIMSK2'Address use TIMSK2_Addr;
   pragma Volatile (TIMSK2);
   TIMSK2_Bits              : Bits_In_Byte;
   for TIMSK2_Bits'Address use TIMSK2_Addr;
   pragma Volatile (TIMSK2_Bits);
   --  Timer/Counter2 Overflow Interrupt Enable
   TOIE2_Bit                : constant Bit_Number := 0;
   TOIE2_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Output Compare Match A Interrupt Enable
   OCIE2A_Bit               : constant Bit_Number := 1;
   OCIE2A_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Output Compare Match B Interrupt Enable
   OCIE2B_Bit               : constant Bit_Number := 2;
   OCIE2B_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 Input Capture Interrupt Enable
   ICE2B_Bit                : constant Bit_Number := 5;
   ICE2B_Mask               : constant Unsigned_8 := 16#20#;


   --  Timer/Counter1 Interrupt Flag Register
   TIFR1_Addr               : constant Address    := 16#2E#;
   TIFR1                    : Unsigned_8 ;
   for TIFR1'Address use TIFR1_Addr;
   pragma Volatile (TIFR1);
   TIFR1_Bits               : Bits_In_Byte;
   for TIFR1_Bits'Address use TIFR1_Addr;
   pragma Volatile (TIFR1_Bits);
   --  Timer/Counter1 Overflow Flag
   TOV1_Bit                 : constant Bit_Number := 0;
   TOV1_Mask                : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Flag A
   OCF1A_Bit                : constant Bit_Number := 1;
   OCF1A_Mask               : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Flag B
   OCF1B_Bit                : constant Bit_Number := 2;
   OCF1B_Mask               : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Input Capture Flag
   ICF1_Bit                 : constant Bit_Number := 5;
   ICF1_Mask                : constant Unsigned_8 := 16#20#;


   --  Timer/Counter2 Interrupt Flag Register
   TIFR2_Addr               : constant Address    := 16#30#;
   TIFR2                    : Unsigned_8 ;
   for TIFR2'Address use TIFR2_Addr;
   pragma Volatile (TIFR2);
   TIFR2_Bits               : Bits_In_Byte;
   for TIFR2_Bits'Address use TIFR2_Addr;
   pragma Volatile (TIFR2_Bits);
   --  Timer/Counter2 Overflow Flag
   TOV2_Bit                 : constant Bit_Number := 0;
   TOV2_Mask                : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Output Compare Flag A
   OCF2A_Bit                : constant Bit_Number := 1;
   OCF2A_Mask               : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Output Compare Flag B
   OCF2B_Bit                : constant Bit_Number := 2;
   OCF2B_Mask               : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 Input Capture Flag
   ICF2_Bit                 : constant Bit_Number := 5;
   ICF2_Mask                : constant Unsigned_8 := 16#20#;


   --  General Timer/Counter Control Register
   GTCCR_Addr               : constant Address    := 16#43#;
   GTCCR                    : Unsigned_8 ;
   for GTCCR'Address use GTCCR_Addr;
   pragma Volatile (GTCCR);
   GTCCR_Bits               : Bits_In_Byte;
   for GTCCR_Bits'Address use GTCCR_Addr;
   pragma Volatile (GTCCR_Bits);
   --  Prescaler Reset
   PSR_Bit                  : constant Bit_Number := 0;
   PSR_Mask                 : constant Unsigned_8 := 16#01#;
   --  Timer/Counter Synchronization Mode
   TSM_Bit                  : constant Bit_Number := 7;
   TSM_Mask                 : constant Unsigned_8 := 16#80#;


   --  Analog Comparator 0 Control And Status Register
   ACSR0A_Addr              : constant Address    := 16#2A#;
   ACSR0A                   : Unsigned_8 ;
   for ACSR0A'Address use ACSR0A_Addr;
   pragma Volatile (ACSR0A);
   ACSR0A_Bits              : Bits_In_Byte;
   for ACSR0A_Bits'Address use ACSR0A_Addr;
   pragma Volatile (ACSR0A_Bits);
   --  Analog Comparator Interrupt Mode Select Bit 0
   ACIS00_Bit               : constant Bit_Number := 0;
   ACIS00_Mask              : constant Unsigned_8 := 16#01#;
   --  Analog Comparator Interrupt Mode Select Bit 1
   ACIS01_Bit               : constant Bit_Number := 1;
   ACIS01_Mask              : constant Unsigned_8 := 16#02#;
   --  Analog Comparator Input Capture Enable
   ACIC0_Bit                : constant Bit_Number := 2;
   ACIC0_Mask               : constant Unsigned_8 := 16#04#;
   --  Analog Comparator Interrupt Enable
   ACIE0_Bit                : constant Bit_Number := 3;
   ACIE0_Mask               : constant Unsigned_8 := 16#08#;
   --  Analog Comparator Interrupt Flag
   ACI0_Bit                 : constant Bit_Number := 4;
   ACI0_Mask                : constant Unsigned_8 := 16#10#;
   --  Analog Compare Output
   ACO0_Bit                 : constant Bit_Number := 5;
   ACO0_Mask                : constant Unsigned_8 := 16#20#;
   --  Analog Comparator Positive Input Multiplexer Bit 2
   ACPMUX02_Bit             : constant Bit_Number := 6;
   ACPMUX02_Mask            : constant Unsigned_8 := 16#40#;
   --  Analog Comparator Disable
   ACD0_Bit                 : constant Bit_Number := 7;
   ACD0_Mask                : constant Unsigned_8 := 16#80#;


   --  Analog Comparator Control And Status Register B
   ACSR0B_Addr              : constant Address    := 16#2B#;
   ACSR0B                   : Unsigned_8 ;
   for ACSR0B'Address use ACSR0B_Addr;
   pragma Volatile (ACSR0B);
   ACSR0B_Bits              : Bits_In_Byte;
   for ACSR0B_Bits'Address use ACSR0B_Addr;
   pragma Volatile (ACSR0B_Bits);
   --  Analog Comparator Positive Input Multiplexer Bit 0
   ACPMUX00_Bit             : constant Bit_Number := 0;
   ACPMUX00_Mask            : constant Unsigned_8 := 16#01#;
   --  Analog Comparator Positive Input Multiplexer Bit 1
   ACPMUX01_Bit             : constant Bit_Number := 1;
   ACPMUX01_Mask            : constant Unsigned_8 := 16#02#;
   --  Analog Comparator Negative Input Multiplexer Bit 0
   ACNMUX00_Bit             : constant Bit_Number := 2;
   ACNMUX00_Mask            : constant Unsigned_8 := 16#04#;
   --  Analog Comparator Negative Input Multiplexer Bit 1
   ACNMUX01_Bit             : constant Bit_Number := 3;
   ACNMUX01_Mask            : constant Unsigned_8 := 16#08#;
   --  Analog Comparator Output Enable 0
   ACOE0_Bit                : constant Bit_Number := 4;
   ACOE0_Mask               : constant Unsigned_8 := 16#10#;
   --  Hysteresis Level
   HLEV0_Bit                : constant Bit_Number := 6;
   HLEV0_Mask               : constant Unsigned_8 := 16#40#;
   --  Hysteresis Select
   HSEL0_Bit                : constant Bit_Number := 7;
   HSEL0_Mask               : constant Unsigned_8 := 16#80#;


   --  Digital Input Disable Register 0
   DIDR0_Addr               : constant Address    := 16#60#;
   DIDR0                    : Unsigned_8 ;
   for DIDR0'Address use DIDR0_Addr;
   pragma Volatile (DIDR0);
   DIDR0_Bits               : Bits_In_Byte;
   for DIDR0_Bits'Address use DIDR0_Addr;
   pragma Volatile (DIDR0_Bits);
   --  ADC2 Digital Input Disable/AIN01 Digital input buffer disable
   ADC0D_Bit                : constant Bit_Number := 0;
   ADC0D_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC1 Digital Input Disable/AIN00 Digital input buffer disable
   ADC1D_Bit                : constant Bit_Number := 1;
   ADC1D_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC2 Digital Input Disable
   ADC2D_Bit                : constant Bit_Number := 2;
   ADC2D_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC3 Digital Input Disable/AIN10 Digital Input Buffer Disable
   ADC3D_Bit                : constant Bit_Number := 3;
   ADC3D_Mask               : constant Unsigned_8 := 16#08#;
   --  ADC4 Digital Input Disable/AIN11 Digital Input Buffer Disable
   ADC4D_Bit                : constant Bit_Number := 4;
   ADC4D_Mask               : constant Unsigned_8 := 16#10#;
   --  ADC5 Digital Input Disable
   ADC5D_Bit                : constant Bit_Number := 5;
   ADC5D_Mask               : constant Unsigned_8 := 16#20#;
   --  ADC6 Digital Input Disable
   ADC6D_Bit                : constant Bit_Number := 6;
   ADC6D_Mask               : constant Unsigned_8 := 16#40#;
   --  ADC7 Digital Input Disable
   ADC7D_Bit                : constant Bit_Number := 7;
   ADC7D_Mask               : constant Unsigned_8 := 16#80#;


   --  Digital Input Disable Register 1
   DIDR1_Addr               : constant Address    := 16#61#;
   DIDR1                    : Unsigned_8 ;
   for DIDR1'Address use DIDR1_Addr;
   pragma Volatile (DIDR1);
   DIDR1_Bits               : Bits_In_Byte;
   for DIDR1_Bits'Address use DIDR1_Addr;
   pragma Volatile (DIDR1_Bits);
   --  ADC11 Digital Input Disable
   ADC11D_Bit               : constant Bit_Number := 0;
   ADC11D_Mask              : constant Unsigned_8 := 16#01#;
   --  ADC10 Digital Input Disable
   ADC10D_Bit               : constant Bit_Number := 1;
   ADC10D_Mask              : constant Unsigned_8 := 16#02#;
   --  ADC8 Digital Input Disable
   ADC8D_Bit                : constant Bit_Number := 2;
   ADC8D_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC9 Digital Input Disable
   ADC9D_Bit                : constant Bit_Number := 3;
   ADC9D_Mask               : constant Unsigned_8 := 16#08#;


   --  Analog Comparator 1 Control And Status Register
   ACSR1A_Addr              : constant Address    := 16#2C#;
   ACSR1A                   : Unsigned_8 ;
   for ACSR1A'Address use ACSR1A_Addr;
   pragma Volatile (ACSR1A);
   ACSR1A_Bits              : Bits_In_Byte;
   for ACSR1A_Bits'Address use ACSR1A_Addr;
   pragma Volatile (ACSR1A_Bits);
   --  Analog Comparator Interrupt Mode Select Bit 0
   ACIS10_Bit               : constant Bit_Number := 0;
   ACIS10_Mask              : constant Unsigned_8 := 16#01#;
   --  Analog Comparator Interrupt Mode Select Bit 1
   ACIS11_Bit               : constant Bit_Number := 1;
   ACIS11_Mask              : constant Unsigned_8 := 16#02#;
   --  Analog Comparator Input Capture Enable
   ACIC1_Bit                : constant Bit_Number := 2;
   ACIC1_Mask               : constant Unsigned_8 := 16#04#;
   --  Analog Comparator Interrupt Enable
   ACIE1_Bit                : constant Bit_Number := 3;
   ACIE1_Mask               : constant Unsigned_8 := 16#08#;
   --  Analog Comparator Interrupt Flag
   ACI1_Bit                 : constant Bit_Number := 4;
   ACI1_Mask                : constant Unsigned_8 := 16#10#;
   --  Analog Compare Output
   ACO1_Bit                 : constant Bit_Number := 5;
   ACO1_Mask                : constant Unsigned_8 := 16#20#;
   --  Analog Comparator Bandgap Select
   ACBG1_Bit                : constant Bit_Number := 6;
   ACBG1_Mask               : constant Unsigned_8 := 16#40#;
   --  Analog Comparator Disable
   ACD1_Bit                 : constant Bit_Number := 7;
   ACD1_Mask                : constant Unsigned_8 := 16#80#;


   --  Analog Comparator 1 Control And Status Register B
   ACSR1B_Addr              : constant Address    := 16#2D#;
   ACSR1B                   : Unsigned_8 ;
   for ACSR1B'Address use ACSR1B_Addr;
   pragma Volatile (ACSR1B);
   ACSR1B_Bits              : Bits_In_Byte;
   for ACSR1B_Bits'Address use ACSR1B_Addr;
   pragma Volatile (ACSR1B_Bits);
   --  Analog Comparator Multiplexer Enable
   ACME1_Bit                : constant Bit_Number := 2;
   ACME1_Mask               : constant Unsigned_8 := 16#04#;
   --  Analog Comparator Output Enable 1
   ACOE1_Bit                : constant Bit_Number := 4;
   ACOE1_Mask               : constant Unsigned_8 := 16#10#;
   --  Hysteresis Level
   HLEV1_Bit                : constant Bit_Number := 6;
   HLEV1_Mask               : constant Unsigned_8 := 16#40#;
   --  Hysteresis Select
   HSEL1_Bit                : constant Bit_Number := 7;
   HSEL1_Mask               : constant Unsigned_8 := 16#80#;


   --  ADC Multiplexer Selection Register A
   ADMUXA_Addr              : constant Address    := 16#29#;
   ADMUXA                   : Unsigned_8 ;
   for ADMUXA'Address use ADMUXA_Addr;
   pragma Volatile (ADMUXA);
   ADMUXA_Bits              : Bits_In_Byte;
   for ADMUXA_Bits'Address use ADMUXA_Addr;
   pragma Volatile (ADMUXA_Bits);
   --  Analog Channel and Gain Selection Bit 0
   MUX0_Bit                 : constant Bit_Number := 0;
   MUX0_Mask                : constant Unsigned_8 := 16#01#;
   --  Analog Channel and Gain Selection Bit 1
   MUX1_Bit                 : constant Bit_Number := 1;
   MUX1_Mask                : constant Unsigned_8 := 16#02#;
   --  Analog Channel and Gain Selection Bit 2
   MUX2_Bit                 : constant Bit_Number := 2;
   MUX2_Mask                : constant Unsigned_8 := 16#04#;
   --  Analog Channel and Gain Selection Bit 3
   MUX3_Bit                 : constant Bit_Number := 3;
   MUX3_Mask                : constant Unsigned_8 := 16#08#;
   --  Analog Channel and Gain Selection Bit 4
   MUX4_Bit                 : constant Bit_Number := 4;
   MUX4_Mask                : constant Unsigned_8 := 16#10#;
   --  Analog Channel and Gain Selection Bit 5
   MUX5_Bit                 : constant Bit_Number := 5;
   MUX5_Mask                : constant Unsigned_8 := 16#20#;


   --  ADC Multiplexer Selection Register
   ADMUXB_Addr              : constant Address    := 16#28#;
   ADMUXB                   : Unsigned_8 ;
   for ADMUXB'Address use ADMUXB_Addr;
   pragma Volatile (ADMUXB);
   ADMUXB_Bits              : Bits_In_Byte;
   for ADMUXB_Bits'Address use ADMUXB_Addr;
   pragma Volatile (ADMUXB_Bits);
   --  Gain Selection Bit 0
   GSEL0_Bit                : constant Bit_Number := 0;
   GSEL0_Mask               : constant Unsigned_8 := 16#01#;
   --  Gain Selection Bit 1
   GSEL1_Bit                : constant Bit_Number := 1;
   GSEL1_Mask               : constant Unsigned_8 := 16#02#;
   --  Reference Selection Bit 0
   REFS0_Bit                : constant Bit_Number := 5;
   REFS0_Mask               : constant Unsigned_8 := 16#20#;
   --  Reference Selection Bit 1
   REFS1_Bit                : constant Bit_Number := 6;
   REFS1_Mask               : constant Unsigned_8 := 16#40#;
   --  Reference Selection Bit 2
   REFS2_Bit                : constant Bit_Number := 7;
   REFS2_Mask               : constant Unsigned_8 := 16#80#;


   -- ADCL and ADCH - ADC Register
   ADCH_Addr                : constant Address    := 16#27#;
   ADCH                     : Unsigned_8 ;
   for ADCH'Address use ADCH_Addr;
   pragma Volatile (ADCH);
   ADCH_Bits                : Bits_In_Byte;
   for ADCH_Bits'Address use ADCH_Addr;
   pragma Volatile (ADCH_Bits);
   --  ADC Conversion Result Bit 8
   ADC8_Bit                 : constant Bit_Number := 0;
   ADC8_Mask                : constant Unsigned_8 := 16#01#;
   --  ADC Conversion Result Bit 9
   ADC9_Bit                 : constant Bit_Number := 1;
   ADC9_Mask                : constant Unsigned_8 := 16#02#;
   --  ADC Conversion Result Bit 10
   ADC10_Bit                : constant Bit_Number := 2;
   ADC10_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC Conversion Result Bit 11
   ADC11_Bit                : constant Bit_Number := 3;
   ADC11_Mask               : constant Unsigned_8 := 16#08#;
   --  ADC Conversion Result Bit 12
   ADC12_Bit                : constant Bit_Number := 4;
   ADC12_Mask               : constant Unsigned_8 := 16#10#;
   --  ADC Conversion Result Bit 13
   ADC13_Bit                : constant Bit_Number := 5;
   ADC13_Mask               : constant Unsigned_8 := 16#20#;
   --  ADC Conversion Result Bit 14
   ADC14_Bit                : constant Bit_Number := 6;
   ADC14_Mask               : constant Unsigned_8 := 16#40#;
   --  ADC Conversion Result Bit 15
   ADC15_Bit                : constant Bit_Number := 7;
   ADC15_Mask               : constant Unsigned_8 := 16#80#;

   ADCL_Addr                : constant Address    := 16#26#;
   ADC                      : Unsigned_16;
   for ADC'Address use ADCL_Addr;
   pragma Volatile (ADC);
   ADCL                     : Unsigned_8 ;
   for ADCL'Address use ADCL_Addr;
   pragma Volatile (ADCL);
   ADCL_Bits                : Bits_In_Byte;
   for ADCL_Bits'Address use ADCL_Addr;
   pragma Volatile (ADCL_Bits);
   --  ADC Conversion Result Bit 0
   ADC0_Bit                 : constant Bit_Number := 0;
   ADC0_Mask                : constant Unsigned_8 := 16#01#;
   --  ADC Conversion Result Bit 1
   ADC1_Bit                 : constant Bit_Number := 1;
   ADC1_Mask                : constant Unsigned_8 := 16#02#;
   --  ADC Conversion Result Bit 2
   ADC2_Bit                 : constant Bit_Number := 2;
   ADC2_Mask                : constant Unsigned_8 := 16#04#;
   --  ADC Conversion Result Bit 3
   ADC3_Bit                 : constant Bit_Number := 3;
   ADC3_Mask                : constant Unsigned_8 := 16#08#;
   --  ADC Conversion Result Bit 4
   ADC4_Bit                 : constant Bit_Number := 4;
   ADC4_Mask                : constant Unsigned_8 := 16#10#;
   --  ADC Conversion Result Bit 5
   ADC5_Bit                 : constant Bit_Number := 5;
   ADC5_Mask                : constant Unsigned_8 := 16#20#;
   --  ADC Conversion Result Bit 6
   ADC6_Bit                 : constant Bit_Number := 6;
   ADC6_Mask                : constant Unsigned_8 := 16#40#;
   --  ADC Conversion Result Bit 7
   ADC7_Bit                 : constant Bit_Number := 7;
   ADC7_Mask                : constant Unsigned_8 := 16#80#;


   --  ADC Control and Status Register A
   ADCSRA_Addr              : constant Address    := 16#25#;
   ADCSRA                   : Unsigned_8 ;
   for ADCSRA'Address use ADCSRA_Addr;
   pragma Volatile (ADCSRA);
   ADCSRA_Bits              : Bits_In_Byte;
   for ADCSRA_Bits'Address use ADCSRA_Addr;
   pragma Volatile (ADCSRA_Bits);
   --  ADC  Prescaler Select Bit 0
   ADPS0_Bit                : constant Bit_Number := 0;
   ADPS0_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC  Prescaler Select Bit 1
   ADPS1_Bit                : constant Bit_Number := 1;
   ADPS1_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC  Prescaler Select Bit 2
   ADPS2_Bit                : constant Bit_Number := 2;
   ADPS2_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC Interrupt Enable
   ADIE_Bit                 : constant Bit_Number := 3;
   ADIE_Mask                : constant Unsigned_8 := 16#08#;
   --  ADC Interrupt Flag
   ADIF_Bit                 : constant Bit_Number := 4;
   ADIF_Mask                : constant Unsigned_8 := 16#10#;
   --  ADC Auto Trigger Enable
   ADATE_Bit                : constant Bit_Number := 5;
   ADATE_Mask               : constant Unsigned_8 := 16#20#;
   --  ADC Start Conversion
   ADSC_Bit                 : constant Bit_Number := 6;
   ADSC_Mask                : constant Unsigned_8 := 16#40#;
   --  ADC Enable
   ADEN_Bit                 : constant Bit_Number := 7;
   ADEN_Mask                : constant Unsigned_8 := 16#80#;


   --  ADC Control and Status Register B
   ADCSRB_Addr              : constant Address    := 16#24#;
   ADCSRB                   : Unsigned_8 ;
   for ADCSRB'Address use ADCSRB_Addr;
   pragma Volatile (ADCSRB);
   ADCSRB_Bits              : Bits_In_Byte;
   for ADCSRB_Bits'Address use ADCSRB_Addr;
   pragma Volatile (ADCSRB_Bits);
   --  ADC Auto Trigger Source bit 0
   ADTS0_Bit                : constant Bit_Number := 0;
   ADTS0_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC Auto Trigger Source bit 1
   ADTS1_Bit                : constant Bit_Number := 1;
   ADTS1_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC Auto Trigger Source bit 2
   ADTS2_Bit                : constant Bit_Number := 2;
   ADTS2_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC Left Adjust Result
   ADLAR_Bit                : constant Bit_Number := 4;
   ADLAR_Mask               : constant Unsigned_8 := 16#10#;


   --  SPI Control Register
   SPCR_Addr                : constant Address    := 16#B2#;
   SPCR                     : Unsigned_8 ;
   for SPCR'Address use SPCR_Addr;
   pragma Volatile (SPCR);
   SPCR_Bits                : Bits_In_Byte;
   for SPCR_Bits'Address use SPCR_Addr;
   pragma Volatile (SPCR_Bits);
   --  SPI Clock Rate Select 0
   SPR0_Bit                 : constant Bit_Number := 0;
   SPR0_Mask                : constant Unsigned_8 := 16#01#;
   --  SPI Clock Rate Select 1
   SPR1_Bit                 : constant Bit_Number := 1;
   SPR1_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Phase
   CPHA_Bit                 : constant Bit_Number := 2;
   CPHA_Mask                : constant Unsigned_8 := 16#04#;
   --  Clock polarity
   CPOL_Bit                 : constant Bit_Number := 3;
   CPOL_Mask                : constant Unsigned_8 := 16#08#;
   --  Master/Slave Select
   MSTR_Bit                 : constant Bit_Number := 4;
   MSTR_Mask                : constant Unsigned_8 := 16#10#;
   --  Data Order
   DORD_Bit                 : constant Bit_Number := 5;
   DORD_Mask                : constant Unsigned_8 := 16#20#;
   --  SPI Enable
   SPE_Bit                  : constant Bit_Number := 6;
   SPE_Mask                 : constant Unsigned_8 := 16#40#;
   --  SPI Interrupt Enable
   SPIE_Bit                 : constant Bit_Number := 7;
   SPIE_Mask                : constant Unsigned_8 := 16#80#;


   --  SPI Status Register
   SPSR_Addr                : constant Address    := 16#B1#;
   SPSR                     : Unsigned_8 ;
   for SPSR'Address use SPSR_Addr;
   pragma Volatile (SPSR);
   SPSR_Bits                : Bits_In_Byte;
   for SPSR_Bits'Address use SPSR_Addr;
   pragma Volatile (SPSR_Bits);
   --  Double SPI Speed Bit
   SPI2X_Bit                : constant Bit_Number := 0;
   SPI2X_Mask               : constant Unsigned_8 := 16#01#;
   --  Write Collision Flag
   WCOL_Bit                 : constant Bit_Number := 6;
   WCOL_Mask                : constant Unsigned_8 := 16#40#;
   --  SPI Interrupt Flag
   SPIF_Bit                 : constant Bit_Number := 7;
   SPIF_Mask                : constant Unsigned_8 := 16#80#;


   --  SPI Data Register
   SPDR_Addr                : constant Address    := 16#B0#;
   SPDR                     : Unsigned_8 ;
   for SPDR'Address use SPDR_Addr;
   pragma Volatile (SPDR);
   SPDR_Bits                : Bits_In_Byte;
   for SPDR_Bits'Address use SPDR_Addr;
   pragma Volatile (SPDR_Bits);
   --  SPI Data Register bit 0
   SPDR0_Bit                : constant Bit_Number := 0;
   SPDR0_Mask               : constant Unsigned_8 := 16#01#;
   --  SPI Data Register bit 1
   SPDR1_Bit                : constant Bit_Number := 1;
   SPDR1_Mask               : constant Unsigned_8 := 16#02#;
   --  SPI Data Register bit 2
   SPDR2_Bit                : constant Bit_Number := 2;
   SPDR2_Mask               : constant Unsigned_8 := 16#04#;
   --  SPI Data Register bit 3
   SPDR3_Bit                : constant Bit_Number := 3;
   SPDR3_Mask               : constant Unsigned_8 := 16#08#;
   --  SPI Data Register bit 4
   SPDR4_Bit                : constant Bit_Number := 4;
   SPDR4_Mask               : constant Unsigned_8 := 16#10#;
   --  SPI Data Register bit 5
   SPDR5_Bit                : constant Bit_Number := 5;
   SPDR5_Mask               : constant Unsigned_8 := 16#20#;
   --  SPI Data Register bit 6
   SPDR6_Bit                : constant Bit_Number := 6;
   SPDR6_Mask               : constant Unsigned_8 := 16#40#;
   --  SPI Data Register bit 7
   SPDR7_Bit                : constant Bit_Number := 7;
   SPDR7_Mask               : constant Unsigned_8 := 16#80#;


   --  Remap Port Pins
   REMAP_Addr               : constant Address    := 16#65#;
   REMAP                    : Unsigned_8 ;
   for REMAP'Address use REMAP_Addr;
   pragma Volatile (REMAP);
   REMAP_Bits               : Bits_In_Byte;
   for REMAP_Bits'Address use REMAP_Addr;
   pragma Volatile (REMAP_Bits);
   -- USART0 Pin Mapping
   U0MAP_Bit                : constant Bit_Number := 0;
   U0MAP_Mask               : constant Unsigned_8 := 16#01#;
   --  SPI Pin Mapping
   SPIMAP_Bit               : constant Bit_Number := 1;
   SPIMAP_Mask              : constant Unsigned_8 := 16#02#;


   --  USART0 I/O Data Register
   UDR0_Addr                : constant Address    := 16#80#;
   UDR0                     : Unsigned_8 ;
   for UDR0'Address use UDR0_Addr;
   pragma Volatile (UDR0);
   UDR0_Bits                : Bits_In_Byte;
   for UDR0_Bits'Address use UDR0_Addr;
   pragma Volatile (UDR0_Bits);
   --  USART0 I/O Data Register bit 0
   UDR0_0_Bit               : constant Bit_Number := 0;
   UDR0_0_Mask              : constant Unsigned_8 := 16#01#;
   --  USART0 I/O Data Register bit 1
   UDR0_1_Bit               : constant Bit_Number := 1;
   UDR0_1_Mask              : constant Unsigned_8 := 16#02#;
   --  USART0 I/O Data Register bit 2
   UDR0_2_Bit               : constant Bit_Number := 2;
   UDR0_2_Mask              : constant Unsigned_8 := 16#04#;
   --  USART0 I/O Data Register bit 3
   UDR0_3_Bit               : constant Bit_Number := 3;
   UDR0_3_Mask              : constant Unsigned_8 := 16#08#;
   --  USART0 I/O Data Register bit 4
   UDR0_4_Bit               : constant Bit_Number := 4;
   UDR0_4_Mask              : constant Unsigned_8 := 16#10#;
   --  USART0 I/O Data Register bit 5
   UDR0_5_Bit               : constant Bit_Number := 5;
   UDR0_5_Mask              : constant Unsigned_8 := 16#20#;
   --  USART0 I/O Data Register bit 6
   UDR0_6_Bit               : constant Bit_Number := 6;
   UDR0_6_Mask              : constant Unsigned_8 := 16#40#;
   --  USART0 I/O Data Register bit 7
   UDR0_7_Bit               : constant Bit_Number := 7;
   UDR0_7_Mask              : constant Unsigned_8 := 16#80#;


   --  USART1 I/O Data Register
   UDR1_Addr                : constant Address    := 16#90#;
   UDR1                     : Unsigned_8 ;
   for UDR1'Address use UDR1_Addr;
   pragma Volatile (UDR1);
   UDR1_Bits                : Bits_In_Byte;
   for UDR1_Bits'Address use UDR1_Addr;
   pragma Volatile (UDR1_Bits);
   --  USART1 I/O Data Register bit 0
   UDR1_0_Bit               : constant Bit_Number := 0;
   UDR1_0_Mask              : constant Unsigned_8 := 16#01#;
   --  USART1 I/O Data Register bit 1
   UDR1_1_Bit               : constant Bit_Number := 1;
   UDR1_1_Mask              : constant Unsigned_8 := 16#02#;
   --  USART1 I/O Data Register bit 2
   UDR1_2_Bit               : constant Bit_Number := 2;
   UDR1_2_Mask              : constant Unsigned_8 := 16#04#;
   --  USART1 I/O Data Register bit 3
   UDR1_3_Bit               : constant Bit_Number := 3;
   UDR1_3_Mask              : constant Unsigned_8 := 16#08#;
   --  USART1 I/O Data Register bit 4
   UDR1_4_Bit               : constant Bit_Number := 4;
   UDR1_4_Mask              : constant Unsigned_8 := 16#10#;
   --  USART1 I/O Data Register bit 5
   UDR1_5_Bit               : constant Bit_Number := 5;
   UDR1_5_Mask              : constant Unsigned_8 := 16#20#;
   --  USART1 I/O Data Register bit 6
   UDR1_6_Bit               : constant Bit_Number := 6;
   UDR1_6_Mask              : constant Unsigned_8 := 16#40#;
   --  USART1 I/O Data Register bit 7
   UDR1_7_Bit               : constant Bit_Number := 7;
   UDR1_7_Mask              : constant Unsigned_8 := 16#80#;


   --  USART0 Control and Status Register A
   UCSR0A_Addr              : constant Address    := 16#86#;
   UCSR0A                   : Unsigned_8 ;
   for UCSR0A'Address use UCSR0A_Addr;
   pragma Volatile (UCSR0A);
   UCSR0A_Bits              : Bits_In_Byte;
   for UCSR0A_Bits'Address use UCSR0A_Addr;
   pragma Volatile (UCSR0A_Bits);
   --  Multi-processor Communication Mode
   MPCM0_Bit                : constant Bit_Number := 0;
   MPCM0_Mask               : constant Unsigned_8 := 16#01#;
   --  Double the USART transmission speed
   U2X0_Bit                 : constant Bit_Number := 1;
   U2X0_Mask                : constant Unsigned_8 := 16#02#;
   --  USART Parity Error
   UPE0_Bit                 : constant Bit_Number := 2;
   UPE0_Mask                : constant Unsigned_8 := 16#04#;
   --  Data OverRun
   DOR0_Bit                 : constant Bit_Number := 3;
   DOR0_Mask                : constant Unsigned_8 := 16#08#;
   --  Frame Error
   FE0_Bit                  : constant Bit_Number := 4;
   FE0_Mask                 : constant Unsigned_8 := 16#10#;
   --  USART Data Register Empty
   UDRE0_Bit                : constant Bit_Number := 5;
   UDRE0_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Transmit Complete
   TXC0_Bit                 : constant Bit_Number := 6;
   TXC0_Mask                : constant Unsigned_8 := 16#40#;
   --  USART Receive Complete
   RXC0_Bit                 : constant Bit_Number := 7;
   RXC0_Mask                : constant Unsigned_8 := 16#80#;


   --  USART1 Control and Status Register A
   UCSR1A_Addr              : constant Address    := 16#96#;
   UCSR1A                   : Unsigned_8 ;
   for UCSR1A'Address use UCSR1A_Addr;
   pragma Volatile (UCSR1A);
   UCSR1A_Bits              : Bits_In_Byte;
   for UCSR1A_Bits'Address use UCSR1A_Addr;
   pragma Volatile (UCSR1A_Bits);
   --  Multi-processor Communication Mode
   MPCM1_Bit                : constant Bit_Number := 0;
   MPCM1_Mask               : constant Unsigned_8 := 16#01#;
   --  Double the USART transmission speed
   U2X1_Bit                 : constant Bit_Number := 1;
   U2X1_Mask                : constant Unsigned_8 := 16#02#;
   --  USART Parity Error
   UPE1_Bit                 : constant Bit_Number := 2;
   UPE1_Mask                : constant Unsigned_8 := 16#04#;
   --  Data OverRun
   DOR1_Bit                 : constant Bit_Number := 3;
   DOR1_Mask                : constant Unsigned_8 := 16#08#;
   --  Frame Error
   FE1_Bit                  : constant Bit_Number := 4;
   FE1_Mask                 : constant Unsigned_8 := 16#10#;
   --  USART Data Register Empty
   UDRE1_Bit                : constant Bit_Number := 5;
   UDRE1_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Transmit Complete
   TXC1_Bit                 : constant Bit_Number := 6;
   TXC1_Mask                : constant Unsigned_8 := 16#40#;
   --  USART Receive Complete
   RXC1_Bit                 : constant Bit_Number := 7;
   RXC1_Mask                : constant Unsigned_8 := 16#80#;


   --  USART0 Control and Status Register B
   UCSR0B_Addr              : constant Address    := 16#85#;
   UCSR0B                   : Unsigned_8 ;
   for UCSR0B'Address use UCSR0B_Addr;
   pragma Volatile (UCSR0B);
   UCSR0B_Bits              : Bits_In_Byte;
   for UCSR0B_Bits'Address use UCSR0B_Addr;
   pragma Volatile (UCSR0B_Bits);
   --  Transmit Data Bit 8
   TXB80_Bit                : constant Bit_Number := 0;
   TXB80_Mask               : constant Unsigned_8 := 16#01#;
   --  Receive Data Bit 8
   RXB80_Bit                : constant Bit_Number := 1;
   RXB80_Mask               : constant Unsigned_8 := 16#02#;
   --  Character Size
   UCSZ02_Bit               : constant Bit_Number := 2;
   UCSZ02_Mask              : constant Unsigned_8 := 16#04#;
   --  Transmitter Enable
   TXEN0_Bit                : constant Bit_Number := 3;
   TXEN0_Mask               : constant Unsigned_8 := 16#08#;
   --  Receiver Enable
   RXEN0_Bit                : constant Bit_Number := 4;
   RXEN0_Mask               : constant Unsigned_8 := 16#10#;
   --  USART Data register Empty Interrupt Enable
   UDRIE0_Bit               : constant Bit_Number := 5;
   UDRIE0_Mask              : constant Unsigned_8 := 16#20#;
   --  TX Complete Interrupt Enable
   TXCIE0_Bit               : constant Bit_Number := 6;
   TXCIE0_Mask              : constant Unsigned_8 := 16#40#;
   --  RX Complete Interrupt Enable
   RXCIE0_Bit               : constant Bit_Number := 7;
   RXCIE0_Mask              : constant Unsigned_8 := 16#80#;


   --  USART1 Control and Status Register B
   UCSR1B_Addr              : constant Address    := 16#95#;
   UCSR1B                   : Unsigned_8 ;
   for UCSR1B'Address use UCSR1B_Addr;
   pragma Volatile (UCSR1B);
   UCSR1B_Bits              : Bits_In_Byte;
   for UCSR1B_Bits'Address use UCSR1B_Addr;
   pragma Volatile (UCSR1B_Bits);
   --  Transmit Data Bit 8
   TXB81_Bit                : constant Bit_Number := 0;
   TXB81_Mask               : constant Unsigned_8 := 16#01#;
   --  Receive Data Bit 8
   RXB81_Bit                : constant Bit_Number := 1;
   RXB81_Mask               : constant Unsigned_8 := 16#02#;
   --  Character Size
   UCSZ12_Bit               : constant Bit_Number := 2;
   UCSZ12_Mask              : constant Unsigned_8 := 16#04#;
   --  Transmitter Enable
   TXEN1_Bit                : constant Bit_Number := 3;
   TXEN1_Mask               : constant Unsigned_8 := 16#08#;
   --  Receiver Enable
   RXEN1_Bit                : constant Bit_Number := 4;
   RXEN1_Mask               : constant Unsigned_8 := 16#10#;
   --  USART Data register Empty Interrupt Enable
   UDRIE1_Bit               : constant Bit_Number := 5;
   UDRIE1_Mask              : constant Unsigned_8 := 16#20#;
   --  TX Complete Interrupt Enable
   TXCIE1_Bit               : constant Bit_Number := 6;
   TXCIE1_Mask              : constant Unsigned_8 := 16#40#;
   --  RX Complete Interrupt Enable
   RXCIE1_Bit               : constant Bit_Number := 7;
   RXCIE1_Mask              : constant Unsigned_8 := 16#80#;


   --  USART0 Control and Status Register C
   UCSR0C_Addr              : constant Address    := 16#84#;
   UCSR0C                   : Unsigned_8 ;
   for UCSR0C'Address use UCSR0C_Addr;
   pragma Volatile (UCSR0C);
   UCSR0C_Bits              : Bits_In_Byte;
   for UCSR0C_Bits'Address use UCSR0C_Addr;
   pragma Volatile (UCSR0C_Bits);
   --  Clock Polarity
   UCPOL0_Bit               : constant Bit_Number := 0;
   UCPOL0_Mask              : constant Unsigned_8 := 16#01#;
   --  Character Size / Clock Phase in MSPI mode
   UCSZ00_Bit               : constant Bit_Number := 1;
   UCSZ00_Mask              : constant Unsigned_8 := 16#02#;
   --  Character Size / Data Order in MSPI mode
   UCSZ01_Bit               : constant Bit_Number := 2;
   UCSZ01_Mask              : constant Unsigned_8 := 16#04#;
   --  Stop Bit Select
   USBS0_Bit                : constant Bit_Number := 3;
   USBS0_Mask               : constant Unsigned_8 := 16#08#;
   --  Parity Mode Bit 0
   UPM00_Bit                : constant Bit_Number := 4;
   UPM00_Mask               : constant Unsigned_8 := 16#10#;
   --  Parity Mode Bit 1
   UPM01_Bit                : constant Bit_Number := 5;
   UPM01_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Mode Select
   UMSEL00_Bit              : constant Bit_Number := 6;
   UMSEL00_Mask             : constant Unsigned_8 := 16#40#;
   --  USART Mode Select
   UMSEL01_Bit              : constant Bit_Number := 7;
   UMSEL01_Mask             : constant Unsigned_8 := 16#80#;


   --  USART1 Control and Status Register C
   UCSR1C_Addr              : constant Address    := 16#94#;
   UCSR1C                   : Unsigned_8 ;
   for UCSR1C'Address use UCSR1C_Addr;
   pragma Volatile (UCSR1C);
   UCSR1C_Bits              : Bits_In_Byte;
   for UCSR1C_Bits'Address use UCSR1C_Addr;
   pragma Volatile (UCSR1C_Bits);
   --  Clock Polarity
   UCPOL1_Bit               : constant Bit_Number := 0;
   UCPOL1_Mask              : constant Unsigned_8 := 16#01#;
   --  Character Size
   UCSZ10_Bit               : constant Bit_Number := 1;
   UCSZ10_Mask              : constant Unsigned_8 := 16#02#;
   --  Character Size
   UCSZ11_Bit               : constant Bit_Number := 2;
   UCSZ11_Mask              : constant Unsigned_8 := 16#04#;
   --  Stop Bit Select
   USBS1_Bit                : constant Bit_Number := 3;
   USBS1_Mask               : constant Unsigned_8 := 16#08#;
   --  Parity Mode Bit 0
   UPM10_Bit                : constant Bit_Number := 4;
   UPM10_Mask               : constant Unsigned_8 := 16#10#;
   --  Parity Mode Bit 1
   UPM11_Bit                : constant Bit_Number := 5;
   UPM11_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Mode Select
   UMSEL10_Bit              : constant Bit_Number := 6;
   UMSEL10_Mask             : constant Unsigned_8 := 16#40#;
   --  USART Mode Select
   UMSEL11_Bit              : constant Bit_Number := 7;
   UMSEL11_Mask             : constant Unsigned_8 := 16#80#;


   --  USART0 Control and Status Register D
   UCSR0D_Addr              : constant Address    := 16#83#;
   UCSR0D                   : Unsigned_8 ;
   for UCSR0D'Address use UCSR0D_Addr;
   pragma Volatile (UCSR0D);
   UCSR0D_Bits              : Bits_In_Byte;
   for UCSR0D_Bits'Address use UCSR0D_Addr;
   pragma Volatile (UCSR0D_Bits);
   --  Start Frame Detection Enable
   SFDE0_Bit                : constant Bit_Number := 5;
   SFDE0_Mask               : constant Unsigned_8 := 16#20#;
   --  USART RX Start
   RXS0_Bit                 : constant Bit_Number := 6;
   RXS0_Mask                : constant Unsigned_8 := 16#40#;
   --  USART RX Start Interrupt Enable
   RXSIE0_Bit               : constant Bit_Number := 7;
   RXSIE0_Mask              : constant Unsigned_8 := 16#80#;


   --  USART1 Control and Status Register D
   UCSR1D_Addr              : constant Address    := 16#93#;
   UCSR1D                   : Unsigned_8 ;
   for UCSR1D'Address use UCSR1D_Addr;
   pragma Volatile (UCSR0D);
   UCSR1D_Bits              : Bits_In_Byte;
   for UCSR1D_Bits'Address use UCSR1D_Addr;
   pragma Volatile (UCSR1D_Bits);
   --  Start Frame Detection Enable
   SFDE1_Bit                : constant Bit_Number := 5;
   SFDE1_Mask               : constant Unsigned_8 := 16#20#;
   --  USART RX Start
   RXS1_Bit                 : constant Bit_Number := 6;
   RXS1_Mask                : constant Unsigned_8 := 16#40#;
   --  USART RX Start Interrupt Enable
   RXSIE1_Bit               : constant Bit_Number := 7;
   RXSIE1_Mask              : constant Unsigned_8 := 16#80#;


   --  USART0 Baud Rate Register High Byte
   UBRR0H_Addr              : constant Address    := 16#82#;
   UBRR0H                   : Unsigned_8 ;
   for UBRR0H'Address use UBRR0H_Addr;
   pragma Volatile (UBRR0H);
   UBRR0H_Bits              : Bits_In_Byte;
   for UBRR0H_Bits'Address use UBRR0H_Addr;
   pragma Volatile (UBRR0H_Bits);
   --  USART0 Baud Rate Register bit 8
   UBRR008_Bit              : constant Bit_Number := 0;
   UBRR008_Mask             : constant Unsigned_8 := 16#01#;
   --  USART0 Baud Rate Register bit 9
   UBRR009_Bit              : constant Bit_Number := 1;
   UBRR009_Mask             : constant Unsigned_8 := 16#02#;
   --  USART0 Baud Rate Register bit 10
   UBRR010_Bit              : constant Bit_Number := 2;
   UBRR010_Mask             : constant Unsigned_8 := 16#04#;
   --  USART0 Baud Rate Register bit 11
   UBRR011_Bit              : constant Bit_Number := 3;
   UBRR011_Mask             : constant Unsigned_8 := 16#08#;


   --  USART0 Baud Rate Register Low Byte
   UBRR0L_Addr              : constant Address    := 16#81#;
   UBRR0                    : Unsigned_16;
   for UBRR0'Address use UBRR0L_Addr;
   pragma Volatile (UBRR0);
   UBRR0L                   : Unsigned_8 ;
   for UBRR0L'Address use UBRR0L_Addr;
   pragma Volatile (UBRR0L);
   UBRR0L_Bits              : Bits_In_Byte;
   for UBRR0L_Bits'Address use UBRR0L_Addr;
   pragma Volatile (UBRR0L_Bits);
   --  USART0 Baud Rate Register bit 0
   UBRR000_Bit              : constant Bit_Number := 0;
   UBRR000_Mask             : constant Unsigned_8 := 16#01#;
   --  USART0 Baud Rate Register bit 1
   UBRR001_Bit              : constant Bit_Number := 1;
   UBRR001_Mask             : constant Unsigned_8 := 16#02#;
   --  USART0 Baud Rate Register bit 2
   UBRR002_Bit              : constant Bit_Number := 2;
   UBRR002_Mask             : constant Unsigned_8 := 16#04#;
   --  USART0 Baud Rate Register bit 3
   UBRR003_Bit              : constant Bit_Number := 3;
   UBRR003_Mask             : constant Unsigned_8 := 16#08#;
   --  USART0 Baud Rate Register bit 4
   UBRR004_Bit              : constant Bit_Number := 4;
   UBRR004_Mask             : constant Unsigned_8 := 16#10#;
   --  USART0 Baud Rate Register bit 5
   UBRR005_Bit              : constant Bit_Number := 5;
   UBRR005_Mask             : constant Unsigned_8 := 16#20#;
   --  USART0 Baud Rate Register bit 6
   UBRR006_Bit              : constant Bit_Number := 6;
   UBRR006_Mask             : constant Unsigned_8 := 16#40#;
   --  USART0 Baud Rate Register bit 7
   UBRR007_Bit              : constant Bit_Number := 7;
   UBRR007_Mask             : constant Unsigned_8 := 16#80#;


   --  USART1 Baud Rate Register High Byte
   UBRR1H_Addr              : constant Address    := 16#92#;
   UBRR1H                   : Unsigned_8 ;
   for UBRR1H'Address use UBRR1H_Addr;
   pragma Volatile (UBRR1H);
   UBRR1H_Bits              : Bits_In_Byte;
   for UBRR1H_Bits'Address use UBRR1H_Addr;
   pragma Volatile (UBRR1H_Bits);
   --  USART1 Baud Rate Register bit 8
   UBRR108_Bit              : constant Bit_Number := 0;
   UBRR108_Mask             : constant Unsigned_8 := 16#01#;
   --  USART1 Baud Rate Register bit 9
   UBRR109_Bit              : constant Bit_Number := 1;
   UBRR109_Mask             : constant Unsigned_8 := 16#02#;
   --  USART1 Baud Rate Register bit 10
   UBRR110_Bit              : constant Bit_Number := 2;
   UBRR110_Mask             : constant Unsigned_8 := 16#04#;
   --  USART1 Baud Rate Register bit 11
   UBRR111_Bit              : constant Bit_Number := 3;
   UBRR111_Mask             : constant Unsigned_8 := 16#08#;


   --  USART1 Baud Rate Register Low Byte
   UBRR1L_Addr              : constant Address    := 16#91#;
   UBRR1                    : Unsigned_16;
   for UBRR1'Address use UBRR1L_Addr;
   pragma Volatile (UBRR1);
   UBRR1L                   : Unsigned_8 ;
   for UBRR1L'Address use UBRR1L_Addr;
   pragma Volatile (UBRR1L);
   UBRR1L_Bits              : Bits_In_Byte;
   for UBRR1L_Bits'Address use UBRR1L_Addr;
   pragma Volatile (UBRR1L_Bits);
   --  USART1 Baud Rate Register bit 0
   UBRR100_Bit              : constant Bit_Number := 0;
   UBRR100_Mask             : constant Unsigned_8 := 16#01#;
   --  USART1 Baud Rate Register bit 1
   UBRR101_Bit              : constant Bit_Number := 1;
   UBRR101_Mask             : constant Unsigned_8 := 16#02#;
   --  USART1 Baud Rate Register bit 2
   UBRR102_Bit              : constant Bit_Number := 2;
   UBRR102_Mask             : constant Unsigned_8 := 16#04#;
   --  USART1 Baud Rate Register bit 3
   UBRR103_Bit              : constant Bit_Number := 3;
   UBRR103_Mask             : constant Unsigned_8 := 16#08#;
   --  USART1 Baud Rate Register bit 4
   UBRR104_Bit              : constant Bit_Number := 4;
   UBRR104_Mask             : constant Unsigned_8 := 16#10#;
   --  USART1 Baud Rate Register bit 5
   UBRR105_Bit              : constant Bit_Number := 5;
   UBRR105_Mask             : constant Unsigned_8 := 16#20#;
   --  USART1 Baud Rate Register bit 6
   UBRR106_Bit              : constant Bit_Number := 6;
   UBRR106_Mask             : constant Unsigned_8 := 16#40#;
   --  USART1 Baud Rate Register bit 7
   UBRR107_Bit              : constant Bit_Number := 7;
   UBRR107_Mask             : constant Unsigned_8 := 16#80#;


   --  TWI Slave Control Register A
   TWSCRA_Addr              : constant Address    := 16#A5#;
   TWSCRA                   : Unsigned_8 ;
   for TWSCRA'Address use TWSCRA_Addr;
   pragma Volatile (TWSCRA);
   TWSCRA_Bits              : Bits_In_Byte;
   for TWSCRA_Bits'Address use TWSCRA_Addr;
   pragma Volatile (TWSCRA_Bits);
   --  TWI Smart Mode Enable
   TWSME_Bit                : constant Bit_Number := 0;
   TWSME_Mask               : constant Unsigned_8 := 16#01#;
   --  TWI Promiscuous Mode Enable
   TWPME_Bit                : constant Bit_Number := 1;
   TWPME_Mask               : constant Unsigned_8 := 16#02#;
   --  TWI Stop Interrupt Enable
   TWSIE_Bit                : constant Bit_Number := 2;
   TWSIE_Mask               : constant Unsigned_8 := 16#04#;
   --  Two-Wire Interface Enable
   TWEN_Bit                 : constant Bit_Number := 3;
   TWEN_Mask                : constant Unsigned_8 := 16#08#;
   --  TWI Address/Stop Interrupt Enable
   TWASIE_Bit               : constant Bit_Number := 4;
   TWASIE_Mask              : constant Unsigned_8 := 16#10#;
   --  TWI Data Interrupt Enable
   TWDIE_Bit                : constant Bit_Number := 5;
   TWDIE_Mask               : constant Unsigned_8 := 16#20#;
   --  TWI SDA Hold Time Enable
   TWSHE_Bit                : constant Bit_Number := 7;
   TWSHE_Mask               : constant Unsigned_8 := 16#80#;


   --  TWI Slave Control Register B
   TWSCRB_Addr              : constant Address    := 16#A4#;
   TWSCRB                   : Unsigned_8 ;
   for TWSCRB'Address use TWSCRB_Addr;
   pragma Volatile (TWSCRB);
   TWSCRB_Bits              : Bits_In_Byte;
   for TWSCRB_Bits'Address use TWSCRB_Addr;
   pragma Volatile (TWSCRB_Bits);
   --  TWI Command Bit 0
   TWCMD0_Bit               : constant Bit_Number := 0;
   TWCMD0_Mask              : constant Unsigned_8 := 16#01#;
   --  TWI Command Bit 1
   TWCMD1_Bit               : constant Bit_Number := 1;
   TWCMD1_Mask              : constant Unsigned_8 := 16#02#;
   --  TWI Acknowledge Action
   TWAA_Bit                 : constant Bit_Number := 2;
   TWAA_Mask                : constant Unsigned_8 := 16#04#;
   --  TWI High Noise Mode
   TWHNM_Bit                : constant Bit_Number := 3;
   TWHNM_Mask               : constant Unsigned_8 := 16#08#;


   --  TWI Slave Status Register A
   TWSSRA_Addr              : constant Address    := 16#A3#;
   TWSSRA                   : Unsigned_8 ;
   for TWSSRA'Address use TWSSRA_Addr;
   pragma Volatile (TWSSRA);
   TWSSRA_Bits              : Bits_In_Byte;
   for TWSSRA_Bits'Address use TWSSRA_Addr;
   pragma Volatile (TWSSRA_Bits);
   --  TWI Address or Stop
   TWAS_Bit                 : constant Bit_Number := 0;
   TWAS_Mask                : constant Unsigned_8 := 16#01#;
   --  TWI Read/Write Direction
   TWDIR_Bit                : constant Bit_Number := 1;
   TWDIR_Mask               : constant Unsigned_8 := 16#02#;
   --  TWI Bus Error
   TWBE_Bit                 : constant Bit_Number := 2;
   TWBE_Mask                : constant Unsigned_8 := 16#04#;
   --  TWI Collision
   TWC_Bit                  : constant Bit_Number := 3;
   TWC_Mask                 : constant Unsigned_8 := 16#08#;
   --  TWI Received Acknowledge
   TWRA_Bit                 : constant Bit_Number := 4;
   TWRA_Mask                : constant Unsigned_8 := 16#10#;
   --  TWI Clock Hold
   TWCH_Bit                 : constant Bit_Number := 5;
   TWCH_Mask                : constant Unsigned_8 := 16#20#;
   --  TWI Address/Stop Interrupt Flag
   TWASIF_Bit               : constant Bit_Number := 6;
   TWASIF_Mask              : constant Unsigned_8 := 16#40#;
   --  TWI Data Interrupt Flag
   TWDIF_Bit                : constant Bit_Number := 7;
   TWDIF_Mask               : constant Unsigned_8 := 16#80#;


   --  TWI Slave Address Register
   TWSA_Addr                : constant Address    := 16#A2#;
   TWSA                     : Unsigned_8 ;
   for TWSA'Address use TWSA_Addr;
   pragma Volatile (TWSA);
   TWSA_Bits                : Bits_In_Byte;
   for TWSA_Bits'Address use TWSA_Addr;
   pragma Volatile (TWSA_Bits);
   --  TWI Slave Address Register bit 0
   TWSA0_Bit                : constant Bit_Number := 0;
   TWSA0_Mask               : constant Unsigned_8 := 16#01#;
   --  TWI Slave Address Register bit 1
   TWSA1_Bit                : constant Bit_Number := 1;
   TWSA1_Mask               : constant Unsigned_8 := 16#02#;
   --  TWI Slave Address Register bit 2
   TWSA2_Bit                : constant Bit_Number := 2;
   TWSA2_Mask               : constant Unsigned_8 := 16#04#;
   --  TWI Slave Address Register bit 3
   TWSA3_Bit                : constant Bit_Number := 3;
   TWSA3_Mask               : constant Unsigned_8 := 16#08#;
   --  TWI Slave Address Register bit 4
   TWSA4_Bit                : constant Bit_Number := 4;
   TWSA4_Mask               : constant Unsigned_8 := 16#10#;
   --  TWI Slave Address Register bit 5
   TWSA5_Bit                : constant Bit_Number := 5;
   TWSA5_Mask               : constant Unsigned_8 := 16#20#;
   --  TWI Slave Address Register bit 6
   TWSA6_Bit                : constant Bit_Number := 6;
   TWSA6_Mask               : constant Unsigned_8 := 16#40#;
   --  TWI Slave Address Register bit 7
   TWSA7_Bit                : constant Bit_Number := 7;
   TWSA7_Mask               : constant Unsigned_8 := 16#80#;


   --  TWI Slave Address Mask Register
   TWSAM_Addr               : constant Address    := 16#A1#;
   TWSAM                    : Unsigned_8 ;
   for TWSAM'Address use TWSAM_Addr;
   pragma Volatile (TWSAM);
   TWSAM_Bits               : Bits_In_Byte;
   for TWSAM_Bits'Address use TWSAM_Addr;
   pragma Volatile (TWSAM_Bits);
   --  TWI Slave Address Enable
   TWAE_Bit                 : constant Bit_Number := 0;
   TWAE_Mask                : constant Unsigned_8 := 16#01#;
   --  TWI Slave Address Mask bit 0
   TWSAM0_Bit               : constant Bit_Number := 1;
   TWSAM0_Mask              : constant Unsigned_8 := 16#02#;
   --  TWI Slave Address Mask bit 1
   TWSAM1_Bit               : constant Bit_Number := 2;
   TWSAM1_Mask              : constant Unsigned_8 := 16#04#;
   --  TWI Slave Address Mask bit 2
   TWSAM2_Bit               : constant Bit_Number := 3;
   TWSAM2_Mask              : constant Unsigned_8 := 16#08#;
   --  TWI Slave Address Mask bit 3
   TWSAM3_Bit               : constant Bit_Number := 4;
   TWSAM3_Mask              : constant Unsigned_8 := 16#10#;
   --  TWI Slave Address Mask bit 4
   TWSAM4_Bit               : constant Bit_Number := 5;
   TWSAM4_Mask              : constant Unsigned_8 := 16#20#;
   --  TWI Slave Address Mask bit 5
   TWSAM5_Bit               : constant Bit_Number := 6;
   TWSAM5_Mask              : constant Unsigned_8 := 16#40#;
   --  TWI Slave Address Mask bit 6
   TWSAM6_Bit               : constant Bit_Number := 7;
   TWSAM6_Mask              : constant Unsigned_8 := 16#80#;


   --  TWI Slave Data Register
   TWSD_Addr                : constant Address    := 16#A0#;
   TWSD                     : Unsigned_8 ;
   for TWSD'Address use TWSD_Addr;
   pragma Volatile (TWSD);
   TWSD_Bits                : Bits_In_Byte;
   for TWSD_Bits'Address use TWSD_Addr;
   pragma Volatile (TWSD_Bits);
   --  TWI Slave Data Register bit 0
   TWSD0_Bit                : constant Bit_Number := 0;
   TWSD0_Mask               : constant Unsigned_8 := 16#01#;
   --  TWI Slave Data Register bit 1
   TWSD1_Bit                : constant Bit_Number := 1;
   TWSD1_Mask               : constant Unsigned_8 := 16#02#;
   --  TWI Slave Data Register bit 2
   TWSD2_Bit                : constant Bit_Number := 2;
   TWSD2_Mask               : constant Unsigned_8 := 16#04#;
   --  TWI Slave Data Register bit 3
   TWSD3_Bit                : constant Bit_Number := 3;
   TWSD3_Mask               : constant Unsigned_8 := 16#08#;
   --  TWI Slave Data Register bit 4
   TWSD4_Bit                : constant Bit_Number := 4;
   TWSD4_Mask               : constant Unsigned_8 := 16#10#;
   --  TWI Slave Data Register bit 5
   TWSD5_Bit                : constant Bit_Number := 5;
   TWSD5_Mask               : constant Unsigned_8 := 16#20#;
   --  TWI Slave Data Register bit 6
   TWSD6_Bit                : constant Bit_Number := 6;
   TWSD6_Mask               : constant Unsigned_8 := 16#40#;
   --  TWI Slave Data Register bit 7
   TWSD7_Bit                : constant Bit_Number := 7;
   TWSD7_Mask               : constant Unsigned_8 := 16#80#;


   --  debugWire Data Register
   DWDR_Addr                : constant Address    := 16#47#;
   DWDR                     : Unsigned_8 ;
   for DWDR'Address use DWDR_Addr;
   pragma Volatile (DWDR);
   DWDR_Bits                : Bits_In_Byte;
   for DWDR_Bits'Address use DWDR_Addr;
   pragma Volatile (DWDR_Bits);
   --  debugWire Data Register bit 0
   DWDR0_Bit                : constant Bit_Number := 0;
   DWDR0_Mask               : constant Unsigned_8 := 16#01#;
   --  debugWire Data Register bit 1
   DWDR1_Bit                : constant Bit_Number := 1;
   DWDR1_Mask               : constant Unsigned_8 := 16#02#;
   --  debugWire Data Register bit 2
   DWDR2_Bit                : constant Bit_Number := 2;
   DWDR2_Mask               : constant Unsigned_8 := 16#04#;
   --  debugWire Data Register bit 3
   DWDR3_Bit                : constant Bit_Number := 3;
   DWDR3_Mask               : constant Unsigned_8 := 16#08#;
   --  debugWire Data Register bit 4
   DWDR4_Bit                : constant Bit_Number := 4;
   DWDR4_Mask               : constant Unsigned_8 := 16#10#;
   --  debugWire Data Register bit 5
   DWDR5_Bit                : constant Bit_Number := 5;
   DWDR5_Mask               : constant Unsigned_8 := 16#20#;
   --  debugWire Data Register bit 6
   DWDR6_Bit                : constant Bit_Number := 6;
   DWDR6_Mask               : constant Unsigned_8 := 16#40#;
   --  debugWire Data Register bit 7
   DWDR7_Bit                : constant Bit_Number := 7;
   DWDR7_Mask               : constant Unsigned_8 := 16#80#;


   --  Store Program Memory Control and Status Register
   SPMCSR_Addr              : constant Address    := 16#57#;
   SPMCSR                   : Unsigned_8 ;
   for SPMCSR'Address use SPMCSR_Addr;
   pragma Volatile (SPMCSR);
   SPMCSR_Bits              : Bits_In_Byte;
   for SPMCSR_Bits'Address use SPMCSR_Addr;
   pragma Volatile (SPMCSR_Bits);
   --  Store Program Memory Enable
   SPMEN_Bit                : constant Bit_Number := 0;
   SPMEN_Mask               : constant Unsigned_8 := 16#01#;
   --  Page Erase
   PGERS_Bit                : constant Bit_Number := 1;
   PGERS_Mask               : constant Unsigned_8 := 16#02#;
   --  Page Write
   PGWRT_Bit                : constant Bit_Number := 2;
   PGWRT_Mask               : constant Unsigned_8 := 16#04#;
   --  Read Fuse and Lock Bits
   RFLB_Bit                 : constant Bit_Number := 3;
   RFLB_Mask                : constant Unsigned_8 := 16#08#;
   --  Clear Temporary Page Buffer
   CTPB_Bit                 : constant Bit_Number := 4;
   CTPB_Mask                : constant Unsigned_8 := 16#10#;
   --  Read Device Signature Imprint Table
   RSIG_Bit                 : constant Bit_Number := 5;
   RSIG_Mask                : constant Unsigned_8 := 16#20#;


   --
   --  available assembler instructions
   --
   --  type to designate the instruction core of the devices.  See
   --  the help file of Atmel's "AVR Assembler 2".
   type Instruction_Core_Type is (V0, V0E, V1, V2, V2E, V3);
   Instruction_Core  : constant Instruction_Core_Type := V2;
   Have_lpm_rd_Zplus : constant Boolean               := True;
   EEprom_8bit_Addr  : constant Boolean               :=
     (EEprom_Size <= 16#0100#);


end AVR.ATtiny841;
