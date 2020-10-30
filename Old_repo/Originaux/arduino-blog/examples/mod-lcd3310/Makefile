CFLAGS=-Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
AVRDUDE=sudo avrdude -V
BAUD?=57600

GNATMAKE=avr-gnatmake

lcd.hex: main.adb lcd3310.adb lcd3310.ads soft_spi.adb
	$(GNATMAKE) -save-temps -p -XMCU=atmega328p -Plcd.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom main.elf lcd.hex

upload: lcd.hex
	$(AVRDUDE) -c arduino -p m328p -P $(PORT) -b $(BAUD) -U flash:w:lcd.hex

clean:
	avr-gnatclean -XMCU=atmega328p -Plcd
	rm -f main.elf lcd.hex main.map

