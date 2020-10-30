------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                           L V C . T I M E R 0                            --
--                                                                          --
--                                 S p e c                                  --
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
--    This package enable to configure the Timer 1 (16-bit one) to ensure   --
--    the pwm on port PB1 and PB2 on the ATmega328p ie port D9 and D10      --
--    of the Arduino Uno/Nano.                                              --
------------------------------------------------------------------------------
with Interfaces;


package LVC.TIMER0 is
------------------------------------------------------------------------------
--    This procedure initialize the timer 1 as cyclique timer               --
------------------------------------------------------------------------------
   procedure Init_Timer0;
   
   procedure Run;


end LVC.TIMER0;
