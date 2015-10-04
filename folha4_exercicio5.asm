; *********************************************
; Folha nº4 Exercício 4
; *********************************************
include c:\masm32\include\masm32rt.inc
poly2 PROTO coefs:PTR SWORD, x:SWORD
.data
coef SWORD 1,2,3,4,5
.code
start:
    invoke poly2,offset coef,2
    inkey
    exit
poly2 proc coefs:PTR SWORD, x:SWORD
    xor ecx,ecx ; acumulador temporario
    xor ebx,ebx ; indice do vector
    xor eax, eax ; auxiliar para multiplicação
    .REPEAT
        mov ax,coefs[ebx]
        add ebx,2
    .UNTIL ebx==lengthof coefs*2
    ret
poly2 endp
    
end start