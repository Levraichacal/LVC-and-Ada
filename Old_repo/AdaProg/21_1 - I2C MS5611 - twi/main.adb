with I2c_ms5611;
with AVR.UART;
use I2c_ms5611;
with AVR.Real_Time.Delays;
with Interfaces;
use Interfaces;
--with Ada.Unchecked_Conversion;

procedure Main is
   connect : Boolean;
   TempRaw, PresRaw, Pres : Unsigned_32;
   Temp : Integer_32;
begin
   AVR.UART.Init (103); -- 9600 @16MHz
   AVR.UART.Put ("Initialisation du ms5611");
   AVR.UART.CRLF;
   connect := I2c_ms5611.MS5611_Initialise;
   if(connect) then
      AVR.UART.Put ("Initialisation OK");
   else
      AVR.UART.Put ("Initialisation Pb");
   end if;
   AVR.UART.CRLF;
   loop
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
      delay 0.2;
   end loop;
end Main;
