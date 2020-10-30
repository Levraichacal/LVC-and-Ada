with AVR;
with AVR.UART;
with AVR.MCU;
with AVR.Strings;
with AVR.Real_Time.Delays; -- for delay x.x
use type AVR.Strings.AVR_String;

use AVR;

procedure Hello is

   Hello : AVR.Strings.AVR_String := "Hello, AVR-Ada!";
   Counter : Integer := 0;
begin
   AVR.UART.Init (103); -- 9600 @16MHz

   loop
      AVR.UART.Put (Hello);
      AVR.UART.CRLF;
      delay 1.0;
      Counter := Counter + 1;
      if Counter = 10 then
         Counter := 0;
         AVR.UART.Put ("*******");
         AVR.UART.CRLF;
      end if;
   end loop;
end Hello;
