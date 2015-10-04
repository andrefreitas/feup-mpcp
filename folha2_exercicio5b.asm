include c:\masm32\include\masm32rt.inc
.data
vector1 sword 100 dup(100)
vector2 sbyte 100 dup(4)
.code
start:
     xor eax,eax
     xor ebx,ebx
     xor ecx,ecx
     xor edx,edx
     ciclo: cmp ecx,200
        je fim
        mov ax,vector1[ecx]
        mov bx,vector1[ecx]
        shr ax,8
        shl bx,8
        shr bx,8
        cmp ax,0
        je copianormal
            cmp al,0
            jl negativo
               ; Positivo
                cmp ax,bx
                jg copia1
                mov vector2[edx],bl
                jmp salta
                copia1:
                mov vector2[edx],al
                jmp salta
            negativo:
                cmp ax,bx
                jg copia
                mov vector2[edx],al
                jmp salta
                copia:
                mov vector2[edx],bl
                jmp salta

        copianormal:
            mov ax,vector1[ecx]
            mov vector2[edx],al
        salta:
        add ecx,2
        inc edx
     jmp ciclo
     fim:
     print sstr$(vector2),10,13

inkey
exit
end start