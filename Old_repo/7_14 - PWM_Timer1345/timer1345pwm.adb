with LVC.PWM.TIMER1345;
use LVC.PWM.TIMER1345;

package body Timer1345pwm is

   procedure Run is
   begin
      LVC.PWM.TIMER1345.Init_Port_PWM(2);
      LVC.PWM.TIMER1345.Init_Port_PWM(3);
      LVC.PWM.TIMER1345.Init_Port_PWM(5);
      LVC.PWM.TIMER1345.Init_Port_PWM(6);
      LVC.PWM.TIMER1345.Init_Port_PWM(7);
      LVC.PWM.TIMER1345.Init_Port_PWM(8);
      LVC.PWM.TIMER1345.Init_Port_PWM(11);
      LVC.PWM.TIMER1345.Init_Port_PWM(12);
      LVC.PWM.TIMER1345.Init_Port_PWM(13);
      LVC.PWM.TIMER1345.Init_Port_PWM(44);
      LVC.PWM.TIMER1345.Init_Port_PWM(45);
      LVC.PWM.TIMER1345.Init_Port_PWM(46);
      loop
         LVC.PWM.TIMER1345.Write_PWM(2,50);
         LVC.PWM.TIMER1345.Write_PWM(3,150);
         LVC.PWM.TIMER1345.Write_PWM(5,250);
         LVC.PWM.TIMER1345.Write_PWM(6,350);
         LVC.PWM.TIMER1345.Write_PWM(7,450);
         LVC.PWM.TIMER1345.Write_PWM(8,1550);
         LVC.PWM.TIMER1345.Write_PWM(11,1650);
         LVC.PWM.TIMER1345.Write_PWM(12,6750);
         LVC.PWM.TIMER1345.Write_PWM(13,1850);
         LVC.PWM.TIMER1345.Write_PWM(44,1950);
         LVC.PWM.TIMER1345.Write_PWM(45,2050);
         LVC.PWM.TIMER1345.Write_PWM(46,2150);
      end loop;
   end Run;
end Timer1345pwm;
