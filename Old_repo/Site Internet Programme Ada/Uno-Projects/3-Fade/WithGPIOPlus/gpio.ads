------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                                G P I O                                   --
--                                                                          --
--                                S p e c                                   --
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

with Interfaces;
use Interfaces;

package GPIO is

   -- Enumeration of Arduino Pin
   type lvcPins is (D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,A0,A1,A2,A3,A4,A5);

   -- Enumeration of port mode
   type lvcMode is (Input,Output,AnalogOutput);

   -- Procedure to attribute a mode for a pin Input, Output or analog output
   procedure PinMode(nomPort : lvcPins; modePort : lvcMode);

   -- Procedure to write a level on a pin of Arduino (the port need to be initialise
   -- thanks to the PinMode procedure.
   procedure DigitalWrite(nomPort : lvcPins; niveauPort : Boolean);

   -- Procedure to write an analog level on a nomport. The level should be between
   -- 0 and 255 and it works for D3, D5, D6, D9, D10 and D11.
   -- For the others, when the value is under 128 it's off, and when the
   -- value is above or equal 128 it's on.
   procedure AnalogWrite(nomPort : lvcPins; value : Unsigned_16);

end GPIO;
