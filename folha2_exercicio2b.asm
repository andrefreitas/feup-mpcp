include c:\masm32\include\masm32rt.inc
.data
vector1 sword 100 dup(3)
vector2 sdword 100 dup(0)
.code
start:
   xor ecx,ecx
   xor eax,eax
   ciclo: cmp ecx, lengthof vector1 * 2
   je final
   mov ax,vector1[ecx]
   mov vector2[ecx*2],eax
   add ecx,2
   jmp ciclo
   final:
    inkey
    exit
end start