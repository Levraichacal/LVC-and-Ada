MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude

timer1345pwm.hex: timer1345pwm.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ptimer1345pwm.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf timer1345pwm.hex

upload: timer1345pwm.hex
	$(AVRDUDE) -D -c stk500v2 -p m2560 -P $(PORT) -b 115200 -U flash:w:timer1345pwm.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ptimer1345pwm.gpr
	rm -f timer1345pwm.hex main.elf main.map *~ -r objects
