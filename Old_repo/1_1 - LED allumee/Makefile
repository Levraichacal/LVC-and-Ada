MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
PROG=arduino

ledallumee.hex: ledallumee.adb
	avr-gnatmake -p -XMCU=$(MCU) -Pledallumee.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom ledallumee.elf ledallumee.hex

upload: ledallumee.hex
	$(AVRDUDE) -D -c $(PROG) -p $(PART) -P $(PORT) -b 115200 -U flash:w:ledallumee.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Pledallumee
	rm -f ledallumee.elf ledallumee.hex main.map

