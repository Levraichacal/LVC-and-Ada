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
--                         PACKAGE Interruption                             --
--                                 BODY                                     --
--                                                                          --
------------------------------------------------------------------------------

------------------------------------------------------------------------------
--  IMPORTATIONS ET UTILISATIONS DES PACKAGES UTILES                        --
------------------------------------------------------------------------------
with AVR;
with AVR.MCU;
with AVR.Interrupts;
with LVC.PINS;
with LVC.WATCHDOG;

use AVR;
use AVR.MCU;
use LVC.PINS;
use LVC.WATCHDOG;

package body Interruption is

------------------------------------------------------------------------------
--  DECLARATIONS DES VARIABLES GLOBALES                                     --
------------------------------------------------------------------------------
   -- Variable globale niveauLed stockant le dernier état envoyé à la LED D13
   niveauLed : lvcLevel := High_lvl;


------------------------------------------------------------------------------
--  DECLARATIONS DES PROCEDURES D'INTERRUPTIONS                             --
------------------------------------------------------------------------------

   -- Traitement de l'interruption du WatchDog
   procedure WatchDog_Interrupt;

   pragma Machine_Attribute (Entity         => WatchDog_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, WatchDog_Interrupt, MCU.Sig_WDT_String);

   procedure WatchDog_Interrupt is
   begin
      AVR.Interrupts.Disable;
      -- Changement d'état de la LED
      niveauLed := not niveauLed;
      digitalWrite(D13,niveauLed);
      AVR.Interrupts.Enable;
   end WatchDog_Interrupt;

------------------------------------------------------------------------------
--  LA PROCEDURE RUN                                                        --
------------------------------------------------------------------------------

   procedure Run is
   begin
      Init_WatchDog(Interrupt,K512);
      pinMode(D13,Output);
      digitalWrite(D13,niveauLed);
   end Run;

end Interruption;
