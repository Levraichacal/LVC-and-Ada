pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E22 : Short_Integer; pragma Import (Ada, E22, "avr__real_time__clock_E");
   E24 : Short_Integer; pragma Import (Ada, E24, "avr__real_time__clock_impl_E");
   E20 : Short_Integer; pragma Import (Ada, E20, "avr__real_time__delays_E");
   E42 : Short_Integer; pragma Import (Ada, E42, "lvc__timer0_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E24 := E24 + 1;
      E22 := E22 + 1;
      E20 := E20 + 1;
      E42 := E42 + 1;
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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-calend.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-except.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-stoele.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-unstyp.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-caldel.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/28_2 - Fonction Temps arduino 2/objects/lvc.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/28_2 - Fonction Temps arduino 2/objects/lvc-timer0.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/28_2 - Fonction Temps arduino 2/objects/main.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/28_2 - Fonction Temps arduino 2/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
