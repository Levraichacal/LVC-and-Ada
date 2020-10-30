--  command interpreter and chip inspection

with AVR;                          use AVR;
with AVR.Strings;                  use AVR.Strings;
with AVR.Strings.Edit;
with AVR.UART;
with Commands;

procedure Main is
   Prompt : constant AVR_String := "$> ";

   procedure Parse_Input_And_Trigger_Action
   is
      Cmd_Start : Strings.Edit.Input_Index_T;
   begin
      Strings.Edit.Input_Ptr := 1;
      Strings.Edit.Skip;
      Cmd_Start := Strings.Edit.Input_Ptr;
      Strings.Edit.Get_Str;

      for I in Cmd_List'Range loop
         declare
            Current : Cmd_Info renames Cmd_List(I);
            Cmd : AVR_String renames := Input_Line(Cmd_Start..Input_Ptr-1);
         begin
            if Cmd = Current.Id.all then
               Current.Action.all;
            end if;
         end;
      end loop;
   end Parse_Input_And_Trigger_Action;


begin
   UART.Init (UART.Baud_19200_16MHz);
   UART.Put_Line ("starting chip inspection");

   Cmd_Loop : loop
      UART.Put (Prompt);
      UART.Get_Line (Strings.Edit.Input_Line, Strings.Edit.Input_Last);

      Parse_Input_And_Trigger_Action;
   end loop;
end Main;
