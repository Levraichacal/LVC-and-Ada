MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
PROG=arduino

timer2cyclique.hex: main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ptimer2cyclique.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf timer2cyclique.hex

upload: timer2cyclique.hex
	$(AVRDUDE) -D -c $(PROG) -p $(PART) -P $(PORT) -b 115200 -U flash:w:timer2cyclique.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ptimer2cyclique.gpr
	rm -f timer2cyclique.hex main.elf main.map *~ -r objects
