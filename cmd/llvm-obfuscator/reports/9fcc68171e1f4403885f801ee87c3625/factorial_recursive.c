#include <stdio.h>
#include <stdlib.h>

// String literals for testing string obfuscation
const char *APP_NAME = "Factorial Calculator - Recursive Version";
const char *VERSION = "v1.0.0";
const char *AUTHOR = "Research Team";

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

// Recursive factorial implementation
unsigned long long factorial_recursive(int n) {
    if (n == 0 || n == 1) {
        return 1;
    }
    return n * factorial_recursive(n - 1);
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

int main(int argc, char *argv[]) {
    print_header();

    if (argc != 2) {
        printf("Usage: %s <number>\n", argv[0]);
        printf("Calculate factorial for numbers 1-20\n");
        return 1;
    }

    int n = atoi(argv[1]);

    if (!validate_input(n)) {
        return 1;
    }

    unsigned long long result = factorial_recursive(n);
    display_result(n, result);

    printf("\nCalculation completed successfully!\n");

    return 0;
}
