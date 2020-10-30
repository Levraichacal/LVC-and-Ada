#MCU=atmega328p
#MCU=atmega2560
MCU=attiny841
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
#PART=m328p
#PART=m2560
PART=t841
AVRDUDE=sudo avrdude
#PROG=-c arduino
PROG=-D -c stk500v2
BAUD = 115200

visca841.hex: visca841.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pvisca841.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf visca841.hex

upload: visca841.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:visca841.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pvisca841.gpr
	rm -f visca841.hex main.elf main.map -r objects
