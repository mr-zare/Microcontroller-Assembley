ldi r16, 1
delay_loop:
    ldi r17, 234
inner_loop:
    ldi r18, 237
innermost_loop:
    dec r18
    brne innermost_loop
    dec r17
    brne inner_loop
    dec r16
    brne delay_loop
    ret
