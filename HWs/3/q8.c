#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 8000000UL
#define PERIOD (F_CPU / 2000)

volatile uint16_t counter = 0; 

ISR(TIMER0_OVF_vect) {
    counter++;

    if (counter == PERIOD) {
        PORTB ^= (1 << PB0);
        counter = 0;
    }
}

void configure_timer() {
    TCCR0B |= (1 << CS01) | (1 << CS00); // Prescaler set to 64
    TIMSK0 |= (1 << TOIE0);
    sei();
}

void generate_wave() {
    DDRB |= (1 << PB0);

    while (1) {
        counter = 0;

        while (counter < PERIOD);

        PORTB ^= (1 << PB0);
    }
}

int main() {
    configure_timer();
    generate_wave();

    return 0;
}
