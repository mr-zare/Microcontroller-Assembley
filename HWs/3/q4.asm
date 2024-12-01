;; erfan zare
;; 98411432

;; Q4

.include "m32def.inc"

.equ input1 = R30
.equ input2 = R31
.equ result = R29

GCD:
    PUSH temp
    PUSH input2

    MOV temp, input1
    MOV input2, input1
    MOV input1, temp

MyMainLoop:
    CP input1, input2
    BRNE MyContinue

    MOV result, input1
    JMP MyEnd 

MyContinue:
    CP input1, input2   
    BRCS MySwap   

    SUB input1, input2 
    RJMP MyMainLoop  

MySwap:
    XCH input1, input2  
    RJMP MyMainLoop  

MyEnd:
    POP input2        
    POP temp
    RET           

main:
    ldi temp, 0xFF  
    out DDRB, temp

    ldi input1, 54  

    ldi input2, 24  

    CALL GCD

    out PORTB, result

end:
    JMP end  

.org 0x0000
    rjmp main
