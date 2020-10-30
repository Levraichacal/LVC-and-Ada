pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E27 : Short_Integer; pragma Import (Ada, E27, "lvc__pins_E");
   E03 : Short_Integer; pragma Import (Ada, E03, "irreceiver_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      E27 := E27 + 1;
      E03 := E03 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma No_Return (Ada_Main_Program);
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/ada.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/interfac.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/system.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/s-maccod.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/s-stoele.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/s-unstyp.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/32_1 - IR_Receiver/objects/lvc.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/32_1 - IR_Receiver/objects/lvc-pins.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/32_1 - IR_Receiver/objects/irreceiver.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/32_1 - IR_Receiver/objects/main.o
   --   -L/home/touneseb/Dropbox/AdaProg/AdaProg/32_1 - IR_Receiver/objects/
   --   -L/opt/avr-ada/avr-ada-122/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
