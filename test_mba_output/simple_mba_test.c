// Simpler MBA test
#include <stdint.h>

uint32_t test_and(uint32_t a, uint32_t b) {
    return a & b;
}

uint32_t test_or(uint32_t a, uint32_t b) {
    return a | b;
}

uint32_t test_xor(uint32_t a, uint32_t b) {
    return a ^ b;
}

int main() {
    uint32_t result = test_and(0xDEADBEEF, 0xCAFEBABE);
    return result == 0xCAACBAAE ? 0 : 1;
}
