with AVR.UART;
with LVC.PINS;
with MS5611;
with AVR.Real_Time.Delays;
with LVC.I2C;

use LVC.I2C;
use MS5611;

procedure Main is
   erreur : Error_Status;
begin
   AVR.UART.Init (103); -- 9600 @16MHz

   MS5611.Init(LVC.PINS.A4, LVC.PINS.A5);
   delay 1.0;
--   AVR.UART.Put("C1 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C1),10);
--   AVR.UART.Put("C2 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C2),10);
--   AVR.UART.Put("C3 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C3),10);
--   AVR.UART.Put("C4 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C4),10);
--   AVR.UART.Put("C5 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C5),10);
--   AVR.UART.Put("C6 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C6),10);
--   AVR.UART.Put("C1 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C1));
--   AVR.UART.Put("C2 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C2));
--   AVR.UART.Put("C3 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C3));
--   AVR.UART.Put("C4 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C4));
--   AVR.UART.Put("C5 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C5));
--   AVR.UART.Put("C6 : ");
--   AVR.UART.Put(MS5611.getCoefficient(C6));
   --AVR.UART.Put(MS5611.Reset);getCoefficient
   delay 1.0;
   erreur := MS5611.Reset;
   case erreur is
      when No_Error => AVR.UART.Put("No Error");
      when Error_Start => AVR.UART.Put("Error Start");
      when No_Slave_Ack => AVR.UART.Put("No Slave Ack");
      when No_Data_Ack => AVR.UART.Put("No Data Ack");
   end case;
   delay 1.0;
   loop
      AVR.UART.Put("Temperature");
      --delay 1.0;
      AVR.UART.Put(MS5611.getTemperature,10);
      --AVR.UART.Put(MS5611.getCoefficient(C1));
      delay 1.0;
      --AVR.UART.Put("Pressure");
--      AVR.UART.Put(MS5611.getPressure);
  --    delay 1.0;
   end loop;

end Main;
