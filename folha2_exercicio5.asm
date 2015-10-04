include c:\masm32\include\masm32rt.inc
.data
vector1 sdword 100 dup(100000)
vector2 sword 100 dup(4)
.code
start:
     xor eax,eax
     xor ebx,ebx
     xor ecx,ecx
     xor edx,edx
     ciclo: cmp ecx,400
        je fim
        mov eax,vector1[ecx]
        mov ebx,vector1[ecx]
        shr eax,16
        shl ebx,16
        shr ebx,16
        cmp eax,0
        je copianormal
            cmp ax,0
            jl negativo
               ; Positivo
                cmp eax,ebx
                jg copia1
                mov vector2[edx],bx
                jmp salta
                copia1:
                mov vector2[edx],ax
                jmp salta
            negativo:
                cmp eax,ebx
                jg copia
                mov vector2[edx],ax
                jmp salta
                copia:
                mov vector2[edx],bx
                jmp salta

        copianormal:
            mov eax,vector1[ecx]
            mov vector2[edx],ax
        salta:
        add ecx,4
        add edx,2
     jmp ciclo
     fim:
     print sstr$(vector2),10,13

inkey
exit
end start