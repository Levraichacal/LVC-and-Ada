------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                           L V C . T I M E R 1                            --
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
--                                                                          --
--    This package needs the LVC one and teh LVC.PWM one to be called, make --
--    sure they are in the project folder.                                  --
--    This package and its children are based on AVR-Ada Library.           --
--                                                                          --
--                                                                          --
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


-- Déclaration des variables
   -- Etat de la LED
   niveauLed : LVC.PINS.lvcLevel := High_lvl;

   function To_Uint8 is new Ada.Unchecked_Conversion (Target => Unsigned_8,
                                                      Source => Character);


-- Déclaration des fonctions d'initialisation
   -- Timer 1

   procedure Init_Timer1 is
   begin
   -- Activation du timer
      MCU.PRR_Bits (MCU.PRTIM1_Bit) := False;
   -- Mettre le timer à sa valeur initiale
      MCU.TCNT1 := 16#00#;
   -- Start the timer1 with /1024 prescaler
      MCU.TCCR1C_Bits := (others => False);
      MCU.TCCR1B_Bits := (MCU.CS22_Bit  => True,
                          MCU.CS20_Bit  => True,
                          others => False);
      MCU.TCCR1A_Bits := (others => False);
   end Init_Timer1;

   -- UART

   procedure Init_UART is
   begin
      -- Set Baud rate Fosc = 16MHz, baud 57600 => UBRR = Fosc/16/baud-1 = 16
      MCU.UBRR0 := Unsigned_16(16);
      MCU.UCSR0A := 0;
      --Set Format bit : 8N1
      MCU.UCSR0C := +(MCU.UCSZ00_Bit => True,
                      MCU.UCSZ01_Bit => True,
                      others => False);
      -- Enable Transmitter
      MCU.UCSR0B := +(MCU.TXEN0_Bit => True,
                      others => False);
   end Init_UART;

   procedure Write (d : Unsigned_8) is
   begin
      MCU.UDR0 := d;
   end Write;

-- Déclaration des intérruptions

   -- Timer 1
   procedure Timer1_Interrupt;
   pragma Machine_Attribute (Entity         => Timer1_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Timer1_Interrupt, MCU.Sig_TIMER1_OVF_String);

   procedure Timer1_Interrupt is
   begin
      niveauLed := not niveauLed;
      LVC.PINS.digitalWrite(D13,niveauLed);
      Write(1); --recoit en hexa
   end Timer1_Interrupt;


-- Déclaration de la procedure RUN.
   procedure Run is
   begin
      Init_Timer1;
      Init_UART;
      LVC.PINS.pinMode(D13,Output);
      LVC.PINS.digitalWrite(D13,niveauLed);
      MCU.TIMSK1_Bits := (MCU.TOIE1_Bit => True,
                          others => False);
      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;

end LVC.TIMER1UART;
