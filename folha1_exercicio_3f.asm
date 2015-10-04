; *********************************************************************************
; Author: André Freitas
; Email: p.andrefreitas@gmail.com
; Program: Counts how many even numbers exists between 0x0010F000 and 0x0011B003
; *********************************************************************************
include c:\masm32\include\masm32rt.inc
.code
start:
    xor ecx,ecx ;Counter starts at Zero
    mov eax,0010F000h  
    
    cicle:
         mov ebx,[eax]
         shr ebx,1
         jc salta
         inc ecx
         salta:
         add eax,4
         cmp eax,0011B003h
         je final
    jmp cicle
    
    final:
    
    inkey
    exit
end start

























