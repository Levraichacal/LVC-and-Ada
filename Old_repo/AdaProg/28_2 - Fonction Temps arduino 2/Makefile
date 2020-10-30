MCU=atmega328p
#MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
#PART=m2560
AVRDUDE=sudo avrdude
PROG=-c arduino
#PROG=-D -c stk500v2
BAUD = 115200

lvc-timer0.hex: lvc-timer0.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Plvctimer0.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf lvc-timer0.hex

upload: lvc-timer0.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:lvc-timer0.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Plvctimer0.gpr
	rm -f lvc-timer0.hex main.elf main.map -r objects
