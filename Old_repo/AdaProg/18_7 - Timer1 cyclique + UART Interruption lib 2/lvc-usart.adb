with AVR;
with AVR.MCU;
with Interfaces;
with Ada.Unchecked_Conversion;

use AVR;
use AVR.MCU;
use Interfaces;

package body LVC.USART is

-- Fonctions utiles
   function To_Uint8 is new Ada.Unchecked_Conversion (Target => Unsigned_8, Source => Character);


   procedure Init_USART is
   begin
      -- Set Baud rate Fosc = 16MHz, baud 57600 => UBRR = Fosc/16/baud-1 = 16
      MCU.UBRR0 := Unsigned_16(16);
      MCU.UCSR0A := 0;
      --Set Format bit : 8N1
      MCU.UCSR0C := +(MCU.UCSZ00_Bit => True,
                      MCU.UCSZ01_Bit => True,
                      others => False);
      -- Enable Transmitter
      MCU.UCSR0B := +(MCU.TXEN0_Bit => True,
                      others => False);
   end Init_USART;

   procedure Write(str : String) is
   begin
      for i in str'Range loop
         buffer(finBuf) := To_Uint8(str(i));
         finBuf := finBuf + 1 mod 16;
      end loop;
      buffer(finBuf) := 16#0D#;
      finBuf := finBuf + 1 mod 16;
      buffer(finBuf) := 16#0A#;
      finBuf := finBuf + 1 mod 16;
      if (not interAct) then
         MCU.UDR0 := buffer(debutBuf);
         debutBuf := debutBuf + 1 mod 16;
      end if;
   end Write;

end LVC.USART;
