package body Floors is

   function Float_Floor (X : Real) return Int is

      X_Rounded : constant Int := Int(X);

   begin
      if Real(X_Rounded) <= X then
         return X_Rounded;
      else
         return X_Rounded - 1;
      end if;
   end Float_Floor;

   function Float_Ceiling (X : Real) return Int is

      X_Rounded : constant Int := Int(X);

   begin
      if Real(X_Rounded) >= X then
         return X_Rounded;
      else
         return X_Rounded + 1;
      end if;
   end Float_Ceiling; 
   
end Floors;
