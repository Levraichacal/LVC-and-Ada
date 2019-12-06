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
with AVR.Real_Time.Delays;
with GPIO;
with Interfaces;

use AVR;
use GPIO;
use Interfaces;

procedure ServoPWM is
   Sens : Boolean;
   Valeur_PWM : Unsigned_16 :=1000;
begin
   PinMode(D3,PWMOutput);
   PinMode(D11,PWMOutput);
   loop
      if(Valeur_PWM = 2100)then
         Sens := False;
      elsif(Valeur_PWM = 800) then
         Sens := True;
      end if;
      if (Sens) then
         Valeur_PWM := Valeur_PWM + 50;
      else
         Valeur_PWM := Valeur_PWM - 50;
      end if;
      PWMWrite(D3, Valeur_PWM);
      PWMWrite(D11, Valeur_PWM);
      delay 0.5;
   end loop;
end ServoPWM;
