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

i2c_ecran1602.hex: i2c_ecran1602.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pi2c_ecran1602.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf i2c_ecran1602.hex

upload: i2c_ecran1602.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:i2c_ecran1602.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pi2c_ecran1602.gpr
	rm -f i2c_ecran1602.hex main.elf main.map -r objects
