with HC_SR04;
use HC_SR04;
with AVR.UART;
with AVR.Real_Time.Delays;
with Interfaces;
use Interfaces;

procedure Main is
   Time, Distance : Unsigned_16;
begin
   AVR.UART.Init (103); -- 9600 @16MHz
   AVR.UART.Put ("Initialisation du HC SR04 : ");
   AVR.UART.CRLF;
      delay 5.0;
   Init_HC_SR04;
   loop
      delay 1.0;
      Time := GetTime;
      Distance := Time/58;
      AVR.UART.Put(Time);
      AVR.UART.Put("    ");
      AVR.UART.Put(Distance);
      AVR.UART.CRLF;
   end loop;
end Main;
