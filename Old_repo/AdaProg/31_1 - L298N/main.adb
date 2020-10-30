with L298N;
use L298N;
with AVR.UART;
with AVR.Real_Time.Delays;
with Interfaces;
use Interfaces;

procedure Main is
begin
   AVR.UART.Init (103); -- 9600 @16MHz
   AVR.UART.Put ("Initialisation du L298N : ");
   AVR.UART.CRLF;
   Init_L298N;
   loop
      delay 0.5;
      Stop;
      delay 0.5;
      Avance;
      delay 1.0;
      Stop;
      delay 0.5;
      Recule;
      delay 1.0;
      Stop;
      delay 0.5;
      Droite;
      delay 0.5;
      Stop;
      delay 0.5;
      Gauche;
   end loop;
end Main;
