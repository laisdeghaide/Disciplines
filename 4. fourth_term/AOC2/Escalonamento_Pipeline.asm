

.data
x: .space 2968
.text
	li 	$t0,0 	 #sera nosso contador i
	li	$s1,2972 #usado para comparar no beq, fim do numero de interações
	li	$s2,0    #Salva x[i]
	li	$s3,1	 #usado para somar +1
FOR:	
	beq	$t0,$s1,SAI #Saida do loop, checa o num total de interações
	lw 	$s2,x($t0)    #Carrega o conteudo de x[i]
	add	$s2,$s2,$s3   #Soma 1
	sw   	$s2,x($t0)    #Salva novamente em x[i]
	addi 	$t0,$t0,4     #Soma o contador
	j	 FOR
	
SAI:
	li	$v0,0
