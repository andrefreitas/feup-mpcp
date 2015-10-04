include c:\masm32\include\masm32rt.inc
.data
vector1 dword 2,2,3,4,5,1,6,2,4,6
vector2 dword 2,1,1,4,5,1
resultado dword 10 dup(0)
.code
start:
  xor ecx,ecx
  .REPEAT ; Ciclo Principal
    mov eax,vector1[ecx*4]
    xor edx,edx
    .REPEAT ; Ciclo para o vector2
        .IF(eax==vector2[edx*4])
            mov resultado[ecx*4],1
        .ENDIF
     inc edx      
    .UNTIL (edx==lengthof vector2)
    inc ecx
  .UNTIL (ecx==lengthof vector1)
  ; Imprimir o vector de resultados
  xor ecx,ecx
  .Repeat
    push ecx
    print sstr$(resultado[ecx*4]),10,13
    pop ecx
    inc ecx
  .Until (ecx==lengthof resultado)
  
  inkey
  exit
end start