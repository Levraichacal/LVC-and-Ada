with Interfaces;
use Interfaces;


package I2c_ms5611 is

-------------------------------------
-- Constantes
   MS5611_ADDRESS           : constant := 16#77#;
   MS5611_CMD_ADC_READ      : constant := 16#00#;
   MS5611_CMD_RESET         : constant := 16#1E#;
   MS5611_CMD_CONV_D1       : constant := 16#40#;
   MS5611_CMD_CONV_D2       : constant := 16#50#;
   MS5611_CMD_READ_PROM     : constant := 16#A2#;

-------------------------------------
-- Type
   type T_MS5611_Osr is (MS5611_ULTRA_LOW_POWER,
                         MS5611_LOW_POWER,
                         MS5611_STANDARD,
                         MS5611_HIGH_RES,
                         MS5611_ULTRA_HIGH_RES);

-------------------------------------
-- Procedures
   -- Initialise the MS5611
   function MS5611_Initialise(MS5611_Osr : T_MS5611_Osr := MS5611_HIGH_RES) return Boolean;

   -- Return the temperature
   function MS5611_ReadRawTemperature return Unsigned_32;

   -- Return the pressure
   function MS5611_ReadRawPressure return Unsigned_32;

   -- Return the calculate temperature
   function MS5611_ReadTemperature(Compensation : Boolean :=True) return Integer_32;

   -- Return the calculate pressure
   function MS5611_ReadPressure(Compensation : Boolean :=True) return Unsigned_32;

   -- Set the OverSampling Mode
   procedure MS5611_SetOverSamping(MS5611_Osr : T_MS5611_Osr);

   -- Get the OverSampling mode of teh MS5611
   function MS5611_GetOverSampling return T_MS5611_Osr;

private
   

end I2c_ms5611;
