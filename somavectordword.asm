include c:\masm32\include\masm32rt.inc
.data
vector1 DWORD  1,2,3,4,5,6,7,8,9,10
.code
start:
    xor ecx,ecx
    xor eax,eax
    ciclo: cmp ecx,lengthof vector1*4
    je fim
    add eax,vector1[ecx]
    add ecx,4
    jmp ciclo
    fim:
    print sstr$(eax),10,13
    inkey
    exit

end start