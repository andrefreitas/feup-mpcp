; *********************************************
; Folha nº4 Exercício 3
; Considere um buffer de WORDS cujo comprimento
; está guardado em ECX e o endereço em EDI
; *********************************************
include c:\masm32\include\masm32rt.inc
max proto vec:PTR WORD,comp:DWORD
min proto vec:PTR WORD,comp:DWORD
media proto vec:PTR WORD,comp:DWORD

.data
buffer WORD 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
.code
start:
    ; Maximo
    mov ecx,lengthof buffer
    mov edx, offset buffer
    invoke max,edx,ecx
    push eax
    print "Maximo: "
    pop eax
    print sstr$(eax),10,13

    ; Minimo
    mov ecx,lengthof buffer
    mov edx, offset buffer
    invoke min,edx,ecx
    push eax
    print "Minimo: "
    pop eax
    print sstr$(eax),10,13
    
    ; Media
    mov ecx,lengthof buffer
    mov edx, offset buffer
    invoke media,edx,ecx
    push eax
    print "Media: "
    pop eax
    print sstr$(eax),10,13

    inkey
exit
; Maximum procedure
max proc vec:PTR WORD,comp:DWORD
    mov edi,vec ; Endereço Base
    xor eax,eax ; Maior valor
    mov ax,[edi]; Maior valor
    mov ecx,comp
    ciclo:
        .IF [edi]>ax
            mov ax,[edi]
        .ENDIF
        add edi,2
    loop ciclo
    movzx eax,ax
ret
max endp

; Minimum procedure
min proc vec:PTR WORD,comp:DWORD
    mov edi,vec ; Endereço Base
    xor eax,eax ; Maior valor
    mov ax,[edi]; Maior valor
    mov ecx,comp
    ciclo:
        .IF [edi]<ax
            mov ax,[edi]
        .ENDIF
        add edi,2
    loop ciclo
    movzx eax,ax
ret
min endp

; Media procedure
media proc vec:PTR WORD,comp:DWORD
    mov edi,vec ; Endereço Base
    xor eax,eax ; Maior valor
    mov ecx,comp
    ciclo:
       add ax,[edi]
       add edi,2
    loop ciclo
    ; IMPORTANTE!!!!!!!!!!!!!
    xor edx,edx
    ; IMPORTANTE!!!!!!!!!!!!!
    div comp
    ret
media endp

end start