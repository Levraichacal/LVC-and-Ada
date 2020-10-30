with Interfaces;
use Interfaces;

package AVRIEEEFloat is

   -- The IEEE standard describe float in 32 bit as
   -- SEEEEEEEEMMMMMMMMMMMMMMMMMMMMMMM;
   -- S : Sign 1 :Negative number, 0 positive number on 1 bit
   -- E : Exposant of 2, from 0 to 255, 127 is subtracted to obtained the exposant on 8 bits
   -- M : the Mantisse (contained between 2^23 and 2^24, cause on 23 bits)
   -- the float number is S*M*2^E
   type IEEE_Float_32 is new Unsigned_32;
   for IEEE_Float_32'Size use 32;

   type IEEE_Float_Sign is (POSITIVE,NEGATIVE);

   -- The function to know the sign
   function sign (number : IEEE_Float_32) return IEEE_Float_Sign;

   -- The function have the exposant
   function exposant (number : IEEE_Float_32) return Unsigned_8;

   -- The function have the mantisee
   function mantisse (number : IEEE_Float_32) return Unsigned_32;

   -- The + function for IEEE_Float_32
   function "+" (Left,Right : IEEE_Float_32) return IEEE_Float_32;

   --function "<" (Left, Right : IEEE_Float_32) return Boolean;

   procedure Init;

end AVRIEEEFloat;
