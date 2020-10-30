with IRreceiver;
use IRreceiver;
with AVR.UART;

with LVC.PINS;
use LVC.PINS;
with AVR.Real_Time.Delays;

procedure Main is
   temp : Boolean;
begin
   AVR.UART.Init (103); -- 9600 @16MHz
   AVR.UART.Put ("Initialisation : ");
   AVR.UART.CRLF;
   init_receiver(D11);
   loop
         temp := getDataReady;
         if(temp) then
            AVR.UART.Put (getValue);
            AVR.UART.CRLF;
         end if;
         delay 0.1;
   end loop;
end Main;
