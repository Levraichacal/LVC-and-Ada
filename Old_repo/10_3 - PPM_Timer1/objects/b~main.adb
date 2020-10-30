pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E32 : Short_Integer; pragma Import (Ada, E32, "avr__real_time__clock_E");
   E34 : Short_Integer; pragma Import (Ada, E34, "avr__real_time__clock_impl_E");
   E30 : Short_Integer; pragma Import (Ada, E30, "avr__real_time__delays_E");
   E45 : Short_Integer; pragma Import (Ada, E45, "lvc__pwm__timer1_E");
   E24 : Short_Integer; pragma Import (Ada, E24, "timer1pwm_E");

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
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/ada.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-calend.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/interfac.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/system.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-except.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-maccod.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-stoele.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/s-unstyp.o
   --   /opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/a-caldel.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/10_3 - PPM_Timer1/objects/lvc.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/10_3 - PPM_Timer1/objects/lvc-pwm.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/10_3 - PPM_Timer1/objects/lvc-pwm-timer1.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/10_3 - PPM_Timer1/objects/timer1pwm.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/10_3 - PPM_Timer1/objects/main.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/10_3 - PPM_Timer1/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
