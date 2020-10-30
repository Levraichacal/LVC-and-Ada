------------------------------------------------------------------------------
--                                                                          --
--                            L V C COMPONENTS                              --
--                                                                          --
--                         L V C . W A T CH D O G                           --
--                                                                          --
--                                 B o d y                                  --
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
with AVR;
with AVR.MCU;
with Interfaces;
with AVR.Interrupts;

use Interfaces;
use AVR;

package body LVC.WATCHDOG is

------------------------------------------------------------------------------
--  DECLARATIONS DES PROCEDURES ET FONCTIONS                                --
------------------------------------------------------------------------------

   -- Fonction retournant le mask correspondant au mode du WatchDog
   function SetMode (mode : ModeWatchDog) return Unsigned_8 is
      modeMask : Unsigned_8 := 0;
   begin
      case mode is
         when Interrupt => modeMask := MCU.WDIE_Mask;
         when Reset => modeMask := MCU.WDE_Mask;
         when InterReset => modeMask := MCU.WDE_Mask + MCU.WDIE_Mask;
         when others => modeMask := 0;
      end case;
      return modeMask;
   end SetMode;

   -- Fonction retournant le mask correspondant à la durée avant le
   -- déclenchement du WatchDog
   function SetDuree (duree : DureeWatchDog) return Unsigned_8 is
      dureeMask : Unsigned_8 := 0;
   begin
      case duree is
         when K2 => dureeMask := 0;
         when K4 => dureeMask := MCU.WDP0_Mask;
         when K8 => dureeMask := MCU.WDP1_Mask;
         when K16 => dureeMask := MCU.WDP0_Mask + MCU.WDP1_Mask;
         when K32 => dureeMask := MCU.WDP2_Mask;
         when K64 => dureeMask := MCU.WDP0_Mask + MCU.WDP2_Mask;
         when K128 => dureeMask := MCU.WDP1_Mask + MCU.WDP2_Mask;
         when K256 => dureeMask := MCU.WDP0_Mask + MCU.WDP1_Mask + MCU.WDP2_Mask;
         when K512 => dureeMask := MCU.WDP3_Mask;
         when K1024 => dureeMask := MCU.WDP0_Mask + MCU.WDP3_Mask;
         when others => dureeMask := 0;
      end case;
      return dureeMask;
   end SetDuree;

   -- Procedure d'initialisation du Watchdog
   procedure Init_WatchDog(mode : ModeWatchDog; duree : DureeWatchDog) is
      tempMask : Unsigned_8;
   begin
      tempMask := SetDuree(duree) + SetMode(mode);
      -- Desactivation des interruptions pour paramétrer le watchdog
      AVR.Interrupts.Disable;
      -- WatchDog reset
      Wdr;
      -- Pour pouvoir changer le parametrage du watchdog, on doit activer
      -- les bits WDCE et WDE à la même opération et parametrer le timer
      -- en une opération dans les 4 cycles d'horloge suivant l'activation
      -- des bits WDCE et WDE.
      -- Pour plus d'info, voir datasheet paragraphe 11.8 Watchdog Timer
      -- Activation des bits WDCE et WDE
      MCU.WDTCSR := +(MCU.WDCE_Bit => True,
                      MCU.WDE_Bit => True,
                      others => False);
      -- Activation des paramétres
      MCU.WDTCSR :=  tempMask;
      -- Activation des interruptions
      AVR.Interrupts.Enable;
   end Init_WatchDog;

end LVC.WATCHDOG;
