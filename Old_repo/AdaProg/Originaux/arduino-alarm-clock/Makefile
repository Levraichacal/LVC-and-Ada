CC=avr-gcc
MCU=atmega328p
# MCU=attiny13a
# MCU=atmega2560
CFLAGS=-Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyUSB0
# BAUD=19200
BAUD=57600

# attiny13
# PROTOCOL=usbtiny
# PART=t13
# AVRDUDE=sudo avrdude -F -V -P $(PORT) -b $(BAUD)

# atmega328p
BAUD=57600
PROTOCOL=arduino
PART=m328p
AVRDUDE=sudo avrdude -V -P $(PORT) -b $(BAUD)

GNATMAKE=avr-gnatmake
MFLAGS=-p -XMCU=$(MCU) -Pmain.gpr -aI.

main.hex: main.adb two_wire.adb ds1307.adb
	$(GNATMAKE) $(MFLAGS)
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf main.hex

upload: main.hex
	$(AVRDUDE) -c $(PROTOCOL) -p $(PART) -U flash:w:main.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pmain.gpr
	rm -f main.hex main.elf
