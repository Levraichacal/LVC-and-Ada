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

lcd_test.hex: lcd_test.adb lcd-wiring.ads lcd.ads lcd.adb
	avr-gnatmake -save-temps -p -XMCU=$(MCU) -Plcd.gpr
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom lcd_test.elf lcd_test.hex

upload: lcd_test.hex
	$(AVRDUDE) $(PROG) -p $(PART) -P $(PORT) -b $(BAUD) -U flash:w:lcd_test.hex


clean:
	avr-gnatclean -XMCU=$(MCU) -Plcd.gpr
	rm -f lcd_test.hex lcd_test.elf
