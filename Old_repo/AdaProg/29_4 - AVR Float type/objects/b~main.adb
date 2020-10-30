pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E18 : Short_Integer; pragma Import (Ada, E18, "avr__real_time__clock_E");
   E20 : Short_Integer; pragma Import (Ada, E20, "avr__real_time__clock_impl_E");
   E16 : Short_Integer; pragma Import (Ada, E16, "avr__real_time__delays_E");
   E33 : Short_Integer; pragma Import (Ada, E33, "avrieeefloat_E");
   E43 : Short_Integer; pragma Import (Ada, E43, "avrieeefloatlcd_E");
   E45 : Short_Integer; pragma Import (Ada, E45, "i2c_ecran1602_E");
   E47 : Short_Integer; pragma Import (Ada, E47, "two_wire_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E20 := E20 + 1;
      E18 := E18 + 1;
      E16 := E16 + 1;
      E33 := E33 + 1;
      E43 := E43 + 1;
      E47 := E47 + 1;
      E45 := E45 + 1;
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
   --   /home/helipse/Dropbox/AdaProg/AdaProg/29_4 - AVR Float type/objects/avrieeefloat.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/29_4 - AVR Float type/objects/avrieeefloatlcd.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/29_4 - AVR Float type/objects/main.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/29_4 - AVR Float type/objects/two_wire.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/29_4 - AVR Float type/objects/i2c_ecran1602.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/29_4 - AVR Float type/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
