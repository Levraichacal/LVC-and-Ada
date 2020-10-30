with System;
with Interfaces;                   use Interfaces;
with AVR;                          use AVR;
with AVR.Strings;
with AVR.Strings.Edit;             use AVR.Strings.Edit;
with AVR.Strings.Edit.Integers;
with AVR.Serial;

procedure Test_Edit is


   A16 : Unsigned_32;

begin
   Serial.Init(Serial.Baud_19200_16MHz);
   Serial.Put_Line ("starting test of edit IO");

   A16 := 32;

   Integers.Put (A16);
   Serial.New_Line;

end Test_Edit;
