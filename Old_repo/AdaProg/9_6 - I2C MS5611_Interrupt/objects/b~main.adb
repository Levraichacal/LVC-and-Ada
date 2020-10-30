pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E25 : Short_Integer; pragma Import (Ada, E25, "lvc__pins_E");
   E27 : Short_Integer; pragma Import (Ada, E27, "ms5611_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      E25 := E25 + 1;
      E27 := E27 + 1;
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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-stoele.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-unstyp.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/9_6 - I2C MS5611_Interrupt/objects/lvc.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/9_6 - I2C MS5611_Interrupt/objects/lvc-pins.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/9_6 - I2C MS5611_Interrupt/objects/ms5611.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/9_6 - I2C MS5611_Interrupt/objects/main.o
   --   -L/home/touneseb/Dropbox/AdaProg/AdaProg/9_6 - I2C MS5611_Interrupt/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
