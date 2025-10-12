// Test file for Linear MBA obfuscation
// Contains various bitwise operations to be obfuscated

#include <stdio.h>
#include <stdint.h>

// Simple bitwise AND
uint32_t test_and(uint32_t a, uint32_t b) {
    return a & b;
}

// Simple bitwise OR
uint32_t test_or(uint32_t a, uint32_t b) {
    return a | b;
}

// Simple bitwise XOR
uint32_t test_xor(uint32_t a, uint32_t b) {
    return a ^ b;
}

// Combined operations
uint32_t test_combined(uint32_t a, uint32_t b, uint32_t c) {
    uint32_t temp1 = a & b;
    uint32_t temp2 = temp1 | c;
    uint32_t temp3 = temp2 ^ a;
    return temp3;
}

// Bit manipulation example (common in crypto/hashing)
uint32_t hash_step(uint32_t state, uint32_t input) {
    state ^= input;
    state &= 0xFFFFFFFF;
    state |= (input << 4);
    return state;
}

// Test with different bit widths
uint8_t test_8bit(uint8_t a, uint8_t b) {
    return (a & 0xF0) | (b & 0x0F);
}

uint16_t test_16bit(uint16_t a, uint16_t b) {
    return (a ^ b) & 0xFFFF;
}

uint64_t test_64bit(uint64_t a, uint64_t b) {
    return (a | b) ^ (a & b);
}

int main() {
    printf("=== Linear MBA Obfuscation Test ===\n\n");

    uint32_t a = 0xDEADBEEF;
    uint32_t b = 0xCAFEBABE;
    uint32_t c = 0x12345678;

    printf("Testing 32-bit operations:\n");
    printf("  a = 0x%08X\n", a);
    printf("  b = 0x%08X\n", b);
    printf("  c = 0x%08X\n\n", c);

    uint32_t result_and = test_and(a, b);
    printf("  AND: 0x%08X\n", result_and);

    uint32_t result_or = test_or(a, b);
    printf("  OR:  0x%08X\n", result_or);

    uint32_t result_xor = test_xor(a, b);
    printf("  XOR: 0x%08X\n", result_xor);

    uint32_t result_combined = test_combined(a, b, c);
    printf("  Combined: 0x%08X\n", result_combined);

    uint32_t result_hash = hash_step(a, b);
    printf("  Hash step: 0x%08X\n\n", result_hash);

    // Test different bit widths
    uint8_t a8 = 0xAB, b8 = 0xCD;
    uint16_t a16 = 0x1234, b16 = 0x5678;
    uint64_t a64 = 0xDEADBEEFCAFEBABEULL, b64 = 0x123456789ABCDEF0ULL;

    printf("Testing different bit widths:\n");
    printf("  8-bit:  0x%02X\n", test_8bit(a8, b8));
    printf("  16-bit: 0x%04X\n", test_16bit(a16, b16));
    printf("  64-bit: 0x%016llX\n", test_64bit(a64, b64));

    printf("\n=== Test completed successfully! ===\n");
    return 0;
}
