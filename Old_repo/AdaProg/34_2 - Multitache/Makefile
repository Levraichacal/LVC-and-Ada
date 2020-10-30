CFLAGS=-Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
AVRDUDE=avrdude -F -V

GNATMAKE=avr-gnatmake

multitache.hex: multitache.adb
	$(GNATMAKE) -p -XMCU=atmega328p -Pmultitache.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom multitache.elf multitache.hex

upload: multitache.hex
	$(AVRDUDE) -c arduino -p m328p -P $(PORT) -b 115200 -U flash:w:multitache.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Pmultitache
	rm -f multitache.elf multitache.hex main.map -R objects

