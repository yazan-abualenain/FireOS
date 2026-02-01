OBJECTS = loader.o kmain.o 
CC = gcc
CFLAGS = 	-m32 -nostdlib -nostdinc -fno-builtin \
			-fno-stack-protector -nostartfiles -nodefaultlibs -Wall -Wextra -Werror  -c
LDFLAGS = -T link.ld -melf_i386 --no-warn-rwx-segments
AS = nasm
ASFLAGS = -f elf

all: kernel.elf
kernel.elf: $(OBJECTS)
	ld $(LDFLAGS) $(OBJECTS) -o kernel.elf

all: os.iso
os.iso: kernel.elf
	cp kernel.elf iso/boot/kernel.elf
	genisoimage -R                              \
            -b boot/grub/stage2_eltorito        \
            -no-emul-boot                       \
            -boot-load-size 4                   \
            -A FireOS                           \
            -input-charset utf-8                \
            -quiet                              \
            -boot-info-table                    \
            -o myos.iso iso                     \

run: os.iso
	qemu-system-i386 -cdrom myos.iso

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -rf *.o $(OBJECTS) kernel.elf 