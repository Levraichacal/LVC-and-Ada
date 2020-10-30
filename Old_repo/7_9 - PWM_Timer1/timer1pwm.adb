with LVC.PWM.TIMER1;

use LVC.PWM.TIMER1;

package body Timer1pwm is


   procedure Run is
   begin
      LVC.PWM.TIMER1.Init_Port_PWM1(11);
      LVC.PWM.TIMER1.Init_Port_PWM1(12);
      LVC.PWM.TIMER1.Init_Port_PWM1(13);
      loop
         LVC.PWM.TIMER1.Write_PWM1(11,1000);
         LVC.PWM.TIMER1.Write_PWM1(12,1500);
         LVC.PWM.TIMER1.Write_PWM1(13,2000);
      end loop;
   end Run;
end Timer1pwm;
