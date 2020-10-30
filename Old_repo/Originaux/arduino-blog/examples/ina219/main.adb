with INA219;
with AVR.UART;
with AVR.Real_Time.Delays;
with Two_Wire;
with Interfaces;
use Interfaces;

procedure Main is
begin
   AVR.UART.Init (103);
   delay 0.1;
   AVR.UART.Put ("INA219 example"); AVR.UART.CRLF;

   INA219.Init;
   AVR.UART.Put ("INA219.Init done"); AVR.UART.CRLF;
   if INA219.Get_Error then
      AVR.UART.Put ("Got error during init"); AVR.UART.CRLF;
      AVR.UART.Put (Unsigned_8 (Two_Wire.TWI_Error_Enum'Pos
        (Two_Wire.Get_Error)));
      AVR.UART.CRLF;
   else
      delay 0.2;
      AVR.UART.Put ("Init ok"); AVR.UART.CRLF;

      loop
         AVR.UART.Put ("   ***"); AVR.UART.CRLF;
         AVR.UART.Put (INA219.Get_Bus_Voltage); AVR.UART.CRLF;
         AVR.UART.Put (INA219.Get_Shunt_Voltage); AVR.UART.CRLF;
         AVR.UART.Put (INA219.Get_Current); AVR.UART.CRLF;
         AVR.UART.Put (INA219.Get_Power); AVR.UART.CRLF;
         delay 1.0;
      end loop;
   end if;

   loop
      delay 10.0;
   end loop;
end Main;
