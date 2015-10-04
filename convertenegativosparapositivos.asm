;**************************************
; Programa: Converte os negativos para positivos
; Autor: André Freitas
; Email: p.andrefreitas@gmail.com
;**************************************
include c:\masm32\include\masm32rt.inc
.data
vector SDWORD -5,6,-2,-7,-8,1,4,7,-7,3,1,6
.code
start:
    xor ecx,ecx ; Vector Counter
    xor eax,eax ; Auxiliar register
    ; Converter tudo para positivo
   .REPEAT
        mov eax,vector[ecx]
        cmp eax,0
        ; o i f é unsigned por isso não pode ser usado
        jg salta
            xor ebx,ebx
            sub ebx,eax
            mov vector[ecx],ebx
        salta:
        add ecx,4
   .UNTIL ecx==lengthof vector*4
   ; Imprimir vector
   xor ecx,ecx
   .REPEAT
      push ecx
      print sstr$(vector[ecx])
      print " "
      pop ecx
      add ecx,4
   .UNTIL ecx==lengthof vector*4   
   
   
inkey
exit
end start