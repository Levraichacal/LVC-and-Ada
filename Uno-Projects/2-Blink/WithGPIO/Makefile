MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
GNATMAKE=avr-gnatmake

blink.hex: blink.adb
	$(GNATMAKE) -p -XMCU=$(MCU) -Pblink.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom blink.elf blink.hex

upload: blink.hex
	$(AVRDUDE) -c arduino -p $(PART)  -P $(PORT) -b 115200 -U flash:w:blink.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Pblink
	rm -f blink.elf blink.hex main.map *~ -R objects

