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

dht11.hex: dht11.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pdht11.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf dht11.hex

upload: dht11.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:dht11.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pdht11.gpr
	rm -f dht11.hex main.elf main.map -r objects
