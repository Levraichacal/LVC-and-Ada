with Interfaces;
use Interfaces;


package I2c_hmc5883l is

-------------------------------------
-- Constantes

--   HMC5883L_ADDRESS              : constant := 16#3C#;
--    HMC5883L_ADDRESS_R            : constant := 16#3D#;
   HMC5883L_ADDRESS              : constant := 16#1E#;
   -- HMC5883L_ADDRESS_R            : constant := 16#1E#;
   HMC5883L_REG_CONFIG_A         : constant := 16#00#;
   HMC5883L_REG_CONFIG_B         : constant := 16#01#;
   HMC5883L_REG_MODE             : constant := 16#02#;
   HMC5883L_REG_OUT_X_M          : constant := 16#03#;
   HMC5883L_REG_OUT_X_L          : constant := 16#04#;
   HMC5883L_REG_OUT_Z_M          : constant := 16#05#;
   HMC5883L_REG_OUT_Z_L          : constant := 16#06#;
   HMC5883L_REG_OUT_Y_M          : constant := 16#07#;
   HMC5883L_REG_OUT_Y_L          : constant := 16#08#;
   HMC5883L_REG_STATUS           : constant := 16#09#;
   HMC5883L_REG_IDENT_A          : constant Unsigned_8 := 16#0A#;
   HMC5883L_REG_IDENT_B          : constant Unsigned_8 := 16#0B#;
   HMC5883L_REG_IDENT_C          : constant Unsigned_8 := 16#0C#;
   --type IEEE_Float_32 is digits 6;
   --for IEEE_Float_32'Size use 32;

   type T_HMC5883L_Range is (HMC5883L_RANGE_0_88GA,
                             HMC5883L_RANGE_1_3GA,
                             HMC5883L_RANGE_1_9GA,
                             HMC5883L_RANGE_2_5GA,
                             HMC5883L_RANGE_4GA,
                             HMC5883L_RANGE_4_7GA,
                             HMC5883L_RANGE_5_6GA,
                             HMC5883L_RANGE_8_1GA);

   type T_HMC5883L_DataRate is (HMC5883L_DATARATE_0_75_HZ,
                                HMC5883L_DATARATE_1_5HZ,
                                HMC5883L_DATARATE_3HZ,
                                HMC5883L_DATARATE_7_5HZ,
                                HMC5883L_DATARATE_15HZ,
                                HMC5883L_DATARATE_30HZ,
                                HMC5883L_DATARATE_75HZ);

   type T_HMC5883L_Sample is (HMC5883L_SAMPLES_1,
                              HMC5883L_SAMPLES_2,
                              HMC5883L_SAMPLES_4,
                              HMC5883L_SAMPLES_8);

   type T_HMC5883L_Mode is (HMC5883L_CONTINOUS,
                            HMC5883L_SINGLE,
                            HMC5883L_IDLE);

   type Vector is record
      X : IEEE_Float_32;
      Y : IEEE_Float_32;
      Z : IEEE_Float_32;
   end record;


   function beginHMC5883L return Boolean;

   function readRaw return Vector;
   function readNormalize return Vector;

   procedure setOffset(X0 : Unsigned_8; Y0 : Unsigned_8);

   procedure setRange(HMC5883L_range : T_HMC5883L_Range);
   function getRange return T_HMC5883L_Range;

   procedure setMeasurementMode(HMC5883L_MeasurementMode : T_HMC5883L_Mode);
   function getMeasurementMode return T_HMC5883L_Mode;

   procedure setDataRate(HMC5883L_DataRate : T_HMC5883L_DataRate);
   function getDataRate return T_HMC5883L_DataRate;

   procedure setSamples(HMC5883L_sample : T_HMC5883L_Sample);
   function getSamples return T_HMC5883L_Sample;

private
   mgPerDigit :IEEE_Float_32;
   v : Vector;
   xOffset, yOffset : Unsigned_8 := 0;
end I2c_hmc5883l;
