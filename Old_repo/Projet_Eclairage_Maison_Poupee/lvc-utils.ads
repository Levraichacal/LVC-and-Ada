with Ada.Unchecked_Conversion;
with Interfaces;

use Interfaces;

package LVC.UTILS is

   -- Convert Unsigned_8 to Unsigned_32
   function Unsigned_8_To_Unsigned_32 is
      new Ada.Unchecked_Conversion(Source => Unsigned_8,
                                   Target => Unsigned_32);

end LVC.UTILS;
