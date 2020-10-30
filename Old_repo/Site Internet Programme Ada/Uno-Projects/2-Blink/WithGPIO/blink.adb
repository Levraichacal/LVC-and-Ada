------------------------------------------------------------------------------
--                                                                          --
--                                                                          --
--                               B L I N K                                  --
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
use GPIO;

with AVR.Real_Time.Delays;

procedure Blink is
   Led_On : Boolean := False;
   LED_PIN : constant lvcPins := D13;
begin
   PinMode(LED_PIN,Output);
   loop
      Led_On := not Led_On;
      DigitalWrite (LED_PIN, Led_On);
      delay 1.0;
   end loop;
end Blink;
