with LVC.TIMER0;
use LVC.TIMER0;
with AVR.Interrupts;
with Interfaces;
use Interfaces;
with AVR;
use AVR;
with AVR.MCU;
with AVR.UART;
with AVR.Real_Time.Delays;

procedure Main is
   Temp1,Temp2 : Unsigned_32 := 0;
begin
   Init;
   AVR.UART.Init(103);
   AVR.UART.Put("Initialisation");
   AVR.UART.CRLF;
   loop
      Temp1 := micros;
      Temp2 := micros;
      AVR.UART.Put(Unsigned_16(Temp1));
      AVR.UART.CRLF;
      AVR.UART.Put(Unsigned_16(Temp2));
      AVR.UART.CRLF;
      AVR.UART.Put(Unsigned_16(Temp2-Temp1));
      AVR.UART.CRLF;
      delay 0.5;
   end loop;
end Main;
