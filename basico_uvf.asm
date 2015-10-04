include c:\\masm32\include\masm32rt.inc
.data
a real8 2.0
b real8 2.0
.code
start:
    fld b
    fld a
    fcom st(1)
    fstsw ax
    sahf
    ; Analisar
    jz iguais
        ja amaior
        print "O maior e B"
        jmp fim
        
        amaior:
        print "Maior e A"
        jmp fim
    iguais:
    print "Iguais"
    fim:
inkey
exit
end start