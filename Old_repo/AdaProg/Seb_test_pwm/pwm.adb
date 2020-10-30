with AVR;
with AVR.MCU;
with AVR.Timer1;
with Interfaces;
with AVR.Real_Time.Delays;

use AVR;
use AVR.MCU;
use Interfaces;

procedure Pwm is
   
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
--   LED_PIN : constant := 3;
--begin
 --  MCU.DDRB_Bits (LED_PIN) := DD_Output;
   --MCU.OCR2A := 16#0002#;
 --  MCU.PRR_Bits (MCU.PRTIM2_Bit) := Low;
  -- TCCR2A_Bits := (COM2A1_Bit => True,
    --               COM2B1_Bit => True,
      --             WGM20_Bit  => True,
        --           WGM21_Bit  => True,
          --         others => False);
--    TCCR2B_Bits := (CS20_Bit => true);
   --TCCR1B_Bits := (WGM12_Bit => True,
--                   WGM13_Bit => False,
  --                 CS10_Bit => True,
    --               CS11_Bit => False,
      --             CS12_Bit => False,
        --           others => False);
  -- MCU.OCR2A := 16#0002#;
--   loop
  --    MCU.OCR2A := 16#D2#;
--   end loop;
   use AVR.MCU;

--   IN_1 : Boolean renames MCU.PORTB_Bits (0);
--   IN_2 : Boolean renames MCU.PORTB_Bits (3);
--   EA_1 : Boolean renames MCU.PORTB_Bits (1);
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
