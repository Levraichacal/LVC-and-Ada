with AVR.UART;

with MS5611;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz

   MS5611.Init;
   loop
      null;
   end loop;


end Main;
