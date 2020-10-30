MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
PROG=arduino

timer1cycliqueuart.hex: main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ptimer1cycliqueuart.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf timer1cycliqueuart.hex

upload: timer1cycliqueuart.hex
	$(AVRDUDE) -D -c $(PROG) -p $(PART) -P $(PORT) -b 115200 -U flash:w:timer1cycliqueuart.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ptimer1cycliqueuart.gpr
	rm -f timer1cycliqueuart.hex main.elf main.map *~ -r objects
