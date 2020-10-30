pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~test_74hc595.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~test_74hc595.adb");

package body ada_main is
   pragma Warnings (Off);

   E18 : Short_Integer; pragma Import (Ada, E18, "avr__real_time__clock_E");
   E20 : Short_Integer; pragma Import (Ada, E20, "avr__real_time__clock_impl_E");
   E16 : Short_Integer; pragma Import (Ada, E16, "avr__real_time__delays_E");
   E33 : Short_Integer; pragma Import (Ada, E33, "lib_74hc595_E");
   E36 : Short_Integer; pragma Import (Ada, E36, "lvc__digitalwrite_E");
   E39 : Short_Integer; pragma Import (Ada, E39, "lvc__pinmode_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E20 := E20 + 1;
      E18 := E18 + 1;
      E16 := E16 + 1;
      E36 := E36 + 1;
      E39 := E39 + 1;
      E33 := E33 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma No_Return (Ada_Main_Program);
   pragma Import (Ada, Ada_Main_Program, "_ada_test_74hc595");

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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-unstyp.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-caldel.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/35_5 - 74HC595 par 2/objects/lvc.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/35_5 - 74HC595 par 2/objects/lvc-pins.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/35_5 - 74HC595 par 2/objects/test_74hc595.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/35_5 - 74HC595 par 2/objects/lvc-digitalwrite.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/35_5 - 74HC595 par 2/objects/lvc-pinmode.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/35_5 - 74HC595 par 2/objects/lib_74hc595.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/35_5 - 74HC595 par 2/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
