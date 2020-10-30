with AVR.UART;

--with Timer0cyclique;
with LVC.TIMER0;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz
   LVC.TIMER0.Run;

   --Timer0cyclique.Run;
   
end Main;
