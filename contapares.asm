;**************************************
; Programa: Conta quantos pares há num vector
; Autor: André Freitas
; Email: p.andrefreitas@gmail.com
;**************************************
include c:\masm32\include\masm32rt.inc
.data
vector DWORD 5,6,2,7,8,1,4,7,7,3,1,6
.code
start:
    xor eax,eax ; Índice do vector
    xor ecx,ecx ; Contador
    xor ebx, ebx ; Auxiliar
    .REPEAT
        mov ebx,vector[eax]
        push ebx
        push eax
        push ecx
        print sstr$(vector[eax])
        print " "
        pop ecx
        pop eax
        pop ebx
        shr ebx,1
        jc impar
            inc ecx
        impar:
        add eax,4
    .UNTIL eax==lengthof vector*4
    push ecx
    print " ",10,13
    print "Total de pares: "
    pop ecx
    print sstr$(ecx),10,13

inkey
exit
end start