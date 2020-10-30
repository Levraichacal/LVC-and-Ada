MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
#BAUD=57600
BAUD=115200

tuneddelay.hex: tuneddelay.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ptuneddelay.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf tuneddelay.hex

upload: tuneddelay.hex
	$(AVRDUDE) -c arduino -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:tuneddelay.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ptuneddelay.gpr
	rm -f tuneddelay.hex main.elf main.map
