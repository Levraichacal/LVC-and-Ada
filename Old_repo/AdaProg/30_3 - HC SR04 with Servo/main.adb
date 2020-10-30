with HC_SR04;
use HC_SR04;
with AVR.UART;
with AVR.Real_Time.Delays;
with Interfaces;
use Interfaces;

procedure Main is
   PWM : Unsigned_16 := 1500;
   sensPlus : Boolean := True;
begin
   AVR.UART.Init (103); -- 9600 @16MHz
   AVR.UART.Put ("Initialisation du HC SR04 : ");
   AVR.UART.CRLF;
   Init_HC_SR04;
   loop
      if(sensPlus) then
         PWM := PWM + 100;
         if(PWM>1900) then
            sensPlus := not sensPlus;
         end if;
      else
         PWM := PWM - 100;
         if(PWM<1100) then
            sensPlus := not sensPlus;
         end if;
      end if;
      delay 1.0;
      Set_Servo9(PWM);
      GetDistance;
      AVR.UART.CRLF;
   end loop;
end Main;
