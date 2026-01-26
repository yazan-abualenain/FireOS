extern "C" void kmain() {
    volatile char* video = (volatile char*)0xB8000;
    const char* message = "Hello from FireOS!";
    int i = 0;
    while (message[i] != 0) {
        video[i * 2] = message[i];
        video[i * 2 + 1] = 0x07; // Light grey on black
        i++;
    }
}
