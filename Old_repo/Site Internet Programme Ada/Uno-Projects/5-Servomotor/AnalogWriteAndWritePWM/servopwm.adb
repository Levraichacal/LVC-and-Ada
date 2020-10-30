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
   Value : Unsigned_16 :=1000;
begin
   PinMode(D3,PWMOutput);
   PinMode(D6,PWMOutput);
   PinMode(D9,AnalogOutput);
   loop
      value := AnalogRead(A0);
      -- Write on the pwm port the value +1000 to be betwwen 1000 and 2023
      PWMWrite(D3, Value + 1000);
      -- Write on the pwm port 2023 - the value to be between 1000 and 2023
      PWMWrite(D6, 2023 - Value);
      -- Write on the analog port to fade the LED divide by 4 to be between 0 and 255
      AnalogWrite(D9, Value/4);
   end loop;
end ServoPWM;
