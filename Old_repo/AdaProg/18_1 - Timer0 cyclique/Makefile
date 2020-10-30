MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
PROG=arduino

timer0cyclique.hex: timer0cyclique.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ptimer0cyclique.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf timer0cyclique.hex

upload: timer0cyclique.hex
	$(AVRDUDE) -D -c $(PROG) -p $(PART) -P $(PORT) -b 115200 -U flash:w:timer0cyclique.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ptimer0cyclique.gpr
	rm -f timer0cyclique.hex main.elf main.map *~ -r objects
