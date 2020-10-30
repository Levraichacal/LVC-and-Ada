pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E16 : Short_Integer; pragma Import (Ada, E16, "avr__real_time__clock_E");
   E18 : Short_Integer; pragma Import (Ada, E18, "avr__real_time__clock_impl_E");
   E14 : Short_Integer; pragma Import (Ada, E14, "avr__real_time__delays_E");
   E31 : Short_Integer; pragma Import (Ada, E31, "i2c_ecran1602_E");
   E35 : Short_Integer; pragma Import (Ada, E35, "two_wire_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E18 := E18 + 1;
      E16 := E16 + 1;
      E14 := E14 + 1;
      E35 := E35 + 1;
      E31 := E31 + 1;
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
   --   /home/helipse/Dropbox/AdaProg/AdaProg/24_5 - I2C Ecran1602 nombre flottant/objects/main.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/24_5 - I2C Ecran1602 nombre flottant/objects/two_wire.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/24_5 - I2C Ecran1602 nombre flottant/objects/i2c_ecran1602.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/24_5 - I2C Ecran1602 nombre flottant/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
