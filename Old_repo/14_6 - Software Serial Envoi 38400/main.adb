with SoftwareSerial;
use SoftwareSerial;
with LVC.PINS;
use LVC.PINS;
with AVR.Real_Time.Delays;
procedure Main is

begin
   Init_SoftSerial(D10);
   delay 1.0;
   Begin_SoftSerial(38400);
   init_Serial_Com;
   init_Interrupt_Com;
   delay 1.0;
   loop
      null;
   end loop;
end Main;