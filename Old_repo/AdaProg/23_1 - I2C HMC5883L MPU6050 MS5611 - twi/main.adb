with I2c_hmc5883l;
use I2c_hmc5883l;
with I2c_mpu6050;
use I2c_mpu6050;
with I2c_ms5611;
use I2c_ms5611;
with AVR.Real_Time.Delays;
with Interfaces;
use Interfaces;
with AVR.UART;
with Ada.Unchecked_Conversion;

procedure Main is
   TempData : T_IMU_Data;
   connect_hmc5883l : Boolean;
   connect_mpu6050 : Boolean;
   connect_ms5611 : Boolean;
   TempRaw, PresRaw, Pres : Unsigned_32;
   Temp : Integer_32;
   vectorTemp : Vector;
   vectorTempF : Vectorf;
   function U32_To_U16 is
      new Ada.Unchecked_Conversion (Source => Unsigned_32,
                                    Target => Unsigned_16);
begin
   AVR.UART.Init (103); -- 9600 @16MHz
   AVR.UART.Put ("Initialisation du MPU6050");
   AVR.UART.CRLF;
   I2c_mpu6050.MPU6050_Initialize;
   connect_mpu6050 := I2c_mpu6050.MPU6050_TestConnection;
   if(connect_mpu6050) then
      AVR.UART.Put ("Initialisation OK");
   else
      AVR.UART.Put ("Initialisation Pb");
   end if;
   AVR.UART.Put ("Initialisation Device : ");
   AVR.UART.Put (I2c_mpu6050.MPU6050_GetDeviceID);
   AVR.UART.CRLF;
   AVR.UART.Put ("Initialisation du HMC5883L");
   AVR.UART.CRLF;
   connect_hmc5883l := I2c_hmc5883l.beginHMC5883L;
   AVR.UART.Put ("Initialisation OK");
   AVR.UART.CRLF;
   AVR.UART.Put ("Initialisation du ms5611");
   AVR.UART.CRLF;
   connect_ms5611 := I2c_ms5611.MS5611_Initialise;
   if(connect_ms5611) then
      AVR.UART.Put ("Initialisation OK");
   else
      AVR.UART.Put ("Initialisation Pb");
   end if;
   AVR.UART.CRLF;
   loop
      TempData := I2c_mpu6050.MPU6050_GetMotion6;
      AVR.UART.Put ("Ax : ");AVR.UART.Put (TempData.Ax);
      --/16384);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Ax-(TempData.Ax/16384)*16384));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Ay : ");AVR.UART.Put (TempData.Ay);
      --/16384);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Ay-(TempData.Ay/16384)*16384));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Az : ");AVR.UART.Put (TempData.Az);
      --/16384);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Az-(TempData.Az/16384)*16384));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Temp : ");AVR.UART.Put (TempData.Tp/340 + 3653/100);
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Gx : ");AVR.UART.Put (TempData.Gx);
      --/131);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Gx-(TempData.Gx/131)*131));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Gy : ");AVR.UART.Put (TempData.Gy);
      --/131);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Gy-(TempData.Gy/131)*131));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Gz : ");AVR.UART.Put (TempData.Gz);
      --/131);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Gz-(TempData.Gz/131)*131));
      -- AVR.UART.Put ("     ");
      -- AVR.UART.Put (Integer_16(59/10));
      AVR.UART.CRLF;
      vectorTemp := I2c_hmc5883l.readRaw;
      AVR.UART.Put ("X : ");AVR.UART.Put (vectorTemp.X);
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Y : ");AVR.UART.Put (vectorTemp.Y);
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Z : ");AVR.UART.Put (vectorTemp.Z);
      AVR.UART.Put ("     ");
      vectorTempF := I2c_hmc5883l.readNormalize;
      AVR.UART.Put ("Xf : ");AVR.UART.Put (U32_To_U16(vectorTempF.X/1000));
      AVR.UART.Put (".");AVR.UART.Put (U32_To_U16(vectorTempF.X - (vectorTempF.X/1000)*1000));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Yf : ");AVR.UART.Put (U32_To_U16(vectorTempF.Y/1000));
      AVR.UART.Put (".");AVR.UART.Put (U32_To_U16(vectorTempF.Y - (vectorTempF.Y/1000)*1000));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Zf : ");AVR.UART.Put (U32_To_U16(vectorTempF.Z/1000));
      AVR.UART.Put (".");AVR.UART.Put (U32_To_U16(vectorTempF.Z - (vectorTempF.Z/1000)*1000));
      AVR.UART.CRLF;
      Pres := I2c_ms5611.MS5611_ReadPressure;
      TempRaw := I2c_ms5611.MS5611_ReadRawTemperature;
      PresRaw := I2c_ms5611.MS5611_ReadRawPressure;
      Temp := I2c_ms5611.MS5611_ReadTemperature;
      AVR.UART.Put ("Temp Raw : ");AVR.UART.Put (TempRaw,10);
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Pres Raw : ");AVR.UART.Put (PresRaw,10);
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Temp : ");AVR.UART.Put (Unsigned_16(Temp));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Pres : ");AVR.UART.Put (Unsigned_16(Pres));
      AVR.UART.CRLF;
      delay 0.5;
   end loop;
end Main;
