-----------------------------------------------------------------
-----------------------------------------------------------------

-- The MS5611 has only fice basic commands:
-- 1. Reset
-- 2. Read PROM (128 biy of calibration words)
-- 3. D1 conversion
-- 4. D2 conversion
-- 5. Read ADC result (24 bit presssure/temperature)

PACKAGE BODY MS5611 IS

   MS5611_ADDR_W       : CONSTANT := 16#EE#; -- The read address of MS5611
   MS5611_ADDR_R       : CONSTANT := 16#EF#; -- The write address of MS5611
   MS5611_RESET        : CONSTANT := 16#1E#; -- Reset command
   MS5611_CONVERT_ADC  : CONSTANT := 16#40#; -- Conversion command base
   MS5611_CONVERT_D1   : CONSTANT := 16#00#; -- Addon conversion command for D1
   MS5611_CONVERT_D2   : CONSTANT := 16#10#; -- Addon conversion command for D2
   MS5611_CONVERT_256  : CONSTANT := 16#00#; -- Addon conversion command for OSR = 256
   MS5611_CONVERT_512  : CONSTANT := 16#02#; -- Addon conversion command for OSR = 512
   MS5611_CONVERT_1024 : CONSTANT := 16#04#; -- Addon conversion command for OSR = 1024
   MS5611_CONVERT_2048 : CONSTANT := 16#06#; -- Addon conversion command for OSR = 2048
   MS5611_CONVERT_4096 : CONSTANT := 16#08#; -- Addon conversion command for OSR = 4096
   MS5611_ADC_READ     : CONSTANT := 16#00#; -- ADC read command
   MS5611_PROM_READ    : CONSTANT := 16#A0#; -- PROM read command

   PROCEDURE Start IS
   BEGIN
   END Start;

   PROCEDURE Init IS
   BEGIN
   END Init;

   PROCEDURE Stop IS
   BEGIN
   END Stop;

   PROCEDURE Request_Data IS
   BEGIN
   END Request_Data;

   PROCEDURE I2C_Interrupt;
   PRAGMA Machine_Attribute (Entity        => I2C_Interrupt,
                             Attibute_Name => "signal");
      
      pragma export (C, I2C_Interrupt, MCU.Sig_TWI_String);
   PROCEDURE I2C_Interrupt IS
   BEGIN
   END I2C_Interrupt;


END MS5611;
