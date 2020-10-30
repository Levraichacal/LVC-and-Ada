with Ada.Unchecked_Conversion;
-- with AVR;
-- use AVR;
with AVR.UART;

package body AVRIEEEFloat64 is

   pragma Warnings (Off);
   -- Unchecked Conversion function
   function U52_To_I64 is new Ada.Unchecked_Conversion (Source => Float_64_Mant,
                                                        Target => Integer_64);

--    function U52_To_U32 is new Ada.Unchecked_Conversion (Source => Float_64_Mant,
--                                                         Target => Unsigned_32);

   function U52_To_U64 is new Ada.Unchecked_Conversion (Source => Float_64_Mant,
                                                        Target => Unsigned_64);

   -- function I32_To_U52 is new Ada.Unchecked_Conversion (Source => Integer_32,
   --                                     Target => Float_64_Mant);

   -- function U64_To_U52 is new Ada.Unchecked_Conversion (Source => Unsigned_64,
   --                                                      Target => Float_64_Mant);

   function U64_To_U52 is new Ada.Unchecked_Conversion (Source => Unsigned_64,
                                                        Target => Float_64_Mant);

   function U8_To_U64 is new Ada.Unchecked_Conversion (Source => Unsigned_8,
                                                       Target => Unsigned_64);

   function U16_To_U64 is new Ada.Unchecked_Conversion (Source => Unsigned_16,
                                                        Target => Unsigned_64);

   function U32_To_U64 is new Ada.Unchecked_Conversion (Source => Unsigned_32,
                                                        Target => Unsigned_64);

   function I8_To_I64 is new Ada.Unchecked_Conversion (Source => Integer_8,
                                                       Target => Integer_64);

   function I16_To_I64 is new Ada.Unchecked_Conversion (Source => Integer_16,
                                                        Target => Integer_64);

   function I32_To_I64 is new Ada.Unchecked_Conversion (Source => Integer_32,
                                                        Target => Integer_64);

   function U64_To_U8 is new Ada.Unchecked_Conversion (Source => Unsigned_64,
                                                       Target => Unsigned_8);

   function U64_To_U16 is new Ada.Unchecked_Conversion (Source => Unsigned_64,
                                                        Target => Unsigned_16);

   function U64_To_U32 is new Ada.Unchecked_Conversion (Source => Unsigned_64,
                                                        Target => Unsigned_32);

   function I64_To_I8 is new Ada.Unchecked_Conversion (Source => Integer_64,
                                                       Target => Integer_8);

   function I64_To_I16 is new Ada.Unchecked_Conversion (Source => Integer_64,
                                                        Target => Integer_16);

   function I64_To_I32 is new Ada.Unchecked_Conversion (Source => Integer_64,
                                                        Target => Integer_32);
   pragma Warnings (On);

   -- function E64_To_U16 is new Ada.Unchecked_Conversion (Source => Float_64_Expo,
   --                                                     Target => Unsigned_16);

   --     function I8_To_U8 is new Ada.Unchecked_Conversion (Source => Integer_8,
   --                                                        Target => Unsigned_8);
   --
   --     function I16_To_U16 is new Ada.Unchecked_Conversion (Source => Integer_16,
   --                                                          Target => Unsigned_16);

   function I64_To_U64 is new Ada.Unchecked_Conversion (Source => Integer_64,
                                                        Target => Unsigned_64);

   function "=" (Left,Right : IEEE_Float64) return Boolean is
   begin
      -- Two float are equals if the have the same sign,
      -- the same exposant and the same mantisse
      if((Left.S = Right.S) and (Left.E = Right.E) and (Left.M = Right.M)) then
         return True;
      else
         return False;
      end if;
   end "=";

   function "+" (Left,Right : IEEE_Float64) return IEEE_Float64 is
      result : IEEE_Float64;
      Expo, ExpoT : Float_64_Expo;
      Int1 : Integer_64 := U52_To_I64(Left.M);
      Int2 : Integer_64 := U52_To_I64(Right.M);
      Int3 : Integer_64;
   begin
      -- Calculate the max Exposant
      if (Left.E > Right.E) then
         Expo := Left.E;
      else
         Expo := Right.E;
      end if;
      -- Normalize the number around the max exposant
      ExpoT := Left.E;
      while (ExpoT /= Expo) loop
         Int1 := Int1 / 2;
         ExpoT := ExpoT + 1;
      end loop;
      ExpoT := Right.E;
      while (ExpoT /= Expo) loop
         Int2 := Int2 / 2;
         ExpoT := ExpoT + 1;
      end loop;
      -- Int2 := Int2 / (2 ** (E32_To_Nat8(Expo - Right.E)));
      -- Put the right sign
      if (Left.S = 1) then
         Int1 := -Int1;
      end if;
      if (Right.S = 1) then
         Int2 := -Int2;
      end if;
      -- Add the to number
      Int3 := Int1 + Int2;
      -- Put the right sign of the result
      if (Int3 = 0) then
         result.S := 0;
         result.E := 0;
         result.M := 0;
      else
         if (Int3 <0) then
            result.S := 1;
            Int3 := - Int3;
         else
            result.S := 0;
         end if;
         -- Normalize the number between 2**23 and 2**24
         if (Int3 >= 2**24) then
            Int3 := Int3/2;
            Expo := Expo + 1;
         else
            while (Int3 < 2**23) loop
               Int3 := Int3 * 2;
               Expo := Expo - 1;
            end loop;
         end if;
         result.M := U64_To_U52(I64_To_U64(Int3));
         result.E := Expo;
      end if;
      return result;
   end "+";

   -- The subtraction is just an addition with a negative number
   function "-" (Left,Right : IEEE_Float64) return IEEE_Float64 is
      temp : IEEE_Float64 := Right;
   begin
      if (temp.S =1) then
         temp.S := 0;
      else
         temp.S := 1;
      end if;
      return (Left + temp);
   end "-";


   function "*" (Left,Right : IEEE_Float64) return IEEE_Float64 is
      result : IEEE_Float64;
      ExpoT : Float_64_Expo;
      Uns1 : Unsigned_64 := U52_To_U64(Left.M);
      Uns2 : Unsigned_64 := U52_To_U64(Right.M);
      Uns3 : Unsigned_64;
   begin
      -- Calculate the multiplication
      Uns3 := Uns1 * Uns2;
      -- Normalize the number between 2**52 and 2**53
      if (Uns3 = 0) then
         result.S := 0;
         result.E := 0;
         result.M := 0;
      else
         -- Define the sign
         if (Left.S = Right.S) then
            result.S := 0;
         else
            result.S := 1;
         end if;
         -- Calculate the Exposant
         ExpoT := Left.E - 1023 + Right.E;
         while (Uns3 > 2**52) loop
            Uns3 := Uns3/2;
            ExpoT := ExpoT + 1;
         end loop;
         result.M := U64_To_U52(Uns3);
         result.E := ExpoT;
      end if;
      return result;
   end "*";


   function "/" (Left,Right : IEEE_Float64) return IEEE_Float64 is
      result : IEEE_Float64;
      ExpoT : Float_64_Expo;
      Uns1 : Unsigned_64 := U52_To_U64(Left.M);
      Uns2 : Unsigned_64 := U52_To_U64(Right.M);
      Uns3 : Unsigned_64;
   begin
      -- Calculate the division
      if (Uns2 = 0) then
         result.S := 0;
         result.E := 2047;
         result.M := 4503599627370495;
      else
         if (Uns1 = 0) then
            result.S := 0;
            result.E := 0;
            result.M := 0;
         else
            Uns1 := Uns1 * 2**11;
            -- Calculate the Exposant
            ExpoT := Left.E - Right.E + 1012;
            -- Define the sign
            if (Left.S = Right.S) then
               result.S := 0;
            else
               result.S := 1;
            end if;
            Uns3 := Uns1 / Uns2 ; -- for around the number
            -- Normalize the number between 2**52 and 2**53
            while (Uns3 < 2**52) loop
               Uns3 := Uns3*2;
               ExpoT := ExpoT - 1;
            end loop;
            result.M := U64_To_U52(Uns3);
            result.E := ExpoT;
         end if;
      end if;
         return result;
   end "/";


   function ">" (Left,Right : IEEE_Float64) return Boolean is
   begin
      -- If the sign is equal, we test the following
      if (Left.S = Right.S) then
         -- If the two numbers are positives
         if (Left.S = 0) then
            -- Check the exposant
            if (Left.E > Right.E) then
               return True;
            else
               if (Left.E = Right.E) then
                  -- if equals, check the mantisse
                  if (Left.M > Right.M) then
                     return True;
                  else
                     return False;
                  end if;
               else
                  return False;
               end if;
            end if;
            -- If the two numbers are negatives
         else
            -- Check the exposant
            if (Left.E < Right.E) then
               return True;
            else
               if (Left.E = Right.E) then
                  -- if equals, check the mantisse
                  if (Left.M < Right.M) then
                     return True;
                  else
                     return False;
                  end if;
               else
                  return False;
               end if;
            end if;
         end if;
         -- They don't have the same sign
      else
         -- If Left is positive, then is greater else it's Right
         if (Left.S = 0) then
            return True;
         else
            return False;
         end if;
      end if;
   end ">";

   function ">=" (Left,Right : IEEE_Float64) return Boolean is
   begin
      return ((Left > Right) or (Left = Right));
   end ">=";

   function "<" (Left,Right : IEEE_Float64) return Boolean is
   begin
      return (not(Left >= Right));
   end "<";

   function "<=" (Left,Right : IEEE_Float64) return Boolean is
   begin
      return ((Left < Right) or (Left = Right));
   end "<=";

   function To_IEEE_Float_64(Number : Unsigned_8) return IEEE_Float64 is
      temp : IEEE_Float64;
      Uns : Unsigned_64;
      ExpoT : Float_64_Expo := 1023;
   begin
      Uns := U8_To_U64(Number);
      while (Uns < 2**52) loop
         Uns := Uns*2;
         ExpoT := ExpoT - 1;
      end loop;
      temp.S := 0; -- It's a positive number
      temp.E := ExpoT;
      temp.M := U64_To_U52(Uns);
      return temp;
   end To_IEEE_Float_64;

   function To_IEEE_Float_64(Number : Unsigned_16) return IEEE_Float64 is
      temp : IEEE_Float64;
      Uns : Unsigned_64;
      ExpoT : Float_64_Expo := 1023;
   begin
      Uns := U16_To_U64(Number);
      while (Uns < 2**52) loop
         Uns := Uns*2;
         ExpoT := ExpoT - 1;
      end loop;
      temp.S := 0; -- It's a positive number
      temp.E := ExpoT;
      temp.M := U64_To_U52(Uns);
      return temp;
   end To_IEEE_Float_64;

   function To_IEEE_Float_64(Number : Unsigned_32) return IEEE_Float64 is
      temp : IEEE_Float64;
      Uns : Unsigned_64;
      ExpoT : Float_64_Expo := 1023;
   begin
      Uns := U32_To_U64(Number);
      if (Uns < 2**53) then
         while (Uns < 2**52) loop
            Uns := Uns*2;
            ExpoT := ExpoT - 1;
         end loop;
      else
         while (Uns >= 2**53) loop
            Uns := Uns/2;
            ExpoT := ExpoT + 1;
         end loop;
      end if;
      temp.S := 0; -- It's a positive number
      temp.E := ExpoT;
      temp.M := U64_To_U52(Uns);
      return temp;
   end To_IEEE_Float_64;

   function To_Unsigned8(Number : IEEE_Float64) return Unsigned_8 is
      Num : Unsigned_8;
      Uns : Unsigned_64;
      ExpoT : Float_64_Expo := Number.E;
   begin
      -- If it's a négative number, then it's a zero for an Unsigned
      if (Number.S = 1) then
         Num := 0;
      else
         -- As 2**0 <= Num < 2**8
         -- Exp max = 979 and over Number = 255 (number on Unsigned_8)
         -- Exp min = 971 and under Number = 0
         -- to have a number between 0 and 255
         -- else, it's the number with Exposant 103 basis.
         if (ExpoT > 979) then
            Num := 255;
         else
            if (ExpoT < 971) then
               Num := 0;
            else
               Uns := U52_To_U64(Number.M);
               while (ExpoT < 1023) loop
                  Uns := Uns/2;
                  ExpoT := ExpoT + 1;
               end loop;
               --Uns := Uns / (2**16);
               Num := U64_To_U8(Uns);
            end if;
         end if;
      end if;
      return Num;
   end To_Unsigned8;

   function To_Unsigned16(Number : IEEE_Float64) return Unsigned_16 is
      Num : Unsigned_16;
      Uns : Unsigned_64;
      ExpoT : Float_64_Expo := Number.E;
   begin
      -- If it's a négative number, then it's a zero for an Unsigned
      if (Number.S = 1) then
         Num := 0;
      else
         -- As 2**0 <= Num < 2**16
         -- Exp max = 987 and over Number = 65535 (number on Unsigned_16)
         -- Exp min = 971 and under Number = 0
         -- to have a number between 0 and 65535
         -- else, it's the number with Exposant 103 basis.
         if (ExpoT > 987) then
            Num := 65535;
         else
            if (ExpoT < 971) then
               Num := 0;
            else
               Uns := U52_To_U64(Number.M);
               while (ExpoT < 1023) loop
                  Uns := Uns/2;
                  ExpoT := ExpoT + 1;
               end loop;
               Num := U64_To_U16(Uns);
            end if;
         end if;
      end if;
      return Num;
   end To_Unsigned16;

   function To_Unsigned32(Number : IEEE_Float64) return Unsigned_32 is
      Num : Unsigned_32;
      Uns : Unsigned_64;
      ExpoT : Float_64_Expo := Number.E;
   begin
      -- If it's a negative number, then it's a zero for an Unsigned
      if (Number.S = 1) then
         Num := 0;
      else
         -- As 2**0 <= Num < 2**32
         -- Exp max = 1003 and over Number = 4294967295 (number on Unsigned_32)
         -- Exp min = 971 and under Number = 0
         -- The number between 0 and 4294967295
         -- else, it's the number with Exposant 103 basis.
         if (ExpoT > 1003) then
            Num := 4294967295;
         else
            if (ExpoT < 971) then
               Num := 0;
            else
               Uns := U52_To_U64(Number.M);
               if (ExpoT > 1023) then
                  while (ExpoT > 1023) loop
                     Uns := Uns*2;
                     ExpoT := ExpoT - 1;
                  end loop;
               else
                  while (ExpoT < 1023) loop
                     Uns := Uns/2;
                     ExpoT := ExpoT + 1;
                  end loop;
               end if;
               Num := U64_To_U32(Uns);
            end if;
         end if;
      end if;
      return Num;
   end To_Unsigned32;

   function To_IEEE_Float_64(Number : Integer_8) return IEEE_Float64 is
      temp : IEEE_Float64;
      Int : Integer_64;
      ExpoT : Float_64_Expo := 1023;
   begin
      Int := I8_To_I64(Number);
      if(Number >= 0) then
         temp.S := 0; -- It's a positive number
      else
         temp.S := 1; -- It's a negative number
         Int := - Int;
      end if;
      while (Int < 2**52) loop
         Int := Int*2;
         ExpoT := ExpoT - 1;
      end loop;
      temp.E := ExpoT;
      temp.M := U64_To_U52(I64_To_U64(Int));
      return temp;
   end To_IEEE_Float_64;

   function To_IEEE_Float_64(Number : Integer_16) return IEEE_Float64 is
      temp : IEEE_Float64;
      Int : Integer_64;
      ExpoT : Float_64_Expo := 1023;
   begin
      Int := I16_To_I64(Number);
      if(Number >= 0) then
         temp.S := 0; -- It's a positive number
      else
         temp.S := 1; -- It's a negative number
         Int := - Int;
      end if;
      while (Int < 2**52) loop
         Int := Int*2;
         ExpoT := ExpoT - 1;
      end loop;
      temp.E := ExpoT;
      temp.M := U64_To_U52(I64_To_U64(Int));
      return temp;
   end To_IEEE_Float_64;

   function To_IEEE_Float_64(Number : Integer_32) return IEEE_Float64 is
      temp : IEEE_Float64;
      Int : Integer_64;
      ExpoT : Float_64_Expo := 1023;
   begin
      Int := I32_To_I64(Number);
      if(Number >= 0) then
         temp.S := 0; -- It's a positive number
      else
         temp.S := 1; -- It's a negative number
         Int := - Int;
      end if;
      if (Int < 2**53) then
         while (Int < 2**52) loop
            Int := Int*2;
            ExpoT := ExpoT - 1;
         end loop;
      else
         while (Int >= 2**53) loop
            Int := Int/2;
            ExpoT := ExpoT + 1;
         end loop;
      end if;
      temp.E := ExpoT;
      temp.M := U64_To_U52(I64_To_U64(Int));
      return temp;
   end To_IEEE_Float_64;

   function To_Integer8(Number : IEEE_Float64) return Integer_8 is
      Num : Integer_8;
      Int : Integer_64;
      ExpoT : Float_64_Expo := Number.E;
   begin
      -- As -2**7 <= Num < 2**7
      -- Exp max = 977 and over Number = -128/127 (number on Integer_8)
      -- Exp min = 970 and under Number = 0
      -- Between ExpMin et ExpMax, put on ExpMin and divide by 2**16
      -- to have a number between 0 and -128/127
      -- else, it's the number with Exposant 103 basis.
      if (ExpoT< 971) then
         Num := 0;
      else
         if (ExpoT > 977) then
            if (Number.S = 0) then
               Num := 127;
            else
               Num := -128;
            end if;
         else
            Int := U52_To_I64(Number.M);
            while (ExpoT < 1023) loop
               Int := Int/2;
               ExpoT := ExpoT + 1;
            end loop;
            if (Number.S = 1) then
               Int := - Int ;
            end if;
            Num := I64_To_I8(Int);
         end if;
      end if;
      return Num;
   end To_Integer8;

   function To_Integer16(Number : IEEE_Float64) return Integer_16 is
      Num : Integer_16;
      Int : Integer_64;
      ExpoT : Float_64_Expo := Number.E;
   begin
      -- As -2**15 <= Num < 2**15
      -- Exp max = 985 and over Number = -32768/32767 (number on Integer_16)
      -- Exp min = 971 and under Number = 0
      -- Between ExpMin et ExpMax, put on ExpMin and divide by 2**8
      -- to have a number between 0 and -32768/32767
      -- else, it's the number with Exposant 103 basis.
      if (ExpoT< 971) then
         Num := 0;
      else
         if (ExpoT > 985) then
            if (Number.S = 0) then
               Num := 32767;
            else
               Num := -32768;
            end if;
         else
            Int := U52_To_I64(Number.M);
            while (ExpoT < 1023) loop
               Int := Int/2;
               ExpoT := ExpoT + 1;
            end loop;
            if (Number.S = 1) then
               Int := - Int ;
            end if;
            Num := I64_To_I16(Int);
         end if;
      end if;
      return Num;
   end To_Integer16;

   function To_Integer32(Number : IEEE_Float64) return Integer_32 is
      Num : Integer_32;
      Int : Integer_64;
      ExpoT : Float_64_Expo := Number.E;
   begin
      -- As -2**31 <= Num < 2**31
      -- Exp max = 1001 and over Number = -2147483648/2147483647 (number on Integer_32)
      -- Exp min = 970 and under Number = 0
      -- Between ExpMin et ExpMax, put on ExpMin
      -- to have a number between 0 and -2147483648/2147483647
      -- else, it's the number with Exposant 103 basis.
      if (ExpoT < 971) then
         Num := 0;
      else
         if (ExpoT > 1001) then
            if (Number.S = 0) then
               Num := 2147483647;
            else
               Num := -2147483648;
            end if;
         else
            Int := U52_To_I64(Number.M);
            if (ExpoT >1023) then
               while (ExpoT > 1023) loop
                  Int := Int*2;
                  ExpoT := ExpoT - 1;
               end loop;
            else
               while (ExpoT <1023) loop
                  Int := Int/2;
                  ExpoT := ExpoT + 1;
               end loop;
            end if;
            if (Number.S = 1) then
               Int := -Int;
            end if;
            Num := I64_To_I32(Int);
         end if;
      end if;
      return Num;
   end To_Integer32;

   -- function To_String(Number : IEEE_Float64) return String is
   -- buf : String := "";
   -- i,p : Integer := 1;
   -- n,m,a : Unsigned_32 := U52_To_U32(Number.M);
   -- j,k,l : Unsigned_8 := E64_To_U16(Number.E);
   -- begin
   -- if (Number.E = 0) then
   -- buf(i) := '+';
   -- else
   -- buf(i) := '-';
   -- end if;
   -- while(n>0) loop
   -- m := n;
   -- n := m / 10;
   -- a := m - 10 * n;
   -- i := i + 1;
   -- buf(i) := Character'Val(a + Character'Pos('0'));
   -- end loop;
   -- declare
   -- temp : String(1..i);
   -- begin
   -- for q in 2..i loop
   -- temp(q) := buf(i+1-q);
   -- end loop;
   -- buf(2..i) := temp(2..i);
   -- end;
   -- if (i = p) then
   -- i := i + 1;
   -- buf(i) := '0';
   -- end if;
   -- i := i + 1;
   -- buf(i..i+4) := "x2**";
   -- i := i + 4;
   -- p := i;
   -- while(j>0) loop
   -- k := j;
   -- j := k / 10;
   -- l := k - 10 * j;
   -- i := i + 1;
   -- buf(i) := Character'Val(l + Character'Pos('0'));
   -- end loop;
   -- if (i = p) then
   -- i := i + 1;
   -- buf(i) := '0';
   -- end if;
   -- declare
   -- temp : String(1..i);
   -- begin
   -- for q in p..i loop
   -- temp(q) := buf(i+1-q);
   -- end loop;
   -- buf(p..i) := temp(p..i);
   -- end;
   -- return buf(1..i);
   -- end To_String;


end AVRIEEEFloat64;
