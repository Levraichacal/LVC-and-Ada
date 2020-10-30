---------------------------------------------------------------------------
-- The AVR-Ada Library is free software;  you can redistribute it and/or --
-- modify it under terms of the  GNU General Public License as published --
-- by  the  Free Software  Foundation;  either  version 2, or  (at  your --
-- option) any later version.  The AVR-Ada Library is distributed in the --
-- hope that it will be useful, but  WITHOUT ANY WARRANTY;  without even --
-- the  implied warranty of MERCHANTABILITY or FITNESS FOR A  PARTICULAR --
-- PURPOSE. See the GNU General Public License for more details.         --
--                                                                       --
-- As a special exception, if other files instantiate generics from this --
-- unit,  or  you  link  this  unit  with  other  files  to  produce  an --
-- executable   this  unit  does  not  by  itself  cause  the  resulting --
-- executable to  be  covered by the  GNU General  Public License.  This --
-- exception does  not  however  invalidate  any  other reasons why  the --
-- executable file might be covered by the GNU Public License.           --
---------------------------------------------------------------------------

with Interfaces;                   use Interfaces;
with AVR;                          use AVR;
with AVR.Serial;                   use AVR.Serial;
with AVR.Strings;                  use AVR.Strings;
with AVR.Strings.Edit.Generic_Integers;
with AVR.Int_Img;
with AVR.Strings.Edit.Integers;

procedure Int_Out is

   Sample1 : Unsigned_32 := 16#DEAD_BEEF#;
   Sample2 : Unsigned_32 := 123;
   Sample3 : Integer_16  := -1;
   Sample4 : Integer_16  := 16;

   Str : AStr11;

   Len : Unsigned_8;
   Lstr : AStr3;

begin
   Serial.Init (Serial.Baud_19200_16MHz);

   Str := (others => '@');

   --  output Sample1 and Sample2 first through the new low level
   --  interface (new assembler code), show the length of the
   --  generated string with the old (pre v1.2) interface.
   Serial.Put_Line ("check asm output of integers");
   Serial.New_Line;
   Edit.Generic_Integers.Put_U32 (Sample1, 16, Str, Len);
   Serial.Put_Line (Str);
   Int_Img.U8_Img_Right (Len, Lstr);
   Serial.Put ("len:"); Serial.Put(Lstr);
   Serial.New_Line;
   Serial.New_Line;

   Str := (others => '@');

   Edit.Generic_Integers.Put_U32 (Sample2, 16, Str, Len);
   Serial.Put_Line (Str);
   Int_Img.U8_Img_Right (Len, Lstr);
   Serial.Put ("len:"); Serial.Put(Lstr);
   Serial.New_Line;
   Serial.New_Line;


   --  output Sample1 and Sample2 using the new interface of
   --  Strings.Edit.
   Serial.Put_Line ("Now with edit.integers");
   Edit.Output_Last := 1;
   AVR.Strings.Edit.Integers.Put (Sample1, 16, 11, Left, '#');
   Serial.Put_Line (Edit.Output_Line (1..11));
   Serial.New_Line;

   Edit.Output_Last := 1;
   AVR.Strings.Edit.Integers.Put (Sample2, 16, 11, Left, '#');
   Serial.Put_Line (Edit.Output_Line (1..11));
   Serial.New_Line;
   Serial.New_Line;


   --  output signed numbers Sample3 and Sample4 using the new
   --  interface of Strings.Edit.
   Serial.Put_Line ("Now signed Integers");
   Edit.Output_Last := 1;
   AVR.Strings.Edit.Integers.Put (Sample3, 11, Right, '#');
   Serial.Put_Line (Edit.Output_Line (1..11));
   Serial.New_Line;

   Edit.Output_Last := 1;
   AVR.Strings.Edit.Integers.Put (Sample4, 11, Left, '#');
   Serial.Put_Line (Edit.Output_Line (1..11));
   Serial.New_Line;
   Serial.New_Line;


end Int_Out;
