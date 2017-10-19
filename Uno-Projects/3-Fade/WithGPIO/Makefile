MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
GNATMAKE=avr-gnatmake

fade.hex: fade.adb
	$(GNATMAKE) -p -XMCU=$(MCU) -Pfade.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom fade.elf fade.hex

upload: fade.hex
	$(AVRDUDE) -c arduino -p $(PART)  -P $(PORT) -b 115200 -U flash:w:fade.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Pfade
	rm -f fade.elf fade.hex main.map *~ -R objects
