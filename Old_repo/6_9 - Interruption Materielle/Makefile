#MCU=atmega328p
MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
#PART=m328p
PART=m2560
AVRDUDE=sudo avrdude
#PROG=-c arduino
PROG=-D -c stk500v2
BAUD = 115200

button.hex: button.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pbutton.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf button.hex

upload: button.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:button.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pbutton.gpr
	rm -f button.hex main.elf main.map
