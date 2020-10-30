with AVR.Strings;                  use AVR.Strings;

package Main_Text is
   pragma Preelaborate;

   Prompt : AVR_String := "$> ";
   pragma Linker_Section (Prompt, ".progmem");

   Greet  : AVR_String := "starting chip inspection";
   pragma Linker_Section (Greet, ".progmem");

end Main_Text;
