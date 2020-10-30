------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                           L V C . T I M E R 0                            --
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

use AVR;
use AVR.MCU;
use LVC.PINS;

package body LVC.TIMER0 is

   niveauLed : LVC.PINS.lvcLevel := High_lvl;

   -- Timer 1

   procedure Init_Timer0 is
   begin
   -- Activation du timer
      MCU.PRR_Bits (MCU.PRTIM0_Bit) := False;
   -- Mettre le timer à sa valeur initiale
      MCU.TCNT0 := 16#00#;
   -- Start the timer0 with /1024 prescaler
      MCU.TCCR0B_Bits := (MCU.CS02_Bit  => True,
                          MCU.CS00_Bit  => True,
                          others => False);
      MCU.TCCR0A_Bits := (others => False);                    
   end Init_Timer0;

   procedure Timer0_Interrupt;
   pragma Machine_Attribute (Entity         => Timer0_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Timer0_Interrupt, MCU.Sig_TIMER0_OVF_String);

   procedure Timer0_Interrupt is
   begin
      AVR.Interrupts.Disable;
      niveauLed := not niveauLed;
      LVC.PINS.digitalWrite(D13,niveauLed);
      AVR.Interrupts.Enable;
   end Timer0_Interrupt;

   procedure Run is
   begin
      Init_Timer0;
      LVC.PINS.pinMode(D13,Output);
      LVC.PINS.digitalWrite(D13,niveauLed);
      MCU.TIMSK0_Bits := (MCU.TOIE0_Bit => True,
                          others => false);
      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;

end LVC.TIMER0;
