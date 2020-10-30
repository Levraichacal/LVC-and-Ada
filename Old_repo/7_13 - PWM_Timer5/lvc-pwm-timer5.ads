------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                       L V C . P W M . T I M E R 5                        --
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
--    This package needs the LVC one and the LVC.PWM one to be called, make --
--    sure they are in the project folder.                                  --
--    This package and its children are based on AVR-Ada Library.           --
--                                                                          --
--                                                                          --
------------------------------------------------------------------------------
--    This package enable to configure the Timer 5 (16-bit one) to ensure   --
--    the pwm on port PL3, PL4, PL5 on the ATmega2560 ie port D44, D45 and  --
--    D46 of the Arduino Mega 2560.                                          --
------------------------------------------------------------------------------
with Interfaces;


package LVC.PWM.TIMER5 is

------------------------------------------------------------------------------
--    This procedure initialize the "numeroPort" as output pwm and the      --
--    timer if it's needed. Its works at 50 Hz as usual servomotor          --
------------------------------------------------------------------------------
   procedure Init_Port_PWM(numeroPort : Interfaces.Unsigned_8);

------------------------------------------------------------------------------
--    This procedure write the value of pwm "valeur_PWM" on the port        --
--    "numeroPort". Its needed that the port was initialize with the        --
--    "Init_Port_PWM" function.                                             --
------------------------------------------------------------------------------
   procedure Write_PWM(numeroPort : Interfaces.Unsigned_8; valeur_PWM : Interfaces.Unsigned_16);

------------------------------------------------------------------------------
--    Examples of functionning:                                             --
--    Init_Port_PWM(46);  -- Initialise Timer 5 and D46 port as a PWM output--
--    Write_PWM(46,1500); -- Write 1500, mid value of standard PWM, on      --
--    port D46                                                              --
------------------------------------------------------------------------------


end LVC.PWM.TIMER5;
