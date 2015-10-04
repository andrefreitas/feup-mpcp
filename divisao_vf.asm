include c:\masm32\include\masm32rt.inc
.data
buffer byte 32 dup(0)
x real8 3.0
y real8 2.0
z real8 4.0
p real8 ?
.code
start:
    
    fld x
    fld y
    fld z
    fdiv ; x/y
    fstp p

    invoke FloatToStr,p,offset buffer
    print offset buffer
    print " ",10,13
    
    inkey
    exit
end start