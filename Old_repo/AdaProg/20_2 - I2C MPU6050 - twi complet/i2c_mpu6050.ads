with Interfaces;
use Interfaces;


package I2c_mpu6050 is

-------------------------------------
-- Constantes
   MPU6050_ADDRESS_AD0_LOW       : constant := 16#68#; -- address pin low (GND), default for InvenSense evaluation board
   MPU6050_ADDRESS_AD0_HIGH      : constant := 16#69#; -- address pin high (VCC)
   MPU6050_ADDRESS               : constant := MPU6050_ADDRESS_AD0_LOW;

   MPU6050_RA_XG_OFFS_TC         : constant := 16#00#; --[7] PWR_MODE, [6:1] XG_OFFS_TC, [0] OTP_BNK_VLD
   MPU6050_RA_YG_OFFS_TC         : constant := 16#01#; --[7] PWR_MODE, [6:1] YG_OFFS_TC, [0] OTP_BNK_VLD
   MPU6050_RA_ZG_OFFS_TC         : constant := 16#02#; --[7] PWR_MODE, [6:1] ZG_OFFS_TC, [0] OTP_BNK_VLD
   MPU6050_RA_X_FINE_GAIN        : constant := 16#03#; --[7:0] X_FINE_GAIN
   MPU6050_RA_Y_FINE_GAIN        : constant := 16#04#; --[7:0] Y_FINE_GAIN
   MPU6050_RA_Z_FINE_GAIN        : constant := 16#05#; --[7:0] Z_FINE_GAIN
   MPU6050_RA_XA_OFFS_H          : constant := 16#06#; --[15:0] XA_OFFS
   MPU6050_RA_XA_OFFS_L_TC       : constant := 16#07#;
   MPU6050_RA_YA_OFFS_H          : constant := 16#08#; --[15:0] YA_OFFS
   MPU6050_RA_YA_OFFS_L_TC       : constant := 16#09#;
   MPU6050_RA_ZA_OFFS_H          : constant := 16#0A#; --[15:0] ZA_OFFS
   MPU6050_RA_ZA_OFFS_L_TC       : constant := 16#0B#;
   MPU6050_RA_XG_OFFS_USRH       : constant := 16#13#; --[15:0] XG_OFFS_USR
   MPU6050_RA_XG_OFFS_USRL       : constant := 16#14#;
   MPU6050_RA_YG_OFFS_USRH       : constant := 16#15#; --[15:0] YG_OFFS_USR
   MPU6050_RA_YG_OFFS_USRL       : constant := 16#16#;
   MPU6050_RA_ZG_OFFS_USRH       : constant := 16#17#; --[15:0] ZG_OFFS_USR
   MPU6050_RA_ZG_OFFS_USRL       : constant := 16#18#;
   MPU6050_RA_SMPLRT_DIV         : constant := 16#19#;
   MPU6050_RA_CONFIG             : constant := 16#1A#;
   MPU6050_RA_GYRO_CONFIG        : constant := 16#1B#;
   MPU6050_RA_ACCEL_CONFIG       : constant := 16#1C#;
   MPU6050_RA_FF_THR             : constant := 16#1D#;
   MPU6050_RA_FF_DUR             : constant := 16#1E#;
   MPU6050_RA_MOT_THR            : constant := 16#1F#;
   MPU6050_RA_MOT_DUR            : constant := 16#20#;
   MPU6050_RA_ZRMOT_THR          : constant := 16#21#;
   MPU6050_RA_ZRMOT_DUR          : constant := 16#22#;
   MPU6050_RA_FIFO_EN            : constant := 16#23#;
   MPU6050_RA_I2C_MST_CTRL       : constant := 16#24#;
   MPU6050_RA_I2C_SLV0_ADDR      : constant := 16#25#;
   MPU6050_RA_I2C_SLV0_REG       : constant := 16#26#;
   MPU6050_RA_I2C_SLV0_CTRL      : constant := 16#27#;
   MPU6050_RA_I2C_SLV1_ADDR      : constant := 16#28#;
   MPU6050_RA_I2C_SLV1_REG       : constant := 16#29#;
   MPU6050_RA_I2C_SLV1_CTRL      : constant := 16#2A#;
   MPU6050_RA_I2C_SLV2_ADDR      : constant := 16#2B#;
   MPU6050_RA_I2C_SLV2_REG       : constant := 16#2C#;
   MPU6050_RA_I2C_SLV2_CTRL      : constant := 16#2D#;
   MPU6050_RA_I2C_SLV3_ADDR      : constant := 16#2E#;
   MPU6050_RA_I2C_SLV3_REG       : constant := 16#2F#;
   MPU6050_RA_I2C_SLV3_CTRL      : constant := 16#30#;
   MPU6050_RA_I2C_SLV4_ADDR      : constant := 16#31#;
   MPU6050_RA_I2C_SLV4_REG       : constant := 16#32#;
   MPU6050_RA_I2C_SLV4_DO        : constant := 16#33#;
   MPU6050_RA_I2C_SLV4_CTRL      : constant := 16#34#;
   MPU6050_RA_I2C_SLV4_DI        : constant := 16#35#;
   MPU6050_RA_I2C_MST_STATUS     : constant := 16#36#;
   MPU6050_RA_INT_PIN_CFG        : constant := 16#37#;
   MPU6050_RA_INT_ENABLE         : constant := 16#38#;
   MPU6050_RA_DMP_INT_STATUS     : constant := 16#39#;
   MPU6050_RA_INT_STATUS         : constant := 16#3A#;
   MPU6050_RA_ACCEL_XOUT_H       : constant := 16#3B#;
   MPU6050_RA_ACCEL_XOUT_L       : constant := 16#3C#;
   MPU6050_RA_ACCEL_YOUT_H       : constant := 16#3D#;
   MPU6050_RA_ACCEL_YOUT_L       : constant := 16#3E#;
   MPU6050_RA_ACCEL_ZOUT_H       : constant := 16#3F#;
   MPU6050_RA_ACCEL_ZOUT_L       : constant := 16#40#;
   MPU6050_RA_TEMP_OUT_H         : constant := 16#41#;
   MPU6050_RA_TEMP_OUT_L         : constant := 16#42#;
   MPU6050_RA_GYRO_XOUT_H        : constant := 16#43#;
   MPU6050_RA_GYRO_XOUT_L        : constant := 16#44#;
   MPU6050_RA_GYRO_YOUT_H        : constant := 16#45#;
   MPU6050_RA_GYRO_YOUT_L        : constant := 16#46#;
   MPU6050_RA_GYRO_ZOUT_H        : constant := 16#47#;
   MPU6050_RA_GYRO_ZOUT_L        : constant := 16#48#;
   MPU6050_RA_EXT_SENS_DATA_00   : constant := 16#49#;
   MPU6050_RA_EXT_SENS_DATA_01   : constant := 16#4A#;
   MPU6050_RA_EXT_SENS_DATA_02   : constant := 16#4B#;
   MPU6050_RA_EXT_SENS_DATA_03   : constant := 16#4C#;
   MPU6050_RA_EXT_SENS_DATA_04   : constant := 16#4D#;
   MPU6050_RA_EXT_SENS_DATA_05   : constant := 16#4E#;
   MPU6050_RA_EXT_SENS_DATA_06   : constant := 16#4F#;
   MPU6050_RA_EXT_SENS_DATA_07   : constant := 16#50#;
   MPU6050_RA_EXT_SENS_DATA_08   : constant := 16#51#;
   MPU6050_RA_EXT_SENS_DATA_09   : constant := 16#52#;
   MPU6050_RA_EXT_SENS_DATA_10   : constant := 16#53#;
   MPU6050_RA_EXT_SENS_DATA_11   : constant := 16#54#;
   MPU6050_RA_EXT_SENS_DATA_12   : constant := 16#55#;
   MPU6050_RA_EXT_SENS_DATA_13   : constant := 16#56#;
   MPU6050_RA_EXT_SENS_DATA_14   : constant := 16#57#;
   MPU6050_RA_EXT_SENS_DATA_15   : constant := 16#58#;
   MPU6050_RA_EXT_SENS_DATA_16   : constant := 16#59#;
   MPU6050_RA_EXT_SENS_DATA_17   : constant := 16#5A#;
   MPU6050_RA_EXT_SENS_DATA_18   : constant := 16#5B#;
   MPU6050_RA_EXT_SENS_DATA_19   : constant := 16#5C#;
   MPU6050_RA_EXT_SENS_DATA_20   : constant := 16#5D#;
   MPU6050_RA_EXT_SENS_DATA_21   : constant := 16#5E#;
   MPU6050_RA_EXT_SENS_DATA_22   : constant := 16#5F#;
   MPU6050_RA_EXT_SENS_DATA_23   : constant := 16#60#;
   MPU6050_RA_MOT_DETECT_STATUS  : constant := 16#61#;
   MPU6050_RA_I2C_SLV0_DO        : constant := 16#63#;
   MPU6050_RA_I2C_SLV1_DO        : constant := 16#64#;
   MPU6050_RA_I2C_SLV2_DO        : constant := 16#65#;
   MPU6050_RA_I2C_SLV3_DO        : constant := 16#66#;
   MPU6050_RA_I2C_MST_DELAY_CTRL : constant := 16#67#;
   MPU6050_RA_SIGNAL_PATH_RESET  : constant := 16#68#;
   MPU6050_RA_MOT_DETECT_CTRL    : constant := 16#69#;
   MPU6050_RA_USER_CTRL          : constant := 16#6A#;
   MPU6050_RA_PWR_MGMT_1         : constant := 16#6B#;
   MPU6050_RA_PWR_MGMT_2         : constant := 16#6C#;
   MPU6050_RA_BANK_SEL           : constant := 16#6D#;
   MPU6050_RA_MEM_START_ADDR     : constant := 16#6E#;
   MPU6050_RA_MEM_R_W            : constant := 16#6F#;
   MPU6050_RA_DMP_CFG_1          : constant := 16#70#;
   MPU6050_RA_DMP_CFG_2          : constant := 16#71#;
   MPU6050_RA_FIFO_COUNTH        : constant := 16#72#;
   MPU6050_RA_FIFO_COUNTL        : constant := 16#73#;
   MPU6050_RA_FIFO_R_W           : constant := 16#74#;
   MPU6050_RA_WHO_AM_I           : constant := 16#75#;

   MPU6050_TC_PWR_MODE_BIT     : constant := 7;
   MPU6050_TC_OFFSET_BIT       : constant := 6;
   MPU6050_TC_OFFSET_LENGTH    : constant := 6;
   MPU6050_TC_OTP_BNK_VLD_BIT  : constant := 0;

   MPU6050_VDDIO_LEVEL_VLOGIC  : constant := 0;
   MPU6050_VDDIO_LEVEL_VDD     : constant := 1;

   MPU6050_CFG_EXT_SYNC_SET_BIT    : constant := 5;
   MPU6050_CFG_EXT_SYNC_SET_LENGTH : constant := 3;
   MPU6050_CFG_DLPF_CFG_BIT    : constant := 2;
   MPU6050_CFG_DLPF_CFG_LENGTH : constant := 3;

   MPU6050_EXT_SYNC_DISABLED         : constant := 16#0#;
   MPU6050_EXT_SYNC_TEMP_OUT_L       : constant := 16#1#;
   MPU6050_EXT_SYNC_GYRO_XOUT_L      : constant := 16#2#;
   MPU6050_EXT_SYNC_GYRO_YOUT_L      : constant := 16#3#;
   MPU6050_EXT_SYNC_GYRO_ZOUT_L      : constant := 16#4#;
   MPU6050_EXT_SYNC_ACCEL_XOUT_L     : constant := 16#5#;
   MPU6050_EXT_SYNC_ACCEL_YOUT_L     : constant := 16#6#;
   MPU6050_EXT_SYNC_ACCEL_ZOUT_L     : constant := 16#7#;

   MPU6050_DLPF_BW_256           : constant := 16#00#;
   MPU6050_DLPF_BW_188           : constant := 16#01#;
   MPU6050_DLPF_BW_98            : constant := 16#02#;
   MPU6050_DLPF_BW_42            : constant := 16#03#;
   MPU6050_DLPF_BW_20            : constant := 16#04#;
   MPU6050_DLPF_BW_10            : constant := 16#05#;
   MPU6050_DLPF_BW_5             : constant := 16#06#;

   MPU6050_GCONFIG_FS_SEL_BIT      : constant := 4;
   MPU6050_GCONFIG_FS_SEL_LENGTH   : constant := 2;

   -- In T_GyroRange Type Todo, check what is better
   -- MPU6050_GYRO_FS_250           : constant := 16#00#;
   -- MPU6050_GYRO_FS_500           : constant := 16#01#;
   -- MPU6050_GYRO_FS_1000          : constant := 16#02#;
   -- MPU6050_GYRO_FS_2000          : constant := 16#03#;

   MPU6050_ACONFIG_XA_ST_BIT           : constant := 7;
   MPU6050_ACONFIG_YA_ST_BIT           : constant := 6;
   MPU6050_ACONFIG_ZA_ST_BIT           : constant := 5;
   MPU6050_ACONFIG_AFS_SEL_BIT         : constant := 4;
   MPU6050_ACONFIG_AFS_SEL_LENGTH      : constant := 2;
   MPU6050_ACONFIG_ACCEL_HPF_BIT       : constant := 2;
   MPU6050_ACONFIG_ACCEL_HPF_LENGTH    : constant := 3;

   -- in T_AccelRange type Todo, check what is better
   -- MPU6050_ACCEL_FS_2            : constant := 16#00#;
   -- MPU6050_ACCEL_FS_4            : constant := 16#01#;
   -- MPU6050_ACCEL_FS_8            : constant := 16#02#;
   -- MPU6050_ACCEL_FS_16           : constant := 16#03#;

   MPU6050_DHPF_RESET            : constant := 16#00#;
   MPU6050_DHPF_5                : constant := 16#01#;
   MPU6050_DHPF_2P5              : constant := 16#02#;
   MPU6050_DHPF_1P25             : constant := 16#03#;
   MPU6050_DHPF_0P63             : constant := 16#04#;
   MPU6050_DHPF_HOLD             : constant := 16#07#;

   MPU6050_TEMP_FIFO_EN_BIT    : constant := 7;
   MPU6050_XG_FIFO_EN_BIT      : constant := 6;
   MPU6050_YG_FIFO_EN_BIT      : constant := 5;
   MPU6050_ZG_FIFO_EN_BIT      : constant := 4;
   MPU6050_ACCEL_FIFO_EN_BIT   : constant := 3;
   MPU6050_SLV2_FIFO_EN_BIT    : constant := 2;
   MPU6050_SLV1_FIFO_EN_BIT    : constant := 1;
   MPU6050_SLV0_FIFO_EN_BIT    : constant := 0;

   MPU6050_MULT_MST_EN_BIT     : constant := 7;
   MPU6050_WAIT_FOR_ES_BIT     : constant := 6;
   MPU6050_SLV_3_FIFO_EN_BIT   : constant := 5;
   MPU6050_I2C_MST_P_NSR_BIT   : constant := 4;
   MPU6050_I2C_MST_CLK_BIT     : constant := 3;
   MPU6050_I2C_MST_CLK_LENGTH  : constant := 4;

   MPU6050_CLOCK_DIV_348         : constant := 16#0#;
   MPU6050_CLOCK_DIV_333         : constant := 16#1#;
   MPU6050_CLOCK_DIV_320         : constant := 16#2#;
   MPU6050_CLOCK_DIV_308         : constant := 16#3#;
   MPU6050_CLOCK_DIV_296         : constant := 16#4#;
   MPU6050_CLOCK_DIV_286         : constant := 16#5#;
   MPU6050_CLOCK_DIV_276         : constant := 16#6#;
   MPU6050_CLOCK_DIV_267         : constant := 16#7#;
   MPU6050_CLOCK_DIV_258         : constant := 16#8#;
   MPU6050_CLOCK_DIV_500         : constant := 16#9#;
   MPU6050_CLOCK_DIV_471         : constant := 16#A#;
   MPU6050_CLOCK_DIV_444         : constant := 16#B#;
   MPU6050_CLOCK_DIV_421         : constant := 16#C#;
   MPU6050_CLOCK_DIV_400         : constant := 16#D#;
   MPU6050_CLOCK_DIV_381         : constant := 16#E#;
   MPU6050_CLOCK_DIV_364         : constant := 16#F#;

   MPU6050_I2C_SLV_RW_BIT      : constant := 7;
   MPU6050_I2C_SLV_ADDR_BIT    : constant := 6;
   MPU6050_I2C_SLV_ADDR_LENGTH : constant := 7;
   MPU6050_I2C_SLV_EN_BIT      : constant := 7;
   MPU6050_I2C_SLV_BYTE_SW_BIT : constant := 6;
   MPU6050_I2C_SLV_REG_DIS_BIT : constant := 5;
   MPU6050_I2C_SLV_GRP_BIT     : constant := 4;
   MPU6050_I2C_SLV_LEN_BIT     : constant := 3;
   MPU6050_I2C_SLV_LEN_LENGTH  : constant := 4;

   MPU6050_I2C_SLV4_RW_BIT         : constant := 7;
   MPU6050_I2C_SLV4_ADDR_BIT       : constant := 6;
   MPU6050_I2C_SLV4_ADDR_LENGTH    : constant := 7;
   MPU6050_I2C_SLV4_EN_BIT         : constant := 7;
   MPU6050_I2C_SLV4_INT_EN_BIT     : constant := 6;
   MPU6050_I2C_SLV4_REG_DIS_BIT    : constant := 5;
   MPU6050_I2C_SLV4_MST_DLY_BIT    : constant := 4;
   MPU6050_I2C_SLV4_MST_DLY_LENGTH : constant := 5;

   MPU6050_MST_PASS_THROUGH_BIT    : constant := 7;
   MPU6050_MST_I2C_SLV4_DONE_BIT   : constant := 6;
   MPU6050_MST_I2C_LOST_ARB_BIT    : constant := 5;
   MPU6050_MST_I2C_SLV4_NACK_BIT   : constant := 4;
   MPU6050_MST_I2C_SLV3_NACK_BIT   : constant := 3;
   MPU6050_MST_I2C_SLV2_NACK_BIT   : constant := 2;
   MPU6050_MST_I2C_SLV1_NACK_BIT   : constant := 1;
   MPU6050_MST_I2C_SLV0_NACK_BIT   : constant := 0;

   MPU6050_INTCFG_INT_LEVEL_BIT        : constant := 7;
   MPU6050_INTCFG_INT_OPEN_BIT         : constant := 6;
   MPU6050_INTCFG_LATCH_INT_EN_BIT     : constant := 5;
   MPU6050_INTCFG_INT_RD_CLEAR_BIT     : constant := 4;
   MPU6050_INTCFG_FSYNC_INT_LEVEL_BIT  : constant := 3;
   MPU6050_INTCFG_FSYNC_INT_EN_BIT     : constant := 2;
   MPU6050_INTCFG_I2C_BYPASS_EN_BIT    : constant := 1;
   MPU6050_INTCFG_CLKOUT_EN_BIT        : constant := 0;

   MPU6050_INTMODE_ACTIVEHIGH    : constant := 16#00#;
   MPU6050_INTMODE_ACTIVELOW     : constant := 16#01#;

   MPU6050_INTDRV_PUSHPULL       : constant := 16#00#;
   MPU6050_INTDRV_OPENDRAIN      : constant := 16#01#;

   MPU6050_INTLATCH_50USPULSE    : constant := 16#00#;
   MPU6050_INTLATCH_WAITCLEAR    : constant := 16#01#;

   MPU6050_INTCLEAR_STATUSREAD   : constant := 16#00#;
   MPU6050_INTCLEAR_ANYREAD      : constant := 16#01#;

   MPU6050_INTERRUPT_FF_BIT            : constant := 7;
   MPU6050_INTERRUPT_MOT_BIT           : constant := 6;
   MPU6050_INTERRUPT_ZMOT_BIT          : constant := 5;
   MPU6050_INTERRUPT_FIFO_OFLOW_BIT    : constant := 4;
   MPU6050_INTERRUPT_I2C_MST_INT_BIT   : constant := 3;
   MPU6050_INTERRUPT_PLL_RDY_INT_BIT   : constant := 2;
   MPU6050_INTERRUPT_DMP_INT_BIT       : constant := 1;
   MPU6050_INTERRUPT_DATA_RDY_BIT      : constant := 0;

-- TODO: figure out what these actually do
-- UMPL source code is not very obivous
   MPU6050_DMPINT_5_BIT            : constant := 5;
   MPU6050_DMPINT_4_BIT            : constant := 4;
   MPU6050_DMPINT_3_BIT            : constant := 3;
   MPU6050_DMPINT_2_BIT            : constant := 2;
   MPU6050_DMPINT_1_BIT            : constant := 1;
   MPU6050_DMPINT_0_BIT            : constant := 0;

   MPU6050_MOTION_MOT_XNEG_BIT     : constant := 7;
   MPU6050_MOTION_MOT_XPOS_BIT     : constant := 6;
   MPU6050_MOTION_MOT_YNEG_BIT     : constant := 5;
   MPU6050_MOTION_MOT_YPOS_BIT     : constant := 4;
   MPU6050_MOTION_MOT_ZNEG_BIT     : constant := 3;
   MPU6050_MOTION_MOT_ZPOS_BIT     : constant := 2;
   MPU6050_MOTION_MOT_ZRMOT_BIT    : constant := 0;

   MPU6050_DELAYCTRL_DELAY_ES_SHADOW_BIT   : constant := 7;
   MPU6050_DELAYCTRL_I2C_SLV4_DLY_EN_BIT   : constant := 4;
   MPU6050_DELAYCTRL_I2C_SLV3_DLY_EN_BIT   : constant := 3;
   MPU6050_DELAYCTRL_I2C_SLV2_DLY_EN_BIT   : constant := 2;
   MPU6050_DELAYCTRL_I2C_SLV1_DLY_EN_BIT   : constant := 1;
   MPU6050_DELAYCTRL_I2C_SLV0_DLY_EN_BIT   : constant := 0;

   MPU6050_PATHRESET_GYRO_RESET_BIT    : constant := 2;
   MPU6050_PATHRESET_ACCEL_RESET_BIT   : constant := 1;
   MPU6050_PATHRESET_TEMP_RESET_BIT    : constant := 0;

   MPU6050_DETECT_ACCEL_ON_DELAY_BIT       : constant := 5;
   MPU6050_DETECT_ACCEL_ON_DELAY_LENGTH    : constant := 2;
   MPU6050_DETECT_FF_COUNT_BIT             : constant := 3;
   MPU6050_DETECT_FF_COUNT_LENGTH          : constant := 2;
   MPU6050_DETECT_MOT_COUNT_BIT            : constant := 1;
   MPU6050_DETECT_MOT_COUNT_LENGTH         : constant := 2;

   MPU6050_DETECT_DECREMENT_RESET    : constant := 16#0#;
   MPU6050_DETECT_DECREMENT_1        : constant := 16#1#;
   MPU6050_DETECT_DECREMENT_2        : constant := 16#2#;
   MPU6050_DETECT_DECREMENT_4        : constant := 16#3#;

   MPU6050_USERCTRL_DMP_EN_BIT             : constant := 7;
   MPU6050_USERCTRL_FIFO_EN_BIT            : constant := 6;
   MPU6050_USERCTRL_I2C_MST_EN_BIT         : constant := 5;
   MPU6050_USERCTRL_I2C_IF_DIS_BIT         : constant := 4;
   MPU6050_USERCTRL_DMP_RESET_BIT          : constant := 3;
   MPU6050_USERCTRL_FIFO_RESET_BIT         : constant := 2;
   MPU6050_USERCTRL_I2C_MST_RESET_BIT      : constant := 1;
   MPU6050_USERCTRL_SIG_COND_RESET_BIT     : constant := 0;

   MPU6050_PWR1_DEVICE_RESET_BIT   : constant := 7;
   MPU6050_PWR1_SLEEP_BIT          : constant := 6;
   MPU6050_PWR1_CYCLE_BIT          : constant := 5;
   MPU6050_PWR1_TEMP_DIS_BIT       : constant := 3;
   MPU6050_PWR1_CLKSEL_BIT         : constant := 2;
   MPU6050_PWR1_CLKSEL_LENGTH      : constant := 3;

   -- In T_ClockSource type Todo, check what is better
   -- MPU6050_CLOCK_INTERNAL            : constant := 16#00#;
   -- MPU6050_CLOCK_PLL_XGYRO           : constant := 16#01#;
   -- MPU6050_CLOCK_PLL_YGYRO           : constant := 16#02#;
   -- MPU6050_CLOCK_PLL_ZGYRO           : constant := 16#03#;
   -- MPU6050_CLOCK_PLL_EXT32K          : constant := 16#04#;
   -- MPU6050_CLOCK_PLL_EXT19M          : constant := 16#05#;
   -- MPU6050_CLOCK_KEEP_RESET          : constant := 16#07#;

   MPU6050_PWR2_LP_WAKE_CTRL_BIT       : constant := 7;
   MPU6050_PWR2_LP_WAKE_CTRL_LENGTH    : constant := 2;
   MPU6050_PWR2_STBY_XA_BIT            : constant := 5;
   MPU6050_PWR2_STBY_YA_BIT            : constant := 4;
   MPU6050_PWR2_STBY_ZA_BIT            : constant := 3;
   MPU6050_PWR2_STBY_XG_BIT            : constant := 2;
   MPU6050_PWR2_STBY_YG_BIT            : constant := 1;
   MPU6050_PWR2_STBY_ZG_BIT            : constant := 0;

   MPU6050_WAKE_FREQ_1P25        : constant := 16#0#;
   MPU6050_WAKE_FREQ_2P5         : constant := 16#1#;
   MPU6050_WAKE_FREQ_5           : constant := 16#2#;
   MPU6050_WAKE_FREQ_10          : constant := 16#3#;

   MPU6050_BANKSEL_PRFTCH_EN_BIT       : constant := 6;
   MPU6050_BANKSEL_CFG_USER_BANK_BIT   : constant := 5;
   MPU6050_BANKSEL_MEM_SEL_BIT         : constant := 4;
   MPU6050_BANKSEL_MEM_SEL_LENGTH      : constant := 5;

   MPU6050_WHO_AM_I_BIT        : constant := 6;
   MPU6050_WHO_AM_I_LENGTH     : constant := 6;

   MPU6050_DMP_MEMORY_BANKS        : constant := 8;
   MPU6050_DMP_MEMORY_BANK_SIZE    : constant := 256;
   MPU6050_DMP_MEMORY_CHUNK_SIZE   : constant := 16;

-------------------------------------
-- Type
   type T_ClockSource is  (MPU6050_CLOCK_INTERNAL,
                           MPU6050_CLOCK_PLL_XGYRO,
                           MPU6050_CLOCK_PLL_YGYRO,
                           MPU6050_CLOCK_PLL_ZGYRO,
                           MPU6050_CLOCK_PLL_EXT32K,
                           MPU6050_CLOCK_PLL_EXT19M,
                           MPU6050_CLOCK_KEEP_RESET);

   type T_GyroRange is  (MPU6050_GYRO_FS_250,
                         MPU6050_GYRO_FS_500,
                         MPU6050_GYRO_FS_1000,
                         MPU6050_GYRO_FS_2000);

   type T_AccelRange is (MPU6050_ACCEL_FS_2,
                         MPU6050_ACCEL_FS_4,
                         MPU6050_ACCEL_FS_8,
                         MPU6050_ACCEL_FS_16);

   type T_IMU_Data is record
      Ax : Integer_16;
      Ay : Integer_16;
      Az : Integer_16;
      Tp : Integer_16;
      Gx : Integer_16;
      Gy : Integer_16;
      Gz : Integer_16;
   end record;

-------------------------------------
-- Procedures

   -- Set Clock of the MPU6050
   procedure MPU6050_SetClockSource(ClockSource : T_ClockSource);

   -- Set Full Scale of the Gyro range of the MPU6050
   procedure MPU6050_SetFullScaleGyroRange(GyroRange : T_GyroRange);

   -- Set Full Scale of the Accel range of the MPU6050
   procedure MPU6050_SetFullScaleAccelRange(GyroRange : T_AccelRange);

   -- Set sleep enable
   procedure MPU6050_SetSleepEnable(SleepYN : Boolean);

   -- Initialize The MPU6050
   procedure MPU6050_Initialize;

   -- Get MPU6050 Device ID
   function MPU6050_GetDeviceID return Unsigned_8;

   -- Test the connection between the MPU6050 and the arduino
   function MPU6050_TestConnection return Boolean;

   -- Get the MPU6050 data
   function MPU6050_GetMotion6 return T_IMU_Data;

end I2c_mpu6050;
