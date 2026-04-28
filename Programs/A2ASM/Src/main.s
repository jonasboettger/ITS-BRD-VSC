;******************** (C) COPYRIGHT HAW-Hamburg ********************************
;* File Name          : main.s
;* Author             : Martin Becke    
;* Version            : V1.0
;* Date               : 01.06.2021
;* Description        : This is a simple main to demonstrate data transfer
;                     : and manipulation.
;                     : 
;
;*******************************************************************************
    EXTERN initITSboard ; Helper to organize the setup of the board

    EXPORT main         ; we need this for the linker - In this context it set the entry point,too

ConstByteA  EQU 0xaffe
    
;* We need some data to work on
    AREA DATA, DATA, align=2    
VariableA   DCW 0xbeef
VariableB   DCW 0x1234
VariableC   DCW 0xaffe  

;* We need minimal memory setup of InRootSection placed in Code Section 
    AREA  |.text|, CODE, READONLY, ALIGN = 3    
    ALIGN   
main
    BL initITSboard             ; needed by the board to setup
;* swap memory - Is there another, at least optimized approach?
    ldr     R0,=VariableA   ; Anw01
    ldrb    R2,[R0]         ; Anw02
    ldrb    R3,[R0,#1]      ; Anw03
    lsl     R2, #8          ; Anw04
    orr     R2, R3          ; Anw05
    strh    R2,[R0]         ; Anw06 
    
;* const in var
    mov     R5,#ConstByteA  ; Anw07
    strh    R5,[R0]         ; Anw08

    ldr     R4,=VariableC   ; Adresse von VariableC in R4
    and     R6, R5, #0x00FF ; R6 = 0xFE
    lsl     R6, R6, #8      ; R6 = 0xFE00 
    lsr     R7, R5, #8      ; R7 = 0xAF
    orr     R6, R6, R7      ; R6 = 0xFEAF
    strh    R6,[R4]         ; Spoiler: Speicher sollte ausgeben AF FE 
    
;* Change value from x1234 to x4321.

    ldr     R1, =VariableB      ; Anw09: Adresse vonVariableB
    ldrh    R6, [R1]            ; R6 = 0x1234
    and     R7, R6, #0xFF       ; R7 = 0x34
    lsl     R7, R7, #8          ; R7 = 0x3400
    lsr     R6, R6, #8          ; R6 = 0x12
    orr     R6, R6, R7          ; R6 = 0x3412
    strh    R6, [R1]            ; Speicher bei VariableB
    b .                         ; Endlosschleife


    ;ldr     R1,=VariableB   ; Anw09
    ;ldrb    R6,[R1]         ; Anw0A
    ;ldrb    R7,[R1,#1]      ; Anw0B
    ;strb    R7,[R1]         ; Anw0C
    ;strb    R6,[R1,#1]      ; Anw0D
    ;b .                     ; Anw0E


    ;ldrh    R6,[R1]         ; Anw0A
    ;mov     R7, #0x30ED     ; Anw0B
    ;add     R6, R6, R7      ; Anw0C
    ;strh    R6,[R1]         ; Anw0D
    ;b .                     ; Anw0E
    
    ALIGN
    END