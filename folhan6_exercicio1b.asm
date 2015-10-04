include c:\masm32\include\masm32rt.inc
.data
    buffer byte 32 dup(0)
    b real8 7.0 ; se usar um qword não posso usar nas contas
    n real8  7.1
    p real8  ?
.code
start:
    fld n
    fsqrt
    fadd b
    fstp p
    invoke FloatToStr,p,offset buffer
    print offset buffer
    inkey
    exit
end start