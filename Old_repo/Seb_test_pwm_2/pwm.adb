with AVR;
with AVR.MCU;
with AVR.Timer1;
with Interfaces;
with AVR.Real_Time.Delays;

use AVR;
use AVR.MCU;
use Interfaces;
use AVR.Timer1;

procedure Pwm is
   
   Sens : Boolean;
   pwmValue : Interfaces.Unsigned_16;--Integer;
begin
--   MCU.DDRB_Bits (0) := DD_Output;
   MCU.DDRB_Bits (1) := DD_Output;
--   MCU.DDRB_Bits (3) := DD_Output;
   MCU.OCR1A := 16#0002#;

--   IN_1 := False;
--   IN_2 := True;

   --MCU.PRR_Bits (MCU.PRTIM1_Bit) := Low;
   TCCR1A_Bits := (COM1A1_Bit => True,
                   COM1A0_Bit => False,
                   WGM10_Bit  => True,
                   WGM11_Bit  => False,
                   WGM12_Bit => True,
                   others => False);
   TCCR1B_Bits := (WGM12_Bit => True,
                   WGM13_Bit => False,
                   CS10_Bit => False,
                   CS11_Bit => False,
                   CS12_Bit => True,
                   others => False);
   pwmValue := 16#00#;
   MCU.OCR1A := pwmValue;
   
   loop
      if(pwmValue = 16#FF#)then
          Sens := False;
          --delay 5.0;
      else if(pwmValue = 16#00#) then
           Sens := True;
           --delay 5.0;
           end if;
      end if;
      if (Sens) then
         pwmValue := pwmValue + 16#01#;
      else 
         pwmValue := pwmValue - 16#01#;
      end if;
      MCU.OCR1A := pwmValue;
      delay 1.0;
   end loop;

end Pwm;
