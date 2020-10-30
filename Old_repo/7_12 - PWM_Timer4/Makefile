MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude

timer4pwm.hex: timer4pwm.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ptimer4pwm.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf timer4pwm.hex

upload: timer4pwm.hex
	$(AVRDUDE) -D -c stk500v2 -p m2560 -P $(PORT) -b 115200 -U flash:w:timer4pwm.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ptimer4pwm.gpr
	rm -f timer4pwm.hex main.elf main.map *~ -r objects
