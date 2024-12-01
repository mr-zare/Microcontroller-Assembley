.macro power_calculation
    ldi result, 1
    ldi counter, 0

    power_calculation_loop:
        cp counter, exponent
        breq power_calculation_done

        mov multiplicand, result
        mov multiplier, base
        call multiply_numbers

        mov result, product_low

        inc counter

        rjmp power_calculation_loop

    power_calculation_done:
        mov base, result
.endm

.macro multiply_numbers
    mov original_multiplier_low, multiplier
    mov original_multiplier_high, multiplier + 1
    ldi product_low, 0
    ldi product_high, 0
    ldi loop_counter, 8

multiply_numbers_loop:
    lsl original_multiplier_low
    rol original_multiplier_high
    brcs multiply_numbers_skip

    add product_low, original_multiplier_high
    adc product_high, 0

multiply_numbers_skip:
    dec loop_counter
    brne multiply_numbers_loop

    mov product_low, product_high
.endm

.equ base = R29
.equ exponent = R30
.equ result = R29
.equ counter = R30
.equ multiplicand = R16
.equ multiplier = R17
.equ original_multiplier_low = R18
.equ original_multiplier_high = R19
.equ product_low = R18
.equ product_high = R19
.equ loop_counter = R20

    ldi base, 3
    ldi exponent, 4

    power_calculation
