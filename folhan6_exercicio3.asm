include c:\masm32\include\masm32rt.inc
.data
    buffer byte 32 dup(0)
    raio real8 10.0
    p real8 ?
.code
start:
    fldpi
    fmul raio
    fmul raio
    fstp p
    invoke FloatToStr,p,offset buffer
    print offset buffer
    inkey
    exit
end start