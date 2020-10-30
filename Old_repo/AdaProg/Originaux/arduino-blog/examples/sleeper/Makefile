CC=avr-gcc
MCU=atmega328p
# MCU=attiny13a
# MCU=atmega2560
CFLAGS=-Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
# BAUD=19200

# attiny13
# PROTOCOL=usbtiny
# PART=t13
# AVRDUDE=sudo avrdude -F -V -P $(PORT) -b $(BAUD)

# atmega328p
BAUD=115200
PROTOCOL=arduino
PART=m328p
AVRDUDE=sudo avrdude -V -P $(PORT) -b $(BAUD)


GNATMAKE=avr-gnatmake
MFLAGS=-save-temps -p -XMCU=$(MCU) -Pmain.gpr -aI.

main.hex: main.adb sleeper.adb dosleep.o
	$(GNATMAKE) $(MFLAGS) -largs dosleep.o
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf main.hex

dosleep.o: dosleep.c
	avr-gcc -mmcu=atmega328p -Os -ffunction-sections -fdata-sections -c dosleep.c -o dosleep.o
upload: main.hex
	$(AVRDUDE) -c $(PROTOCOL) -p $(PART) -U flash:w:main.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pmain.gpr
	rm -f main.hex main.elf
