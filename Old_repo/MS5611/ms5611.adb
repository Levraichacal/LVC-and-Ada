-----------------------------------------------------------------
-----------------------------------------------------------------

-- The MS5611 has only fice basic commands:
-- 1. Reset
-- 2. Read PROM (128 biy of calibration words)
-- 3. D1 conversion
-- 4. D2 conversion
-- 5. Read ADC result (24 bit presssure/temperature)

MS5611_ADDR_W       : constant := 16#EE#; -- The read address of MS5611
MS5611_ADDR_R       : constant := 16#EF#; -- The write address of MS5611
MS5611_RESET        : constant := 16#1E#; -- Reset command
MS5611_CONVERT_ADC  : constant := 16#40#; -- Conversion command base
MS5611_CONVERT_D1   : constant := 16#00#; -- Addon conversion command for D1
MS5611_CONVERT_D2   : constant := 16#10#; -- Addon conversion command for D2
MS5611_CONVERT_256  : constant := 16#00#; -- Addon conversion command for OSR = 256
MS5611_CONVERT_512  : constant := 16#02#; -- Addon conversion command for OSR = 512
MS5611_CONVERT_1024 : constant := 16#04#; -- Addon conversion command for OSR = 1024
MS5611_CONVERT_2048 : constant := 16#06#; -- Addon conversion command for OSR = 2048
MS5611_CONVERT_4096 : constant := 16#08#; -- Addon conversion command for OSR = 4096
MS5611_ADC_READ     : constant := 16#00#; -- ADC read command
MS5611_PROM_READ    : constant := 16#A0#; -- PROM read command
