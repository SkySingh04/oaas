#include <stdio.h>
#include <stdlib.h>

// Mutually recursive Ackermann-like function with obfuscated logic
static inline int ack(int m, int n) {
    return (m == 0) ? n + 1 :
           (n == 0) ? ack(m - 1, 1) :
           ack(m - 1, ack(m, n - 1));
}

// Recursive modular exponentiation with XOR twist
static int mod_pow(int base, int exp, int mod, int twist) {
    if (exp == 0) return 1;
    if (exp == 1) return (base ^ twist) % mod;
    int half = mod_pow(base, exp >> 1, mod, twist);
    return (exp & 1) ? (half * half * base) % mod : (half * half) % mod;
}

// Recursive Fibonacci with alternating operations
static int fib_chaos(int n, int a, int b, int op) {
    if (n <= 0) return a;
    if (n == 1) return b;
    int next = (op % 3 == 0) ? (a + b) :
               (op % 3 == 1) ? (a * b) % 997 :
               (a ^ b);
    return fib_chaos(n - 1, b, next, op + n);
}

// Recursive digit sum with alternating base conversions
static int digit_chaos(int n, int base, int depth) {
    if (n == 0 || depth == 0) return 0;
    int sum = (n % base) * (depth % 3 == 0 ? 1 : -1);
    return sum + digit_chaos(n / base, base == 10 ? 16 : 10, depth - 1);
}

// Collatz conjecture with recursive bit manipulation
static int collatz(int n, int steps, int mask) {
    if (n <= 1 || steps > 100) return steps;
    int next = (n & 1) ? ((3 * n + 1) ^ mask) : (n >> 1);
    return collatz(next, steps + 1, mask ^ n);
}

// Nested recursive function that combines all above
static int chaos_core(int x, int y, int z) {
    if (x <= 0 || y <= 0 || z <= 0) return 1;

    int a = ack(x % 3, y % 3);
    int b = mod_pow(x, y % 5, 1000, z);
    int c = fib_chaos(x % 10, 1, 1, y);
    int d = digit_chaos(x * y, 10, z % 5);
    int e = collatz(x + y, 0, z);

    int result = (a ^ b) + (c & d) - (e % 10);

    // Recursive descent with different arithmetic operations
    if (z % 4 == 0) return result + chaos_core(x - 1, y, z - 1);
    if (z % 4 == 1) return result * chaos_core(x, y - 1, z - 1) % 10000;
    if (z % 4 == 2) return result ^ chaos_core(x - 1, y - 1, z - 1);
    return (result + chaos_core(x - 1, y, z - 2)) % 9973;
}

// Entry point with parameter validation
int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Usage: %s <x> <y> <z>\n", argv[0]);
        printf("Recursive Arithmetic Chaos Engine v1.0\n");
        printf("Computes highly obfuscated recursive functions\n");
        return 1;
    }

    int x = atoi(argv[1]) % 10;  // Limit to prevent stack overflow
    int y = atoi(argv[2]) % 10;
    int z = atoi(argv[3]) % 10;

    printf("Computing chaos(%d, %d, %d)...\n", x, y, z);
    int result = chaos_core(x, y, z);
    printf("Result: %d\n", result);

    return 0;
}
