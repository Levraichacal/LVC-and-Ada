pragma Ada_95;
pragma Restrictions (No_Exception_Propagation);
with System;
package ada_main is
   pragma Warnings (Off);


   GNAT_Version : constant String :=
                    "GNAT Version: 4.7.2" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma No_Return (main);
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#b02b4152#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#91391aa5#;
   pragma Export (C, u00002, "ada__calendar__delaysS");
   u00003 : constant Version_32 := 16#13c4ef93#;
   pragma Export (C, u00003, "ada__calendarS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#79c9d4cf#;
   pragma Export (C, u00005, "interfacesS");
   u00006 : constant Version_32 := 16#ea903ba5#;
   pragma Export (C, u00006, "avrB");
   u00007 : constant Version_32 := 16#a0e48464#;
   pragma Export (C, u00007, "avrS");
   u00008 : constant Version_32 := 16#d9160d8e#;
   pragma Export (C, u00008, "system__unsigned_typesS");
   u00009 : constant Version_32 := 16#bf56466d#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#4b50d95c#;
   pragma Export (C, u00010, "avr__real_timeB");
   u00011 : constant Version_32 := 16#22293d6a#;
   pragma Export (C, u00011, "avr__real_timeS");
   u00012 : constant Version_32 := 16#0a5e98d6#;
   pragma Export (C, u00012, "avr__int_imgB");
   u00013 : constant Version_32 := 16#36bdae4d#;
   pragma Export (C, u00013, "avr__int_imgS");
   u00014 : constant Version_32 := 16#4a6d8682#;
   pragma Export (C, u00014, "avr__stringsS");
   u00015 : constant Version_32 := 16#6675d552#;
   pragma Export (C, u00015, "avr__real_time__delaysB");
   u00016 : constant Version_32 := 16#66fd42f7#;
   pragma Export (C, u00016, "avr__real_time__delaysS");
   u00017 : constant Version_32 := 16#40fc3ec7#;
   pragma Export (C, u00017, "avr__real_time__clockB");
   u00018 : constant Version_32 := 16#604ee8a8#;
   pragma Export (C, u00018, "avr__real_time__clockS");
   u00019 : constant Version_32 := 16#a209b291#;
   pragma Export (C, u00019, "avr__real_time__clock_implB");
   u00020 : constant Version_32 := 16#85540fd3#;
   pragma Export (C, u00020, "avr__real_time__clock_implS");
   u00021 : constant Version_32 := 16#80aa7db4#;
   pragma Export (C, u00021, "avr__configS");
   u00022 : constant Version_32 := 16#a7504ddc#;
   pragma Export (C, u00022, "avr__interruptsB");
   u00023 : constant Version_32 := 16#a7a1b728#;
   pragma Export (C, u00023, "avr__interruptsS");
   u00024 : constant Version_32 := 16#c333e27a#;
   pragma Export (C, u00024, "avr__timer0B");
   u00025 : constant Version_32 := 16#7c49cd8e#;
   pragma Export (C, u00025, "avr__timer0S");
   u00026 : constant Version_32 := 16#10aa2dfb#;
   pragma Export (C, u00026, "ada__exceptionsB");
   u00027 : constant Version_32 := 16#dbf5c75a#;
   pragma Export (C, u00027, "ada__exceptionsS");
   u00028 : constant Version_32 := 16#2cdeab82#;
   pragma Export (C, u00028, "avr__mcuS");
   u00029 : constant Version_32 := 16#9ecd08e4#;
   pragma Export (C, u00029, "avr__atmega328pS");
   u00030 : constant Version_32 := 16#e4660a6b#;
   pragma Export (C, u00030, "avr__sleepB");
   u00031 : constant Version_32 := 16#87df0c2f#;
   pragma Export (C, u00031, "avr__sleepS");
   u00032 : constant Version_32 := 16#f5144c48#;
   pragma Export (C, u00032, "avr__uartB");
   u00033 : constant Version_32 := 16#8b039469#;
   pragma Export (C, u00033, "avr__uartS");
   u00034 : constant Version_32 := 16#ad5513f6#;
   pragma Export (C, u00034, "avr__uart_configS");
   u00035 : constant Version_32 := 16#62cb69d8#;
   pragma Export (C, u00035, "avr__programspaceB");
   u00036 : constant Version_32 := 16#38c6863a#;
   pragma Export (C, u00036, "avr__programspaceS");
   u00037 : constant Version_32 := 16#854990f2#;
   pragma Export (C, u00037, "system__machine_codeS");
   u00038 : constant Version_32 := 16#e808fc9d#;
   pragma Export (C, u00038, "system__storage_elementsB");
   u00039 : constant Version_32 := 16#681f2876#;
   pragma Export (C, u00039, "system__storage_elementsS");
   u00040 : constant Version_32 := 16#62d2f06d#;
   pragma Export (C, u00040, "hc_sr04B");
   u00041 : constant Version_32 := 16#8945ad53#;
   pragma Export (C, u00041, "hc_sr04S");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.calendar%s
   --  interfaces%s
   --  system%s
   --  ada.exceptions%s
   --  ada.exceptions%b
   --  system.machine_code%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.unsigned_types%s
   --  ada.calendar.delays%s
   --  avr%s
   --  avr%b
   --  avr.atmega328p%s
   --  avr.config%s
   --  avr.interrupts%s
   --  avr.interrupts%b
   --  avr.mcu%s
   --  avr.programspace%s
   --  avr.programspace%b
   --  avr.sleep%s
   --  avr.sleep%b
   --  avr.strings%s
   --  avr.int_img%s
   --  avr.int_img%b
   --  avr.real_time%s
   --  avr.real_time%b
   --  avr.timer0%s
   --  avr.timer0%b
   --  avr.uart%s
   --  avr.uart_config%s
   --  avr.uart%b
   --  avr.real_time.clock%s
   --  avr.real_time.clock_impl%s
   --  avr.real_time.clock_impl%b
   --  avr.real_time.clock%b
   --  avr.real_time.delays%s
   --  avr.real_time.delays%b
   --  hc_sr04%s
   --  hc_sr04%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;
