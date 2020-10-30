MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude

button.hex: button.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pbutton.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf button.hex

upload: button.hex
	$(AVRDUDE) -c arduino -p $(PART) -P $(PORT) -b 115200 -U flash:w:button.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pbutton.gpr
	rm -f button.hex main.elf main.map
