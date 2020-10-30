MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m2560
AVRDUDE=sudo avrdude

timer1pwm.hex: spi.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pspi.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf spi.hex

upload: spi.hex
	$(AVRDUDE) -D -c stk500v2 -p $(PART) -P $(PORT) -b 115200 -U flash:w:spi.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pspi.gpr
	rm -f spi.hex main.elf main.map *~ -r objects
