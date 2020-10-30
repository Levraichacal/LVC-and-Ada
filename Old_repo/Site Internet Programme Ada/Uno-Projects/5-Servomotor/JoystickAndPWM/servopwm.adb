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

with GPIO;
with Interfaces;

use GPIO;
use Interfaces;

procedure ServoPWM is
   Value1, Value2 : Unsigned_16 :=1000;
begin
   PinMode(D5,PWMOutput);
   PinMode(D6,PWMOutput);
   loop
      Value1 := AnalogRead(A0);
      Value2 := AnalogRead(A1);
      -- Write on the pwm port the value +1000 to be betwwen 1000 and 2023
      PWMWrite(D5, Value1 + 1000);
      PWMWrite(D6, Value2 + 1000);
   end loop;
end ServoPWM;
