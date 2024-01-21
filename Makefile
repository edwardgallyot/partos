CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy
CFLAGS=-mfloat-abi=hard -mfpu=vfp -march=armv6zk -mtune=arm1176jzf-s -nostartfiles
TARGET=build/main.elf
SOURCE=main.c
IMG=build/kernel.img

all: $(IMG)

$(IMG): $(TARGET)
	$(OBJCOPY) $(TARGET) -O binary $(IMG)

$(TARGET):
	mkdir -p build
	$(CC) $(CFLAGS) $(SOURCE) -o $(TARGET)

clean:
	rm -rf build

.PHONY: all clean
