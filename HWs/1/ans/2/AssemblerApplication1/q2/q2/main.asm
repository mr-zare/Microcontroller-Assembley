;
; q2.asm
;
; Created: 11/16/2023 08:00:01 PM
; Author : ERFAN
;
.include "m328pdef.inc"

ldi cnt, 0         
ldi i, 1           

outer_loop:
    ldi j, 5       
    addi j, 6      
    subi j, i      

inner_loop:
    brmi end_inner  

    inc cnt        
    ldi temp, 2   
    add cnt, temp  

    dec j          

    rjmp inner_loop

end_inner:
    inc i          
    dec i          

    cpi i, 5+6     
    brlo outer_loop 


end_program:
    rjmp end_progra
