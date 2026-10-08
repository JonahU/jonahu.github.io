#define BUF_SIZE 1024

char buf[BUF_SIZE] = {};
char scratch[BUF_SIZE] = {}; // scratch buf for direct wasm writes

char* get(void) { return buf; }

void set(char* c, int len) {
    if (len >= BUF_SIZE) return;
    for(int i=0;i<len;i++)
        buf[i] = c[i];
    buf[len] = '\0';
}
