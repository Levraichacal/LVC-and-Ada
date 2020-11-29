pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E03 : Short_Integer; pragma Import (Ada, E03, "button_E");
   E16 : Short_Integer; pragma Import (Ada, E16, "lvc__time_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      E03 := E03 + 1;
      E16 := E16 + 1;
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
   --   /home/helipse/Documents/git/LVC-and-Ada/Old_repo/6_11 - Interruption Materielle sur Uno With Timer/objects/main.o
   --   /home/helipse/Documents/git/LVC-and-Ada/Old_repo/6_11 - Interruption Materielle sur Uno With Timer/objects/lvc.o
   --   /home/helipse/Documents/git/LVC-and-Ada/Old_repo/6_11 - Interruption Materielle sur Uno With Timer/objects/button.o
   --   /home/helipse/Documents/git/LVC-and-Ada/Old_repo/6_11 - Interruption Materielle sur Uno With Timer/objects/lvc-utils.o
   --   /home/helipse/Documents/git/LVC-and-Ada/Old_repo/6_11 - Interruption Materielle sur Uno With Timer/objects/lvc-time.o
   --   -L/home/helipse/Documents/git/LVC-and-Ada/Old_repo/6_11 - Interruption Materielle sur Uno With Timer/objects/
   --   -L/opt/avrada/avr/lib/gnat/avr_lib/atmega328p/lib/
   --   -L/opt/avrada/lib/gcc/avr/4.7.0/rts/avr5/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
