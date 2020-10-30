with LVC.TIMER1;
with Interfaces;
with AVR.Real_Time.Delays;

use LVC.TIMER0;
use Interfaces;

package body Timer1cyclique is


   procedure Run is
   begin
      LVC.TIMER1.Init_Timer1;
   end Run;
end Timer1cyclique;
