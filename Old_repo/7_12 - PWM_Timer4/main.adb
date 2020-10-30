with AVR.UART;

with Timer4pwm;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz

   Timer4pwm.Run;
end Main;
