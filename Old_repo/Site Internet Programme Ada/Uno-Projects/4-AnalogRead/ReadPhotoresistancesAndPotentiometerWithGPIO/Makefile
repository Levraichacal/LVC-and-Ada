MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
GNATMAKE=avr-gnatmake

analogentry.hex: analogentry.adb
	$(GNATMAKE) -p -XMCU=$(MCU) -Panalogentry.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom analogentry.elf analogentry.hex

upload: analogentry.hex
	$(AVRDUDE) -c arduino -p $(PART)  -P $(PORT) -b 115200 -U flash:w:analogentry.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Panalogentry
	rm -f analogentry.elf analogentry.hex main.map *~ -R objects
