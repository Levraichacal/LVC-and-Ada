MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude

serialtoppm.hex: serialtoppm.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pserialtoppm.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf serialtoppm.hex

upload: serialtoppm.hex
	$(AVRDUDE) -c arduino -p $(PART) -P $(PORT) -b 115200 -U flash:w:serialtoppm.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pserialtoppm.gpr
	rm -f serialtoppm.hex main.elf main.map
