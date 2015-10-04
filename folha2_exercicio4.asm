include c:\masm32\include\masm32rt.inc
.data
vector1 sword 256 dup(10)
vector2 sword 256 dup(4)
.code
start:
     xor ecx,ecx
     xor eax,eax
     xor ebx,ebx
     ciclo: cmp ecx, lengthof vector1 * 2
        je final
        mov ax,vector1[ecx]
        add ax,vector2[ecx] 
        ; Check if overflow
        jno semoverflow
            js negativo
                mov bx,vector1[ecx]
                ; If vector2 > vector1
                cmp  vector2[ecx],bx
                jng salta
                mov bx,vector2[ecx]
                mov vector1[ecx],bx
                jmp salta
           
            negativo:
                 mov bx,vector1[ecx]
                ; If vector1 > vector 2
                cmp  bx,vector2[ecx]
                jng salta
                mov bx,vector2[ecx]
                mov vector1[ecx],bx
                jmp salta
        semoverflow:
        mov vector1[ecx],ax
        salta:
     add ecx,2
     jmp ciclo
     final:
     print sstr$(vector1),10,13
     inkey
exit
end start