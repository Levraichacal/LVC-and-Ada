pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E40 : Short_Integer; pragma Import (Ada, E40, "lcd_E");
   E43 : Short_Integer; pragma Import (Ada, E43, "one_wire_E");
   E22 : Short_Integer; pragma Import (Ada, E22, "avr__real_time__clock_E");
   E24 : Short_Integer; pragma Import (Ada, E24, "avr__real_time__clock_impl_E");
   E31 : Short_Integer; pragma Import (Ada, E31, "avr__real_time__delays_E");
   E51 : Short_Integer; pragma Import (Ada, E51, "one_wire__temperature_sensors_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      LCD'ELAB_BODY;
      E40 := E40 + 1;
      One_Wire'Elab_Body;
      E43 := E43 + 1;
      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E24 := E24 + 1;
      E22 := E22 + 1;
      E31 := E31 + 1;
      E51 := E51 + 1;
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
   --   /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/crc8.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/lcd-wiring.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/lcd.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/one_wire-avr_wiring.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/one_wire.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/one_wire-commands.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/one_wire-rom.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/one_wire-search.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/temperatures.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/one_wire-temperature_sensors.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/main.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/26_2 - 18B20 Ecran1602/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
