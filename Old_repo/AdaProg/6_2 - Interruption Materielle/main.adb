with AVR.UART;

with Button;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz

   Button.Run;
end Main;
