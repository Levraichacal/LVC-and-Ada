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
--                                 BODY                                     --
--                                                                          --
------------------------------------------------------------------------------

------------------------------------------------------------------------------
--  IMPORTATIONS ET UTILISATIONS DES PACKAGES UTILES                        --
------------------------------------------------------------------------------
with AVR;
with AVR.MCU;
with AVR.Interrupts;

use AVR;
use AVR.MCU;

------------------------------------------------------------------------------
--  DECLARATIONS DU CORPS DU PACKAGE                                        --
------------------------------------------------------------------------------

package body WatchDogEx0 is

------------------------------------------------------------------------------
--  DECLARATIONS DES VARIABLES                                              --
------------------------------------------------------------------------------

   -- Variable globale booleenne stockant l'état de la LED (la dernière
   -- valeur écrite sur la LED pour être précis).
   niveauLed : Boolean := True;


------------------------------------------------------------------------------
--  DECLARATIONS DES PROCEDURES ET FONCTIONS                                --
------------------------------------------------------------------------------

   -- Procedure d'initialisation du WatchDog
   procedure init_Watchdog is
   begin
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
      -- Activation du prescaler pour avoir un Watchdog toutes les 4.0 s
      -- Configuration du Timer pour activer les interruptions du WatchDog
      -- sans le reset ie effectue ce qu'il y a dans la partie interruption
      MCU.WDTCSR :=  +(MCU.WDIE_Bit => True,
                       MCU.WDE_Bit => False,
                       MCU.WDP3_Bit => True,
                       others => False);
      -- Activation des interruptions
      AVR.Interrupts.Enable;
   end init_Watchdog;


------------------------------------------------------------------------------
--  DECLARATIONS DES PROCEDURES D'INTERRUPTIONS                             --
------------------------------------------------------------------------------

   -- Procedure d'interruption du Watchdog
   procedure WatchDog_Interrupt;

   pragma Machine_Attribute (Entity         => WatchDog_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, WatchDog_Interrupt, MCU.Sig_WDT_String);

   procedure WatchDog_Interrupt is
   begin
      -- Desactivation des interruptions pour paramétrer le watchdog
      AVR.Interrupts.Disable;
      -- Changement de la variable globale niveauLed
      niveauLed := not niveauLed;
      -- Ecriture sur le port PB5 (D13) de la valeur niveauLed
      MCU.PORTB_Bits (5) := niveauLed;
      -- Activation des interruptions
      AVR.Interrupts.Enable;
   end WatchDog_Interrupt;


------------------------------------------------------------------------------
--  LA PROCEDURE RUN                                                        --
------------------------------------------------------------------------------

   procedure Run is
   begin
      -- Appel de la procédure d'initialisation du WatchDog
      init_Watchdog;
      -- Déclaration du port PB5 comme étant une sortie
      MCU.DDRB_Bits (5) := True;
      -- On attribue au port PB5 la valeur niveauLed pour commander la LED
      MCU.PORTB_Bits (5) := niveauLed;
      -- Bouclage infini vide, le processeur fait que boucler mais reste
      -- actif ce qui permet aux interruptions de toujours fonctionner
      loop
         null;
      end loop;
   end Run;

end WatchDogEx0;
