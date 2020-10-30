with L298N;
use L298N;
with AVR.UART;
with AVR.Real_Time.delays;
with Interfaces;
use Interfaces;

procedure Main is
begin
   AVR.UART.Init (103); --9600 @16MHz
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
      delay 0.5;
      Stop;
      delay 0.5;
      Avance(180);
      delay 1.0;
      Stop;
      delay 0.5;
      Recule(200);
      delay 1.0;
      Stop;
      delay 0.5;
      Droite(90);
      delay 0.5;
      Stop;
      delay 0.5;
      Gauche(90);
   end loop;
end Main;
