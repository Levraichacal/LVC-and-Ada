with Interfaces;
use Interfaces;
with AVR;
use AVR;
with AVRIEEEFloat64;
use AVRIEEEFloat64;
with I2c_ecran1602;
use I2c_ecran1602;
with AVRIEEEFloat64LCD;
use AVRIEEEFloat64LCD;
with AVR.Real_Time.Delays;
with AVR.UART;
With AVRIEEEFloat64UART;
use AVRIEEEFloat64UART;

procedure Main is
   a,b,c,d : IEEE_Float64;
   e,m : Unsigned_8;
   f : Unsigned_16;
   g : Unsigned_32;
   h : Integer_8;
   j : Integer_16;
   k : Integer_32;
begin
   e := 100;
   m := 3;
   a := To_IEEE_Float_64(e/m);
   b := To_IEEE_Float_64(e);
   c := To_IEEE_Float_64(m);
   d := b/c;
   LCD_Init(16#27#,16,2);
   LCD_Backlight;
   LCD_SetCursor(0,0);
   LCD_Print(a);
   LCD_SetCursor(1,0);
   LCD_Print(b);
   delay 5.0;
   LCD_Clear;
   LCD_Home;
   --I2c_ecran1602.LCD_SetCursor(1,0);
   LCD_Print(c);
   LCD_SetCursor(1,0);
   LCD_Print(d);
   loop
      null;
   end loop;
end Main;
