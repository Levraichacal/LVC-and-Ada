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

GNATMAKE=avr-gnatmake
MFLAGS=-XMCU=$(MCU) -Pds18b20.gpr 

main.hex: main.adb
	$(GNATMAKE) -save-temps -p $(MFLAGS)
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf main.hex

upload: main.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:main.hex

upload-pololu:
	$(AVRDUDE) -c avrispv2 -p m328p -b 115200 -P /dev/ttyACM0 -U flash:w:main.hex

#upload: upload-duomilanove

clean:
	avr-gnatclean -XMCU=$(MCU) -Pds18b20.gpr
	rm -f main.hex main.elf
