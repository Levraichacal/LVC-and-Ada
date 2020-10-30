with Interfaces;
use Interfaces;
with AVR;
use AVR;
with AVR.MCU;
use AVR.MCU;
with LVC.PINS;
use LVC.PINS;

package body LVC.INTERRUPT is

--type T_Ptr_Procedure is access procedure(niveauLed : in out LVC.PINS.lvcLevel;
--   portLed : in LVC.PINS.lvcPins);
--type T_Ptr_ProcedureUnsigned is access procedure(n :Unsigned_8);

   procedure TIMER1_OVF_Interrupt(proc : T_Ptr_Procedure;niveauLed : in out LVC.PINS.lvcLevel;
      portLed : in LVC.PINS.lvcPins) is
   begin
      proc.all(niveauLed,portLed);
   end TIMER1_OVF_Interrupt;

   procedure TIMER1_OVF_Interrupt(proc : T_Ptr_ProcedureUnsigned;n : Unsigned_8) is
   begin
      proc.all(n);
   end TIMER1_OVF_Interrupt;


end LVC.INTERRUPT;
