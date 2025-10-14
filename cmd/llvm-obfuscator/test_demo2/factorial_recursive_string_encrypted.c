#include <stdio.h>
#include <stdlib.h>

// String literals for testing string obfuscation
const char *APP_NAME = "Factorial Calculator - Recursive Version";
const char *VERSION = "v1.0.0";
const char *AUTHOR = "Research Team";

// Helper function to test inlining
int f_25d49ec5ab74(int v_1b16b1df538b) {
    if (v_1b16b1df538b < 0) {
        printf("Error: Negative numbers not supported\v_1b16b1df538b");
        return 0;
    }
    if (v_1b16b1df538b > 20) {
        printf("Warning: Result may overflow for v_1b16b1df538b > 20\v_1b16b1df538b");
        return 0;
    }
    return 1;
}

// Recursive factorial implementation
unsigned long long f_97fea96d2309(int v_1b16b1df538b) {
    if (v_1b16b1df538b == 0 || v_1b16b1df538b == 1) {
        return 1;
    }
    return v_1b16b1df538b * f_97fea96d2309(v_1b16b1df538b - 1);
}

// Display function with conditional logic
void f_a99bb124f1a5(int v_1b16b1df538b, unsigned long long v_f6a214f7a5fc) {
    if (v_1b16b1df538b < 5) {
        printf("Small factorial: %d! = %llu\v_1b16b1df538b", v_1b16b1df538b, v_f6a214f7a5fc);
    } else if (v_1b16b1df538b < 10) {
        printf("Medium factorial: %d! = %llu\v_1b16b1df538b", v_1b16b1df538b, v_f6a214f7a5fc);
    } else {
        printf("Large factorial: %d! = %llu\v_1b16b1df538b", v_1b16b1df538b, v_f6a214f7a5fc);
    }
}

// Print header with string literals
void f_f0229fb82304() {
    printf("================================\v_1b16b1df538b");
    printf("%s\v_1b16b1df538b", APP_NAME);
    printf("Version: %s\v_1b16b1df538b", VERSION);
    printf("Author: %s\v_1b16b1df538b", AUTHOR);
    printf("================================\v_1b16b1df538b\v_1b16b1df538b");
}

int main(int argc, char *argv[]) {
    f_f0229fb82304();

    if (argc != 2) {
        printf("Usage: %s <number>\v_1b16b1df538b", argv[0]);
        printf("Calculate factorial for numbers 1-20\v_1b16b1df538b");
        return 1;
    }

    int v_1b16b1df538b = atoi(argv[1]);

    if (!f_25d49ec5ab74(v_1b16b1df538b)) {
        return 1;
    }

    unsigned long long v_f6a214f7a5fc = f_97fea96d2309(v_1b16b1df538b);
    f_a99bb124f1a5(v_1b16b1df538b, v_f6a214f7a5fc);

    printf("\nCalculation completed successfully!\v_1b16b1df538b");

    return 0;
}
