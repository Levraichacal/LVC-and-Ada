MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
#BAUD=57600
BAUD=115200

serialtoppm.hex: serialtoppm.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pserialtoppm.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf serialtoppm.hex

upload: serialtoppm.hex
	$(AVRDUDE) -c arduino -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:serialtoppm.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pserialtoppm.gpr
	rm -f serialtoppm.hex main.elf main.map
