with Ada.Unchecked_Conversion;

package body AVRIEEEFloat is
   
   -- The mask for sign, exposant and mantisse
   -- Mask_sign : constant Unsigned_32 := 16#80000000#;
   -- Mask_expo : constant Unsigned_32 := 16#7F800000#;
   -- Mask_mant : constant Unsigned_32 := 16#7FFFFF#;
   -- Expo_step : constant Unsigned_32 := 16#800000#;

   function sign (number : IEEE_Float_32) return IEEE_Float_Sign is
       temp : IEEE_Float_32 := 16#80000000#;
   begin
       if ((number and temp) = temp) then
          return NEGATIVE;
       else
          return POSITIVE;
       end if;
   end sign;

   -- The function have the exposant
   function exposant (number : IEEE_Float_32) return Unsigned_8 is
       tempExp : Unsigned_8;
       temp : Unsigned_32;
       mask : IEEE_Float_32 := 16#7F800000#;
       function Float32_To_U32 is
         new Ada.Unchecked_Conversion (Source => IEEE_Float_32,
                                       Target => Unsigned_32);
       function U32_To_U8 is
         new Ada.Unchecked_Conversion (Source => Unsigned_32,
                                       Target => Unsigned_8); 
   begin
      temp := Float32_To_U32(
      return Exp;
   end exposant;

   -- The function have the mantisee
   function mantisse (number : IEEE_Float_32) return Unsigned_32;

   function "+" (Left,Right : IEEE_Float_32) return IEEE_Float_32 is
      result : IEEE_Float_32;
      M1, M2 : Integer_32;
      tempExp, tempMant : Unsigned_32;
   begin
      if((Left and Mask_expo)>(Right and Mask_expo)) then
         tempExp := Left and Mask_expo;
      else
         tempExp := Right and Mask_expo;
      end if;
      return result;
   end "+";
   
   procedure Init is
   begin
      null;
   end Init;

end AVRIEEEFloat;
