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

with AVR.Real_Time.Delays;

with lib47segments;
use lib47segments;

procedure Segments47 is
   Chip_47Segments : T_47Segments;
begin
   Init(Chip_47Segments);
   loop
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, 1,'0');
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, 2, '1');
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, 3, '2');
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, 4, '3');
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, 1, '4');
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, 1, '5');
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, 1, '6');
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, 1, '7');
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, 1, '8');
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, 1, '9');
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, 1, '.');
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "....");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "0000");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "1111");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "2222");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "3333");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "4444");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "5555");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "6666");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "7777");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "8888");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "9999");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "1234");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "5678");
      delay 2.0;
      PrintNumber47Segments(Chip_47Segments, "90. ");
   end loop;
end Segments47;

