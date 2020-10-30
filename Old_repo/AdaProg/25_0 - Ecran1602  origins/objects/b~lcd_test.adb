pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~lcd_test.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~lcd_test.adb");

package body ada_main is
   pragma Warnings (Off);

   E33 : Short_Integer; pragma Import (Ada, E33, "lcd_E");
   E20 : Short_Integer; pragma Import (Ada, E20, "avr__real_time__clock_E");
   E22 : Short_Integer; pragma Import (Ada, E22, "avr__real_time__clock_impl_E");
   E18 : Short_Integer; pragma Import (Ada, E18, "avr__real_time__delays_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      LCD'ELAB_BODY;
      E33 := E33 + 1;
      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E22 := E22 + 1;
      E20 := E20 + 1;
      E18 := E18 + 1;
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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-calend.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-except.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-unstyp.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-caldel.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/25_0 - Ecran1602  origins/objects/lcd-wiring.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/25_0 - Ecran1602  origins/objects/lcd.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/25_0 - Ecran1602  origins/objects/lcd_test.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/25_0 - Ecran1602  origins/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
