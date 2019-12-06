with GPIO;
use GPIO;

package body lib7segments is

   CommonTrue : Boolean := True;
   CommonFalse : Boolean := False;


   procedure Init7Segments(CommonCathod : Boolean) is
   begin
      if (CommonCathod) then
         CommonTrue := False;
         CommonFalse := True;
      end if;
   end Init7Segments;

   procedure Write7Segments(A : Boolean;
                            B : Boolean;
                            C : Boolean;
                            D : Boolean;
                            E : Boolean;
                            F : Boolean;
                            G : Boolean;
                            P : Boolean) is
   begin
      DigitalWrite(D2,A);
      DigitalWrite(D3,B);
      DigitalWrite(D4,C);
      DigitalWrite(D5,D);
      DigitalWrite(D6,E);
      DigitalWrite(D7,F);
      DigitalWrite(D8,G);
      DigitalWrite(D9,P);
   end Write7Segments;

   procedure PrintNumber7Segments(Number : Character) is
   begin
      case Number is
         when '0' => -- Print 0
            Write7Segments(CommonTrue, CommonTrue, CommonTrue, CommonTrue, CommonTrue, CommonTrue, CommonFalse, CommonFalse);
         when '1' => -- Print 1
            Write7Segments(CommonFalse, CommonTrue, CommonTrue, CommonFalse, CommonFalse, CommonFalse, CommonFalse, CommonFalse);
         when '2' => -- Print 2
            Write7Segments(CommonTrue, CommonTrue, CommonFalse, CommonTrue, CommonTrue, CommonFalse, CommonTrue, CommonFalse);
         when '3' => -- Print 3
            Write7Segments(CommonTrue, CommonTrue, CommonTrue, CommonTrue, CommonFalse, CommonFalse, CommonTrue, CommonFalse);
         when '4' => -- Print 4
            Write7Segments(CommonFalse, CommonTrue, CommonTrue, CommonFalse, CommonFalse, CommonTrue, CommonTrue, CommonFalse);
         when '5' => -- Print 5
            Write7Segments(CommonTrue, CommonFalse, CommonTrue, CommonTrue, CommonFalse, CommonTrue, CommonTrue, CommonFalse);
         when '6' => -- Print 6
            Write7Segments(CommonTrue, CommonFalse, CommonTrue, CommonTrue, CommonTrue, CommonTrue, CommonTrue, CommonFalse);
         when '7' => -- Print 7
            Write7Segments(CommonTrue, CommonTrue, CommonTrue, CommonFalse, CommonFalse, CommonFalse, CommonFalse, CommonFalse);
         when '8' => -- Print 8
            Write7Segments(CommonTrue, CommonTrue, CommonTrue, CommonTrue, CommonTrue, CommonTrue, CommonTrue, CommonFalse);
         when '9' => -- Print 9
            Write7Segments(CommonTrue, CommonTrue, CommonTrue, CommonTrue, CommonFalse, CommonTrue, CommonTrue, CommonFalse);
         when '.' => -- Print Dot Point
            Write7Segments(CommonFalse, CommonFalse, CommonFalse, CommonFalse, CommonFalse, CommonFalse, CommonFalse, CommonTrue);
         when others => null;
      end case;
   end PrintNumber7Segments;
end lib7segments;
