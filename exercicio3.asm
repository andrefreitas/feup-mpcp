include c:\masm32\include\masm32rt.inc
.data
	tabValores real8 100 dup(?) ; tabela que contém os valores
	valor real8 3.0 ; valor da variável V
	nValores dword 10 ; total de valores a serem impresos
	
	TabDist proto tabela:ptr real8, v: real8, n:dword ; protótipo da rotina
      ; Variáveis para a rotina
      alfa real8 0.0
	dois real8 2.0
	noveoito real8 9.8
	passo real8 1.0
      res real8 ?
      buffer byte 32 dup(0) ; buffer para imprimir
.code
start:
	print "Tabela de Valores:",10,13
      print "-----------------------------------",10,13
      invoke TabDist,offset tabValores, valor,nValores
      xor ebx,ebx
    .WHILE(EBX<nValores)
        invoke FloatToStr,tabValores[ebx*8],offset buffer
        print offset buffer,13,10
        inc ebx
    .ENDW
     print "-----------------------------------",10,13
	inkey
	exit
	; Código da Rotina TabDist
	TabDist proc tabela:ptr real8, v: real8, n:dword 

		mov edi, tabela ; ponteiro para a tabela
		xor ecx,ecx ; iterador
		.REPEAT
			fld alfa
			fcos 
			fld alfa
			fsin
			fmul ; multiplicar seno e coseno
			fmul v 
			fmul v
			fmul dois
			fdiv noveoito
                  fst res
			fstp real8 ptr [edi]
			; incrementar o ângulo
			fld alfa
			fadd passo
			fstp alfa
			add edi,8
                  inc ecx
		.UNTIL ecx==n
            ret
	TabDist endp
end start