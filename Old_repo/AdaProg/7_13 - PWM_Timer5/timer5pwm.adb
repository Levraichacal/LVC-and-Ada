with LVC.PWM.TIMER5;
use LVC.PWM.TIMER5;

package body Timer5pwm is

   procedure Run is
   begin
      LVC.PWM.TIMER5.Init_Port_PWM(44);
      LVC.PWM.TIMER5.Init_Port_PWM(45);
      LVC.PWM.TIMER5.Init_Port_PWM(46);
      loop
         LVC.PWM.TIMER5.Write_PWM(44,1250);
         LVC.PWM.TIMER5.Write_PWM(45,1750);
         LVC.PWM.TIMER5.Write_PWM(46,1700);
      end loop;
   end Run;
end Timer5pwm;
