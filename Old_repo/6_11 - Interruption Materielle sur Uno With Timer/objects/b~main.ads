pragma Ada_95;
pragma Restrictions (No_Exception_Propagation);
with System;
package ada_main is
   pragma Warnings (Off);


   GNAT_Version : constant String :=
                    "GNAT Version: 4.7.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma No_Return (main);
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#3493cf76#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#b6f35c74#;
   pragma Export (C, u00002, "buttonB");
   u00003 : constant Version_32 := 16#8d73c146#;
   pragma Export (C, u00003, "buttonS");
   u00004 : constant Version_32 := 16#ea903ba5#;
   pragma Export (C, u00004, "avrB");
   u00005 : constant Version_32 := 16#a0e48464#;
   pragma Export (C, u00005, "avrS");
   u00006 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#79c9d4cf#;
   pragma Export (C, u00007, "interfacesS");
   u00008 : constant Version_32 := 16#d9160d8e#;
   pragma Export (C, u00008, "system__unsigned_typesS");
   u00009 : constant Version_32 := 16#bf56466d#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#a7504ddc#;
   pragma Export (C, u00010, "avr__interruptsB");
   u00011 : constant Version_32 := 16#a7a1b728#;
   pragma Export (C, u00011, "avr__interruptsS");
   u00012 : constant Version_32 := 16#2cdeab82#;
   pragma Export (C, u00012, "avr__mcuS");
   u00013 : constant Version_32 := 16#9ecd08e4#;
   pragma Export (C, u00013, "avr__atmega328pS");
   u00014 : constant Version_32 := 16#b6bfb352#;
   pragma Export (C, u00014, "lvcS");
   u00015 : constant Version_32 := 16#7e0a113f#;
   pragma Export (C, u00015, "lvc__timeB");
   u00016 : constant Version_32 := 16#8622c0f5#;
   pragma Export (C, u00016, "lvc__timeS");
   u00017 : constant Version_32 := 16#fd1abc9f#;
   pragma Export (C, u00017, "lvc__utilsS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.unsigned_types%s
   --  avr%s
   --  avr%b
   --  avr.atmega328p%s
   --  avr.interrupts%s
   --  avr.interrupts%b
   --  avr.mcu%s
   --  button%s
   --  main%b
   --  lvc%s
   --  lvc.time%s
   --  button%b
   --  lvc.utils%s
   --  lvc.time%b
   --  END ELABORATION ORDER


end ada_main;
