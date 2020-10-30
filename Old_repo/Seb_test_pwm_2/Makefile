CFLAGS=-Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
AVRDUDE=sudo avrdude -F -V

GNATMAKE=avr-gnatmake

pwm.hex: pwm.adb
	$(GNATMAKE) -p -XMCU=atmega328p -Ppwm.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom pwm.elf pwm.hex

upload: pwm.hex
	$(AVRDUDE) -c arduino -p m328p -P $(PORT) -b 115200 -U flash:w:pwm.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Ppwm
	rm -f pwm.elf pwm.hex main.map

