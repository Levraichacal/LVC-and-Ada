------------------------------------------------------------------------------
--                                                                          --
--    Copyright (C) 2015 Bardot Sébastien                                   --
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
------------------------------------------------------------------------------

------------------------------------------------------------------------------
--                                                                          --
--           Programme eteignant la LED 13 de la carte arduino              --
--                                                                          --
------------------------------------------------------------------------------

------------------------------------------------------------------------------
--  IMPORTATIONS ET UTILISATIONS DES PACKAGES UTILES                        --
------------------------------------------------------------------------------
with AVR;
with AVR.MCU;

use AVR;

------------------------------------------------------------------------------
--  DECLARATION DE LA PROCEDURE LEDeteinte utilisée comme MAIN              --
------------------------------------------------------------------------------
procedure LEDeteinte is
begin
   -- Déclaration du port PB5 comme étant une sortie
   MCU.DDRB_Bits (5) := True;
   -- On attribue au port PB5 la valeur haute pour éteindre la LED
   MCU.PORTB_Bits (5) := False;
end LEDeteinte;
