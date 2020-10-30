-----------------------------------------------------------------
-----------------------------------------------------------------

-- The MS5611 has only fice basic commands:
-- 1. Reset
-- 2. Read PROM (128 biy of calibration words)
-- 3. D1 conversion
-- 4. D2 conversion
-- 5. Read ADC result (24 bit presssure/temperature)
with AVR;
with AVR.MCU;
use AVR;

package body MS5611 is

   MS5611_ADDR_W       : constant := 16#EE#; -- The read address of MS5611
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

   Command : MS5611_Command;
   nombreBoucle : Unsigned_8;

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

   procedure Init is
   begin
      -- Activate the TWI
      MCU.PRR0_Bits(MCU.PRTWI_Bit) := False;
      -- Set the clock speed (SCL) to 1 MHz and clear the status of the TWI
      MCU.TWBR := 12;
      MCU.TWSR_Bits := (others => False);
   end Init;

   procedure Stop is
   begin
      null;
   end Stop;

   procedure Request_Data(cmd: MS5611_Command) is
   begin
      Command := cmd;
      case cmd is
         when Cmd_Rst =>
            nombreBoucle := 1;
            Start;
         when Cmd_Read_Temp =>
            nombreBoucle := 3;
            Start;
         when Cmd_Read_P =>
            nombreBoucle := 3;
            Start;
         when Cmd_Read_Prom =>
            nombreBoucle := 2;
            Start;
         when others => null;
      end case;
   end Request_Data;

   procedure MS5611_Interrupt;
   pragma Machine_Attribute (Entity        => MS5611_Interrupt,
                             Attribute_Name => "signal");

   procedure MS5611_Interrupt is
   begin
      case MCU.TWSR is
         -- Bus error due to an illegal start or stop condition
         when 16#00# => null;
         -- A START condition has been transmitted so send the address
         when 16#08# =>
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
            MCU.TWDR := Command;
            MCU.TWCR_Bits := (MCU.TWINT_Bit => True,
                              MCU.TWEA_Bit => MCU.TWCR_Bits(MCU.TWEA_Bit),
                              MCU.TWSTA_Bit => MCU.TWCR_Bits(MCU.TWSTA_Bit),
                              MCU.TWSTO_Bit => MCU.TWCR_Bits(MCU.TWSTO_Bit),
                              MCU.TWWC_Bit => MCU.TWCR_Bits(MCU.TWWC_Bit),
                              MCU.TWEN_Bit => True,
                              MCU.TWIE_Bit => MCU.TWCR_Bits(MCU.TWIE_Bit),
                              others => False);

         -- SLA+W has been transmitted, NOT ACK has been received
         when 16#20# => null;

         -- Data byte has been transmitted, ACK has been received
         when 16#28# => null;

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


end MS5611;
