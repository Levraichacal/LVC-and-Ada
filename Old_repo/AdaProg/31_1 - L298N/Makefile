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
BAUD = 115200

l298n.hex: l298n.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pl298n.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf l298n.hex

upload: l298n.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:l298n.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pl298n.gpr
	rm -f l298n.hex main.elf main.map *~ -r objects
