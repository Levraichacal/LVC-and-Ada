------------------------------------------------------------------------------
--                                                                          --
--                            L V C COMPONENTS                              --
--                                                                          --
--                             L V C . P I N S                              --
--                                                                          --
--                                 S p e c                                  --
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

package LVC.PINS is
------------------------------------------------------------------------------
--  DECLARATIONS DES NOUVEAUX TYPES ET SOUS TYPES                           --
------------------------------------------------------------------------------
   -- Le type lvcPins contient les dénominations "arduino"
   type lvcPins is (D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,A0,A1,A2,A3,A4,A5);

   -- Le sous-type lvcMode (du type Boolean) permet de déclarer un port en
   -- entrée ou en sortie
   subtype lvcMode is Boolean;
   Input : lvcMode renames False;
   Output : lvcMode renames True;


   -- Le sous-type lvcLevel (du type Boolean) permet de déclarer le niveau à
   -- écrire sur un port
   subtype lvcLevel is Boolean;
   Low_lvl : lvcLevel renames False;
   High_lvl : lvcLevel renames True;


------------------------------------------------------------------------------
--  DECLARATIONS DES PROCEDURES ET FONCTIONS                                --
------------------------------------------------------------------------------

   -- La procedure pinMode permet de déclarer un port en entrée ou en sortie
   procedure pinMode (port: lvcPins; mode : lvcMode);

   -- La procédure digitalWrite permet d'écrire un valeur sur un port
   procedure digitalWrite (port: lvcPins; level : lvcLevel);

end LVC.PINS;
