with DHT11; use DHT11;
with AVR.Real_Time.Delays;
with LVC.PINS; use LVC.PINS;
with I2c_ecran1602;
use I2c_ecran1602;
with Interfaces; use Interfaces;

procedure Main is
   Data : DHT11.T_DHT11_Data;
begin
   I2c_ecran1602.LCD_Init(16#27#,16,2);
   I2c_ecran1602.LCD_Backlight;
   I2c_ecran1602.LCD_SetCursor(0,0);
   I2c_ecran1602.LCD_Print("Initialisation");
   DHT11.Init(D5);
   I2c_ecran1602.LCD_SetCursor(1,0);
   I2c_ecran1602.LCD_Print("Finie");
   loop
      Data := DHT11.GetData;
      LCD_Clear;
      LCD_SetCursor(0,0);
      case Data.Status is
         when DHT11_Success =>
            LCD_Print("OK Temperature : ");
            LCD_Print(Data.Temperature);
            LCD_Print("C");
            LCD_SetCursor(1,0);
            LCD_Print("Humidity : ");
            LCD_Print(Data.Humidity);
            LCD_Print("%  CRC : ");
            LCD_Print(Data.CRC);
         when DHT11_TimeOut_Error =>
            LCD_Print("Time OUt error");
         when DHT11_CheckSum_Error =>
            LCD_Print("Er Temperature : ");
            LCD_Print(Data.Temperature);
            LCD_Print("C");
            LCD_SetCursor(1,0);
            LCD_Print("Humidity : ");
            LCD_Print(Data.Humidity);
            LCD_Print("%  CRC : ");
            LCD_Print(Data.CRC);
      end case;
      delay 1.0;
   end loop;
end Main;
