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
    db  10,13,'Hello, World!',10,13,'$'
end
