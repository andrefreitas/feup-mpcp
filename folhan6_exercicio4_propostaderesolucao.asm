include c:\masm32\include\masm32rt.inc
.data
    buffer byte 32 dup(0)
    tabela real8 101 dup(?)
    xinc real8 0.1
    coef2 real8 1.2
    coef1 real8 -12.5
    coef0 real8 7.0
    calc_poly_tbl proto uses edi vect:ptr real8  
.code
start:
    invoke calc_poly_tbl, offset tabela
    xor ebx,ebx
    .WHILE(EBX<101)
        invoke FloatToStr,tabela[ebx*8],offset buffer
        print offset buffer,13,10
        inc ebx
    .ENDW
; **************
; Início Rotina
; **************    
calc_poly_tbl proc uses edi vect:ptr real8   
    mov ecx,101
    mov edi,vect
    fldz ; Carrega tudo a zero
    @@: 
        fld st(0)
        fld st(0)
        fmul st(0),st(0)
        fmul st(0),st(1)
        fmul coef2
        fxch
        fmul coef1
        fadd
        fadd coef0
        fstp real8 ptr [edi]
        add edi,8
        fadd xinc
    loop @B
    fstp st(0)
    ret
calc_poly_tbl endp
; **************
; Fim Rotina
; **************  
    inkey
    exit
end start