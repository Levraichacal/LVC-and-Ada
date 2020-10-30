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

spi_max7219.hex: spi_max7219.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pspi_max7219.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf spi_max7219.hex

upload: spi_max7219.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:spi_max7219.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pspi_max7219.gpr
	rm -f spi_max7219.hex main.elf main.map -r objects
