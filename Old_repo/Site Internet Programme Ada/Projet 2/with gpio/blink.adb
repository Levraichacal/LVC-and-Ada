with GPIO;
use GPIO;

with AVR.Real_Time.Delays;

procedure Blink is
   Led_On : Boolean := False;
   LED_PIN : constant lvcPins := D13;
begin
   pinMode(LED_PIN,Output);
   loop
      Led_On := not Led_On;
      digitalWrite (LED_PIN, Led_On);
      delay 1.0;
   end loop;
end Blink;
