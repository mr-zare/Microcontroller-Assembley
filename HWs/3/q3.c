// 98411432 erfanzare

// Q3

#include <avr/io.h>

// Assuming R30 is a port, declare it
#define R30 PIND

uint8_t count_ones(uint8_t num) {
    uint8_t count = 0;

    for (; num; num >>= 1) {
        count += (num & 0x01) ? 1 : 0;
    }

    return count;
}

void check_and_set_ports() {
    // Read from the R30 port
    uint8_t num_ones = count_ones(R30);

    PORTB = (num_ones > (8 - num_ones)) ? 0xFF : 0x00; 
    PORTC = (num_ones > (8 - num_ones)) ? 0x00 : 0xFF; 
}

int main() {
    DDRC = 0xFF; // Set port C as output
    DDRB = 0xFF; // Set port B as output

    check_and_set_ports();

    return 0;
}
