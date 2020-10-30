with I2c_mpu6050;
with AVR.UART;
use I2c_mpu6050;
with AVR.Real_Time.Delays;
with Interfaces;
use Interfaces;
--with Ada.Unchecked_Conversion;

procedure Main is
   TempData : T_IMU_Data;
   connect : Boolean;
begin
   AVR.UART.Init (103); -- 9600 @16MHz
   AVR.UART.Put ("Initialisation du MPU6050");
   AVR.UART.CRLF;
   I2c_mpu6050.MPU6050_Initialize;
   connect := I2c_mpu6050.MPU6050_TestConnection;
   if(connect) then
      AVR.UART.Put ("Initialisation OK");
   else
      AVR.UART.Put ("Initialisation Pb");
   end if;
   AVR.UART.Put ("Initialisation Device : ");
   AVR.UART.Put (I2c_mpu6050.MPU6050_GetDeviceID);
   AVR.UART.CRLF;
   loop
      TempData := I2c_mpu6050.MPU6050_GetMotion6;
      AVR.UART.Put ("Ax : ");AVR.UART.Put (TempData.Ax);--/16384);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Ax-(TempData.Ax/16384)*16384));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Ay : ");AVR.UART.Put (TempData.Ay);--/16384);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Ay-(TempData.Ay/16384)*16384));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Az : ");AVR.UART.Put (TempData.Az);--/16384);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Az-(TempData.Az/16384)*16384));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Temp : ");AVR.UART.Put (TempData.Tp/340 + 3653/100);
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Gx : ");AVR.UART.Put (TempData.Gx);--/131);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Gx-(TempData.Gx/131)*131));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Gy : ");AVR.UART.Put (TempData.Gy);--/131);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Gy-(TempData.Gy/131)*131));
      AVR.UART.Put ("     ");
      AVR.UART.Put ("Gz : ");AVR.UART.Put (TempData.Gz);--/131);AVR.UART.Put (".");AVR.UART.Put (abs(TempData.Gz-(TempData.Gz/131)*131));
      -- AVR.UART.Put ("     ");
      -- AVR.UART.Put (Integer_16(59/10));
      AVR.UART.CRLF;
      delay 0.2;
   end loop;
end Main;
