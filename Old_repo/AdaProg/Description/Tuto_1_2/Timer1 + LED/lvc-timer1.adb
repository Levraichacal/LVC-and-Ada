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
--                         PACKAGE LVC.TIMER1                               --
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

package body LVC.TIMER1 is
------------------------------------------------------------------------------
--  DECLARATIONS DES VARIABLES                                              --
------------------------------------------------------------------------------
   -- Variable globale niveauLed stockant le dernier état envoyé à la LED D13
   niveauLed : LVC.PINS.lvcLevel := High_lvl;

------------------------------------------------------------------------------
--  DECLARATIONS DES PROCEDURES ET FONCTIONS                                --
------------------------------------------------------------------------------

   -- Initialisation du Timer1
   procedure Init_Timer1 is
   begin
   -- Activation du timer
      MCU.PRR_Bits (MCU.PRTIM1_Bit) := False;
   -- Mettre le timer à sa valeur initiale
      MCU.TCNT1 := 16#00#;
   -- Départ du timer avec un prescaler de 1024
      MCU.TCCR1C_Bits := (others => False);
      MCU.TCCR1B_Bits := (MCU.CS12_Bit  => True,
                          MCU.CS10_Bit  => True,
                          others => False);
      MCU.TCCR1A_Bits := (others => False);
   end Init_Timer1;

------------------------------------------------------------------------------
--  DECLARATIONS DES PROCEDURES D'INTERRUPTIONS                             --
------------------------------------------------------------------------------

   -- Traitement de l'interruption du Timer1
   procedure Timer1_Interrupt;
   pragma Machine_Attribute (Entity         => Timer1_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Timer1_Interrupt, MCU.Sig_TIMER1_OVF_String);

   procedure Timer1_Interrupt is
   begin
      AVR.Interrupts.Disable;
      -- Changement d'état de la LED
      niveauLed := not niveauLed;
      LVC.PINS.digitalWrite(D13,niveauLed);
      AVR.Interrupts.Enable;
   end Timer1_Interrupt;

------------------------------------------------------------------------------
--  LA PROCEDURE RUN                                                        --
------------------------------------------------------------------------------
   procedure Run is
   begin
      Init_Timer1;
      LVC.PINS.pinMode(D13,Output);
      LVC.PINS.digitalWrite(D13,niveauLed);
      -- Activation des interruptions dues à l'overflow du timer1
      MCU.TIMSK1_Bits := (MCU.TOIE1_Bit => True,
                          others => False);
      -- Activation des interruptions
      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;

end LVC.TIMER1;
