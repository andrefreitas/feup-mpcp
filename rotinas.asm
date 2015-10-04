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
    mov edi,vec
    mov ax,[edi]
    movzx eax,ax
    print sstr$(eax),10,13
    ret
max endp
end start