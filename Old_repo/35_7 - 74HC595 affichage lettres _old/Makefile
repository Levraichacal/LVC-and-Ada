CFLAGS=-Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
AVRDUDE=avrdude -F -V

GNATMAKE=avr-gnatmake

test_74hc595.hex: test_74hc595.adb
	$(GNATMAKE) -p -XMCU=atmega328p -Ptest_74hc595.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom test_74hc595.elf test_74hc595.hex

upload: test_74hc595.hex
	$(AVRDUDE) -c arduino -p m328p -P $(PORT) -b 115200 -U flash:w:test_74hc595.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Ptest_74hc595
	rm -f test_74hc595.elf test_74hc595.hex main.map -R objects

