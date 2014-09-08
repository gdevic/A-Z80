;
; Boot code for the A-Z80 CPU test module
;
    org 0
start:
    jr  boot

    ; BDOS entry point for various functions
    ; We implement subfunctions:
    ;  C=2  Print a character given in E
    ;  C=9  Print a string pointed to by DE; string ends with '$'
    org 5
    ld  a,c
    cp  a,2
    jz  bdos_ascii
    cp  a,9
    jz  bdos_msg
    ret

bdos_ascii:
    ld  bc,2222 ; port to print
    out (c),e
    ret

bdos_msg:
    push de
    pop hl
lp0:
    ld  e,(hl)
    ld  a,e
    cp  a,'$'
    ret z
    call bdos_ascii
    inc hl
    jmp lp0

boot:
    ; Set the stack pointer
    ld  sp,32768
    ; Jump into the executable at 100h
    ei
    jmp 100h

;---------------------------------------------------------------------
; RST38 (also INT M0)  handler
;---------------------------------------------------------------------
    org 038h
    push af
    push bc
    push de
    push hl
    ld  de,int_msg
    ld  c,9
    call 5
    pop hl
    pop de
    pop bc
    pop af
    ei
    reti
int_msg:
    db  "_INT_",'$'

;---------------------------------------------------------------------
; NMI handler
;---------------------------------------------------------------------
    org 066h
    push af
    push bc
    push de
    push hl
    ld  de,nmi_msg
    ld  c,9
    call 5
    pop hl
    pop de
    pop bc
    pop af
    retn
nmi_msg:
    db  "_NMI_",'$'

end
