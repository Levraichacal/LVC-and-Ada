with AVR.UART;

with Timer1pwm;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz

   Timer1pwm.Run;
end Main;
