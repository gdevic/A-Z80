;
; Dumps NEG variations
;
    org 100h
start:
    ld  b,0
lp2:
    push bc
    ld  a,b
    ld  hl, text+0
    call tohex

    push bc
    pop  af
    neg
    push af
    pop bc

    ld  a,b
    ld  hl, text+6
    call tohex
    ld  a,c
    ld  hl, text+18
    call tohex

    exx
    ld  de,text
    ld  c,9
    call 5
    exx

    pop bc
    inc b
    ld  a,b
    or  a,a
    jnz lp2
die:
    jmp die

tohex:
    ; HL = Address to store a hex value
    ; A  = Hex value 00-FF
    push af
    and  a,0fh
    cmp  a,10
    jc   skip1
    add  a, 'A'-'9'-1
skip1:
    add  a, '0'
    inc  hl
    ld   (hl),a
    dec  hl
    pop  af
    rra
    rra
    rra
    rra
    and  a,0fh
    cmp  a,10
    jc   skip2
    add  a, 'A'-'9'-1
skip2:
    add  a, '0'
    ld   (hl),a    
    ret

text:
    ;    01234567890123456789
    db  "00 -> 00  Flags = 00",13,10,'$'
end
