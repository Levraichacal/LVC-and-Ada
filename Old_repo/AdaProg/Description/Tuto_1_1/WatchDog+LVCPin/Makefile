MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=-P /dev/ttyACM0
PART=-p m328p
AVRDUDE=sudo avrdude
PROG=-c arduino
BAUD=-b 115200 

watchdogex1.hex: watchdogex1.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pwatchdogex1.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf watchdogex1.hex

upload: watchdogex1.hex
	$(AVRDUDE) $(PROG) $(PART) $(PORT) $(BAUD) -U flash:w:watchdogex1.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pwatchdogex1.gpr
	rm -f watchdogex1.hex main.elf main.map *~ -r objects
