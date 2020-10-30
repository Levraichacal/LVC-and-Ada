MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=-P /dev/ttyACM0
PART=-p m328p
AVRDUDE=sudo avrdude
PROG=-c arduino
BAUD=-b 115200
#PROG=-D -c stk500v2

timer2pwm.hex: timer2pwm.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ptimer2pwm.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf timer2pwm.hex

upload: timer2pwm.hex
	$(AVRDUDE) $(PROG) $(PART) $(PORT) $(BAUD) -U flash:w:timer2pwm.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ptimer2pwm.gpr
	rm -f timer2pwm.hex main.elf main.map *~ -r objects
