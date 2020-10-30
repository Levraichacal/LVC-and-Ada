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

spi_slave_interrupt.hex: spi_slave_interrupt.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Pspi_slave_interrupt.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf spi_slave_interrupt.hex

upload: spi_slave_interrupt.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:spi_slave_interrupt.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Pspi_slave_interrupt.gpr
	rm -f spi_slave_interrupt.hex main.elf main.map -r objects
