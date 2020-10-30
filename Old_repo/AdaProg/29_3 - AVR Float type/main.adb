with Interfaces;
use Interfaces;
with AVR;
use AVR;
with AVRIEEEFloat;
use AVRIEEEFloat;
with AVRIEEEFloatUART;
use AVRIEEEFloatUART;
with AVR.UART;

procedure Main is
   a,b,c,d : AVRIEEEFloat.IEEE_Float_32;
   e,m : Unsigned_8;
   f : Unsigned_16;
   g : Unsigned_32;
   h : Integer_8;
   j : Integer_16;
   k : Integer_32;
begin
   e := 100;
   m := 3;
   a := To_IEEE_Float_32(e/m);
   b := To_IEEE_Float_32(e);
   c := To_IEEE_Float_32(m);
   d := b/c;
   AVR.UART.Init(103);
   Put(a);
   AVR.UART.CRLF;
   Put(b);
   AVR.UART.CRLF;
   Put(c);
   AVR.UART.CRLF;
   Put(d);
   AVR.UART.CRLF;
   loop
      null;
   end loop;
end Main;
