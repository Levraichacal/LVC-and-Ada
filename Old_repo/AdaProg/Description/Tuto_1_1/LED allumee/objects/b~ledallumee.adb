pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~ledallumee.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~ledallumee.adb");

package body ada_main is
   pragma Warnings (Off);


   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

   end adainit;

   procedure Ada_Main_Program;
   pragma No_Return (Ada_Main_Program);
   pragma Import (Ada, Ada_Main_Program, "_ada_ledallumee");

   procedure main is
   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/ada.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-unstyp.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/Description/Tuto_1_1/LED allumee/objects/ledallumee.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/Description/Tuto_1_1/LED allumee/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
