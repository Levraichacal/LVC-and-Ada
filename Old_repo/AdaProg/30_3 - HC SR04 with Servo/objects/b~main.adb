pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E18 : Short_Integer; pragma Import (Ada, E18, "avr__real_time__clock_E");
   E20 : Short_Integer; pragma Import (Ada, E20, "avr__real_time__clock_impl_E");
   E16 : Short_Integer; pragma Import (Ada, E16, "avr__real_time__delays_E");
   E41 : Short_Integer; pragma Import (Ada, E41, "hc_sr04_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E20 := E20 + 1;
      E18 := E18 + 1;
      E16 := E16 + 1;
      E41 := E41 + 1;
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
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/a-calend.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/interfac.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/system.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/a-except.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/s-maccod.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/s-stoele.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/s-unstyp.o
   --   /opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/a-caldel.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/30_3 - HC SR04 with Servo/objects/hc_sr04.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/30_3 - HC SR04 with Servo/objects/main.o
   --   -L/home/touneseb/Dropbox/AdaProg/AdaProg/30_3 - HC SR04 with Servo/objects/
   --   -L/opt/avr-ada/avr-ada-122/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avr-ada/avr-ada-122/lib/gcc/avr/4.7.2/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
