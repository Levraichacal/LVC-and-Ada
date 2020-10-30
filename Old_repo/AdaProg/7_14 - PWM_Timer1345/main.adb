with AVR.UART;

with Timer1345pwm;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz

   Timer1345pwm.Run;
end Main;
