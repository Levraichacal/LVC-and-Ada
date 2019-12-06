MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
GNATMAKE=avr-gnatmake

segments7.hex: segments7.adb
	$(GNATMAKE) -p -XMCU=$(MCU) -Psegments7.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom segments7.elf segments7.hex

upload: segments7.hex
	$(AVRDUDE) -c arduino -p $(PART)  -P $(PORT) -b 115200 -U flash:w:segments7.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Psegments7
	rm -f segments7.elf segments7.hex main.map *~ -R objects
