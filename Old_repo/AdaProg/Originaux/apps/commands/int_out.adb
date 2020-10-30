with Interfaces;                   use Interfaces;
with AVR;                          use AVR;
with AVR.Serial;                   use AVR.Serial;
with AVR.Strings;                  use AVR.Strings;
with AVR.Strings.Edit.Generic_Integers;
with AVR.Int_Img;

procedure Int_Out is

   Sample1 : Unsigned_32 := 16#DEAD_BEEF#;
   Sample2 : Unsigned_32 := 123;

   Str : AStr11;

   Len : Unsigned_8;
   Lstr : AStr3;

begin
   Serial.Init (Serial.Baud_19200_16MHz);
   Serial.Put_Line ("check asm output of integers");
   Serial.New_Line;

   Str := (others => '@');

   Edit.Generic_Integers.Put_U32 (Sample1, 16, Str, Len);
   Serial.Put_Line (Str);
   Int_Img.U8_Img_Right (Len, Lstr);
   Serial.Put ("len:"); Serial.Put(Lstr);
   Serial.New_Line;
   Serial.New_Line;

   Str := (others => '@');

   Edit.Generic_Integers.Put_U32 (123, 16, Str, Len);
   Serial.Put_Line (Str);
   Int_Img.U8_Img_Right (Len, Lstr);
   Serial.Put ("len:"); Serial.Put(Lstr);
   Serial.New_Line;
   Serial.New_Line;
end Int_Out;
