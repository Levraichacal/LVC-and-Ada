pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E18 : Short_Integer; pragma Import (Ada, E18, "avr__real_time__clock_E");
   E20 : Short_Integer; pragma Import (Ada, E20, "avr__real_time__clock_impl_E");
   E16 : Short_Integer; pragma Import (Ada, E16, "avr__real_time__delays_E");
   E40 : Short_Integer; pragma Import (Ada, E40, "i2c_ecran1602_E");
   E38 : Short_Integer; pragma Import (Ada, E38, "lvc__pins_E");
   E33 : Short_Integer; pragma Import (Ada, E33, "dht11_E");
   E36 : Short_Integer; pragma Import (Ada, E36, "lvc__timer0_E");
   E42 : Short_Integer; pragma Import (Ada, E42, "two_wire_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      AVR.REAL_TIME.CLOCK_IMPL'ELAB_BODY;
      E20 := E20 + 1;
      E18 := E18 + 1;
      E16 := E16 + 1;
      E38 := E38 + 1;
      E36 := E36 + 1;
      E33 := E33 + 1;
      E42 := E42 + 1;
      E40 := E40 + 1;
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
   --   /home/helipse/Dropbox/AdaProg/AdaProg/27_2 - DHT11 Ecran LCD/objects/lvc.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/27_2 - DHT11 Ecran LCD/objects/lvc-pins.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/27_2 - DHT11 Ecran LCD/objects/main.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/27_2 - DHT11 Ecran LCD/objects/lvc-timer0.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/27_2 - DHT11 Ecran LCD/objects/dht11.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/27_2 - DHT11 Ecran LCD/objects/two_wire.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/27_2 - DHT11 Ecran LCD/objects/i2c_ecran1602.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/27_2 - DHT11 Ecran LCD/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
