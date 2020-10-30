with LVC.TIMER0;
with Interfaces;
with AVR.Real_Time.Delays;

use LVC.TIMER0;
use Interfaces;

package body Timer0cyclique is


   procedure Run is
   begin
      LVC.TIMER0.Init_Timer0;
   end Run;
end Timer0cyclique;
