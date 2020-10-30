MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
GNATMAKE=avr-gnatmake

servopwm.hex: servopwm.adb
	$(GNATMAKE) -p -XMCU=$(MCU) -Pservopwm.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom servopwm.elf servopwm.hex

upload: servopwm.hex
	$(AVRDUDE) -c arduino -p $(PART)  -P $(PORT) -b 115200 -U flash:w:servopwm.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Pservopwm
	rm -f servopwm.elf servopwm.hex main.map *~ -R objects
