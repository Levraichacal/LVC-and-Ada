MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude

timer5pwm.hex: timer5pwm.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ptimer5pwm.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf timer5pwm.hex

upload: timer5pwm.hex
	$(AVRDUDE) -D -c stk500v2 -p m2560 -P $(PORT) -b 115200 -U flash:w:timer5pwm.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ptimer5pwm.gpr
	rm -f timer5pwm.hex main.elf main.map *~ -r objects
