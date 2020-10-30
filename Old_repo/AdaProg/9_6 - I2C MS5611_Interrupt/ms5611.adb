-----------------------------------------------------------------
-----------------------------------------------------------------

-- The MS5611 has only fice basic commands:
-- 1. Reset
-- 2. Read PROM (128 biy of calibration words)
-- 3. D1 conversion
-- 4. D2 conversion
-- 5. Read ADC result (24 bit presssure/temperature)
-- During the init, we choose the resolution, 256 (the lowest one) by default.
-- The functionning of the programme is the following one:
-- 1. Reset of the MS5611
-- 2. Get the 6 coefficients
-- 3. Get the temperature
-- 4. Get the Pressure
-- In functionning, the steps 3 and 4 will be execute by a timer.

with AVR;
with AVR.MCU;
use AVR;
use AVR.MCU;
with LVC.PINS;
use LVC.PINS;
with AVR.Interrupts;

package body MS5611 is

   type EtapeCmd is (Start, SendW, SendR, GetCoef);

   MS5611_ADDR_W       : constant := 16#77#; --16#EE#; -- The read address of MS5611
   MS5611_ADDR_R       : constant := 16#EF#; -- The write address of MS5611
   MS5611_RESET        : constant := 16#1E#; -- Reset command
   MS5611_CONVERT_D1   : constant := 16#40#; -- Addon conversion command for D1
   MS5611_CONVERT_D2   : constant := 16#50#; -- Addon conversion command for D2
   MS5611_CONVERT_256  : constant := 16#00#; -- Addon conversion command for OSR = 256
   MS5611_CONVERT_512  : constant := 16#02#; -- Addon conversion command for OSR = 512
   MS5611_CONVERT_1024 : constant := 16#04#; -- Addon conversion command for OSR = 1024
   MS5611_CONVERT_2048 : constant := 16#06#; -- Addon conversion command for OSR = 2048
   MS5611_CONVERT_4096 : constant := 16#08#; -- Addon conversion command for OSR = 4096
   MS5611_PROM_READ    : constant := 16#A0#; -- PROM read command

--   Address : Bits_In_Byte := MS5611_ADDR_W;
--   Command : Bits_In_Byte := MS5611_RESET;
   Address : Unsigned_8 := MS5611_ADDR_W;
   Command : Unsigned_8 := MS5611_RESET;

   C1 : Unsigned_16 := 0;
   C2 : Unsigned_16 := 0;
   C3 : Unsigned_16 := 0;
   C4 : Unsigned_16 := 0;
   C5 : Unsigned_16 := 0;
   C6 : Unsigned_16 := 0;
   Temperature : Unsigned_32 := 0;
   Pressure : Unsigned_32 := 0;

   function GetC1 return Unsigned_16 is
   begin
      return C1;
   end GetC1;


   function GetC2 return Unsigned_16 is
   begin
      return C2;
   end GetC2;

   function GetC3 return Unsigned_16 is
   begin
      return C3;
   end GetC3;

   function GetC4 return Unsigned_16 is
   begin
      return C4;
   end GetC4;

   function GetC5 return Unsigned_16 is
   begin
      return C5;
   end GetC5;

   function GetC6 return Unsigned_16 is
   begin
      return C6;
   end GetC6;

   function GetTemperature return Unsigned_32 is
   begin
      return Temperature;
   end GetTemperature;

   function GetPressure return Unsigned_32 is
   begin
      return Pressure;
   end GetPressure;


   procedure Start is
   begin
      MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                        MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                        MCU.TWSTA_Bit => True,
                        MCU.TWSTO_Bit => False,
                        MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                        MCU.TWEN_Bit => True,
                        MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                        others => False);
   end Start;

   procedure Init(SCL_Port : lvcPins; SDA_Port : lvcPins) is
   begin
      AVR.Interrupts.Disable;
      pinMode(D13,Output);
      -- Activate the TWI
--      MCU.PRR0_Bits(MCU.PRTWI_Bit) := False;
      MCU.PRR_Bits(MCU.PRTWI_Bit) := False;
      -- Set the clock speed (SCL) to 400 kHz and clear the status of the TWI
      MCU.TWBR := 12;
      MCU.TWSR_Bits := (others => False);
      pinMode(SCL_Port, Output);
      pinMode(SDA_Port, Output);
      digitalWrite(D13, Low_lvl);
      MCU.TWCR := +(MCU.TWIE_Bit => True,
                    others => False);
      AVR.Interrupts.Enable;
      Start;
   end Init;

   procedure Stop is
   begin
      null;
   end Stop;

   procedure MS5611_Interrupt;
   pragma Machine_Attribute (Entity        => MS5611_Interrupt,
                             Attribute_Name => "signal");

   pragma Export (C, MS5611_Interrupt, MCU.Sig_TWI_String);

   procedure MS5611_Interrupt is
   begin
      case MCU.TWSR is
         -- Bus error due to an illegal start or stop condition
         when 16#00# => null;
         -- A START condition has been transmitted so send the address
         when 16#08# =>
            --Send Address
            MCU.TWDR := Address;
            MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                              MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                              MCU.TWSTA_Bit => MCU.TWCR_Bits(MCU.TWSTA_Bit),
                              MCU.TWSTO_Bit => MCU.TWCR_Bits(MCU.TWSTO_Bit),
                              MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                              MCU.TWEN_Bit => True,
                              MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                              others => False);

         -- A repeated START condition has been transmitted
         when 16#10# =>
            --Send Address
            MCU.TWDR := Address;
            MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                              MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                              MCU.TWSTA_Bit => MCU.TWCR_Bits(MCU.TWSTA_Bit),
                              MCU.TWSTO_Bit => MCU.TWCR_Bits(MCU.TWSTO_Bit),
                              MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                              MCU.TWEN_Bit => True,
                              MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                              others => False);

         -- SLA+W has been transmitted, ACK has been received
         when 16#18# =>
            --Send Command
            MCU.TWCR := +(MCU.TWINT_Bit => True,
                          others => False);
            MCU.TWDR := Command;
            MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                              MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                              MCU.TWSTA_Bit => MCU.TWCR_Bits(MCU.TWSTA_Bit),
                              MCU.TWSTO_Bit => MCU.TWCR_Bits(MCU.TWSTO_Bit),
                              MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                              MCU.TWEN_Bit => True,
                              MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                              others => False);
            -- digitalWrite(D13, High_lvl);

         -- SLA+W has been transmitted, NOT ACK has been received
         when 16#20# => 
         --null;

            digitalWrite(D13, High_lvl);
         -- Data byte has been transmitted, ACK has been received
         when 16#28# =>
            --Send Stop
            MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                              MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                              MCU.TWSTA_Bit => False,
                              MCU.TWSTO_Bit => True,
                              MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                              MCU.TWEN_Bit => True,
                              MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                              others => False);
            digitalWrite(D13, High_lvl);

         -- Data byte has been transmitted, NOT ACK has been received
         when 16#30# => null;

         -- Arbitration lost in SLA+W or data bytes in Master Transmitter Mode
         -- Arbitration lost in SLA+R or NOT ACK bit in Master Receiver Mode
         when 16#38# => null;

         -- SLA+R has been transmitted, ACK has been received
         when 16#40# => null;

         -- SLA+R has been transmitted, NOT ACK has been received
         when 16#48# => null;

         -- Data byte has been received, ACK has been return
         when 16#50# => null;

         -- Data byte has been received, NOT ACK has been return
         when 16#58# => null;

         --No relavant state information available
         when 16#F8# => null;
         when others => null;
      end case;
   end MS5611_Interrupt;


   -- Procedure qui permet d'attendre environ 15 ms entre la demande et la lecture des données.
   procedure Timer_Interrupt is
   begin
      null;
   end Timer_Interrupt;


end MS5611;
