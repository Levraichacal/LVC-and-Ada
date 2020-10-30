with AVR.UART;

with Spi;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz

   Spi.Run;
end Main;
