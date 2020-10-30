with I2c_ecran1602;
use I2c_ecran1602;
with AVR.Real_Time.Delays;
with Interfaces;
use Interfaces;
--with Ada.Unchecked_Conversion;

procedure Main is
begin
   I2c_ecran1602.LCD_Init(16#27#,16,2);
   I2c_ecran1602.LCD_Backlight;
   I2c_ecran1602.LCD_SetCursor(0,0);
   -- I2c_ecran1602.LCD_Print("Coucou mon amour");
   I2c_ecran1602.LCD_Print("0123456789AB");
   I2c_ecran1602.LCD_SetCursor(1,0);
   -- I2c_ecran1602.LCD_Print("Je t'aime :) <3");
   --I2c_ecran1602.LCD_Print("Code en Ada");
   I2c_ecran1602.LCD_Print(Unsigned_16(12141),10);
   loop
      null;
   end loop;
end Main;
