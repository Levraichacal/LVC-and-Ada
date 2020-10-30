with AVR;            use AVR;
--with Avr.Mcu;        use Avr.Mcu;
with AVR.Real_Time.Delays;
with Interfaces;
use Interfaces;
with LCD;

procedure Lcd_Test is

begin

   LCD.Init;
      LCD.Clear_Screen;
      LCD.Put ("Hello, AVR-Ada!");
      --LCD.Put(Integer_8(-128));
      --LCD.Put(" ");
      --LCD.Put(Integer_16(-32768));
      --LCD.Put(" ");
      -- LCD.Put(Integer_32(2147483647));
      LCD.GotoXY(1,2);
      LCD.Put(Integer_32(-2147483648));

   loop
      null;
   end loop;
end Lcd_Test;
