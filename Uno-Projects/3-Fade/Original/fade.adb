------------------------------------------------------------------------------
--                                                                          --
--                                                                          --
--                                F A D E                                   --
--                                                                          --
--                                M a i n                                   --
--                                                                          --
--    Copyright (C) 2017 Bardot Sébastien                                   --
--    More information on http://lvcetada.e-monsite.com/ or by mail on      --
--    lvcetada@gmail.com                                                    --
--                                                                          --
--    This program is free software: you can redistribute it and/or modify  --
--    it under the terms of the GNU General Public License as published by  --
--    the Free Software Foundation, either version 3 of the License, or     --
--    (at your option) any later version.                                   --
--                                                                          --
--    This program is distributed in the hope that it will be useful,       --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of        --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         --
--    GNU General Public License for more details.                          --
--                                                                          --
--    You should have received a copy of the GNU General Public License     --
--    along with this program.  If not, see <http://www.gnu.org/licenses/>. --
--                                                                          --
--                                                                          --
--    This package and its children are based on AVR-Ada Library.           --
--                                                                          --
--                                                                          --
------------------------------------------------------------------------------

with AVR;
with AVR.MCU;
with Interfaces;
with AVR.Real_Time.Delays;

use AVR;
use AVR.MCU;
use Interfaces;

procedure Fade is
   Sens : Boolean;
   pwmValue : Interfaces.Unsigned_16;
begin

   MCU.DDRB_Bits (1) := DD_Output;
   MCU.DDRB_Bits (2) := DD_Output;

   TCCR1A_Bits := (COM1A1_Bit => True,
                   COM1A0_Bit => False,
                   COM1B1_Bit => True,
                   COM1B0_Bit => False,
                   WGM10_Bit  => True,
                   WGM11_Bit  => False,
                   others => False);
   TCCR1B_Bits := (WGM12_Bit => True,
                   WGM13_Bit => False,
                   CS10_Bit => True,
                   CS11_Bit => False,
                   CS12_Bit => False,
                   others => False);
   pwmValue := 16#00#;
   MCU.OCR1A := pwmValue;
   MCU.OCR1B := pwmValue;

   loop
      if(pwmValue = 16#FF#)then
         Sens := False;
      elsif(pwmValue = 16#00#) then
         Sens := True;
         -- end if;
      end if;
      if (Sens) then
         pwmValue := pwmValue + 16#01#;
      else
         pwmValue := pwmValue - 16#01#;
      end if;
      MCU.OCR1A := pwmValue;
      MCU.OCR1B := pwmValue;
      delay 0.01;
   end loop;
end Fade;
