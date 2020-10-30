pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E28 : Short_Integer; pragma Import (Ada, E28, "lvc__pwm__timer5_E");
   E24 : Short_Integer; pragma Import (Ada, E24, "timer5pwm_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      E28 := E28 + 1;
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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-stoele.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/s-unstyp.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/7_13 - PWM_Timer5/objects/lvc.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/7_13 - PWM_Timer5/objects/lvc-pwm.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/7_13 - PWM_Timer5/objects/lvc-pwm-timer5.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/7_13 - PWM_Timer5/objects/timer5pwm.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/7_13 - PWM_Timer5/objects/main.o
   --   -L/home/touneseb/Dropbox/AdaProg/AdaProg/7_13 - PWM_Timer5/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega2560/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr6/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
