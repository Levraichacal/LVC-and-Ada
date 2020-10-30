MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
PROG=arduino

timer1pwm.hex: timer1pwm.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ptimer1pwm.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf timer1pwm.hex

upload: timer1pwm.hex
	$(AVRDUDE) -D -c $(PROG) -p $(PART) -P $(PORT) -b 115200 -U flash:w:timer1pwm.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ptimer1pwm.gpr
	rm -f timer1pwm.hex main.elf main.map *~ -r objects
