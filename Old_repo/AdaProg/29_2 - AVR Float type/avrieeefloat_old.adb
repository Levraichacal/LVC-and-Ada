with Ada.Unchecked_Conversion;
-- with AVR;
-- use AVR;
with AVR.UART;

package body AVRIEEEFloat is

   -- Unchecked Conversion function
   function U23_To_I32 is new Ada.Unchecked_Conversion (Source => Float_32_Mant,
                                       Target => Integer_32);

   function U23_To_U32 is new Ada.Unchecked_Conversion (Source => Float_32_Mant,
                                       Target => Unsigned_32);

   function I32_To_U23 is new Ada.Unchecked_Conversion (Source => Integer_32,
                                       Target => Float_32_Mant);

   function U32_To_U23 is new Ada.Unchecked_Conversion (Source => Unsigned_32,
                                       Target => Float_32_Mant);

   function U8_To_U32 is new Ada.Unchecked_Conversion (Source => Unsigned_8,
                                       Target => Unsigned_32);

   function U16_To_U32 is new Ada.Unchecked_Conversion (Source => Unsigned_16,
                                       Target => Unsigned_32);

   function I8_To_I32 is new Ada.Unchecked_Conversion (Source => Integer_8,
                                       Target => Integer_32);

   function I16_To_I32 is new Ada.Unchecked_Conversion (Source => Integer_16,
                                       Target => Integer_32);

   function U32_To_U8 is new Ada.Unchecked_Conversion (Source => Unsigned_32,
                                       Target => Unsigned_8);

   function U32_To_U16 is new Ada.Unchecked_Conversion (Source => Unsigned_32,
                                       Target => Unsigned_16);

   function I32_To_I8 is new Ada.Unchecked_Conversion (Source => Integer_32,
                                       Target => Integer_8);

   function I32_To_I16 is new Ada.Unchecked_Conversion (Source => Integer_32,
                                       Target => Integer_16);

   function E32_To_U8 is new Ada.Unchecked_Conversion (Source => Float_32_Expo,
                                       Target => Unsigned_8);


   function "=" (Left,Right : IEEE_Float_32) return Boolean is
   begin
      -- Two float are equals if the have the same sign,
      -- the same exposant and the same mantisse
      if((Left.S = Right.S) and (Left.E = Right.E) and (Left.M = Right.M)) then
         return True;
      else
         return False;
      end if;
   end "=";

   function "+" (Left,Right : IEEE_Float_32) return IEEE_Float_32 is
      result : IEEE_Float_32;
      Expo, ExpoT : Float_32_Expo;
      Int1 : Integer_32 := U23_To_I32(Left.M);
      Int2 : Integer_32 := U23_To_I32(Right.M);
      Int3 : Integer_32;
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
      if (Int3 <0) then
         result.E := 1;
         Int3 := - Int3;
      else
         result.E := 0;
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
      result.M := I32_To_U23(Int3);
      result.E := Expo;
      return result;
   end "+";

   -- The subtraction is just an addition with a negative number
   function "-" (Left,Right : IEEE_Float_32) return IEEE_Float_32 is
      temp : IEEE_Float_32 := Right;
   begin
      if (temp.S =1) then
         temp.S := 0;
      else
         temp.S := 1;
      end if;
      return (Left + temp);
   end "-";


   function "*" (Left,Right : IEEE_Float_32) return IEEE_Float_32 is
      result : IEEE_Float_32;
      ExpoT : Float_32_Expo;
      Uns1 : Unsigned_32 := U23_To_U32(Left.M);
      Uns2 : Unsigned_32 := U23_To_U32(Right.M);
      Uns3 : Unsigned_32;
   begin
      -- Define the sign
      if (Left.S = Right.S) then
         result.S := 0;
      else
         result.S := 1;
      end if;
      -- Divide by 2**7 for don't have an overflow
      Uns1 := Uns1 / (2**7);
      Uns2 := Uns2 / (2**7);
      -- Calculate the Exposant
      ExpoT := Left.E + Right.E + 14;
      -- Calculate the multiplication
      Uns3 := Uns1 * Uns2;
      -- Normalize the number between 2**23 and 2**24, it will always be between 2**30 and 2*32
      while (Uns3 >= 2**24) loop
         Uns3 := Uns3/2;
         ExpoT := ExpoT + 1;
      end loop;
      result.M := U32_To_U23(Uns3);
      result.E := ExpoT;
      return result;
   end "*";


   function "/" (Left,Right : IEEE_Float_32) return IEEE_Float_32 is
      result : IEEE_Float_32;
      ExpoT : Float_32_Expo;
      Uns1 : Unsigned_32 := U23_To_U32(Left.M);
      Uns2 : Unsigned_32 := U23_To_U32(Right.M);
      Uns3 : Unsigned_32;
   begin
      -- Define the sign
      if (Left.S = Right.S) then
         result.S := 0;
      else
         result.S := 1;
      end if;
      -- Multiply by 2**7 for have a better resoltuion
      Uns1 := Uns1 * (2**8);
      -- Calculate the Exposant
      ExpoT := Left.E - Right.E + 8;
      -- Calculate the division
      Uns3 := Uns1 / Uns2;
      -- Normalize the number between 2**23 and 2**24, it will always be under 2**9
      while (Uns3 < 2**23) loop
         Uns3 := Uns3*2;
         ExpoT := ExpoT - 1;
      end loop;
      result.M := U32_To_U23(Uns3);
      result.E := ExpoT;
      return result;
   end "/";


   function ">" (Left,Right : IEEE_Float_32) return Boolean is
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

   function ">=" (Left,Right : IEEE_Float_32) return Boolean is
   begin
      return ((Left > Right) or (Left = Right));
   end ">=";

   function "<" (Left,Right : IEEE_Float_32) return Boolean is
   begin
      return (not(Left >= Right));
   end "<";

   function "<=" (Left,Right : IEEE_Float_32) return Boolean is
   begin
      return ((Left < Right) or (Left = Right));
   end "<=";

   function To_IEEE_Float_32(Number : Unsigned_8) return IEEE_Float_32 is
      temp : IEEE_Float_32;
      Uns : Unsigned_32;
      ExpoT : Float_32_Expo := 127;
   begin
      Uns := U8_To_U32(Number);
      while (Uns < 2**23) loop
         Uns := Uns*2;
         ExpoT := ExpoT - 1;
      end loop;
      temp.S := 0; -- It's a positive number
      temp.E := ExpoT;
      temp.M := U32_To_U23(Uns);
      return temp;
   end To_IEEE_Float_32;

   function To_IEEE_Float_32(Number : Unsigned_16) return IEEE_Float_32 is
      temp : IEEE_Float_32;
      Uns : Unsigned_32;
      ExpoT : Float_32_Expo := 127;
   begin
      Uns := U16_To_U32(Number);
      while (Uns < 2**23) loop
         Uns := Uns*2;
         ExpoT := ExpoT - 1;
      end loop;
      temp.S := 0; -- It's a positive number
      temp.E := ExpoT;
      temp.M := U32_To_U23(Uns);
      return temp;
   end To_IEEE_Float_32;

   function To_IEEE_Float_32(Number : Unsigned_32) return IEEE_Float_32 is
      temp : IEEE_Float_32;
      Uns : Unsigned_32;
      ExpoT : Float_32_Expo := 127;
   begin
      Uns := Number;
      if (Uns < 2**24) then
         while (Uns < 2**23) loop
            Uns := Uns*2;
            ExpoT := ExpoT - 1;
         end loop;
      else
         while (Uns >= 2**24) loop
            Uns := Uns/2;
            ExpoT := ExpoT + 1;
         end loop;
      end if;
      temp.S := 0; -- It's a positive number
      temp.E := ExpoT;
      temp.M := U32_To_U23(Uns);
      return temp;
   end To_IEEE_Float_32;

   function To_Unsigned8(Number : IEEE_Float_32) return Unsigned_8 is
      Num : Unsigned_8;
      Uns : Unsigned_32;
      ExpoT : Float_32_Expo := Number.E;
   begin
      -- If it's a négative number, then it's a zero for an Unsigned
      if (Number.S = 1) then
         Num := 0;
      else
      -- As 2**0 <= Num < 2**8
      -- ie 2**16 <= Num < 2**24 / 2**16
      -- Exp max = 111 and over Number = 255 (number on Unsigned_8)
      -- Exp min = 103 and under Number = 0
      -- Between ExpMin et EXpMAx, put on EXPMax and divide by 2**16
      -- to have a number between 0 and 255
      -- else, it's the number with Exposant 103 basis.
         if (ExpoT > 111) then
            Num := 255;
         else
            if (ExpoT < 103) then
               Num := 0;
            else
               Uns := U23_To_U32(Number.M);
               while (ExpoT > 103) loop
                  Uns := Uns*2;
                  ExpoT := ExpoT - 1;
               end loop;
               Uns := Uns / (2**16);
               Num := U32_To_U8(Uns);
            end if;
         end if;
      end if;
      return Num;
   end To_Unsigned8;

   function To_Unsigned16(Number : IEEE_Float_32) return Unsigned_16 is
      Num : Unsigned_16;
      Uns : Unsigned_32;
      ExpoT : Float_32_Expo := Number.E;
   begin
      -- If it's a négative number, then it's a zero for an Unsigned
      if (Number.S = 1) then
         Num := 0;
      else
      -- As 2**0 <= Num < 2**16
      -- ie 2**8 <= Num < 2**24 / 2**8
      -- Exp max = 119 and over Number = 65535 (number on Unsigned_16)
      -- Exp min = 103 and under Number = 0
      -- Between ExpMin et ExpMax, put on ExpMax and divide by 2**8
      -- to have a number between 0 and 65535
      -- else, it's the number with Exposant 103 basis.
         if (ExpoT > 119) then
            Num := 65535;
         else
            if (ExpoT < 103) then
               Num := 0;
            else
               Uns := U23_To_U32(Number.M);
               while (ExpoT > 103) loop
                  Uns := Uns*2;
                  ExpoT := ExpoT - 1;
               end loop;
               Uns := Uns / (2**8);
               Num := U32_To_U16(Uns);
            end if;
         end if;
      end if;
      return Num;
   end To_Unsigned16;


   function To_Unsigned32(Number : IEEE_Float_32) return Unsigned_32 is
      Num : Unsigned_32;
      ExpoT : Float_32_Expo := Number.E;
   begin
      -- If it's a negative number, then it's a zero for an Unsigned
      if (Number.S = 1) then
         Num := 0;
      else
      -- As 2**0 <= Num < 2**32
      -- Exp max = 135 and over Number = 4294967295 (number on Unsigned_32)
      -- Exp min = 103 and under Number = 0
      -- The number between 0 and 4294967295
      -- else, it's the number with Exposant 103 basis.
         if (ExpoT > 135) then
            Num := 4294967295;
         else
            if (ExpoT < 103) then
               Num := 0;
            else
               Num := U23_To_U32(Number.M);
               while (ExpoT > 103) loop
                  Num := Num*2;
                  ExpoT := ExpoT - 1;
               end loop;
            end if;
         end if;
      end if;
      return Num;
   end To_Unsigned32;

   function To_IEEE_Float_32(Number : Integer_8) return IEEE_Float_32 is
      temp : IEEE_Float_32;
      Int : Integer_32;
      ExpoT : Float_32_Expo := 127;
   begin
      Int := I8_To_I32(Number);
      if(Number >= 0) then
         temp.S := 0; -- It's a positive number
      else
         temp.S := 1; -- It's a negative number
         Int := - Int;
      end if;
      while (Int < 2**23) loop
         Int := Int*2;
         ExpoT := ExpoT - 1;
      end loop;
      temp.E := ExpoT;
      temp.M := I32_To_U23(Int);
      return temp;
   end To_IEEE_Float_32;

   function To_IEEE_Float_32(Number : Integer_16) return IEEE_Float_32 is
      temp : IEEE_Float_32;
      Int : Integer_32;
      ExpoT : Float_32_Expo := 127;
   begin
      Int := I16_To_I32(Number);
      if(Number >= 0) then
         temp.S := 0; -- It's a positive number
      else
         temp.S := 1; -- It's a negative number
         Int := - Int;
      end if;
      while (Int < 2**23) loop
         Int := Int*2;
         ExpoT := ExpoT - 1;
      end loop;
      temp.E := ExpoT;
      temp.M := I32_To_U23(Int);
      return temp;
   end To_IEEE_Float_32;

   function To_IEEE_Float_32(Number : Integer_32) return IEEE_Float_32 is
      temp : IEEE_Float_32;
      Int : Integer_32;
      ExpoT : Float_32_Expo := 127;
   begin
      Int := Number;
      if(Number >= 0) then
         temp.S := 0; -- It's a positive number
      else
         temp.S := 1; -- It's a negative number
         Int := - Int;
      end if;
      if (Int < 2**24) then
         while (Int < 2**23) loop
            Int := Int*2;
            ExpoT := ExpoT - 1;
         end loop;
      else
         while (Int >= 2**24) loop
            Int := Int/2;
            ExpoT := ExpoT + 1;
         end loop;
      end if;
      temp.E := ExpoT;
      temp.M := I32_To_U23(Int);
      return temp;
   end To_IEEE_Float_32;

   function To_Integer8(Number : IEEE_Float_32) return Integer_8 is
      Num : Integer_8;
      Int : Integer_32;
      ExpoT : Float_32_Expo := Number.E;
   begin
      -- As -2**7 <= Num < 2**7
      -- Exp max = 110 and over Number = -128/127 (number on Integer_8)
      -- Exp min = 103 and under Number = 0
      -- Between ExpMin et ExpMax, put on ExpMin and divide by 2**16
      -- to have a number between 0 and -128/127
      -- else, it's the number with Exposant 103 basis.
      if (ExpoT< 103) then
         Num := 0;
      else
         if (ExpoT > 110) then
            if (Number.S = 0) then
               Num := 127;
            else
               Num := -128;
            end if;
         else
            Int := U23_To_I32(Number.M);
            while (ExpoT > 103) loop
               Int := Int*2;
               ExpoT := ExpoT - 1;
            end loop;
            if (Number.S = 0) then
               Int := Int / (2**16);
            else
               Int := - Int / (2**16);
            end if;
            Num := I32_To_I8(Int);
         end if;
      end if;
      return Num;
   end To_Integer8;

   function To_Integer16(Number : IEEE_Float_32) return Integer_16 is
      Num : Integer_16;
      Int : Integer_32;
      ExpoT : Float_32_Expo := Number.E;
   begin
      -- As -2**15 <= Num < 2**15
      -- Exp max = 118 and over Number = -32768/32767 (number on Integer_16)
      -- Exp min = 103 and under Number = 0
      -- Between ExpMin et ExpMax, put on ExpMin and divide by 2**8
      -- to have a number between 0 and -32768/32767
      -- else, it's the number with Exposant 103 basis.
      if (ExpoT< 103) then
         Num := 0;
      else
         if (ExpoT > 118) then
            if (Number.S = 0) then
               Num := 32767;
            else
               Num := -32768;
            end if;
         else
            Int := U23_To_I32(Number.M);
            while (ExpoT > 103) loop
               Int := Int*2;
               ExpoT := ExpoT - 1;
            end loop;
            if (Number.S = 0) then
               Int := Int / (2**8);
            else
               Int := - Int / (2**8);
            end if;
            Num := I32_To_I16(Int);
         end if;
      end if;
      return Num;
   end To_Integer16;


   function To_Integer32(Number : IEEE_Float_32) return Integer_32 is
      Num : Integer_32;
      ExpoT : Float_32_Expo := Number.E;
   begin
      -- As -2**31 <= Num < 2**31
      -- Exp max = 134 and over Number = -2147483648/2147483647 (number on Integer_32)
      -- Exp min = 103 and under Number = 0
      -- Between ExpMin et ExpMax, put on ExpMin
      -- to have a number between 0 and -2147483648/2147483647
      -- else, it's the number with Exposant 103 basis.
      if (ExpoT< 103) then
         Num := 0;
      else
         if (ExpoT > 134) then
            if (Number.S = 0) then
               Num := 2147483647;
            else
               Num := -2147483648;
            end if;
         else
            Num := U23_To_I32(Number.M);
            while (ExpoT > 103) loop
               Num := Num*2;
               ExpoT := ExpoT - 1;
            end loop;
            if (Number.S = 1) then
               Num := -Num;
            end if;
         end if;
      end if;
      return Num;
   end To_Integer32;

-- function To_String(Number : IEEE_Float_32) return String is
      -- buf : String := "";
      -- i,p : Integer := 1;
      -- n,m,a : Unsigned_32 := U23_To_U32(Number.M);
      -- j,k,l : Unsigned_8 := E32_To_U8(Number.E);
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
   procedure Put(Number : IEEE_Float_32) is
      buf : String := "";
      i,p : Integer := 1;
      n,m,a : Unsigned_32 := U23_To_U32(Number.M);
      j,k,l : Unsigned_8 := E32_To_U8(Number.E);
   begin
      if (Number.E = 0) then
         buf(i) := '+';
      else
         buf(i) := '-';
      end if;
      p := 1;
      while(n>0) loop
         m := n;
         n := m / 10;
         a := m - 10 * n;
         i := i + 1;
         buf(i) := Character'Val(a + Character'Pos('0'));
      end loop;
      if (i = p) then
         i := i + 1;
         buf(i) := '0';
      else
         p := p + 1;
         declare
            temp : String(p..i);
         begin
            for q in p..i loop
               temp(q) := buf(i+p-q);
            end loop;
            buf(p..i) := temp(p..i);
         end;
      end if;
      --i := i + 1;
      buf(i..i+4) := "x2**";
      i := i + 4;
      p := i;
      while(j>0) loop
         k := j;
         j := k / 10;
         l := k - 10 * j;
         i := i + 1;
         buf(i) := Character'Val(l + Character'Pos('0'));
      end loop;
      if (i = p) then
         i := i + 1;
         buf(i) := '0';
      end if;
      declare
         temp : String(p..i);
      begin
         for q in p..i loop
            temp(q) := buf(i+p-q);
         end loop;
         buf(p..i) := temp(p..i);
      end;
      for z in 1..i-1 loop
         AVR.UART.Put(buf(z));
      end loop;
   end Put;

end AVRIEEEFloat;
