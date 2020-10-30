with LVC.TIMER0;
use LVC.TIMER0;
with AVR.Interrupts;
with Interfaces;
use Interfaces;
with AVR;
use AVR;
with AVR.MCU;
with LVC.BUTTON;
use LVC.BUTTON;

procedure Main is

begin
   Init;
   Init_Button_Interrupt ;
end Main;
