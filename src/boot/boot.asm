; boot.asm
section .text
bits 32

%define MULTIBOOT_MAGIC 0x1BADB002
%define MULTIBOOT_FLAGS 0x0
%define MULTIBOOT_CHECKSUM -(MULTIBOOT_MAGIC + MULTIBOOT_FLAGS)

align 4
dd MULTIBOOT_MAGIC
dd MULTIBOOT_FLAGS
dd MULTIBOOT_CHECKSUM

extern kmain

global start
start:
    cli
    call kmain
    hlt
