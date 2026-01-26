import os

CC = "g++"
AS = "nasm"
LD = "ld"

CFLAGS = "-m32 -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti"
ASFLAGS = "-f elf32"
LDFLAGS = "-m elf_i386 -T linker.ld"

os.system(f"{AS} {ASFLAGS} src/boot/boot.asm -o build/boot.o")
os.system(f"{CC} {CFLAGS} -c src/kernel/kernel.cpp -o build/kernel.o")
os.system(f"{LD} {LDFLAGS} -o build/kernel.bin build/boot.o build/kernel.o")

print("Build successful!")
