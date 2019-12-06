MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
GNATMAKE=avr-gnatmake

segments47.hex: segments47.adb
	$(GNATMAKE) -p -XMCU=$(MCU) -Psegments47.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom segments47.elf segments47.hex

upload: segments47.hex
	$(AVRDUDE) -c arduino -p $(PART)  -P $(PORT) -b 115200 -U flash:w:segments47.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Psegments47
	rm -f segments47.elf segments47.hex main.map *~ -R objects
