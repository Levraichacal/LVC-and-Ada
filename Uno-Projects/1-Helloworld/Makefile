MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude

hello.hex: hello.adb
	avr-gnatmake -p -XMCU=$(MCU) -Phello.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom hello.elf hello.hex

upload: hello.hex
	$(AVRDUDE) -c arduino -p $(PART) -P $(PORT) -b 115200 -U flash:w:hello.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Phello.gpr
	rm -f hello.hex hello.elf main.map *~ -R objects
