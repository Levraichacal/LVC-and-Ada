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
   u00001 : constant Version_32 := 16#67cf5bed#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#ea903ba5#;
   pragma Export (C, u00002, "avrB");
   u00003 : constant Version_32 := 16#a0e48464#;
   pragma Export (C, u00003, "avrS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#79c9d4cf#;
   pragma Export (C, u00005, "interfacesS");
   u00006 : constant Version_32 := 16#d9160d8e#;
   pragma Export (C, u00006, "system__unsigned_typesS");
   u00007 : constant Version_32 := 16#bf56466d#;
   pragma Export (C, u00007, "systemS");
   u00008 : constant Version_32 := 16#a7504ddc#;
   pragma Export (C, u00008, "avr__interruptsB");
   u00009 : constant Version_32 := 16#a7a1b728#;
   pragma Export (C, u00009, "avr__interruptsS");
   u00010 : constant Version_32 := 16#b6bfb352#;
   pragma Export (C, u00010, "lvcS");
   u00011 : constant Version_32 := 16#1eb14c0b#;
   pragma Export (C, u00011, "lvc__interruptS");
   u00012 : constant Version_32 := 16#1ee02822#;
   pragma Export (C, u00012, "lvc__pinsB");
   u00013 : constant Version_32 := 16#cede8e34#;
   pragma Export (C, u00013, "lvc__pinsS");
   u00014 : constant Version_32 := 16#2cdeab82#;
   pragma Export (C, u00014, "avr__mcuS");
   u00015 : constant Version_32 := 16#9ecd08e4#;
   pragma Export (C, u00015, "avr__atmega328pS");
   u00016 : constant Version_32 := 16#ec56821a#;
   pragma Export (C, u00016, "lvc__interrupt__timer1B");
   u00017 : constant Version_32 := 16#f39b1b91#;
   pragma Export (C, u00017, "lvc__interrupt__timer1S");
   u00018 : constant Version_32 := 16#0a62f2b1#;
   pragma Export (C, u00018, "lvc__interrupt__usartB");
   u00019 : constant Version_32 := 16#57d2f154#;
   pragma Export (C, u00019, "lvc__interrupt__usartS");
   u00020 : constant Version_32 := 16#fc6d7887#;
   pragma Export (C, u00020, "lvc__timer1B");
   u00021 : constant Version_32 := 16#e2bbbd9b#;
   pragma Export (C, u00021, "lvc__timer1S");
   u00022 : constant Version_32 := 16#5b177588#;
   pragma Export (C, u00022, "lvc__usartB");
   u00023 : constant Version_32 := 16#40216df9#;
   pragma Export (C, u00023, "lvc__usartS");
   u00024 : constant Version_32 := 16#40d285eb#;
   pragma Export (C, u00024, "timeruartfunctionsB");
   u00025 : constant Version_32 := 16#b0b149b7#;
   pragma Export (C, u00025, "timeruartfunctionsS");
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
   --  lvc%s
   --  lvc.pins%s
   --  lvc.pins%b
   --  lvc.interrupt%s
   --  lvc.interrupt.timer1%s
   --  lvc.interrupt.timer1%b
   --  lvc.interrupt.usart%s
   --  lvc.interrupt.usart%b
   --  lvc.timer1%s
   --  lvc.timer1%b
   --  lvc.usart%s
   --  lvc.usart%b
   --  timeruartfunctions%s
   --  timeruartfunctions%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;
