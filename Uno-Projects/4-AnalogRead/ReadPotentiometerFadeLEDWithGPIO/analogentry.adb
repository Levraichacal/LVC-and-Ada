------------------------------------------------------------------------------
--                                                                          --
--                                                                          --
--                         A n a l o g   E n t r y                          --
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
with AVR.Real_Time.Delays;
with GPIO;
with Interfaces;

use AVR;
use GPIO;
use Interfaces;

procedure AnalogEntry is
   temp : Unsigned_16 := 0;
begin
   -- D9 and D10 in AnalogOutput mode
   PinMode(D9, AnalogOutput);
   PinMode(D10, AnalogOutput);
   -- Change timer to be on 10 bit, so 0-1023 and no conversion for the
   -- analog enter
   MCU.TCCR1A_Bits(MCU.WGM11_Bit) := True;
   MCU.TCCR1A_Bits(MCU.WGM12_Bit) := True;
   -- Write value temp on D9 and D10
   AnalogWrite(D9, temp);
   AnalogWrite(D10, 1023 - temp);
   loop
      -- Read the value on Analog pin A0
      temp := AnalogRead(A0);
      -- Write the value on D9 and D10
      AnalogWrite(D9, temp);
      AnalogWrite(D10, 1023 - temp);
      delay 0.1;
   end loop;
end AnalogEntry;
