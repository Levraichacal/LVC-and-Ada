MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
BAUD=57600
#BAUD=115200

pwmtocamera.hex: pwmtocamera.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ppwmtocamera.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf pwmtocamera.hex

upload: pwmtocamera.hex
	$(AVRDUDE) -c arduino -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:pwmtocamera.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ppwmtocamera.gpr
	rm -f pwmtocamera.hex main.elf main.map
