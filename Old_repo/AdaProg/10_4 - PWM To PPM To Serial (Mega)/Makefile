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

pwmtoserial.hex: pwmtoserial.adb main.adb Makefile
	avr-gnatmake -p -XMCU=$(MCU) -Ppwmtoserial.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf pwmtoserial.hex

upload: pwmtoserial.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:pwmtoserial.hex

clean:
	avr-gnatclean -XMCU=$(MCU) -Ppwmtoserial.gpr
	rm -f pwmtoserial.hex main.elf main.map
