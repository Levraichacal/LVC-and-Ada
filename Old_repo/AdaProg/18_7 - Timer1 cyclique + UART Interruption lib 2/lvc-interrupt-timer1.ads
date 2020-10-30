with Interfaces;
use Interfaces;
with AVR;
use AVR;
with AVR.MCU;
use AVR.MCU;
with LVC.PINS;
use LVC.PINS;
with LVC.INTERRUPT;
use LVC.INTERRUPT;

package LVC.INTERRUPT.TIMER1 is
   -- Initialisation de l'interruption sur l'overflow du timer 1
   procedure Init_TIMER1_OVF_Interrupt;
   procedure TIMER1_OVF_Interrupt(proc : T_Ptr_Proc);
   procedure TIMER1_OVF_Interrupt(proc : T_Ptr_ProcedureUnsigned; n : Unsigned_8);
   procedure TIMER1_OVF_Interrupt(proc : T_Ptr_Procedure; niveauLed : in out LVC.PINS.lvcLevel;
   portLed : in LVC.PINS.lvcPins);

   pragma Machine_Attribute (Entity         => TIMER1_OVF_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, TIMER1_OVF_Interrupt, MCU.Sig_TIMER1_OVF_String);

end LVC.INTERRUPT.TIMER1;
