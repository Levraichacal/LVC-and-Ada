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
   u00001 : constant Version_32 := 16#7e03c890#;
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
   u00008 : constant Version_32 := 16#4918ba73#;
   pragma Export (C, u00008, "avr__uartB");
   u00009 : constant Version_32 := 16#8b039469#;
   pragma Export (C, u00009, "avr__uartS");
   u00010 : constant Version_32 := 16#0a5e98d6#;
   pragma Export (C, u00010, "avr__int_imgB");
   u00011 : constant Version_32 := 16#36bdae4d#;
   pragma Export (C, u00011, "avr__int_imgS");
   u00012 : constant Version_32 := 16#4a6d8682#;
   pragma Export (C, u00012, "avr__stringsS");
   u00013 : constant Version_32 := 16#a7504ddc#;
   pragma Export (C, u00013, "avr__interruptsB");
   u00014 : constant Version_32 := 16#a7a1b728#;
   pragma Export (C, u00014, "avr__interruptsS");
   u00015 : constant Version_32 := 16#d3bce54f#;
   pragma Export (C, u00015, "avr__mcuS");
   u00016 : constant Version_32 := 16#04616bc0#;
   pragma Export (C, u00016, "avr__atmega2560S");
   u00017 : constant Version_32 := 16#1159e5cd#;
   pragma Export (C, u00017, "avr__uart_configS");
   u00018 : constant Version_32 := 16#07054431#;
   pragma Export (C, u00018, "avr__programspaceB");
   u00019 : constant Version_32 := 16#38c6863a#;
   pragma Export (C, u00019, "avr__programspaceS");
   u00020 : constant Version_32 := 16#854990f2#;
   pragma Export (C, u00020, "system__machine_codeS");
   u00021 : constant Version_32 := 16#e808fc9d#;
   pragma Export (C, u00021, "system__storage_elementsB");
   u00022 : constant Version_32 := 16#681f2876#;
   pragma Export (C, u00022, "system__storage_elementsS");
   u00023 : constant Version_32 := 16#baaf8402#;
   pragma Export (C, u00023, "timer1pwmB");
   u00024 : constant Version_32 := 16#e2b5d359#;
   pragma Export (C, u00024, "timer1pwmS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.machine_code%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.unsigned_types%s
   --  avr%s
   --  avr%b
   --  avr.atmega2560%s
   --  avr.interrupts%s
   --  avr.interrupts%b
   --  avr.mcu%s
   --  avr.programspace%s
   --  avr.programspace%b
   --  avr.strings%s
   --  avr.int_img%s
   --  avr.int_img%b
   --  avr.uart%s
   --  avr.uart_config%s
   --  avr.uart%b
   --  timer1pwm%s
   --  timer1pwm%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;
