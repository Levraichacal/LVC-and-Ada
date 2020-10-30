with SoftwareSerial;
use SoftwareSerial;
with LVC.PINS;
use LVC.PINS;
with AVR.Real_Time.Delays;
with AVR.UART;
procedure Main is

begin
   Init_SoftSerial(D9,D10);
   delay 1.0;
   Begin_SoftSerial(115200);
   AVR.UART.Init(8);
   delay 1.0;
   loop
      null;
   end loop;
end Main;
