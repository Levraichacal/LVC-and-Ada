with DHT11; use DHT11;
with AVR.UART;
with AVR.Real_Time.Delays;
with LVC.PINS; use LVC.PINS;

with Interfaces; use Interfaces;

procedure Main is
   Data : DHT11.T_DHT11_Data;
begin
   AVR.UART.Init(103);
   AVR.UART.Put("Initialisation du DHT11");
   DHT11.Init(D5);
      AVR.UART.CRLF;
   AVR.UART.Put("Coin");
      AVR.UART.CRLF;
   loop
      Data := DHT11.GetData;
      AVR.UART.CRLF;
      case Data.Status is
         when DHT11_Success =>
            AVR.UART.Put("Temperature : ");
            AVR.UART.Put(Data.Temperature,10);
            AVR.UART.Put("C  Humidity : ");
            AVR.UART.Put(Data.Humidity,10);
            AVR.UART.Put("%  CRC : ");
            AVR.Uart.Put(Data.CRC,10);
         when DHT11_TimeOut_Error =>
            AVR.UART.Put("Time OUt error");
         when DHT11_CheckSum_Error =>
            AVR.UART.Put("Temperature : ");
            AVR.UART.Put(Data.Temperature,10);
            AVR.UART.Put("C  Humidity : ");
            AVR.UART.Put(Data.Humidity,10);
            AVR.UART.Put("%  CRC : ");
            AVR.Uart.Put(Data.CRC,10);
      end case;
      delay 1.0;
   end loop;
end Main;
