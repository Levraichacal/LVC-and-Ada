pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~lcd_test.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~lcd_test.adb");

package body ada_main is
   pragma Warnings (Off);

   E31 : Short_Integer; pragma Import (Ada, E31, "lcd_E");
   E16 : Short_Integer; pragma Import (Ada, E16, "avr__real_time__clock_E");
   E18 : Short_Integer; pragma Import (Ada, E18, "avr__real_time__clock_impl_E");
   E14 : Short_Integer; pragma Import (Ada, E14, "avr__real_time__delays_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      LCD'ELAB_BODY;
      E31 := E31 + 1;
      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E18 := E18 + 1;
      E16 := E16 + 1;
      E14 := E14 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma No_Return (Ada_Main_Program);
   pragma Import (Ada, Ada_Main_Program, "_ada_lcd_test");

   procedure main is
   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/ada.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-except.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-unstyp.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/objects/lcd-wiring.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/objects/lcd.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/objects/lcd_test.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/25_2 - Ecran1602  nombre/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
