CC=avr-gcc
MCU=atmega328p
# MCU=attiny2313
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyUSB0
# BAUD=19200
BAUD=57600
PROTOCOL=arduino
PART=m328p
AVRDUDE=avrdude

GNATMAKE=avr-gnatmake
MFLAGS=-XMCU=$(MCU) -Pds18b20.gpr -aI.

main.hex: main.adb
	$(GNATMAKE) $(MFLAGS)
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf main.hex

upload-duomilanove: main.hex
	$(AVRDUDE) -c arduino -p m328p -b $(BAUD) -P $(PORT) -U flash:w:main.hex

upload-pololu:
	$(AVRDUDE) -c avrispv2 -p m328p -b 115200 -P /dev/ttyACM0 -U flash:w:main.hex

upload: upload-duomilanove

clean:
	avr-gnatclean -XMCU=$(MCU) -Pmain.gpr
	rm -f main.hex main.elf
