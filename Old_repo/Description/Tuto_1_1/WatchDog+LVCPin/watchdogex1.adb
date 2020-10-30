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
--                         PACKAGE WatchDogEx1                              --
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

use AVR;
use AVR.MCU;
use LVC.PINS;

package body WatchDogEx1 is

------------------------------------------------------------------------------
--  DECLARATIONS DES VARIABLES                                              --
------------------------------------------------------------------------------
   -- Variable globale niveauLed stockant le dernier état envoyé à la LED D13
   niveauLed : lvcLevel := High_lvl;

------------------------------------------------------------------------------
--  DECLARATIONS DES PROCEDURES ET FONCTIONS                                --
------------------------------------------------------------------------------

   -- Initialisation du WatchDog
   procedure init_Watchdog is
   begin
      AVR.Interrupts.Disable;
      -- Watchdog reset
      Wdr;
      -- Start timed sequence
      MCU.WDTCSR := +(MCU.WDCE_Bit => True,
                      MCU.WDE_Bit => True,
                      others => False);
      -- Set the prescaler 4.0 s and the WatchDog Timer Configuration:
      -- just in Interrupt Mode
      MCU.WDTCSR :=  +(MCU.WDIE_Bit => True,
                       MCU.WDE_Bit => False,
                       MCU.WDP3_Bit => True,
                       others => False);

      AVR.Interrupts.Enable;
   end init_Watchdog;

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
      init_Watchdog;
      pinMode(D13,Output);
      digitalWrite(D13,niveauLed);
      loop
         null;
      end loop;
   end Run;

end WatchDogEx1;
