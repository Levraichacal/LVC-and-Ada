with AVR;
use AVR;
with AVR.MCU;
use AVR.MCU;

package body LVC.INTERRUPT.USART is
   procedure Init_USART_TX_Interrupt is
   begin
      -- Interruption sur l'émission
      MCU.UCSR0B_Bits (MCU.TXCIE0_Bit) := True;
   end Init_USART_TX_Interrupt;

   procedure USART_TXC_Interrupt(proc : T_Ptr_Proc) is
   begin
      proc.all;
   end USART_TXC_Interrupt;

end LVC.INTERRUPT.USART;
