CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy
CFLAGS=-mfloat-abi=hard -mfpu=vfp -march=armv6zk -mtune=arm1176jzf-s -nostartfiles
TARGET=main.elf
SOURCE=main.c
IMG=kernel.img

all: $(IMG)

$(IMG): $(TARGET)
	$(OBJCOPY) $(TARGET) -O binary $(IMG)

$(TARGET):
	$(CC) $(CFLAGS) $(SOURCE) -o $(TARGET)

clean:
	rm -f $(TARGET) $(IMG)

.PHONY: all clean
