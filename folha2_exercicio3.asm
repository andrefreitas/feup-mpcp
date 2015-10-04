include c:\masm32\include\masm32rt.inc
.data
vector sbyte 10 dup(3)
.code
start:
    xor ecx,ecx
    xor eax,eax
    ciclo: cmp ecx,lengthof vector -1
         je final
         mov al,vector[ecx]
         cmp al,vector[ecx+1]
         jg desordenado
    jmp ciclo
    final:
         jmp ordenado
         desordenado:
         print "Vector desordenado!",10,13
         jmp salta
         ordenado:
         print "Vector ordenado!",10,13
         salta:  
    inkey
    exit
end start