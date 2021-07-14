
BUILD_DIR = build
#--------------------------------------Makefile-------------------------------------
CFILES = $(wildcard *.c)
OFILES = $(CFILES:.c=.o)
GCCFLAGS = -Wall -O2 -ffreestanding -nostdinc -nostdlib -nostartfiles
LDFLAGS = -nostdlib -nostartfile


all: 	clean kernel8.img post
		
boot.o: boot.S 
		aarch64-none-elf-gcc $(GCCFLAGS) -c boot.S -o boot.o
		
%.o: %.c
		aarch64-none-elf-gcc $(GCCFLAGS) -c $< -o $@
		
kernel8.img: boot.o $(OFILES)
		aarch64-none-elf-ld $(LDFLAGS) boot.o $(OFILES) -T link.ld -o kernel8.elf
		aarch64-none-elf-objcopy -O binary kernel8.elf $(BUILD_DIR)/kernel8.img

		
		
clean:
		del kernel8.elf *.o *.img
post:
		del kernel8.elf *.o *.img
		