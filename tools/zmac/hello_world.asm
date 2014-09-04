;
; Prints "Hello, World!"
;
    org 100h
start:
    ld  de,hello
    ld  c,9
    call 5
die:
    jr die

hello:
    db  13,10,'Hello, World!',13,10,'$'
end
