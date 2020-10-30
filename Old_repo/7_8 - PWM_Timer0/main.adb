with AVR.UART;

with Timer0pwm;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz

   Timer0pwm.Run;
end Main;
