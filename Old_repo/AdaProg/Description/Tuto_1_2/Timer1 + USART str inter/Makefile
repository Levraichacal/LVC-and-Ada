MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
PROG=arduino

timerUARTinterrupt.hex: main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -PtimerUARTinterrupt.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf timerUARTinterrupt.hex

upload: timerUARTinterrupt.hex
	$(AVRDUDE) -D -c $(PROG) -p $(PART) -P $(PORT) -b 115200 -U flash:w:timerUARTinterrupt.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -PtimerUARTinterrupt.gpr
	rm -f timerUARTinterrupt.hex main.elf main.map *~ -r objects
