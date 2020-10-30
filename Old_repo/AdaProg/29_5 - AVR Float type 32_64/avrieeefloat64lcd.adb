with I2c_ecran1602;
with Interfaces;
use Interfaces;
with Ada.Unchecked_Conversion;

package body AVRIEEEFloat64LCD is

   function U52_To_U64 is new Ada.Unchecked_Conversion (Source => Float_64_Mant,
                                       Target => Unsigned_64);

   function E64_To_U16 is new Ada.Unchecked_Conversion (Source => Float_64_Expo,
                                       Target => Unsigned_16);

   procedure LCD_Print(Number : IEEE_Float64) is
      buf : String := "                                                                                                ";
      i,p : Integer := 1;
      n,m,a : Unsigned_64 := U52_To_U64(Number.M);
      j,k,l : Unsigned_16 := E64_To_U16(Number.E);
   begin
      if (Number.S = 1) then
         buf(i) := '-';
      else
         buf(i) := '+';
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
      i := i + 1;
      -- buf(i..i+4) := "x2**";
      buf(i) := 'x';
      i := i + 1;
      buf(i) := '2';
      i := i + 1;
      buf(i) := '*';
      i := i + 1;
      buf(i) := '*';
      i := i + 1;
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
      if(i > 16) then
         --I2c_ecran1602.LCD_SetCursor(0,0);
         I2c_ecran1602.LCD_Print(buf(1..16));
         --I2c_ecran1602.LCD_SetCursor(1,0);
         --I2c_ecran1602.LCD_Print(buf(17..i));
       else
          I2c_ecran1602.LCD_Print(buf(1..i));
       end if;
   end LCD_Print;

end AVRIEEEFloat64LCD;
