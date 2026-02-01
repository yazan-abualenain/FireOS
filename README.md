# FireOS

A custom, high-performance bare-metal OS.

## Building from source

To build the kernel, you need `nasm` and a 32-bit C++ cross-compiler (or `g++-multilib`).
Once you have the dependencies, run the build script:

```bash
python3 build.py
```

## Running with QEMU

You can run the kernel with QEMU:

```bash
qemu-system-i386 -cdrom build/FireOS.iso
```
