include c:\masm32\include\masm32rt.inc
.data
vector sbyte 100 dup(3)
.code
start:
    xor ecx,ecx
    xor eax,eax
    xor ebx,ebx
    ciclo: cmp ecx,lengthof vector
    je final
    mov bl,vector[ecx]
    add eax,ebx
    inc ecx
    jmp ciclo
    final:
    print sstr$(eax),10,13
    inkey
    exit
end start