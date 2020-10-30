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

visca328p.hex: visca328p.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pvisca328p.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf visca328p.hex

upload: visca328p.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:visca328p.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pvisca328p.gpr
	rm -f visca328p.hex main.elf main.map
