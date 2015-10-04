include c:\masm32\include\masm32rt.inc
.data
vector1 sbyte 100 dup(3)
vector2 sword 100 dup(0)
.code
start:
   xor ecx,ecx
   xor eax,eax
   ciclo: cmp ecx, lengthof vector1
   je final
   mov al,vector1[ecx]
   mov vector2[ecx*4],ax
   inc ecx
   jmp ciclo
   print sstr$(vector2)
   final:
    inkey
    exit
end start