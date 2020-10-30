with I2c_ecran1602;
with Interfaces;
use Interfaces;

package body AVRIEEEFloatLCD is

   procedure LCD_Print(Number : IEEE_Float_32) is
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
      while(n>0) loop
         m := n;
         n := m / 10;
         a := m - 10 * n;
         i := i + 1;
         buf(i) := Character'Val(a + Character'Pos('0'));
      end loop;
      declare
         temp : String(1..i);
      begin
         for q in 2..i loop
            temp(q) := buf(i+1-q);
         end loop;
         buf(2..i) := temp(2..i);
      end;
      if (i = p) then
         i := i + 1;
         buf(i) := '0';
      end if;
      i := i + 1;
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
         temp : String(1..i);
      begin
         for q in p..i loop
            temp(q) := buf(i+1-q);
         end loop;
         buf(p..i) := temp(p..i);
      end;
      I2c_ecran1602.LCD_Print(buf(1..i));
   end LCD_Print;

end AVRIEEEFloatLCD;
