; *********************************************************************************
; Author: André Freitas
; Email: p.andrefreitas@gmail.com
; Program: Counts how many sequence of 10110 exists
; *********************************************************************************

include c:\masm32\include\masm32rt.inc
.code
start:
    xor eax,eax
    mov eax,sval(input("Introduza o eax: ",62," "))
    xor ecx,ecx ; Contador comeca a zero
    
    ciclo: cmp eax,0 ; So faz o ciclo enquanto o eax e diferente de 0
    je final 
    mov ebx,eax
    ; *******************************************************
    ; 1º Teste
    shl ebx,1
    jnc salta
    
    ; 2º Teste
    shl ebx,1
    jc salta
    
    ; 3º Teste
    shl ebx,1
    jnc salta
    
    ; 4º Teste
    shl ebx,1
    jnc salta
    
    ; 5º Teste
    shl ebx,1
    jc salta
    
    ; Verificou que tem 10110 na sequencia, incrementa 1
    inc ecx
    ; *******************************************************
    salta:
    shl eax,1
    jmp ciclo

 
    final:
    
    push ecx
    print "Total de sequencias: "
    pop ecx
    
    print sstr$(ecx),10,16
    inkey
    exit
end start

























