pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E24 : Short_Integer; pragma Import (Ada, E24, "button_E");
   E27 : Short_Integer; pragma Import (Ada, E27, "lvc__pins_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      E27 := E27 + 1;
      E24 := E24 + 1;
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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/ada.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-stoele.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-unstyp.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/6_9 - Interruption Materielle/objects/main.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/6_9 - Interruption Materielle/objects/lvc.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/6_9 - Interruption Materielle/objects/lvc-pins.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/6_9 - Interruption Materielle/objects/button.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/6_9 - Interruption Materielle/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega2560/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
