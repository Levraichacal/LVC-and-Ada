with AVR.UART;
with LVC.PINS; use LVC.PINS;
with MS5611;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz

   MS5611.Init(A4,A5);
   loop
      null;
   end loop;


end Main;
