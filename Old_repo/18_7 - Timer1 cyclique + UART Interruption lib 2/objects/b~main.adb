pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E13 : Short_Integer; pragma Import (Ada, E13, "lvc__pins_E");
   E17 : Short_Integer; pragma Import (Ada, E17, "lvc__interrupt__timer1_E");
   E19 : Short_Integer; pragma Import (Ada, E19, "lvc__interrupt__usart_E");
   E21 : Short_Integer; pragma Import (Ada, E21, "lvc__timer1_E");
   E23 : Short_Integer; pragma Import (Ada, E23, "lvc__usart_E");
   E25 : Short_Integer; pragma Import (Ada, E25, "timeruartfunctions_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      E13 := E13 + 1;
      E17 := E17 + 1;
      E19 := E19 + 1;
      E21 := E21 + 1;
      E23 := E23 + 1;
      E25 := E25 + 1;
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
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/18_7 - Timer1 cyclique + UART Interruption lib 2/objects/lvc.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/18_7 - Timer1 cyclique + UART Interruption lib 2/objects/lvc-pins.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/18_7 - Timer1 cyclique + UART Interruption lib 2/objects/lvc-interrupt.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/18_7 - Timer1 cyclique + UART Interruption lib 2/objects/lvc-interrupt-timer1.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/18_7 - Timer1 cyclique + UART Interruption lib 2/objects/lvc-interrupt-usart.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/18_7 - Timer1 cyclique + UART Interruption lib 2/objects/lvc-timer1.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/18_7 - Timer1 cyclique + UART Interruption lib 2/objects/lvc-usart.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/18_7 - Timer1 cyclique + UART Interruption lib 2/objects/timeruartfunctions.o
   --   /home/touneseb/Dropbox/AdaProg/AdaProg/18_7 - Timer1 cyclique + UART Interruption lib 2/objects/main.o
   --   -L/home/touneseb/Dropbox/AdaProg/AdaProg/18_7 - Timer1 cyclique + UART Interruption lib 2/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
