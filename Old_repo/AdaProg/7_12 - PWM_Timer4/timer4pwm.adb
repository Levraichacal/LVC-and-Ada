with LVC.PWM.TIMER4;
use LVC.PWM.TIMER4;

package body Timer4pwm is

   procedure Run is
   begin
      LVC.PWM.TIMER4.Init_Port_PWM(6);
      LVC.PWM.TIMER4.Init_Port_PWM(7);
      LVC.PWM.TIMER4.Init_Port_PWM(8);
      loop
         LVC.PWM.TIMER4.Write_PWM(6,1250);
         LVC.PWM.TIMER4.Write_PWM(7,1750);
         LVC.PWM.TIMER4.Write_PWM(8,1700);
      end loop;
   end Run;
end Timer4pwm;
