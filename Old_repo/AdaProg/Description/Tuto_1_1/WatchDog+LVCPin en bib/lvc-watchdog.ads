------------------------------------------------------------------------------
--                                                                          --
--                            L V C COMPONENTS                              --
--                                                                          --
--                         L V C . W A T CH D O G                           --
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
with Interfaces;
use Interfaces;

package LVC.WATCHDOG is

------------------------------------------------------------------------------
--  DECLARATIONS DES NOUVEAUX TYPES ET SOUS TYPES                           --
------------------------------------------------------------------------------

   -- Type correspondant à la configuration du mode du watchdog
   type ModeWatchDog is (Stopped,Interrupt,InterReset,Reset);

   -- Type correspondant à la durée (en nombre de cycle) du WatchDog choisie
   type DureeWatchDog is (K2,K4,K8,K16,K32,K64,K128,K256,K512,K1024);


------------------------------------------------------------------------------
--  DECLARATIONS DES PROCEDURES ET FONCTIONS                                --
------------------------------------------------------------------------------

   -- Fonction retournant le mask correspondant au mode du WatchDog
   function SetMode (mode : ModeWatchDog) return Unsigned_8;

   -- Fonction retournant le mask correspondant à la durée avant le
   -- déclenchement du WatchDog
   function SetDuree (duree : DureeWatchDog) return Unsigned_8;


   -- Procedure d'initialisation du Watchdog
   procedure Init_WatchDog(mode : ModeWatchDog; duree : DureeWatchDog);

   -- Declaration de la procedure Wdr (WatchDog Reset)
   procedure Wdr;

private
   pragma Import (Intrinsic, Wdr, "__builtin_avr_wdr");
end LVC.WATCHDOG;
