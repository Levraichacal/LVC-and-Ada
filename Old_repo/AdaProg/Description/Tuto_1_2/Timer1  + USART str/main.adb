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
--   Ce programme permet d'envoyer une chaîne de caractères toutes les 4 s  --
--   Le principe de fonctionnement est le suivant :                         --
--     - Le timer déclenche une intérruption logicielle toutes les 4 s      --
--     - Dans l'intérruption, on envoie une chaîne de caractères.           --
--   et on boucle...                                                        --
--                                                                          --
------------------------------------------------------------------------------

------------------------------------------------------------------------------
--  INCLUSIONS DES PACKAGES                                                 --
------------------------------------------------------------------------------
with LVC.TIMER1UART;

------------------------------------------------------------------------------
--  DECLARATION DE LA PROCEDURE MAIN                                        --
------------------------------------------------------------------------------
procedure Main is

begin
-- Appel de la fonction Run du package LVC.TIMER1UART
   LVC.TIMER1UART.Run;
end Main;
