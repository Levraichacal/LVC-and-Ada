pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E24 : Short_Integer; pragma Import (Ada, E24, "avr__real_time__clock_E");
   E26 : Short_Integer; pragma Import (Ada, E26, "avr__real_time__clock_impl_E");
   E22 : Short_Integer; pragma Import (Ada, E22, "avr__real_time__delays_E");
   E36 : Short_Integer; pragma Import (Ada, E36, "lvc__pins_E");
   E03 : Short_Integer; pragma Import (Ada, E03, "visca2560_E");

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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/ada.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/a-calend.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/a-except.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-unstyp.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/a-caldel.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/16_2 - Visca FCBEH6300 - 2560 RX0TX1/objects/lvc.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/16_2 - Visca FCBEH6300 - 2560 RX0TX1/objects/lvc-pins.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/16_2 - Visca FCBEH6300 - 2560 RX0TX1/objects/visca2560.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/16_2 - Visca FCBEH6300 - 2560 RX0TX1/objects/main.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/16_2 - Visca FCBEH6300 - 2560 RX0TX1/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega2560/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
