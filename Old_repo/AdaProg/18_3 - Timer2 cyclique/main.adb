with AVR.UART;


with LVC.TIMER2;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz
   LVC.TIMER2.Run;

   
end Main;
