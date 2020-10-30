with AVR;
with AVR.MCU;
with LVC.PINS;
with LVC.USART;

use AVR;
use AVR.MCU;
use LVC.PINS;
use LVC.USART;

package body timerUARTFunctions is
  
   procedure init_intr(nivLed : LVC.PINS.lvcLevel;pLed : LVC.PINS.lvcPins) is
   begin
      niveauLed := nivLed;
      portLed := pLed;
      LVC.PINS.pinMode(portLed,Output);
      LVC.PINS.digitalWrite(portLed,nivLed);
   end init_intr;

   -- Timer
   procedure Timer1_Interrupt is
   begin
      niveauLed := not niveauLed;
      LVC.PINS.digitalWrite(portLed,niveauLed);
      --Write("Hello World!");
   end Timer1_Interrupt;

   -- UART
   procedure USART_TXComplete is
   begin
      if (finBuf = debutBuf) then
         interAct := False;
      else
         MCU.UDR0 := buffer(debutBuf);
         debutBuf := debutBuf + 1 mod 16;
      end if;
   end USART_TXComplete;

end timerUARTFunctions;
