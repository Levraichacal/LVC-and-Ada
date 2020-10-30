------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                          L V C . P W M . S P I                           --
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
--    This package needs the LVC one and the LVC.COM one to be called, make --
--    sure they are in the project folder.                                  --
--    This package and its children are based on AVR-Ada Library.           --
--                                                                          --
--                                                                          --
------------------------------------------------------------------------------
--    This package enable to configure the communication in spi mode        --
------------------------------------------------------------------------------
with Interfaces;
use Interfaces;

package LVC.COM.SPI is

------------------------------------------------------------------------------
--    This procedure initialize the "numeroPort" as output pwm and the      --
--    timer if it's needed. Its works at 50 Hz as usual servomotor          --
------------------------------------------------------------------------------
   procedure Init_SPI(CPOL : Boolean ; CPHA : Boolean);

------------------------------------------------------------------------------
--    This procedure write the value of pwm "valeur_PWM" on the port        --
--    "numeroPort". Its needed that the port was initialize with the        --
--    "Init_Port_PWM1" function.                                            --
------------------------------------------------------------------------------
   procedure Transfert_SPI(Data : Unsigned_8);

------------------------------------------------------------------------------
--    Examples of functionning:                                             --
--    Init_Port_PWM1(11);  -- Initialise Timer 1 and D11 port as a PWM      --
--    output                                                                --
--    Write_PWM1(11,1500); -- Write 1500, mid value of standard PWM, on     --
--    port D11                                                              --
------------------------------------------------------------------------------


end LVC.COM.SPI;
