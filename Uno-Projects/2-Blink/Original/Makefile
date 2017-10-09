CFLAGS=-Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
AVRDUDE=sudo avrdude -F -V

GNATMAKE=avr-gnatmake

blink.hex: blink.adb
	$(GNATMAKE) -p -XMCU=atmega328p -Pblink.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom blink.elf blink.hex

upload: blink.hex
	$(AVRDUDE) -c arduino -p m328p -P $(PORT) -b 115200 -U flash:w:blink.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Pblink
	rm -f blink.elf blink.hex main.map -R objects

