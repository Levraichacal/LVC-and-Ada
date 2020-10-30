with LVC.PWM.TIMER1;
with Interfaces;
with AVR.Real_Time.Delays;

use LVC.PWM.TIMER1;
use Interfaces;

package body Timer1pwm is


   procedure Run is
      j,k : Interfaces.Unsigned_16;
   begin
      LVC.PWM.TIMER1.Init_Port_PWM(D9);
      LVC.PWM.TIMER1.Init_Port_PWM(D10);
      loop
         j := 0;
         k := 2000;
         for i in 1..2000 loop
            j := j + 1;
            k := k - 1;
            LVC.PWM.TIMER1.Write_PWM(D9,j);
            LVC.PWM.TIMER1.Write_PWM(D10,k);
            delay 0.001;
         end loop;
         for i in 1..2000 loop
            j := j - 1;
            k := k + 1;
            LVC.PWM.TIMER1.Write_PWM(D9,j);
            LVC.PWM.TIMER1.Write_PWM(D10,k);
            delay 0.001;
         end loop;
      end loop;
   end Run;
end Timer1pwm;
