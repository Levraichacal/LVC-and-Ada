MCU=atmega328p
#MCU=atmega2560
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
PART=m328p
#PART=m2560
AVRDUDE=avrdude
PROG=-c arduino
#PROG=-D -c stk500v2
BAUD = 115200

hc_sr04.hex: hc_sr04.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Phc_sr04.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf hc_sr04.hex

upload: hc_sr04.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:hc_sr04.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Phc_sr04.gpr
	rm -f hc_sr04.hex main.elf main.map -r objects
