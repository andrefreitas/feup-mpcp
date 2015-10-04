include c:\masm32\include\masm32rt.inc
; ************************************************
; Definição das Variáveis
; ************************************************
.data
    n real8 1.0 ; argumento a
    m real8 5.0 ; argumento b
    x real8 1.0 ; valor objecto
    aux real8 ? ; registo auxiliar para as operações
    dois real8 2.0 ; constante dois
    quatro real8 4.0 ; constante quatro
    seis real8 6.0 ; constante 6
    simpson  proto a: real8, b:real8
     buffer byte 32 dup(0) ; para imprimir o valor final
.code
; ************************************************
; Código Principal
; ************************************************
start:
      invoke simpson,n,m
    inkey
    exit
    ; ************************************************
    ; Código Principal
    ; ************************************************
    simpson proc a:real8, b:real8
          ; (1) f((a+b) / 2)
				fld a ; | a |
				fadd b ; | a + b|
				fld dois ; | a + b | 2 |
				fdiv  ; | (a + b) / 2 |
				fst aux ; aux = st(0)
				fmul aux; | aux * aux |
				fcos ; | cos ( aux * aux) |
				fmul quatro ; | 4* (cos ( aux * aux)) |
				fstp aux ; aux = st(0) = 4* (cos ( aux * aux))
				; a pilha ficou vazia
          ; (2) f(a)
				fld a ; | a |
				fmul a ; | a * a |
				fcos ; | cos (a*a) |
				fadd aux ; | cos (a*a) +  aux|
				fstp aux ; aux= st(0) = cos (a*a) + 4* (cos ( aux * aux))
				; a pilha ficou vazia
          ; (3) f(b)
				fld b ; | b |
				fmul b ; | b * b |
				fcos  ; | cos (b*b) |
				fadd aux ; |  aux + cos (b*b) | 
				fstp aux ; aux= st(0) = cos (a*a) + 4* (cos ( aux * aux)) + cos (b*b) 
				; a pilha ficou vazia
          ; (4) Dividir por 6
				fld aux ; | aux |
				fld seis ; | aux | 6.0 |
				fdiv ; | aux / 6.0 |
				fstp aux ; aux= st(0)= (cos (a*a) + 4* (cos ( aux * aux)) + cos (b*b)) / 6.0
				; a pilha ficou vazia
          ; (5) Multiplicar por (b -a)
				fld b ; | b |
				fsub a ; | b -a |
				fmul aux ; |(b-a) * aux |
				fstp aux ; aux = st(0) = | (b-a) * (cos (a*a) + 4* (cos ( aux * aux)) + cos (b*b)) / 6.0
				; a pilha ficou vazia e aux tem o valor
                 invoke FloatToStr,aux,offset buffer
                 print offset buffer
			
          ret
    simpson endp
end start