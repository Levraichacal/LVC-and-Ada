MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude

blink.hex: blink.adb
	avr-gnatmake -p -XMCU=$(MCU) -Pblink.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom blink.elf blink.hex

upload: blink.hex
	$(AVRDUDE) -D -c stk500v2 -p m2560 -P $(PORT) -b 115200 -U flash:w:blink.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Pblink
	rm -f blink.elf blink.hex main.map

