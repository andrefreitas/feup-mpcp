include c:\masm32\include\masm32rt.inc
.data
vector sword 100 dup(3)
.code
start:
    xor ecx,ecx
    xor eax,eax
    xor ebx,ebx
    ciclo: cmp ecx,lengthof vector * 2
    je final
    mov bx,vector[ecx]
    add eax,ebx
    add ecx,2
    jmp ciclo
    final:
    print sstr$(eax),10,13
    inkey
    exit
end start