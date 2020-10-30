MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
AVRDUDE=sudo avrdude
PROG=-c arduino
#PROG=-D -c stk500v2

timer1pwm.hex: ms5611.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pms5611.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf ms5611.hex

upload: ms5611.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b 115200 -U flash:w:ms5611.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pms5611.gpr
	rm -f ms5611.hex main.elf main.map *~ -r objects
