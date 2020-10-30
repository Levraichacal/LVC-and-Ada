with I2c_ecran1602;
use I2c_ecran1602;
with AVR.Real_Time.Delays;
with Interfaces;
use Interfaces;
--with Ada.Unchecked_Conversion;

procedure Main is
   Test : Float := -127.1;
   Test2 : IEEE_Float_32 := 121.31;
begin
   I2c_ecran1602.LCD_Init(16#27#,16,2);
   I2c_ecran1602.LCD_Backlight;
   I2c_ecran1602.LCD_SetCursor(0,0);
   -- I2c_ecran1602.LCD_Print("Coucou mon amour");
   I2c_ecran1602.LCD_Print(Unsigned_8(Test));
   I2c_ecran1602.LCD_SetCursor(1,0);
   -- I2c_ecran1602.LCD_Print("Je t'aime :) <3");
   --I2c_ecran1602.LCD_Print("Code en Ada");
   I2c_ecran1602.LCD_Print(Unsigned_8(Test2));
   loop
      null;
   end loop;
end Main;
