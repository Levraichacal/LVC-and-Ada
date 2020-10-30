with Interfaces;
use Interfaces;
with AVR;
use AVR;
with AVR.MCU;
use AVR.MCU;
with LVC.PINS;
use LVC.PINS;


package LVC.INTERRUPT is



   type T_Ptr_Procedure is access procedure(niveauLed : in out LVC.PINS.lvcLevel;
      portLed : in LVC.PINS.lvcPins);
--   type T_Ptr_ProcedureUnsigned is access procedure(n :Unsigned_8);

--   procedure TIMER1_OVF_Interrupt(proc : T_Ptr_ProcedureUnsigned; n : Unsigned_8);
   procedure WDT_Interrupt(proc : T_Ptr_Procedure; niveauLed : in out LVC.PINS.lvcLevel;
   portLed : in LVC.PINS.lvcPins);
--procedure TIMER1_OVF_Interrupt(proc : T_Ptr_ProcedureUnsigned);
   pragma Machine_Attribute (Entity         => WDT_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, WDT_Interrupt, MCU.Sig_WDT_String);

end LVC.INTERRUPT;
