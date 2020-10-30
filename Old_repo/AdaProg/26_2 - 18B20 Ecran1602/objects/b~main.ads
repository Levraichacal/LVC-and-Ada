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
   u00001 : constant Version_32 := 16#afae2292#;
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
   u00010 : constant Version_32 := 16#d18f7292#;
   pragma Export (C, u00010, "avr__eepromB");
   u00011 : constant Version_32 := 16#c0993f14#;
   pragma Export (C, u00011, "avr__eepromS");
   u00012 : constant Version_32 := 16#a7504ddc#;
   pragma Export (C, u00012, "avr__interruptsB");
   u00013 : constant Version_32 := 16#a7a1b728#;
   pragma Export (C, u00013, "avr__interruptsS");
   u00014 : constant Version_32 := 16#2cdeab82#;
   pragma Export (C, u00014, "avr__mcuS");
   u00015 : constant Version_32 := 16#9ecd08e4#;
   pragma Export (C, u00015, "avr__atmega328pS");
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
   u00021 : constant Version_32 := 16#40fc3ec7#;
   pragma Export (C, u00021, "avr__real_time__clockB");
   u00022 : constant Version_32 := 16#604ee8a8#;
   pragma Export (C, u00022, "avr__real_time__clockS");
   u00023 : constant Version_32 := 16#a209b291#;
   pragma Export (C, u00023, "avr__real_time__clock_implB");
   u00024 : constant Version_32 := 16#85540fd3#;
   pragma Export (C, u00024, "avr__real_time__clock_implS");
   u00025 : constant Version_32 := 16#80aa7db4#;
   pragma Export (C, u00025, "avr__configS");
   u00026 : constant Version_32 := 16#c333e27a#;
   pragma Export (C, u00026, "avr__timer0B");
   u00027 : constant Version_32 := 16#7c49cd8e#;
   pragma Export (C, u00027, "avr__timer0S");
   u00028 : constant Version_32 := 16#10aa2dfb#;
   pragma Export (C, u00028, "ada__exceptionsB");
   u00029 : constant Version_32 := 16#dbf5c75a#;
   pragma Export (C, u00029, "ada__exceptionsS");
   u00030 : constant Version_32 := 16#6675d552#;
   pragma Export (C, u00030, "avr__real_time__delaysB");
   u00031 : constant Version_32 := 16#66fd42f7#;
   pragma Export (C, u00031, "avr__real_time__delaysS");
   u00032 : constant Version_32 := 16#e4660a6b#;
   pragma Export (C, u00032, "avr__sleepB");
   u00033 : constant Version_32 := 16#87df0c2f#;
   pragma Export (C, u00033, "avr__sleepS");
   u00034 : constant Version_32 := 16#037269f1#;
   pragma Export (C, u00034, "avr__waitB");
   u00035 : constant Version_32 := 16#18e7cf15#;
   pragma Export (C, u00035, "avr__waitS");
   u00036 : constant Version_32 := 16#854990f2#;
   pragma Export (C, u00036, "system__machine_codeS");
   u00037 : constant Version_32 := 16#b22535f0#;
   pragma Export (C, u00037, "crc8B");
   u00038 : constant Version_32 := 16#23cb6434#;
   pragma Export (C, u00038, "crc8S");
   u00039 : constant Version_32 := 16#7a405e1e#;
   pragma Export (C, u00039, "lcdB");
   u00040 : constant Version_32 := 16#a09407f8#;
   pragma Export (C, u00040, "lcdS");
   u00041 : constant Version_32 := 16#df9bfc8d#;
   pragma Export (C, u00041, "lcd__wiringS");
   u00042 : constant Version_32 := 16#b2a65bf8#;
   pragma Export (C, u00042, "one_wireB");
   u00043 : constant Version_32 := 16#463f5ec4#;
   pragma Export (C, u00043, "one_wireS");
   u00044 : constant Version_32 := 16#a7d6cdf7#;
   pragma Export (C, u00044, "one_wire__avr_wiringS");
   u00045 : constant Version_32 := 16#00e1aaf0#;
   pragma Export (C, u00045, "one_wire__romB");
   u00046 : constant Version_32 := 16#deda832f#;
   pragma Export (C, u00046, "one_wire__romS");
   u00047 : constant Version_32 := 16#8de21e5c#;
   pragma Export (C, u00047, "one_wire__searchB");
   u00048 : constant Version_32 := 16#4e3ff943#;
   pragma Export (C, u00048, "one_wire__searchS");
   u00049 : constant Version_32 := 16#3c3fcede#;
   pragma Export (C, u00049, "one_wire__commandsS");
   u00050 : constant Version_32 := 16#80a197f3#;
   pragma Export (C, u00050, "one_wire__temperature_sensorsB");
   u00051 : constant Version_32 := 16#d4ca666e#;
   pragma Export (C, u00051, "one_wire__temperature_sensorsS");
   u00052 : constant Version_32 := 16#a6a6c3ae#;
   pragma Export (C, u00052, "temperaturesB");
   u00053 : constant Version_32 := 16#dae4b8f1#;
   pragma Export (C, u00053, "temperaturesS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.calendar%s
   --  interfaces%s
   --  system%s
   --  ada.exceptions%s
   --  ada.exceptions%b
   --  system.machine_code%s
   --  system.unsigned_types%s
   --  ada.calendar.delays%s
   --  avr%s
   --  avr%b
   --  avr.atmega328p%s
   --  avr.config%s
   --  avr.interrupts%s
   --  avr.interrupts%b
   --  avr.mcu%s
   --  avr.eeprom%s
   --  avr.eeprom%b
   --  avr.sleep%s
   --  avr.sleep%b
   --  avr.strings%s
   --  avr.int_img%s
   --  avr.int_img%b
   --  avr.real_time%s
   --  avr.real_time%b
   --  avr.timer0%s
   --  avr.timer0%b
   --  avr.wait%s
   --  avr.wait%b
   --  crc8%s
   --  crc8%b
   --  lcd%s
   --  lcd.wiring%s
   --  lcd%b
   --  one_wire%s
   --  one_wire.avr_wiring%s
   --  one_wire%b
   --  one_wire.commands%s
   --  one_wire.rom%s
   --  one_wire.rom%b
   --  one_wire.search%s
   --  one_wire.search%b
   --  temperatures%s
   --  temperatures%b
   --  avr.real_time.clock%s
   --  avr.real_time.clock_impl%s
   --  avr.real_time.clock_impl%b
   --  avr.real_time.clock%b
   --  avr.real_time.delays%s
   --  avr.real_time.delays%b
   --  one_wire.temperature_sensors%s
   --  one_wire.temperature_sensors%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;
