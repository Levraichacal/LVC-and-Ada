MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude

timer0pwm.hex: timer0pwm.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ptimer0pwm.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf timer0pwm.hex

upload: timer0pwm.hex
	$(AVRDUDE) -D -c stk500v2 -p m2560 -P $(PORT) -b 115200 -U flash:w:timer0pwm.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ptimer0pwm.gpr
	rm -f timer0pwm.hex main.elf main.map *~ -r objects
