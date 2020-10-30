MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=-P /dev/ttyACM0
PART=-p m328p
AVRDUDE=sudo avrdude
PROG=-c arduino
BAUD=-b 115200 

interruptionWDT.hex: main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -PinterruptionWDT.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf interruptionWDT.hex

upload: interruptionWDT.hex
	$(AVRDUDE) $(PROG) $(PART) $(PORT) $(BAUD) -U flash:w:interruptionWDT.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -PinterruptionWDT.gpr
	rm -f interruptionWDT.hex main.elf main.map *~ -r objects
