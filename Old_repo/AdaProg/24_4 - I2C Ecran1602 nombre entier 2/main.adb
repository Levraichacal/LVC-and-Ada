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
   I2c_ecran1602.LCD_Print(Integer_32(-2147483648));
   I2c_ecran1602.LCD_SetCursor(1,0);
   I2c_ecran1602.LCD_Print(Integer_32(2147483647));
   --LCD_Blink;
   --delay 5.0;
   --LCD_Display(False);
   --delay 5.0;
   ---LCD_Display;
   --delay 5.0;
   --LCD_Blink(False);
   --delay 5.0;
   --LCD_LeftToRight;
   --I2c_ecran1602.LCD_SetCursor(0,0);
   --I2c_ecran1602.LCD_Print("Code en Ada");
   --delay 5.0;
   --LCD_RightToLeft;
   --I2c_ecran1602.LCD_SetCursor(1,15);
   --I2c_ecran1602.LCD_Print("Code en Ada");
   --delay 5.0;
   --LCD_ScrollDisplayLeft;
   --delay 5.0;
   --LCD_ScrollDisplayRight;
   delay 5.0;
   --LCD_LeftToRight;
   --I2c_ecran1602.LCD_SetCursor(0,0);
   --I2c_ecran1602.LCD_Print("Je veux savoir si l'autoscroll fonctionne");
   -- LCD_Autoscroll;
   --LCD_Autoscroll(False);
   --delay 5.0;
   --LCD_Display;
   LCD_Clear;
   delay 5.0;
   I2c_ecran1602.LCD_SetCursor(1,0);
   I2c_ecran1602.LCD_Print("Code en Ada");
   I2c_ecran1602.LCD_Home;
   I2c_ecran1602.LCD_Print("Code en Ada");
   loop
      null;
   end loop;
end Main;
