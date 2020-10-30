MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=-P /dev/ttyACM0
PART=-p m328p
AVRDUDE=sudo avrdude
PROG=-c arduino
BAUD=-b 115200 

watchdogex0.hex: watchdogex0.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pwatchdogex0.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf watchdogex0.hex

upload: watchdogex0.hex
	$(AVRDUDE) $(PROG) $(PART) $(PORT) $(BAUD) -U flash:w:watchdogex0.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pwatchdogex0.gpr
	rm -f watchdogex0.hex main.elf main.map -r objects
