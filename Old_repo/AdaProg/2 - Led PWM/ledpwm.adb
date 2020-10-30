---------------------------------------------------------------------------
-- The AVR-Ada Library is free software;  you can redistribute it and/or --
-- modify it under terms of the  GNU General Public License as published --
-- by  the  Free Software  Foundation;  either  version 2, or  (at  your --
-- option) any later version.  The AVR-Ada Library is distributed in the --
-- hope that it will be useful, but  WITHOUT ANY WARRANTY;  without even --
-- the  implied warranty of MERCHANTABILITY or FITNESS FOR A  PARTICULAR --
-- PURPOSE. See the GNU General Public License for more details.         --
--                                                                       --
-- As a special exception, if other files instantiate generics from this --
-- unit,  or  you  link  this  unit  with  other  files  to  produce  an --
-- executable   this  unit  does  not  by  itself  cause  the  resulting --
-- executable to  be  covered by the  GNU General  Public License.  This --
-- exception does  not  however  invalidate  any  other reasons why  the --
-- executable file might be covered by the GNU Public License.           --
---------------------------------------------------------------------------


with AVR;
with AVR.MCU;
with AVR.Timer1;

use AVR;

void pwmWrite(uint8_t pin, uint8_t val)
{
	pinMode(pin, OUTPUT);
	
	uint32_t tmp = val;
	
	if (val == 0)
		digitalWrite(pin, LOW);
	else if (val == 255)
		digitalWrite(pin, HIGH);
	else
	{
		TimerData td = timer_to_pwm_data[digitalPinToTimer(pin)];
		if(td.ChannelRegLoc) //null checking
		{
			if(td.Is16Bit)
			{
				sbi(_SFR_MEM8(td.PinConnectRegLoc), td.PinConnectBits);
				_SFR_MEM16(td.ChannelRegLoc) = (tmp * _SFR_MEM16(td.TimerTopRegLoc)) / 255;
			}
			else
			{
				sbi(_SFR_MEM8(td.PinConnectRegLoc), td.PinConnectBits);
				_SFR_MEM8(td.ChannelRegLoc) = (tmp * _SFR_MEM8(td.TimerTopRegLoc)) / 255;
			}
		}		
	}
}
procedure Ledpwm is
   use AVR.MCU;

   IN_1 : Boolean renames MCU.PORTB_Bits (0);
   IN_2 : Boolean renames MCU.PORTB_Bits (3);
   EA_1 : Boolean renames MCU.PORTB_Bits (1);

begin
   MCU.DDRB_Bits (0) := DD_Output;
   MCU.DDRB_Bits (1) := DD_Output;
   MCU.DDRB_Bits (3) := DD_Output;
   MCU.OCR1A := 16#0002#;

   IN_1 := False;
   IN_2 := True;

   MCU.PRR_Bits (MCU.PRTIM1_Bit) := Low;
   TCCR1A_Bits := (COM1A1_Bit => True,
                   COM1A0_Bit => False,
                   WGM10_Bit  => True,
                   WGM11_Bit  => False,
                   others => False);
   TCCR1B_Bits := (WGM12_Bit => True,
                   WGM13_Bit => False,
                   CS10_Bit => True,
                   CS11_Bit => False,
                   CS12_Bit => False,
                   others => False);

   MCU.OCR1A := 16#D2#;
   loop
      null;
   end loop;
end Ledpwm;
