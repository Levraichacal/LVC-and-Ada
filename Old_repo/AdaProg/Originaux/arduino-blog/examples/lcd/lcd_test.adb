with Avr;            use AVR;
with Avr.Mcu;        use Avr.Mcu;
with AVR.Real_Time.Delays;

with Lcd;

procedure Lcd_Test is

begin

   Lcd.Init;

   loop
      Lcd.Clear_Screen;
      Lcd.Put ("Hello, AVR-Ada!");

      delay 2.0;
   end loop;
end Lcd_Test;
