#MCU=atmega328p
MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
#PART=m328p
PART=m2560
AVRDUDE=sudo avrdude
#PROG=-c arduino
PROG=-D -c stk500v2
BAUD = 115200

visca2560.hex: visca2560.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pvisca2560.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf visca2560.hex

upload: visca2560.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:visca2560.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pvisca2560.gpr
	rm -f visca2560.hex main.elf main.map
