with interfaces;
use interfaces;
with AVR.Strings;
use AVR.Strings;

package magneticsfield is

   type magnetics is Integer_32; -- N*10000

   function "*"(Left,Right : magnetics) return magnetics;

   function "+"(Left,Right : magnetics) return magnetics;

   function "/"(Left,Right : magnetics) return magnetics;

   function "-"(Left,Right : magnetics) return magnetics;

   function "="(Left,Right : magnetics) return boolean;

   function "=<"(Left,Right : magnetics) return boolean;

   function "=>"(Left,Right : magnetics) return boolean;

   function ">"(Left,Right : magnetics) return boolean;

   function "<"(Left,Right : magnetics) return boolean;

   function To_String(Data : magnetics) return AStr11;

   function To_Magnetics(Data : Integer_32) return magnetics;

   function To_Integer(Data: magnetics) return Integer_32;

private
   Step : constant Integer_32 := 10000;
end magneticsfield;
