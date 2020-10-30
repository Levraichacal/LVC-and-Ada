pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~servopwm.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~servopwm.adb");

package body ada_main is
   pragma Warnings (Off);

   E03 : Short_Integer; pragma Import (Ada, E03, "gpio_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      E03 := E03 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma No_Return (Ada_Main_Program);
   pragma Import (Ada, Ada_Main_Program, "_ada_servopwm");

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
   --   /home/helipse/Dropbox/AdaProg/AdaProg/Site Internet Programme Ada/Uno-Projects/5-Servomotor/JoystickAndPWM/objects/gpio.o
   --   /home/helipse/Dropbox/AdaProg/AdaProg/Site Internet Programme Ada/Uno-Projects/5-Servomotor/JoystickAndPWM/objects/servopwm.o
   --   -L/home/helipse/Dropbox/AdaProg/AdaProg/Site Internet Programme Ada/Uno-Projects/5-Servomotor/JoystickAndPWM/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
