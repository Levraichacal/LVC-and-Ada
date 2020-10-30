with AVR;
with AVR.Interrupts;
with LVC.PINS;
with LVC.USART;
with LVC.TIMER1;
with LVC.INTERRUPT;
with LVC.INTERRUPT.TIMER1;
with LVC.INTERRUPT.USART;

use AVR;
use LVC.PINS;
use LVC.TIMER1;
use LVC.USART;
use LVC.INTERRUPT;
use LVC.INTERRUPT.TIMER1;
use LVC.INTERRUPT.USART;


with timerUARTFunctions;
use timerUARTFunctions;

procedure Main is

-- Instantiation des variables
   -- Les pointeurs vers les procedures
   f : T_Ptr_Proc;
   g : T_Ptr_Proc;
   -- Etat de la LED
   --niveauLed : LVC.PINS.lvcLevel := High_lvl;
   --portLed : LVC.PINS.lvcPins := D13;

begin
-- Phase d'initialisation
   Init_Timer1_OVF;
   Init_USART;
   init_intr(True,D13) ;
   Init_TIMER1_OVF_Interrupt;
   Init_USART_TX_Interrupt;
   f := Timer1_Interrupt'Access;
   TIMER1_OVF_Interrupt(f);
   g := USART_TXComplete'Access;
   USART_TXC_Interrupt(g);
   AVR.Interrupts.Enable;

-- Boocle infinie
   loop
      null;
   end loop;
end Main;
