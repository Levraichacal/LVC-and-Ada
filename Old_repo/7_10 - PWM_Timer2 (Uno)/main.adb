with AVR.UART;

with Timer2pwm;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz

   Timer2pwm.Run;
end Main;
