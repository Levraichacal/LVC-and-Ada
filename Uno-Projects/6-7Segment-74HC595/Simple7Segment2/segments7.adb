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

procedure Segments7 is
   procedure Write7Segments(A : Boolean;
                            B : Boolean;
                            C : Boolean;
                            D : Boolean;
                            E : Boolean;
                            F : Boolean;
                            G : Boolean;
                            P : Boolean) is
   begin
      DigitalWrite(D2,A);
      DigitalWrite(D3,B);
      DigitalWrite(D4,C);
      DigitalWrite(D5,D);
      DigitalWrite(D6,E);
      DigitalWrite(D7,F);
      DigitalWrite(D8,G);
      DigitalWrite(D9,P);
   end Write7Segments;

   procedure PrintNumber7Segments(Number : Character) is
   begin
      case Number is
         when '0' => -- Print 0
            Write7Segments(False, False, False, False, False, False, True, True);
         when '1' => -- Print 1
            Write7Segments(True, False, False, True, True, True, True, True);
         when '2' => -- Print 2
            Write7Segments(False, False, True, False, False, True, False, True);
         when '3' => -- Print 3
            Write7Segments(False, False, False, False, True, True, False, True);
         when '4' => -- Print 4
            Write7Segments(True, False, False, True, True, False, False, True);
         when '5' => -- Print 5
            Write7Segments(False, True, False, False, True, False, False, True);
         when '6' => -- Print 6
            Write7Segments(False, True, False, False, False, False, False, True);
         when '7' => -- Print 7
            Write7Segments(False, False, False, True, True, True, True, True);
         when '8' => -- Print 8
            Write7Segments(False, False, False, False, False, False, False, True);
         when '9' => -- Print 9
            Write7Segments(False, False, False, False, True, False, False, True);
         when '.' => -- Print Dot Point
            Write7Segments(True, True, True, True, True, True, True, False);
         when others => null;
      end case;
   end PrintNumber7Segments;

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

