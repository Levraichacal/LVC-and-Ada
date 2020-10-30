MCU=atmega328p
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=-P /dev/ttyACM0
PART=-p m328p
AVRDUDE=sudo avrdude
PROG=-c arduino
BAUD=-b 115200 

softwareserial.hex: softwareserial.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Psoftwareserial.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf softwareserial.hex

upload: softwareserial.hex
	$(AVRDUDE) $(PROG) $(PART) $(PORT) $(BAUD) -U flash:w:softwareserial.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Psoftwareserial.gpr
	rm -f softwareserial.hex main.elf main.map
