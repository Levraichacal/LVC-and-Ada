------------------------------------------------------------------------------
--                                                                          --
--                                                                          --
--                           S e g m e n t s 7                              --
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
with AVR.Real_Time.Delays;

use GPIO;

with lib7segments;
use lib7segments;

procedure Segments7 is
begin
   PinMode(D2,Output);
   PinMode(D3,Output);
   PinMode(D4,Output);
   PinMode(D5,Output);
   PinMode(D6,Output);
   PinMode(D7,Output);
   PinMode(D8,Output);
   PinMode(D9,Output);
   PinMode(D13,Output);
   Init7Segments(True);
   loop
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments('0');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments('1');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments('2');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments('3');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments('4');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments('5');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments('6');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments('7');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments('8');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments('9');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments('.');
      DigitalWrite(D13, True);
   end loop;
end Segments7;

