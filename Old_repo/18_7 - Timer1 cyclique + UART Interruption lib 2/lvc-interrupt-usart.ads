with AVR;
use AVR;
with AVR.MCU;
use AVR.MCU;
with LVC.INTERRUPT;
use LVC.INTERRUPT;

package LVC.INTERRUPT.USART is
   procedure Init_USART_TX_Interrupt;

   procedure USART_TXC_Interrupt(proc : T_Ptr_Proc);

   pragma Machine_Attribute (Entity         => USART_TXC_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, USART_TXC_Interrupt, MCU.Sig_USART_TX_String);
end LVC.INTERRUPT.USART;
