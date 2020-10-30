MCU=atmega328p
#MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
#PART=m2560
AVRDUDE=sudo avrdude
PROG=-c arduino
#PROG=-D -c stk500v2
BAUD = 57600

avrieeefloat.hex: avrieeefloat.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pavrieeefloat.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf avrieeefloat.hex

upload: avrieeefloat.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:avrieeefloat.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pavrieeefloat.gpr
	rm -f avrieeefloat.hex main.elf main.map -r objects
