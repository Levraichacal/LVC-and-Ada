CFLAGS=-Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(MCU)
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex
PORT=/dev/ttyACM0
AVRDUDE=avrdude -F -V
MAIN_NAME=main
GPR_FILE=${MAIN_NAME}.gpr

GNATMAKE=avr-gnatmake

${MAIN_NAME}.hex: ${MAIN_NAME}.adb
	$(GNATMAKE) -p -XMCU=atmega328p -P${GPR_FILE}
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom ${MAIN_NAME}.elf ${MAIN_NAME}.hex

upload: ${MAIN_NAME}.hex
	$(AVRDUDE) -c arduino -p m328p -P $(PORT) -b 115200 -U flash:w:${MAIN_NAME}.hex

clean:
	avr-gnatclean -XMCU=atmega328p -P${GPR_FILE}
	rm -f ${MAIN_NAME}.elf ${MAIN_NAME}.hex main.map *~  -R objects

