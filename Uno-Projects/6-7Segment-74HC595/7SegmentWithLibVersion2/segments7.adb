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
   Chip_7Segments : T_7Segments;
begin
   Init(Chip_7Segments, False);
   loop
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments(Chip_7Segments, '0');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments(Chip_7Segments, '1');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments(Chip_7Segments, '2');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments(Chip_7Segments, '3');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments(Chip_7Segments, '4');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments(Chip_7Segments, '5');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments(Chip_7Segments, '6');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments(Chip_7Segments, '7');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments(Chip_7Segments, '8');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments(Chip_7Segments, '9');
      DigitalWrite(D13, True);
      delay 2.0;
      DigitalWrite(D13, False);
      PrintNumber7Segments(Chip_7Segments, '.');
      DigitalWrite(D13, True);
   end loop;
end Segments7;

