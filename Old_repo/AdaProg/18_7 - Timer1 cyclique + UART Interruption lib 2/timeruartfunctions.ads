with LVC.PINS;
use LVC.PINS;
package timerUARTFunctions is
-- Procedure effectuer durant les interruptions
   niveauLed : LVC.PINS.lvcLevel;
   portLed : LVC.PINS.lvcPins;
   procedure init_intr(nivLed : LVC.PINS.lvcLevel;pLed : LVC.PINS.lvcPins) ;
   -- Timer
   procedure Timer1_Interrupt;
   -- UART
   procedure USART_TXComplete;

end timerUARTFunctions;
