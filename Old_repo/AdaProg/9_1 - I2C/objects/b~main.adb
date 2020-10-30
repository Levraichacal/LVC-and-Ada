pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E32 : Short_Integer; pragma Import (Ada, E32, "avr__real_time__clock_E");
   E34 : Short_Integer; pragma Import (Ada, E34, "avr__real_time__clock_impl_E");
   E30 : Short_Integer; pragma Import (Ada, E30, "avr__real_time__delays_E");
   E45 : Short_Integer; pragma Import (Ada, E45, "lvc__com__spi_E");
   E24 : Short_Integer; pragma Import (Ada, E24, "spi_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E34 := E34 + 1;
      E32 := E32 + 1;
      E30 := E30 + 1;
      E45 := E45 + 1;
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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/a-calend.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/a-except.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-stoele.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-unstyp.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/a-caldel.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/8-1 - SPI_Master_Helloworld/objects/lvc.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/8-1 - SPI_Master_Helloworld/objects/lvc-com.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/8-1 - SPI_Master_Helloworld/objects/lvc-com-spi.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/8-1 - SPI_Master_Helloworld/objects/spi.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/8-1 - SPI_Master_Helloworld/objects/main.o
   --   -L/home/touneseb/Dropbox/AdaProg/AdaProg/8-1 - SPI_Master_Helloworld/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega2560/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
