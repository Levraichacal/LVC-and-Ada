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
--   Ce programme permet de faire clignoter une LED, la D13 qui est celle   --
--   connectée par défaut, à l'aide d'un watchdog                           --
--                  ___    ___                                              --
--             PC6 -   \__/   - PC5                                         --
--             PD0 -          - PC4                                         --
--             PD1 -          - PC3                                         --
--             PD2 -          - PC2                                         --
--             PD3 -          - PC1                                         --
--             PD4 -          - PC0                                         --
--             VCC -          - GND                                         --
--             GND -          - AREF                                        --
--             PB6 -          - AVCC                                        --
--             PB7 -          - PB5 - D13                                   --
--             PD5 -          - PB4                                         --
--             PD6 -          - PB3                                         --
--             PD7 -          - PB2                                         --
--             PB0 -__________- PB1                                         --
--                                                                          --
--   Le principe de fonctionnement est le suivant :                         --
--     - Le watchdog déclenche une intérruption logicielle toutes les 4 s   --
--     - Dans l'intérruption, on change le status de la LED.                --
--   et on boucle...                                                        --
--                                                                          --
------------------------------------------------------------------------------

------------------------------------------------------------------------------
--  INCLUSIONS DES PACKAGES                                                 --
------------------------------------------------------------------------------
with WatchDogEx0;

------------------------------------------------------------------------------
--  DECLARATION DE LA PROCEDURE MAIN                                        --
------------------------------------------------------------------------------

procedure Main is
begin
   WatchDogEx0.Run;
end Main;
