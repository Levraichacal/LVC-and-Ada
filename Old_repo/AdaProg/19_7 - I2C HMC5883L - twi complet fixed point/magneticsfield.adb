package body magneticsfield is

   function "*"(Left,Right : magnetics) return magnetics is
      result : magnetics;
   begin
      return result;
   end "*";

   function "+"(Left,Right : magnetics) return magnetics is
      result : magnetics;
   begin
      return result;
   end "+";

   function "/"(Left,Right : magnetics) return magnetics is
      result : magnetics;
   begin
      return result;
   end "/";

   function "-"(Left,Right : magnetics) return magnetics is
      result : magnetics;
   begin
      return result;
   end "-";

   function "="(Left,Right : magnetics) return boolean is
      result : boolean;
   begin
      return result;
   end "=";

   function "=<"(Left,Right : magnetics) return boolean is
      result : boolean;
   begin
      return result;
   end "=<";

   function "=>"(Left,Right : magnetics) return boolean is
      result : boolean;
   begin
      return result;
   end "=>";

   function ">"(Left,Right : magnetics) return boolean is
      result : boolean;
   begin
      return result;
   end ">";

   function "<"(Left,Right : magnetics) return boolean is
      result : boolean;
   begin
      return result;
   end "<";

   function To_String(Data : magnetics) return AStr11 is
      result : AStr11;
   begin
      return result;
   end To_String;

   function To_Magnetics(Data : Integer_32) return magnetics is
      -- result : magnetics;
   begin
      -- result := Data / Step;
      return Data / Step;
   end To_Magnetics;

   function To_Integer(Data: magnetics) return Integer_32 is
      --result : Integer_32;
   begin
      return Data * Step;
   end To_Integer;

end magneticsfield
