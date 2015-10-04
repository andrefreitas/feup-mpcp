include c:\masm32\include\masm32rt.inc
.data
    buffer byte 32
    b real8 7.8
    m real8 3.6
    n real8 7.1
    res real8 ?
.code
start:
    ; Adiciona à pilha | m |
    fld m
    ; Troca o sinal do topo | - m |
    fchs
    ; Adiciona à pilha | - m | n |
    fld n
    ; Soma ao topo da pilha | - m | n + b |
    fadd b 
    ; Multiplica todos os valores da pilha -m * (n+b)
    fmul
    ; Tira da pilha e devolve para o resultado
    fstp res
    invoke FloatToStr, res, offset buffer
    print offset buffer
    print " ", 10,16
    inkey
    exit
end start