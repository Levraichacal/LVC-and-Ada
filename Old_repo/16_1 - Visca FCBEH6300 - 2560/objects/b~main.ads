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
   u00001 : constant Version_32 := 16#587b5194#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#f45b2144#;
   pragma Export (C, u00002, "visca2560B");
   u00003 : constant Version_32 := 16#3eae7bc5#;
   pragma Export (C, u00003, "visca2560S");
   u00004 : constant Version_32 := 16#91391aa5#;
   pragma Export (C, u00004, "ada__calendar__delaysS");
   u00005 : constant Version_32 := 16#13c4ef93#;
   pragma Export (C, u00005, "ada__calendarS");
   u00006 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#79c9d4cf#;
   pragma Export (C, u00007, "interfacesS");
   u00008 : constant Version_32 := 16#ea903ba5#;
   pragma Export (C, u00008, "avrB");
   u00009 : constant Version_32 := 16#a0e48464#;
   pragma Export (C, u00009, "avrS");
   u00010 : constant Version_32 := 16#d9160d8e#;
   pragma Export (C, u00010, "system__unsigned_typesS");
   u00011 : constant Version_32 := 16#bf56466d#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#a7504ddc#;
   pragma Export (C, u00012, "avr__interruptsB");
   u00013 : constant Version_32 := 16#a7a1b728#;
   pragma Export (C, u00013, "avr__interruptsS");
   u00014 : constant Version_32 := 16#d3bce54f#;
   pragma Export (C, u00014, "avr__mcuS");
   u00015 : constant Version_32 := 16#04616bc0#;
   pragma Export (C, u00015, "avr__atmega2560S");
   u00016 : constant Version_32 := 16#4b50d95c#;
   pragma Export (C, u00016, "avr__real_timeB");
   u00017 : constant Version_32 := 16#22293d6a#;
   pragma Export (C, u00017, "avr__real_timeS");
   u00018 : constant Version_32 := 16#0a5e98d6#;
   pragma Export (C, u00018, "avr__int_imgB");
   u00019 : constant Version_32 := 16#36bdae4d#;
   pragma Export (C, u00019, "avr__int_imgS");
   u00020 : constant Version_32 := 16#4a6d8682#;
   pragma Export (C, u00020, "avr__stringsS");
   u00021 : constant Version_32 := 16#6675d552#;
   pragma Export (C, u00021, "avr__real_time__delaysB");
   u00022 : constant Version_32 := 16#66fd42f7#;
   pragma Export (C, u00022, "avr__real_time__delaysS");
   u00023 : constant Version_32 := 16#40fc3ec7#;
   pragma Export (C, u00023, "avr__real_time__clockB");
   u00024 : constant Version_32 := 16#604ee8a8#;
   pragma Export (C, u00024, "avr__real_time__clockS");
   u00025 : constant Version_32 := 16#a209b291#;
   pragma Export (C, u00025, "avr__real_time__clock_implB");
   u00026 : constant Version_32 := 16#85540fd3#;
   pragma Export (C, u00026, "avr__real_time__clock_implS");
   u00027 : constant Version_32 := 16#80aa7db4#;
   pragma Export (C, u00027, "avr__configS");
   u00028 : constant Version_32 := 16#144fefc8#;
   pragma Export (C, u00028, "avr__timer0B");
   u00029 : constant Version_32 := 16#1987e067#;
   pragma Export (C, u00029, "avr__timer0S");
   u00030 : constant Version_32 := 16#10aa2dfb#;
   pragma Export (C, u00030, "ada__exceptionsB");
   u00031 : constant Version_32 := 16#dbf5c75a#;
   pragma Export (C, u00031, "ada__exceptionsS");
   u00032 : constant Version_32 := 16#81a82782#;
   pragma Export (C, u00032, "avr__sleepB");
   u00033 : constant Version_32 := 16#87df0c2f#;
   pragma Export (C, u00033, "avr__sleepS");
   u00034 : constant Version_32 := 16#b6bfb352#;
   pragma Export (C, u00034, "lvcS");
   u00035 : constant Version_32 := 16#cdf49699#;
   pragma Export (C, u00035, "lvc__pinsB");
   u00036 : constant Version_32 := 16#4788b568#;
   pragma Export (C, u00036, "lvc__pinsS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.calendar%s
   --  interfaces%s
   --  system%s
   --  ada.exceptions%s
   --  ada.exceptions%b
   --  system.unsigned_types%s
   --  ada.calendar.delays%s
   --  avr%s
   --  avr%b
   --  avr.atmega2560%s
   --  avr.config%s
   --  avr.interrupts%s
   --  avr.interrupts%b
   --  avr.mcu%s
   --  avr.sleep%s
   --  avr.sleep%b
   --  avr.strings%s
   --  avr.int_img%s
   --  avr.int_img%b
   --  avr.real_time%s
   --  avr.real_time%b
   --  avr.timer0%s
   --  avr.timer0%b
   --  avr.real_time.clock%s
   --  avr.real_time.clock_impl%s
   --  avr.real_time.clock_impl%b
   --  avr.real_time.clock%b
   --  avr.real_time.delays%s
   --  avr.real_time.delays%b
   --  lvc%s
   --  lvc.pins%s
   --  lvc.pins%b
   --  visca2560%s
   --  visca2560%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;
