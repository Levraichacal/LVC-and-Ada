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
--                         PACKAGE WatchDogEx0                              --
--                                 SPEC                                     --
--                                                                          --
------------------------------------------------------------------------------


------------------------------------------------------------------------------
--  DECLARATIONS DES SPECIFICATIONS DU PACKAGE                              --
------------------------------------------------------------------------------
package WatchDogEx0 is

------------------------------------------------------------------------------
--  DECLARATIONS DES SPECIFICATIONS DES PROCEDURES ET FONCTIONS             --
------------------------------------------------------------------------------

   -- Declaration de la procedure run
   procedure Run;

   -- Declaration de la procedure Wdr (WatchDog Reset)
   procedure Wdr;

private
   pragma Import (Intrinsic, Wdr, "__builtin_avr_wdr");
end WatchDogEx0;
