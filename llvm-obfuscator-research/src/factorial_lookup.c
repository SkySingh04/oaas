#include <stdio.h>
#include <stdlib.h>

// String literals for testing string obfuscation
const char *APP_NAME = "Factorial Calculator - Lookup Table Version";
const char *VERSION = "v1.0.0";
const char *AUTHOR = "Research Team";

// Precomputed factorial values for testing data obfuscation
static const unsigned long long FACTORIAL_TABLE[21] = {
    1ULL,                    // 0!
    1ULL,                    // 1!
    2ULL,                    // 2!
    6ULL,                    // 3!
    24ULL,                   // 4!
    120ULL,                  // 5!
    720ULL,                  // 6!
    5040ULL,                 // 7!
    40320ULL,                // 8!
    362880ULL,               // 9!
    3628800ULL,              // 10!
    39916800ULL,             // 11!
    479001600ULL,            // 12!
    6227020800ULL,           // 13!
    87178291200ULL,          // 14!
    1307674368000ULL,        // 15!
    20922789888000ULL,       // 16!
    355687428096000ULL,      // 17!
    6402373705728000ULL,     // 18!
    121645100408832000ULL,   // 19!
    2432902008176640000ULL   // 20!
};

// Helper function to test inlining
int validate_input(int n) {
    if (n < 0) {
        printf("Error: Negative numbers not supported\n");
        return 0;
    }
    if (n > 20) {
        printf("Warning: Result may overflow for n > 20\n");
        return 0;
    }
    return 1;
}

// Lookup table factorial implementation
unsigned long long factorial_lookup(int n) {
    return FACTORIAL_TABLE[n];
}

// Fallback iterative implementation for verification
unsigned long long factorial_compute(int n) {
    unsigned long long result = 1;
    for (int i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
}

// Display function with conditional logic
void display_result(int n, unsigned long long result) {
    if (n < 5) {
        printf("Small factorial: %d! = %llu\n", n, result);
    } else if (n < 10) {
        printf("Medium factorial: %d! = %llu\n", n, result);
    } else {
        printf("Large factorial: %d! = %llu\n", n, result);
    }
}

// Print header with string literals
void print_header() {
    printf("================================\n");
    printf("%s\n", APP_NAME);
    printf("Version: %s\n", VERSION);
    printf("Author: %s\n", AUTHOR);
    printf("================================\n\n");
}

// Verify lookup table integrity
int verify_lookup_table() {
    for (int i = 0; i <= 20; i++) {
        if (FACTORIAL_TABLE[i] != factorial_compute(i)) {
            printf("FATAL: Lookup table corrupted at index %d\n", i);
            return 0;
        }
    }
    return 1;
}

int main(int argc, char *argv[]) {
    print_header();

    // Verify lookup table on startup
    if (!verify_lookup_table()) {
        printf("Lookup table verification failed!\n");
        return 1;
    }

    if (argc != 2) {
        printf("Usage: %s <number>\n", argv[0]);
        printf("Calculate factorial for numbers 1-20\n");
        return 1;
    }

    int n = atoi(argv[1]);

    if (!validate_input(n)) {
        return 1;
    }

    unsigned long long result = factorial_lookup(n);
    display_result(n, result);

    printf("\nCalculation completed successfully!\n");

    return 0;
}
