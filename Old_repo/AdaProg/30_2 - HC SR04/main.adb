with HC_SR04;
use HC_SR04;
with AVR.UART;
with AVR.Real_Time.Delays;

procedure Main is
begin
   AVR.UART.Init (103); -- 9600 @16MHz
   AVR.UART.Put ("Initialisation du HC SR04 : ");
   AVR.UART.CRLF;
      delay 5.0;
   Init_HC_SR04;
   loop
      delay 1.0;
	  GetDistance;
      AVR.UART.CRLF;
   end loop;
end Main;
