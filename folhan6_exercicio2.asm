include c:\masm32\include\masm32rt.inc
.data
    buffer byte 32 dup(0)
    a real8 1.0
    b real8 2.0
    valc real8 1.0
    d real8 7.0
    e real8 1.0
    p real8 ?
.code
start:
    ; ((a-b)*c)
    fld a
    fsub b
    fmul valc
    ; ((d+a)+e)
    fld a
    fadd d
    fadd e
  
    fdiv ; st(1)=st(1)/st(0) divide sempre de baixo para cima
    fstp p

    invoke FloatToStr,p,offset buffer
    print offset buffer
    inkey
    exit
end start