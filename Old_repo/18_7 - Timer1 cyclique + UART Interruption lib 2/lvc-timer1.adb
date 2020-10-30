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
------------------------------------------------------------------------------
with AVR.MCU;
use AVR;

package body LVC.TIMER1 is

-- Déclaration des fonctions d'initialisation
-- Timer 1 en OVF
   procedure Init_Timer1_OVF is
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
   end Init_Timer1_OVF;

end LVC.TIMER1;
