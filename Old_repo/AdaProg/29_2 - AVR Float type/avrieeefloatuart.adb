with AVR.UART;
with Interfaces;
use Interfaces;
with Ada.Unchecked_Conversion;

package body AVRIEEEFloatUART is


   function U23_To_U32 is new Ada.Unchecked_Conversion (Source => Float_32_Mant,
                                       Target => Unsigned_32);

   function E32_To_U8 is new Ada.Unchecked_Conversion (Source => Float_32_Expo,
                                       Target => Unsigned_8);

   procedure Put(Number : AVRIEEEFloat.IEEE_Float_32) is
      buf : String := "";
      i,p : Integer := 1;
      n,m,a : Unsigned_32 := U23_To_U32(Number.M);
      j,k,l : Unsigned_8 := E32_To_U8(Number.E);
   begin
      if(Number.E = 1) then
         AVR.UART.Put('');
      end if;
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
      -- if (i = p) then
         -- i := i + 1;
         -- buf(i) := '0';
      -- end if;
      -- declare
         -- temp : String(2..i);
      -- begin
         -- for q in 2..i loop
            -- temp(q) := buf(i+2-q);
         -- end loop;
         -- buf(2..i) := temp(2..i);
      -- end;
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
         -- temp : String(p+1..i);
      -- begin
         -- for q in p..i loop
            -- temp(q) := buf(i+p-q);
         -- end loop;
         -- buf(p..i) := temp(p..i);
      -- end;
      -- for z in 1..i loop
         -- AVR.UART.Put(buf(z));
      -- end loop;
   end Put;

end AVRIEEEFloatUART;
