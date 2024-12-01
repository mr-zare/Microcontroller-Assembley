;
; q4.asm
;
; Created: 11/16/2023 09:42:04 PM
; Author : ERFAN
;
.include "Irvine32.inc"
.include "m32def.inc"
.CODE
    MAIN PROC
        MOV R16, HIGH(0xB0)
        MOV R17, LOW(0xB0)

        MOV R18, HIGH(0xB1)
        MOV R19, LOW(0xB1)

        XOR R20, R20
        XOR R21, R21
        XOR R22, R22
        XOR R23, R23

    loop:
        SHL R22, 1
        RCL R23, 1
        OR R22, R16
        OR R23, R17

        SHR R17, 1
        SHR R16, 1
        SBB R23, R19
        SBB R22, R18

        BRGE carry, end_loop
        INC R21
        BRGE carry, end_loop
        INC R20

    carry:
        JMP loop

    end_loop:
        MOV AX, 4C00h   
        INT 21h         

    MAIN ENDP
END MAIN


