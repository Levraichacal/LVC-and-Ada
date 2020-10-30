with LVC.PWM.TIMER3;
use LVC.PWM.TIMER3;

package body Timer3pwm is

   procedure Run is
   begin
      LVC.PWM.TIMER3.Init_Port_PWM(2);
      LVC.PWM.TIMER3.Init_Port_PWM(3);
      LVC.PWM.TIMER3.Init_Port_PWM(5);
      loop
         LVC.PWM.TIMER3.Write_PWM(2,1250);
         LVC.PWM.TIMER3.Write_PWM(3,1750);
         LVC.PWM.TIMER3.Write_PWM(5,1700);
      end loop;
   end Run;
end Timer3pwm;
