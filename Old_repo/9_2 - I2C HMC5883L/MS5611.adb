HMC5883L_ADDRESS      : constant := 16#1E#;
HMC5883L_REG_CONFIG_A : constant := 16#00#;
HMC5883L_REG_CONFIG_B : constant := 16#01#;
HMC5883L_REG_MODE     : constant := 16#02#;
HMC5883L_REG_OUT_X_M  : constant := 16#03#;
HMC5883L_REG_OUT_X_L  : constant := 16#04#;
HMC5883L_REG_OUT_Z_M  : constant := 16#05#;
HMC5883L_REG_OUT_Z_L  : constant := 16#06#;
HMC5883L_REG_OUT_Y_M  : constant := 16#07#;
HMC5883L_REG_OUT_Y_L  : constant := 16#08#;
HMC5883L_REG_STATUS   : constant := 16#09#;
HMC5883L_REG_IDENT_A  : constant := 16#0A#;
HMC5883L_REG_IDENT_B  : constant := 16#0B#;
HMC5883L_REG_IDENT_C  : constant := 16#0C#;

type HMC5883L_SAMPLES is (HMC5883L_SAMPLES_1, HMC5883L_SAMPLES_2, HMC5883L_SAMPLES_4, HMC5883L_SAMPLES_8);

type HMC5883L_DATARATE is (HMC5883L_DATARATE_0_75_HZ, HMC5883L_DATARATE_1_5_HZ, HMC5883L_DATARATE_3_HZ, HMC5883L_DATARATE_7_5_HZ, HMC5883L_DATARATE_15_HZ, HMC5883L_DATARATE_30_HZ, HMC5883L_DATARATE_75_HZ);

type HMC5883L_RANGE is (HMC5883L_RANGE_0_88GA, HMC5883L_RANGE_1_3GA, HMC5883L_RANGE_1_9GA, HMC5883L_RANGE_2_5GA, HMC5883L_RANGE_4GA, HMC5883L_RANGE_4_7GA, HMC5883L_RANGE_5_6GA, HMC5883L_RANGE_8_1GA);

type HMC588L_MODE is (HMC5883L_CONTINUOUS, HMC5883L_SINGLE, HMC5883L_IDLE);

type Vector is record
XAxis : float;
YAxis : float;
ZAxis : float;
end record; 