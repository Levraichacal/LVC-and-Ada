CFLAGS=-Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
AVRDUDE=avrdude -F -V

GNATMAKE=avr-gnatmake

relay.hex: relay.adb
	$(GNATMAKE) -p -XMCU=atmega328p -Prelay.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom relay.elf relay.hex

upload: relay.hex
	$(AVRDUDE) -c arduino -p m328p -P $(PORT) -b 115200 -U flash:w:relay.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Prelay
	rm -f relay.elf relay.hex main.map

