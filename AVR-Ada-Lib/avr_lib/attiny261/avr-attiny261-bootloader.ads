


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

with System;               use System;  --   make Address visible

package AVR.ATtiny261.Bootloader is
   pragma Pure (AVR.ATtiny261.Bootloader);

   CVS_Version : constant String := "$Id: avr-attiny261-bootloader.ads 488 2006-01-06 15:43:34Z berndtrog $";

   --
   --  bootloader
   --
   Pagesize   : constant := 32;
   rww_Start  : constant := 16#0000#;
   rww_End    : constant := 16#0000#;
   nrww_Start : constant := 16#0000#;
   nrww_End   : constant := 16#03ff#;

   type Boot_Info_Type is record
      Pages : Byte;
      Start : System.Address;
   end record;
   pragma Style_Checks (Off);
   pragma Style_Checks (On);

end AVR.ATtiny261.Bootloader;
