start:
    ei
    im  2
    rst 38h
    ld  a, 0
    inc a
    add a,c
    rst 38h
    srl (ix+20h),b
    adc hl, de
    ld  hl, 30h
    ld  de, 40h
    ld  bc, 3h
    ldir
    ld  bc, 1
    ldir
    halt
    org     38h
    ei
    reti
    org     66h
    ei
    reti
end
