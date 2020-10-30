with Interfaces;
use Interfaces;
with AVR;
use AVR;
with AVR.MCU;
use AVR.MCU;
with LVC.PINS;
use LVC.PINS;

package body LVC.INTERRUPT.TIMER1 is

   procedure Init_TIMER1_OVF_Interrupt is
   begin
      MCU.TIMSK1_Bits := (MCU.TOIE1_Bit => True,
                          others => False);
   end Init_TIMER1_OVF_Interrupt;

   procedure TIMER1_OVF_Interrupt(proc : T_Ptr_Procedure;niveauLed : in out LVC.PINS.lvcLevel;
      portLed : in LVC.PINS.lvcPins) is
   begin
      proc.all(niveauLed,portLed);
   end TIMER1_OVF_Interrupt;

   procedure TIMER1_OVF_Interrupt(proc : T_Ptr_ProcedureUnsigned;n : Unsigned_8) is
   begin
      proc.all(n);
   end TIMER1_OVF_Interrupt;

   procedure TIMER1_OVF_Interrupt(proc : T_Ptr_Proc) is
   begin
      proc.all;
   end TIMER1_OVF_Interrupt;
   
end LVC.INTERRUPT.TIMER1;
