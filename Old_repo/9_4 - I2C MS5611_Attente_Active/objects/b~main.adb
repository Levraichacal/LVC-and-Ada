pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E18 : Short_Integer; pragma Import (Ada, E18, "avr__real_time__clock_E");
   E20 : Short_Integer; pragma Import (Ada, E20, "avr__real_time__clock_impl_E");
   E16 : Short_Integer; pragma Import (Ada, E16, "avr__real_time__delays_E");
   E44 : Short_Integer; pragma Import (Ada, E44, "lvc__pins_E");
   E42 : Short_Integer; pragma Import (Ada, E42, "lvc__i2c_E");
   E46 : Short_Integer; pragma Import (Ada, E46, "ms5611_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E20 := E20 + 1;
      E18 := E18 + 1;
      E16 := E16 + 1;
      E44 := E44 + 1;
      E42 := E42 + 1;
      E46 := E46 + 1;
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
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/9_4 - I2C MS5611_Attente_Active/objects/lvc.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/9_4 - I2C MS5611_Attente_Active/objects/lvc-pins.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/9_4 - I2C MS5611_Attente_Active/objects/lvc-i2c.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/9_4 - I2C MS5611_Attente_Active/objects/ms5611.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/9_4 - I2C MS5611_Attente_Active/objects/main.o
   --   -L/home/touneseb/Dropbox/AdaProg/AdaProg/9_4 - I2C MS5611_Attente_Active/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
