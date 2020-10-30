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

use AVR;
use AVR.MCU;
use LVC.PINS;

package body LVC.TIMER2 is

   niveauLed : LVC.PINS.lvcLevel := High_lvl;

   -- Timer 1

   procedure Init_Timer2 is
   begin
   -- Activation du timer
      MCU.PRR_Bits (MCU.PRTIM2_Bit) := False;
   -- Mettre le timer à sa valeur initiale
      MCU.TCNT2 := 16#00#;
   -- Start the timer0 with /1024 prescaler
      MCU.TCCR2B_Bits := (MCU.CS22_Bit  => True,
                          MCU.CS20_Bit  => True,
                          others => False);
      MCU.TCCR2A_Bits := (others => False);                    
   end Init_Timer2;

   procedure Timer2_Interrupt;
   pragma Machine_Attribute (Entity         => Timer2_Interrupt,
                             Attribute_Name => "signal");
   pragma Export (C, Timer2_Interrupt, MCU.Sig_TIMER2_OVF_String);

   procedure Timer2_Interrupt is
   begin
      AVR.Interrupts.Disable;
      niveauLed := not niveauLed;
      LVC.PINS.digitalWrite(D13,niveauLed);
      AVR.Interrupts.Enable;
   end Timer2_Interrupt;

   procedure Run is
   begin
      Init_Timer2;
      LVC.PINS.pinMode(D13,Output);
      LVC.PINS.digitalWrite(D13,niveauLed);
      MCU.TIMSK2_Bits := (MCU.TOIE2_Bit => True,
                          others => false);
      AVR.Interrupts.Enable;
      loop
         null;
      end loop;
   end Run;

end LVC.TIMER2;
