include c:\masm32\include\masm32rt.inc
.data
    valor real8 10.0	
    buffer byte 32 dup(0)
.code
start:
    ; (1) passar da UVF para um registo usando edi
    mov edi, offset valor ; mover
    fld1 
    fstp real8 ptr [edi]
    invoke FloatToStr,valor,offset buffer
    print offset buffer
    inkey
    exit
end start