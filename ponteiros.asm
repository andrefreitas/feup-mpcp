include c:\masm32\include\masm32rt.inc
max proto vec:PTR WORD
.data
bufer WORD 1,2,3,4,5,6
.code
start:
    invoke max,offset bufer
inkey
ret
max proc vec:PTR WORD
    mov edi,vec ; Mover o endereço do vector
    mov ax,[edi] ; Mover o valor Word para um registo Word
    movzx eax,ax ; Estender o sinal de eax
    print sstr$(eax),10,13
    ret
max endp
end start