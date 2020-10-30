with Interfaces;
use Interfaces;
with LVC.PINS;
use LVC.PINS;

package LVC.INTERRUPT is

   type T_Ptr_Proc is access procedure;

   type T_Ptr_Procedure is access procedure(niveauLed : in out LVC.PINS.lvcLevel;
      portLed : in LVC.PINS.lvcPins);
   type T_Ptr_ProcedureUnsigned is access procedure(n :Unsigned_8);

end LVC.INTERRUPT;
