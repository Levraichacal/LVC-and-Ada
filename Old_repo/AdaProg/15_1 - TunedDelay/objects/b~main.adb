pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E07 : Short_Integer; pragma Import (Ada, E07, "lvc__pins_E");
   E03 : Short_Integer; pragma Import (Ada, E03, "tuneddelay_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      E07 := E07 + 1;
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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/ada.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-unstyp.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/15_1 - TunedDelay/objects/lvc.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/15_1 - TunedDelay/objects/lvc-pins.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/15_1 - TunedDelay/objects/tuneddelay.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/15_1 - TunedDelay/objects/main.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/15_1 - TunedDelay/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
