#	Programa que calcula funções trigonometricas
#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001

.data
	numIter:.word 80
	prompt:	.asciiz	"Digite o valor do angulo: "
	seno:	.asciiz "Seno = "
	cos:	.asciiz "Cosseno = "
	tg: 	.asciiz "Tangete = "
	novalinha: .asciiz "\n" 
	
.text

	main: 
		li	$s0, 0		#contador de iteracoes	
	
		#termo zero para calcular +1 ou -1 do dividendo
		mtc1	$s0, $f13
		cvt.s.w	$f13, $f13
	
		#dividendo da fracao
		li	$s1, 1
		mtc1	$s1, $f1
		cvt.s.w	$f1, $f1
		mov.s	$f7, $f1  	#cte 1
	
		la	$s2, numIter	#carrega o num de iteracoes
		lw	$s2, 0($s2)
		
		#mensagem 
		li	$v0, 4
		la	$a0, prompt
		syscall
		
		#le um float e coloca em f6
		li 	$v0, 6
		syscall
		mov.s 	$f6, $f0
		
	for:
		beq	$s0, $s2, fim
		
		li 	$s3, 1 #valor inicial do fatorial
		li 	$t3, 1 #variavel do loop do fatorial
		
		li	$t4, 1	#variavel do loop do exponencial
		li	$s4, 1
		mtc1	$s4, $f8
		cvt.s.w	$f8, $f8 #vai receber o exponencial

		fatorial:
			mult	$s3, $t3	# fat * i
			mflo 	$s3	
				
			addi 	$t3, $t3, 1	# i += 1 
			ble 	$t3, $s1, fatorial
		
			
		exponencial:
			mul.s 	$f8, $f8, $f6
			
			addi 	$t4, $t4, 1	
			ble 	$t4, $s1, exponencial
	
		
		#convertendo o divisor da fracao (fatorial) para float
		mtc1	$s3, $f1
		cvt.s.w	$f1, $f1
		
		#computa a fracao
		div.s	$f3, $f7, $f1 	#(+/-1)/(2n+1)!
		
		mul.s	$f3, $f3, $f8 # (+/-1)/(2n+1)!	* x^(2n+1)
		
		andi	$t0, $s0, 1 	#se t0 for 1 eh impar, senao (0) eh par
		beq	$t0, $zero, par
		
		#impar
		sub.s	$f13, $f13, $f3
		
		j	computa_divisor	

	par:
		add.s	$f13, $f13, $f3
		
	computa_divisor:
		addi 	$s0, $s0, 1	
		
		mul	$s1, $s0, 2	#2*n
		#add	$s1, $s1, 1	# 2*n + 1
		
		j	for
	
	fim:	
		li	$v0, 4
		la	$a0, seno
		syscall
		
		add.s	$f13, $f13, $f7
		sub.s	$f13, $f13, $f6
				
		li	$v0, 2
		mov.s	$f12, $f13
		syscall
		
		li	$v0, 10
		syscall
