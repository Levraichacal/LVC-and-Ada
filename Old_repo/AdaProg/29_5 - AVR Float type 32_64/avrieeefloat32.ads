with Interfaces;
use Interfaces;

package AVRIEEEFloat32 is
   -- The IEEE standard describe float in 32 bit as
   -- SEEEEEEEEMMMMMMMMMMMMMMMMMMMMMMM;
   -- S : Sign 1 :Negative number, 0 positive number on 1 bit
   -- E : Exposant of 2, from 0 to 255, 127 is subtracted to obtained the exposant on 8 bits
   -- M : the Mantisse (contained between 2^23 and 2^24, cause on 23 bits)
   -- the float number is S*M*2^E
   type Float_Sign is mod 2;
   for Float_Sign'Size use 1;

   type Float_32_Expo is mod 2 ** 8;
   for Float_32_Expo'Size use 8;

   type Float_32_Mant is mod 2 ** 23;
   for Float_32_Mant'Size use 23;

   type IEEE_Float32 is
   record
      S : Float_Sign;     -- Sign
      E : Float_32_Expo;  -- Exposant
      M : Float_32_Mant;  -- Mantisse
   end record;

   -- Basic math functions --
   -- The + function for IEEE_Float32
   function "+" (Left,Right : IEEE_Float32) return IEEE_Float32;

   -- The - function for IEEE_Float32
   function "-" (Left,Right : IEEE_Float32) return IEEE_Float32;

   -- The "*" function for IEEE_Float32
   function "*" (Left,Right : IEEE_Float32) return IEEE_Float32;

   -- The "/" function for IEEE_Float32
   function "/" (Left,Right : IEEE_Float32) return IEEE_Float32;


   -- Comparaison Functions --
   -- The egality function
   function "=" (Left,Right : IEEE_Float32) return Boolean;

   -- The ">" function for IEEE_Float32
   function ">" (Left, Right : IEEE_Float32) return Boolean;

   -- The ">=" function for IEEE_Float32
   function ">=" (Left, Right : IEEE_Float32) return Boolean;

   -- The "<" function for IEEE_Float32
   function "<" (Left, Right : IEEE_Float32) return Boolean;

   -- The "<=" function for IEEE_Float32
   function "<=" (Left, Right : IEEE_Float32) return Boolean;


   -- Conversion functions with Unsigned --
   -- Unsigned_8 to IEEE_Float32
   function To_IEEE_Float_32(Number : Unsigned_8) return IEEE_Float32;

   -- Unsigned_16 to IEEE_Float32
   function To_IEEE_Float_32(Number : Unsigned_16) return IEEE_Float32;

   -- Unsigned_32 to IEEE_Float32
   function To_IEEE_Float_32(Number : Unsigned_32) return IEEE_Float32;

   -- IEEE_Float32 to Unsigned_8
   function To_Unsigned8(Number : IEEE_Float32) return Unsigned_8;

   -- IEEE_Float32 to Unsigned_16
   function To_Unsigned16(Number : IEEE_Float32) return Unsigned_16;

   -- IEEE_Float32 to Unsigned_32
   function To_Unsigned32(Number : IEEE_Float32) return Unsigned_32;


   -- Conversion functions with Unsigned --
   -- Integer_8 to IEEE_Float32
   function To_IEEE_Float_32(Number : Integer_8) return IEEE_Float32;

   -- Integer_16 to IEEE_Float32
   function To_IEEE_Float_32(Number : Integer_16) return IEEE_Float32;

   -- Integer_32 to IEEE_Float32
   function To_IEEE_Float_32(Number : Integer_32) return IEEE_Float32;

   -- IEEE_Float32 to Integer_8
   function To_Integer8(Number : IEEE_Float32) return Integer_8;

   -- IEEE_Float32 to Integer_16
   function To_Integer16(Number : IEEE_Float32) return Integer_16;

   -- IEEE_Float32 to Integer_32
   function To_Integer32(Number : IEEE_Float32) return Integer_32;


   -- Conversion functions with String --
   -- IEEE_Float32 to String
   -- function To_String(Number : IEEE_Float32) return String;
   -- String to IEEE_Float32
   -- procedure Put(Number : IEEE_Float32);


end AVRIEEEFloat32;
