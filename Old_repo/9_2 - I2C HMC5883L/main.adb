with AVR.UART;

with I2C;

procedure Main is

begin
   AVR.UART.Init (103); -- 9600 @16MHz

   I2C.Run;
end Main;
