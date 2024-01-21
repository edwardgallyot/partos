#include "utils/types.h"

#define gpio (0x20200000)

// Register indicies
#define gpfsel        (1)
#define gpfclr0       (10)
#define gpfset0       (7)

// Register bits
// Function select
#define fsel19_out    (1 << 27)
#define fsel18_out    (1 << 24)
#define fsel17_out    (1 << 21)
#define fsel16_out    (1 << 18)

// Clear register
#define clr16_clear   (1 << 16)
#define set16_set     (1 << 16)

volatile u32 time;
volatile u32* pins;

int main(void) {
        pins = (u32*)gpio;

        pins[gpfsel] |= fsel16_out;

        while(1) {
                for (time = 0; time < 50000; ++time);
                pins[gpfset0] = set16_set;

                for (time = 0; time < 50000; ++time);
                pins[gpfclr0] = clr16_clear;
        }
}

void exit(int hi) {
        while(1) {}
}
