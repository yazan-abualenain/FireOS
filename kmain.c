#define FB_ADDRESS 0x000B8000
#define FB_COLUMNS 80
#define FB_ROWS 25
#define FB_CELLS (FB_COLUMNS * FB_ROWS)

void fb_write_cell(unsigned int i, char c, unsigned char fg, unsigned char bg) {
    char *fb = (char *) 0x000B8000;
    fb[i * 2] = c;            
    fb[i * 2 + 1] = ((bg & 0x0F) << 4) | (fg & 0x0F);  
}
void fb_clear() {
    for (unsigned int i = 0; i < FB_CELLS; i++) {
        fb_write_cell(i, ' ', 0x0F, 0x00); 
    }
}
void fb_write_string(const char *str, unsigned int row, unsigned int col, unsigned char fg, unsigned char bg) {
    unsigned int index = row * FB_COLUMNS + col;
    for (unsigned int i = 0; str[i] != '\0'; i++) {
        fb_write_cell(index + i, str[i], fg, bg);
    }
}

int kmain(){
    fb_clear();
    fb_write_string("Hello, World!", 0, 0, 0x0F, 0x00);
    return 0;
}
