with AVR;
with AVR.MCU;
with AVR.Real_Time.Delays;

use AVR;

procedure Blink is
   Led_On : Boolean := False;

   -- Pins on Arduino
   -- Digital pin 2     PD2
   --         pin 3     PD3
   --         pin 4     PD4
   --         pin 5     PD5
   --         pin 6     PD6
   --         pin 7     PD7
   --         pin 8     PB0
   --         pin 9     PB1
   --         pin 10    PB2
   --         pin 11    PB3
   --         pin 12    PB4
   --         pin 13    PB5 ("Built in LED")
   LED_PIN : constant := 5;
begin
   MCU.DDRB_Bits (LED_PIN) := DD_Output;
   loop
      Led_On := not Led_On;
      MCU.PORTB_Bits (LED_PIN) := Led_On;
      delay 1.0;
   end loop;
end Blink;
