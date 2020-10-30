-- Use the two_Wire interface
with Two_Wire;
use Two_Wire;
--with Ada.Unchecked_Conversion;
-- Use AVR.Programspace to use progmem
with AVR.Programspace;
use AVR.Programspace;

package body I2c_mpu6050 is

   -- Set Clock of the MPU6050
   procedure MPU6050_SetClockSource(ClockSource : T_ClockSource) is
      val : Unsigned_8;
      temp : Data_Buffer(1..2);
   begin
      temp(1) := MPU6050_RA_PWR_MGMT_1;
      Write_Data(MPU6050_ADDRESS,temp(1..1));
      Request_Data(MPU6050_ADDRESS,1);
      val := Receive;
      val := val and 2#11111000#;
      case ClockSource is
         when MPU6050_CLOCK_INTERNAL =>
            val := val or 2#000#;
         when MPU6050_CLOCK_PLL_XGYRO =>
            val := val or 2#001#;
         when MPU6050_CLOCK_PLL_YGYRO =>
            val := val or 2#010#;
         when MPU6050_CLOCK_PLL_ZGYRO =>
            val := val or 2#011#;
         when MPU6050_CLOCK_PLL_EXT32K =>
            val := val or 2#100#;
         when MPU6050_CLOCK_PLL_EXT19M =>
            val := val or 2#101#;
         when MPU6050_CLOCK_KEEP_RESET =>
            val := val or 2#111#;
      end case;
      temp(2) := val;
      Write_Data(MPU6050_ADDRESS,temp);
   end MPU6050_SetClockSource;

   -- Set Full Scale of the Gyro range of the MPU6050
   procedure MPU6050_SetFullScaleGyroRange(GyroRange : T_GyroRange) is
      val : Unsigned_8;
      temp : Data_Buffer(1..2);
   begin
      temp(1) := MPU6050_RA_GYRO_CONFIG;
      Write_Data(MPU6050_ADDRESS,temp(1..1));
      Request_Data(MPU6050_ADDRESS,1);
      val := Receive;
      val := val and 2#11100111#;
      case GyroRange is
         when MPU6050_GYRO_FS_250 =>
            val := val or 2#00000#;
         when MPU6050_GYRO_FS_500 =>
            val := val or 2#01000#;
         when MPU6050_GYRO_FS_1000 =>
            val := val or 2#10000#;
         when MPU6050_GYRO_FS_2000 =>
            val := val or 2#11000#;
      end case;
      temp(2) := val;
      Write_Data(MPU6050_ADDRESS,temp);
   end MPU6050_SetFullScaleGyroRange;

   -- Set Full Scale of the Accel range of the MPU6050
   procedure MPU6050_SetFullScaleAccelRange(GyroRange : T_AccelRange) is
      val : Unsigned_8;
      temp : Data_Buffer(1..2);
   begin
      temp(1) := MPU6050_RA_ACCEL_CONFIG;
      Write_Data(MPU6050_ADDRESS,temp(1..1));
      Request_Data(MPU6050_ADDRESS,1);
      val := Receive;
      val := val and 2#11100111#;
      case GyroRange is
         when MPU6050_ACCEL_FS_2 =>
            val := val or 2#00000#;
         when MPU6050_ACCEL_FS_4 =>
            val := val or 2#01000#;
         when MPU6050_ACCEL_FS_8 =>
            val := val or 2#10000#;
         when MPU6050_ACCEL_FS_16 =>
            val := val or 2#11000#;
      end case;
      temp(2) := val;
      Write_Data(MPU6050_ADDRESS,temp);
   end MPU6050_SetFullScaleAccelRange;

   -- Set sleep enable
   procedure MPU6050_SetSleepEnable(SleepYN : Boolean) is
      val : Unsigned_8;
      temp : Data_Buffer(1..2);
   begin
      temp(1) := MPU6050_RA_PWR_MGMT_1;
      Write_Data(MPU6050_ADDRESS,temp(1..1));
      Request_Data(MPU6050_ADDRESS,1);
      val := Receive;
      val := val and 2#10111111#;
      case SleepYN is
         when True =>
            val := val or 2#1000000#;
         when False =>
            val := val or 2#0000000#;
      end case;
      temp(2) := val;
      Write_Data(MPU6050_ADDRESS,temp);
   end MPU6050_SetSleepEnable;

   -- Initialize The MPU6050
   procedure MPU6050_Initialize is
   begin
      Init;
      MPU6050_SetClockSource(MPU6050_CLOCK_PLL_XGYRO);
      MPU6050_SetFullScaleGyroRange(MPU6050_GYRO_FS_250);
      MPU6050_SetFullScaleAccelRange(MPU6050_ACCEL_FS_2);
      MPU6050_SetSleepEnable(False);
   end MPU6050_Initialize;

   function MPU6050_GetDeviceID return Unsigned_8 is
      val : Unsigned_8;
      temp : Data_Buffer(1..1);
   begin
      temp(1) := MPU6050_RA_WHO_AM_I;
      Write_Data(MPU6050_ADDRESS,temp(1..1));
      Request_Data(MPU6050_ADDRESS,1);
      val := Receive;
      return val;
   end MPU6050_GetDeviceID;

   -- Test the connection between the MPU6050 and the arduino
   function MPU6050_TestConnection return Boolean is
   begin
      return (MPU6050_GetDeviceID = 2#1101000#);
   end MPU6050_TestConnection;

   -- Get the MPU6050 data
   -- When you read  the first value (the High byte of accel on x)
   --  The other follow automitacly!
   function MPU6050_GetMotion6 return T_IMU_Data is
      tempData : T_IMU_Data;
      temp : Unsigned_8;
      tempBuff : Data_Buffer(1..1);
   begin
      tempBuff(1) := MPU6050_RA_ACCEL_XOUT_H;

      -- Acceleration X
      Write_Data(MPU6050_ADDRESS,tempBuff(1..1));
      Request_Data(MPU6050_ADDRESS,14);
      temp := Receive;
      tempData.Ax := Integer_16(temp)*256 + Integer_16(Receive);

      -- Acceleration Y
      temp := Receive;
      tempData.Ay := Integer_16(temp)*256 + Integer_16(Receive);

      -- Acceleration Z
      temp := Receive;
      tempData.Az := Integer_16(temp)*256 + Integer_16(Receive);

      -- Temperature
      temp := Receive;
      tempData.Tp := Integer_16(temp)*256 + Integer_16(Receive);

      -- Gyroscope X
      temp := Receive;
      tempData.Gx := Integer_16(temp)*256 + Integer_16(Receive);

      -- Gyroscope Y
      temp := Receive;
      tempData.Gy := Integer_16(temp)*256 + Integer_16(Receive);

      -- Gyroscope Z
      temp := Receive;
      tempData.Gz := Integer_16(temp)*256 + Integer_16(Receive);

      return tempData;
   end MPU6050_GetMotion6;

end I2c_mpu6050;
