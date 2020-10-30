---------------------------------------------------------------------------
-- The AVR-Ada Library is free software;  you can redistribute it and/or --
-- modify it under terms of the  GNU General Public License as published --
-- by  the  Free Software  Foundation;  either  version 2, or  (at  your --
-- option) any later version.  The AVR-Ada Library is distributed in the --
-- hope that it will be useful, but  WITHOUT ANY WARRANTY;  without even --
-- the  implied warranty of MERCHANTABILITY or FITNESS FOR A  PARTICULAR --
-- PURPOSE. See the GNU General Public License for more details.         --
--                                                                       --
-- As a special exception, if other files instantiate generics from this --
-- unit,  or  you  link  this  unit  with  other  files  to  produce  an --
-- executable   this  unit  does  not  by  itself  cause  the  resulting --
-- executable to  be  covered by the  GNU General  Public License.  This --
-- exception does  not  however  invalidate  any  other reasons why  the --
-- executable file might be covered by the GNU Public License.           --
---------------------------------------------------------------------------


--  provide a high resolition clock for the logic analyzer.  It
--  consists of the timer1 counter register plus a 16bit register.

with Interfaces;

package Clock is

   -- type Timestamp is private;
   type Timestamp is new Interfaces.Unsigned_32;

   --  The dividers are based on SUMP's 100Mhz clock.
   --  rate = clock / (divider + 1)
   --  correct divider values at 100MHz  :  resulting sampling freq
   --                   24               :       4 MHz
   --                   49               :       2 MHz
   --                   99               :       1 MHz
   --                  199               :     500 kHz
   --                  399               :     250 kHz
   --                  499               :     200 kHz
   Divider : Interfaces.Unsigned_32;

   function Now return Timestamp;

   procedure Init;

   procedure Reset;


private

   --  type Timestamp is new Interfaces.Unsigned_32;

end Clock;
