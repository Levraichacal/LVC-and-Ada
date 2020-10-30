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
--                       PACKAGE LVC.TIMER1.UART                            --
--                                 BODY                                     --
--                                                                          --
------------------------------------------------------------------------------

------------------------------------------------------------------------------
--  IMPORTATIONS ET UTILISATIONS DES PACKAGES UTILES                        --
------------------------------------------------------------------------------
with AVR;
with AVR.MCU;
with Interfaces;
with AVR.Interrupts;
with LVC.PINS;
with Ada.Unchecked_Conversion;

use AVR;
use AVR.MCU;
use LVC.PINS;
use Interfaces;

package body LVC.TIMER1UART is
------------------------------------------------------------------------------
--  DECLARATIONS DES VARIABLES                                              --
------------------------------------------------------------------------------
   -- Variable globale niveauLed stockant le dernier état envoyé à la LED D13
   niveauLed : LVC.PINS.lvcLevel := High_lvl;


------------------------------------------------------------------------------
--  DECLARATIONS DES PROCEDURES ET FONCTIONS                                --
------------------------------------------------------------------------------
   -- Fonction permettant de transformer un caractère en Unsigned_8, pour
   -- pouvoir envoyé du text (le buffer ne prend que des Unsigned_8.
   function To_Uint8 is new Ada.Unchecked_Conversion (Target => Unsigned_8,
                                                      Source => Character);


   -- Initialisation du Timer1
   procedure Init_Timer1 is
   begin
   -- Activation du timer
      MCU.PRR_Bits (MCU.PRTIM1_Bit) := False;
   -- Mettre le timer à sa valeur initiale
      MCU.TCNT1 := 16#00#;
   -- Départ du timer avec un prescaler de 1024
      MCU.TCCR1C_Bits := (others => False);
      MCU.TCCR1B_Bits := (MCU.CS22_Bit  => True,
                          MCU.CS20_Bit  => True,
                          others => False);
      MCU.TCCR1A_Bits := (others => False);
   end Init_Timer1;

   -- Initialisation du port UART
   procedure Init_UART is
   begin
      -- Fixons le nombre de Baud par seconde, il faut utiliser la formule :
      -- UBRR = Fosc/16/baud-1
      -- Fosc : fréquence de l'oscilateur = 16MHz
      -- Nombre de baud désiré : 57600
      -- =>  UBRR0 := 16
      MCU.UBRR0 := Unsigned_16(16);
      -- Pas de double vitesse
      MCU.UCSR0A := 0;
      -- Choix du format d'envoie 8N1
      MCU.UCSR0C := +(MCU.UCSZ00_Bit => True,
                      MCU.UCSZ01_Bit => True,
                      others => False);
      -- Activation de la transmission
      MCU.UCSR0B := +(MCU.TXEN0_Bit => True,
                      others => False);
   end Init_UART;

   -- Déclaration de la procédure write qui écrit un Unsigned_8 sur le buffer
   procedure Write (d : Unsigned_8) is
   begin
      MCU.UDR0 := d;
   end Write;

   -- Déclaration de la procédure WriteChar qui envoie un caractère
   procedure WriteChar (char : Character) is
   begin
      Write(To_Uint8(char));
   end WriteChar;


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
      niveauLed := not niveauLed;
      LVC.PINS.digitalWrite(D13,niveauLed);
      WriteChar('1'); -- envoit le caractère 1
   end Timer1_Interrupt;


------------------------------------------------------------------------------
--  LA PROCEDURE RUN                                                        --
------------------------------------------------------------------------------
   procedure Run is
   begin
      Init_Timer1;
      Init_UART;
      LVC.PINS.pinMode(D13,Output);
      LVC.PINS.digitalWrite(D13,niveauLed);
      -- Activation des interruptions dues à l'overflow du timer1
      MCU.TIMSK1_Bits := (MCU.TOIE1_Bit => True,
                          others => False);
      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;

end LVC.TIMER1UART;
