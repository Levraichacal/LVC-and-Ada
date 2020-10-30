-- Import et utilisation  des packages Ada nécessaires
with AVR;
with AVR.MCU;
with AVR.UART;
with Interfaces;
with AVR.Real_Time.Delays;
use AVR;
use Interfaces;



-- Déclaration du programme
procedure Blink is
   PORTD_act : Bits_In_Byte := (others => False);
   PORTD_old : Bits_In_Byte := ( 2 => True, others => False);
   Pin_Mask : Bits_In_Byte;
-- Début du programme
procedure affichage (byt : Bits_In_Byte) is
begin
   if(byt(7)) then
      AVR.UART.Put('1');
   else
      AVR.UART.Put('0');
   end if;
   if(byt(6)) then
      AVR.UART.Put('1');
   else
      AVR.UART.Put('0');
   end if;
   if(byt(5)) then
      AVR.UART.Put('1');
   else
      AVR.UART.Put('0');
   end if;
   if(byt(4)) then
      AVR.UART.Put('1');
   else
      AVR.UART.Put('0');
   end if;
   if(byt(3)) then
      AVR.UART.Put('1');
   else
      AVR.UART.Put('0');
   end if;
   if(byt(2)) then
      AVR.UART.Put('1');
   else
      AVR.UART.Put('0');
   end if;
   if(byt(1)) then
      AVR.UART.Put('1');
   else
      AVR.UART.Put('0');
   end if;
   if(byt(0)) then
      AVR.UART.Put('1');
   else
      AVR.UART.Put('0');
   end if;
end affichage;
begin
   AVR.UART.Init (8); -- 115200 @16MHz
   Pin_Mask := (PORTD_act xor PORTD_old);
   loop
      delay 1.0;
      Pin_Mask := (PORTD_act xor PORTD_old);
      affichage(Pin_Mask);
   end loop;
end Blink;

