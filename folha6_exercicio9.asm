include c:\masm32\include\masm32rt.inc
; *********************************************************
; Autor: André Freitas | Email: p.andrefreitas@gmail.com
; Programa: Temos dois vectores do tempo e da velocidade.
; A partir do instante do tempo,  devolver a velocidade e  
; caso não exista o instante no vector do tempo, temos de
; recorrer a um método de interpolação de pontos.
; *********************************************************
.data
    vT real8 0.0,2.0,4.0,6.0,8.0
    vV real8 1.0,5.0,9.0,13.0,17.0
    res real8 ?
    buffer byte 32 dup(?)
    tval real8 7.0
    interpol proto vectT:ptr real8, vectV: ptr real8,n:dword, instT: real8
.code
start:
    invoke interpol, offset vT, offset vV, lengthof vV, tval
    fstp res
    invoke FloatToStr, res, offset buffer
    print offset buffer
    inkey 
    exit
; Sub-Rotina ********************************************************
interpol proc vectT:ptr real8, vectV: ptr real8,n:dword, instT: real8
    mov edi, vectT ; base do vector tempo
    mov esi, vectV ; base do vector velocidade
    mov ecx,n
    dec ecx
    fld instT ; carrega para o topo da pilha
    ; (1) - Ver se o valor do instante de tempo está dentro do intervalo
    fcom real8 ptr [edi] ; compara o valor da pilha com o valor de edi que está em memória
    fstsw ax ; copia para o ax as flags da UVF
    sahf
    jb terminar_erro
    fcom real8 ptr [edi+8*ecx]
    fstsw ax
    sahf
    ja terminar_erro
    ; (2) - Pesquisa no vector
    xor ecx,ecx
    @@: fcom real8 ptr [edi+8*ecx]
        fstsw ax
        sahf
        je encontrado
        jb interpolar
        inc ecx
    jmp @B
    interpolar:
        mov edx,ecx
        dec ecx
        fld real8 ptr [esi+8*edx]
        fsub real8 ptr [esi+8*ecx]
        fmul
        fld real8 ptr [edi+8*edx]
        fsub real8 ptr [edi+8*ecx]
        fdiv
        fadd real8 ptr [esi+8*ecx]
        jmp fim
    encontrado:
        fstp st(0)
        fld real8 ptr [esi+8*ecx]
        jmp fim   
    terminar_erro:
        fstp st(0)
        fldz
     fim: 
     ret
interpol endp
end start