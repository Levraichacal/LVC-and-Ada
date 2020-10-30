MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
PROG=arduino

ledeteinte.hex: ledeteinte.adb
	avr-gnatmake -p -XMCU=$(MCU) -Pledeteinte.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom ledeteinte.elf ledeteinte.hex

upload: ledeteinte.hex
	$(AVRDUDE) -D -c $(PROG) -p $(PART) -P $(PORT) -b 115200 -U flash:w:ledeteinte.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Pledeteinte
	rm -f ledeteinte.elf ledeteinte.hex main.map

