with Interfaces;
use Interfaces;
with AVR;
use AVR;
with AVR.MCU;
use AVR.MCU;
with LVC.PINS;
use LVC.PINS;

package body LVC.INTERRUPT is


   procedure WDT_Interrupt(proc : T_Ptr_Procedure;niveauLed : in out LVC.PINS.lvcLevel;
      portLed : in LVC.PINS.lvcPins) is
   begin
      proc.all(niveauLed,portLed);
   end WDT_Interrupt;


end LVC.INTERRUPT;
