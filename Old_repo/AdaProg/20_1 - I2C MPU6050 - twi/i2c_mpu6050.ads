with Interfaces;
use Interfaces;


package I2c_mpu6050 is

-------------------------------------
-- Constantes
   MPU6050_ADDRESS_AD0_LOW       : constant := 16#68#; -- address pin low (GND), default for InvenSense evaluation board
   MPU6050_ADDRESS_AD0_HIGH      : constant := 16#69#; -- address pin high (VCC)
   MPU6050_ADDRESS               : constant := MPU6050_ADDRESS_AD0_LOW;

   MPU6050_RA_GYRO_CONFIG        : constant := 16#1B#;
   MPU6050_RA_ACCEL_CONFIG       : constant := 16#1C#;
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
   MPU6050_RA_PWR_MGMT_1         : constant := 16#6B#;
   MPU6050_RA_PWR_MGMT_2         : constant := 16#6C#;
   MPU6050_RA_WHO_AM_I           : constant := 16#75#;

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
