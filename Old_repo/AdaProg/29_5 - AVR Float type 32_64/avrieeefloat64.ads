with Interfaces;
use Interfaces;

package AVRIEEEFloat64 is
   -- The IEEE standard describe float in 32 bit as
   -- SEEEEEEEEEEEMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM;
   -- S : Sign 1 :Negative number, 0 positive number on 1 bit
   -- E : Exposant of 2, from 0 to 2047, 1023 is subtracted to obtained the exposant on 11 bits
   -- M : the Mantisse (contained between 2^52 and 2^53, cause on 52 bits)
   -- the float number is S*M*2^E
   type Float_Sign is mod 2;
   for Float_Sign'Size use 1;

   type Float_64_Expo is mod 2 ** 11;
   for Float_64_Expo'Size use 11;

   type Float_64_Mant is mod 2 ** 52;
   for Float_64_Mant'Size use 52;

   type IEEE_Float64 is
   record
      S : Float_Sign;     -- Sign
      E : Float_64_Expo;  -- Exposant
      M : Float_64_Mant;  -- Mantisse
   end record;

   -- Basic math functions --
   -- The + function for IEEE_Float64
   function "+" (Left,Right : IEEE_Float64) return IEEE_Float64;

   -- The - function for IEEE_Float64
   function "-" (Left,Right : IEEE_Float64) return IEEE_Float64;

   -- The "*" function for IEEE_Float64
   function "*" (Left,Right : IEEE_Float64) return IEEE_Float64;

   -- The "/" function for IEEE_Float64
   function "/" (Left,Right : IEEE_Float64) return IEEE_Float64;


   -- Comparaison Functions --
   -- The egality function
   function "=" (Left,Right : IEEE_Float64) return Boolean;

   -- The ">" function for IEEE_Float64
   function ">" (Left, Right : IEEE_Float64) return Boolean;

   -- The ">=" function for IEEE_Float64
   function ">=" (Left, Right : IEEE_Float64) return Boolean;

   -- The "<" function for IEEE_Float64
   function "<" (Left, Right : IEEE_Float64) return Boolean;

   -- The "<=" function for IEEE_Float64
   function "<=" (Left, Right : IEEE_Float64) return Boolean;


   -- Conversion functions with Unsigned --
   -- Unsigned_8 to IEEE_Float64
   function To_IEEE_Float_64(Number : Unsigned_8) return IEEE_Float64;

   -- Unsigned_16 to IEEE_Float64
   function To_IEEE_Float_64(Number : Unsigned_16) return IEEE_Float64;

   -- Unsigned_32 to IEEE_Float64
   function To_IEEE_Float_64(Number : Unsigned_32) return IEEE_Float64;

   -- IEEE_Float64 to Unsigned_8
   function To_Unsigned8(Number : IEEE_Float64) return Unsigned_8;

   -- IEEE_Float64 to Unsigned_16
   function To_Unsigned16(Number : IEEE_Float64) return Unsigned_16;

   -- IEEE_Float64 to Unsigned_32
   function To_Unsigned32(Number : IEEE_Float64) return Unsigned_32;


   -- Conversion functions with Unsigned --
   -- Integer_8 to IEEE_Float64
   function To_IEEE_Float_64(Number : Integer_8) return IEEE_Float64;

   -- Integer_16 to IEEE_Float64
   function To_IEEE_Float_64(Number : Integer_16) return IEEE_Float64;

   -- Integer_32 to IEEE_Float64
   function To_IEEE_Float_64(Number : Integer_32) return IEEE_Float64;

   -- IEEE_Float64 to Integer_8
   function To_Integer8(Number : IEEE_Float64) return Integer_8;

   -- IEEE_Float64 to Integer_16
   function To_Integer16(Number : IEEE_Float64) return Integer_16;

   -- IEEE_Float64 to Integer_32
   function To_Integer32(Number : IEEE_Float64) return Integer_32;


   -- Conversion functions with String --
   -- IEEE_Float64 to String
   -- function To_String(Number : IEEE_Float64) return String;
   -- String to IEEE_Float64
   -- procedure Put(Number : IEEE_Float64);


end AVRIEEEFloat64;
