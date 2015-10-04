; *********************************************************************************
; Author: André Freitas
; Email: p.andrefreitas@gmail.com
; Program: Length of a string that ends with zero
; *********************************************************************************
include c:\masm32\include\masm32rt.inc
.code
start:
    xor eax,eax
    xor ecx,ecx
    mov eax,input("String? ",16," ")
    
    mov ecx,len(eax)
    push ecx
    print "String length: ",10,16
    pop ecx
    print sstr$(ecx),10,13

    inkey
    exit
end start







