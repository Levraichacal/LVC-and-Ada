generic
   type Real is digits <>;
   type Int is range <>;

package Floors is
   function Float_Floor (X : Real) return Int;

   function Float_Ceiling (X : Real) return Int;
   
end Floors;
