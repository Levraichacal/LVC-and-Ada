pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~mpu6000.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~mpu6000.adb");

package body ada_main is
   pragma Warnings (Off);

   E21 : Short_Integer; pragma Import (Ada, E21, "avr__real_time__clock_E");
   E23 : Short_Integer; pragma Import (Ada, E23, "avr__real_time__clock_impl_E");
   E19 : Short_Integer; pragma Import (Ada, E19, "avr__real_time__delays_E");
   E43 : Short_Integer; pragma Import (Ada, E43, "soft_spi_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E23 := E23 + 1;
      E21 := E21 + 1;
      E19 := E19 + 1;
      Soft_Spi'Elab_Body;
      E43 := E43 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma No_Return (Ada_Main_Program);
   pragma Import (Ada, Ada_Main_Program, "_ada_mpu6000");

   procedure main is
   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/ada.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/a-calend.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/a-except.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-stoele.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-unstyp.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/a-caldel.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/5 - MPU 6000/objects/soft_spi.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/5 - MPU 6000/objects/mpu6000.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/5 - MPU 6000/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega2560/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
