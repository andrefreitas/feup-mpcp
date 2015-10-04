;**************************************
; Programa: Bubblesort
; Autor: André Freitas
; Email: p.andrefreitas@gmail.com
;**************************************
include c:\masm32\include\masm32rt.inc
.data
vector DWORD 5,6,2,7,8,1,4,7,7,3,1,6
.code
start:
    ; Order vector
    .REPEAT
        mov eax, 0 ; Registo de Flag =0 cada ciclo
        mov ecx,0 ; Index do vector
        .REPEAT
            mov ebx,vector[ecx+4]
            ; Se o par está desordenado
            .IF vector[ecx]>ebx
                ; troca(vector[ecx],vector[ecx+4])
                mov edx,vector[ecx]
                mov vector[ecx],ebx
                mov vector[ecx+4],edx
                ; Altera a Flag para 1
                mov eax,1
            .ENDIF
            add ecx,4
        .UNTIL ecx==lengthof vector * 4 - 4
    .UNTIL eax==0
    
    ; Print vector
     xor ebx,ebx
    .REPEAT
        print sstr$(vector[ebx]),10,13
        add ebx,4
    .UNTIL ebx==lengthof vector*4
    
inkey
exit
end start