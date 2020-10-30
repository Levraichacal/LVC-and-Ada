MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
#BAUD=57600
BAUD=115200

serial.hex: serial.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pserial.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf serial.hex

upload: serial.hex
	$(AVRDUDE) -c arduino -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:serial.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pserial.gpr
	rm -f serial.hex main.elf main.map
