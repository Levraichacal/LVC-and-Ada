with AVR.UART;

with Timer5pwm;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz

   Timer5pwm.Run;
end Main;
