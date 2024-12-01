;
; q3.asm
;
; Created: 11/16/2023 09:09:05 PM
; Author : ERFAN
;
.include "m32def.inc"
.include Irvine32.inc
.CODE
    MAIN PROC
        MOV R16, HIGH(0xB0)
        MOV R17, LOW(0xB0)

        MOV R18, HIGH(0xB1)
        MOV R19, LOW(0xB1)
        MOV AX, R16
        MUL R18
        MOV R20, AX     
        MOV AX, R17
        MUL R18
        ADD R20, AX     
        SHL R20, 16
        MOV R21, R20   

        MOV AX, R19
        MUL R16
        ADD R21, AX     

        SHL R21, 16
        MOV R22, R21    

        MOV AX, R17
        MUL R19
        ADD R22, AX    

     
        SHL R22, 16
        MOV R23, R22    

        MOV AX, 4C00h   
        INT 21h         

    MAIN ENDP
END MAIN



