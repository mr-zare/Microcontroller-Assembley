;; erfan zare
;; 98411432

.equ F_CPU = 8000000

.macro delay_1s
    ldi r16, 0x06
    sts TCCR0B, r16

    ldi r16, (F_CPU / 256 - 1) & 0xFF
    sts TCNT0, r16

    ldi r16, ((F_CPU / 256 - 1) >> 8) & 0xFF
    sts TCNT0H, r16

delay_loop:
    sbis TIFR0, TOV0
    rjmp delay_loop

    ldi r16, 0xFF
    sts TCNT0, r16

    ldi r16, ((F_CPU / 256 - 1) >> 8) & 0xFF
    sts TCNT0H, r16

    sbi TIFR0, TOV0

    dec r16
    brne delay_loop
.endm

.section .text
.global main

main:
    ldi r16, 0xFF
delay_start:
    call delay_1s
    dec r16
    brne delay_start

    ; Your main code here

end:
    jmp end
