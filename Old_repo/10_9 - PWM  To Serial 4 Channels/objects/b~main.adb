pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E16 : Short_Integer; pragma Import (Ada, E16, "lvc__pins_E");
   E03 : Short_Integer; pragma Import (Ada, E03, "pwmtoserial_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      E16 := E16 + 1;
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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-unstyp.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/10_9 - PWM  To Serial 4 Channels/objects/lvc.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/10_9 - PWM  To Serial 4 Channels/objects/lvc-pins.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/10_9 - PWM  To Serial 4 Channels/objects/pwmtoserial.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/10_9 - PWM  To Serial 4 Channels/objects/main.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/10_9 - PWM  To Serial 4 Channels/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
