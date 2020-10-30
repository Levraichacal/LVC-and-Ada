MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
BAUD=57600
#BAUD=115200

pwmtoserial.hex: pwmtoserial.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ppwmtoserial.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf pwmtoserial.hex

upload: pwmtoserial.hex
	$(AVRDUDE) -c arduino -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:pwmtoserial.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ppwmtoserial.gpr
	rm -f pwmtoserial.hex main.elf main.map
