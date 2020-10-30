with AVR.UART;


with LVC.TIMER1;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz
   LVC.TIMER1.Run;

   
end Main;
