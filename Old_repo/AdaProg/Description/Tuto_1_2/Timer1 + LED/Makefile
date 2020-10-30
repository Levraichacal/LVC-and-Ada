MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
PROG=arduino

timer1cyclique.hex: main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ptimer1cyclique.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf timer1cyclique.hex

upload: timer1cyclique.hex
	$(AVRDUDE) -D -c $(PROG) -p $(PART) -P $(PORT) -b 115200 -U flash:w:timer1cyclique.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ptimer1cyclique.gpr
	rm -f timer1cyclique.hex main.elf main.map *~ -r objects
