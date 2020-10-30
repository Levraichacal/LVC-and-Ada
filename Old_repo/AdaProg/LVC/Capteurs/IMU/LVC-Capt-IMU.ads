------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                         L V C . C a p t . I M U                          --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--    Copyright (C) 2014 Bardot Sébastien                                   --
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
--    This package is on the top of LVC architecture, you need it on your   --
--    folder to call an LVC.Capt package.                                   --
--    This package and its children are based on AVR-Ada Library.           --
--                                                                          --
--                                                                          --
------------------------------------------------------------------------------


with AVR;
with AVR.MCU;

package LVC.Capt.IMU is

------------------------------------------------------------------------------
--    Type used for the IMU components data                                 --
--    Type utilisé pour la getion des données issues de la centrale.        --
--    Les données des accéléromètres, les données des gyromètres et les     --
--    données issues des deux types de capteurs.                            --
------------------------------------------------------------------------------

Type Data_Acc is array(0..2) of integer;

Type Data_Gyro is array(0..2) of integer;

Type Data_IMU is array(0..5) of integer;

------------------------------------------------------------------------------
--    Procedure for starting the IMU components                             --
--    Procédure d'initialisation de la central inertielle notamment         --
--    l'acquisition des biais des gyromètres et des accéléromètres ainsi    --
--    que la fréquence de rafraîchissement des données.                     --
------------------------------------------------------------------------------

procedure init();

------------------------------------------------------------------------------
--    Functions for getting parameters from the IMU                         --
--    Fonctions permettant de récupérer les données issues de la centrale   --
--    inertielle que ce soit de façon individuelle, par type de capteur ou  --
--    l'ensemble des données.                                               --
------------------------------------------------------------------------------

function Get_Acc_X() return integer;

function Get_Acc_Y() return integer;

function Get_Acc_Z() return integer;

function Get_Gyro_X() return integer;

function Get_Gyro_Y() return integer;

function Get_Gyro_Z() return integer;

function Get_Acc_Data() return Data_Acc;

function Get_Gyro_Data() return Data_Gyro;

function Get_IMU_Data() return Data_IMU;

end LVC.Capt.IMU;
