#include <stdio.h>

#include <stdlib.h>
#include <string.h>

/* XOR String Decryption Helper */
static char* _xor_decrypt(const unsigned char* enc, int len, unsigned char key) {
    char* dec = (char*)malloc(len + 1);
    if (!dec) return NULL;
    for (int i = 0; i < len; i++) {
        dec[i] = enc[i] ^ key;
    }
    dec[len] = '\0';
    return dec;
}

static void _secure_free(char* ptr) {
    if (ptr) {
        memset(ptr, 0, strlen(ptr));
        free(ptr);
    }
}


char* API_KEY = NULL;
char* DB_PASSWORD = NULL;

int main() {
    printf("API Key: %s\n", API_KEY);
    printf("DB Pass: %s\n", DB_PASSWORD);
    return 0;
}


/* String decryption initialization (runs before main) */
__attribute__((constructor)) static void _init_encrypted_strings(void) {
    API_KEY = _xor_decrypt((const unsigned char[]){0xec,0xfa,0xfc,0xed,0xfa,0xeb,0xc0,0xfe,0xef,0xf6,0xc0,0xf4,0xfa,0xe6,0xc0,0xae,0xad,0xac,0xab,0xaa}, 20, 0x9f);
    DB_PASSWORD = _xor_decrypt((const unsigned char[]){0x89,0x8f,0xb2,0x9d,0x8c,0x9e,0x9e,0xb2,0x9d,0x9f,0x82,0x89,0xb2,0xdf,0xdd,0xdf,0xd9}, 17, 0xed);
}
