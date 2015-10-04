; *********************************************
; Folha nº4 Exercício 4
; *********************************************
include c:\masm32\include\masm32rt.inc
minpot2 proto num:DWORD
.data
valor dword 24
.code
start:
    invoke minpot2,valor
    print sstr$(eax),10,13
    inkey
    exit
minpot2 proc num:DWORD
    mov edx,num
    mov eax,1
    .REPEAT
        shl eax,1
    .UNTIL eax>edx
    ret
minpot2 endp 
end start