.data

numIter:  .word 100000

str1: .asciiz	"A serie para "
str2: .asciiz	" iteracoes, retorna o valor: "  

.text
	li	$s7, 0		#contador de iteracoes
						
	#termo zero da série
	li	$s0, 0
	mtc1	$s0, $f0
	cvt.d.w	$f0, $f0
		
	#divisor da fracao
	li	$s1, 1
	mtc1	$s1, $f1
	cvt.d.w	$f2, $f1
	mov.d	$f8, $f2  #cte 1
		
	la	$s6, numIter	#carrega o num de iteracoes
	lw	$s6, 0($s6)
		
FOR:	
	beq	$s7, $s6, SAI1
		
	#divisor da fracao
	mtc1	$s1, $f2
	cvt.d.w	$f2, $f2
	
	#computa a fracao
	div.d	$f4, $f8, $f2
	
	#testa se eh uma iteracao par ou impar
	#par -> termo positivo, impar -> termo negativo
	andi	$t0, $s7, 1 #se t0 for 1 eh impar, senao (0) eh par
	beq	$t0, $zero, PAR
	
	#impar
	sub.d	$f0, $f0, $f4
	j	SAIIF
	
PAR:		
	#par
	add.d	$f0, $f0, $f4
		
SAIIF:	
	addi	$s1, $s1, 2
	addi	$s7, $s7, 1
	j	FOR
		
SAI1:
	#primeira parte da resposta
	li	$v0, 4
	la	$a0, str1
	syscall
	
	#numero de iteracoes
	li	$v0, 1
	move	$a0, $s6
	syscall
	
	#segunda parte da resposta
	li	$v0, 4
	la	$a0, str2
	syscall
	
	#aprox. de pi	
	li	$s5, 4
	mtc1	$s5, $f6
	cvt.d.w	$f6, $f6
		
	mul.d	$f0, $f0, $f6
	li	$v0, 3
	mov.d	$f12, $f0
	syscall
		 	
	#return 0
	li	$v0, 10
	syscall
	
		