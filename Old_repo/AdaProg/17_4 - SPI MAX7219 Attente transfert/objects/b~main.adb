pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E24 : Short_Integer; pragma Import (Ada, E24, "avr__real_time__clock_E");
   E26 : Short_Integer; pragma Import (Ada, E26, "avr__real_time__clock_impl_E");
   E22 : Short_Integer; pragma Import (Ada, E22, "avr__real_time__delays_E");
   E36 : Short_Integer; pragma Import (Ada, E36, "lvc__pins_E");
   E03 : Short_Integer; pragma Import (Ada, E03, "spi_max7219_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E26 := E26 + 1;
      E24 := E24 + 1;
      E22 := E22 + 1;
      E36 := E36 + 1;
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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-calend.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-except.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-unstyp.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-caldel.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/17_4 - SPI MAX7219 Attente transfert/objects/lvc.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/17_4 - SPI MAX7219 Attente transfert/objects/lvc-pins.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/17_4 - SPI MAX7219 Attente transfert/objects/spi_max7219.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/17_4 - SPI MAX7219 Attente transfert/objects/main.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/17_4 - SPI MAX7219 Attente transfert/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
