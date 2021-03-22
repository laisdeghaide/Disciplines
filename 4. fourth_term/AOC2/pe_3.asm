#	Programa que calcula funções trigonometricas
#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001

.data
	numIter:.word 30
	prompt:	.asciiz	"Digite o valor do angulo em radianos: "
	sen:	.asciiz "Seno = "
	cos:	.asciiz "Cosseno = "
	tg: 	.asciiz "Tangente = "
	novalinha: .asciiz "\n" 
	
.text

	main: 
		li	$s0, 0		#contador de iterações	para seno
		li	$s6, 0		#contador de iterações para cosseno
		
		#termo zero para calcular +1 ou -1 do dividendo
		mtc1	$s0, $f13
		cvt.s.w	$f13, $f13
		
		mtc1	$s6, $f14
		cvt.s.w	$f14, $f14
		
		#dividendo da fração
		li	$s1, 1
		mtc1	$s1, $f1
		cvt.s.w	$f1, $f1
		mov.s	$f7, $f1  	#constante 1
	
		la	$s2, numIter	#carrega o número de iterações
		lw	$s2, 0($s2)
		
		#mensagem 
		li	$v0, 4
		la	$a0, prompt
		syscall
		
		#lê um float e coloca em f6
		li 	$v0, 6
		syscall
		mov.s 	$f6, $f0
		
	seno:
		beq	$s0, $s2, fim	#se já realizou o número de iterações, vai para fim
		
		li 	$s3, 1 		#valor inicial do fatorial
		li 	$t3, 1 		#variável do loop do fatorial
		
		li	$t4, 1		#variavel do loop do exponencial
		li	$s4, 1
		mtc1	$s4, $f8
		cvt.s.w	$f8, $f8 	#vai receber o exponencial
		
		jal	fatorial
		jal	exponencial
		
		#convertendo o divisor da fração (fatorial) para float
		mtc1	$s3, $f1
		cvt.s.w	$f1, $f1
		
		#computa a fração
		div.s	$f3, $f7, $f1	#(+/-1)/(2n+1)!
		
		mul.s	$f3, $f3, $f8	# (+/-1)/(2n+1)!	* x^(2n+1)
		
		andi	$t0, $s0, 1 	#se t0 for 1 eh impar, senao (0) eh par
		beq	$t0, $zero, par_seno
		
		#impar
		sub.s	$f13, $f13, $f3
		
		j	computa_divisor_seno	
	
	par_seno:
		add.s	$f13, $f13, $f3
		
	computa_divisor_seno:
		addi 	$s0, $s0, 1	#contador recebe +1
		mul	$s1, $s0, 2	#2*n
		add	$s1, $s1, 1	# 2*n + 1
		
		j	seno
		
	
	cosseno:
		beq	$s6, $s2, fim2	#se já realizou o número de iterações, vai para fim2
		
		jal	fatorial
		jal	exponencial
		
		#convertendo o divisor da fração (fatorial) para float
		mtc1	$s3, $f21
		cvt.s.w	$f21, $f21
		
		#computa a fração
		div.s	$f23, $f7, $f21 	#(+/-1)/(2n)!
		
		mul.s	$f23, $f23, $f8 # (+/-1)/(2n)!	* x^(2n)
		
		andi	$t1, $s6, 1 	#se t1 for 1 eh impar, senão (0) eh par
		beq	$t1, $zero, par_cos
		
		#impar
		sub.s	$f14, $f14, $f23
		
		j	computa_divisor_cosseno
	
	fatorial:
		mult	$s3, $t3	# fat * i
		mflo 	$s3	
			
		addi 	$t3, $t3, 1	# i += 1 
		ble 	$t3, $s1, fatorial
		jr	$ra	
			
	exponencial:
		mul.s 	$f8, $f8, $f6
		
		addi 	$t4, $t4, 1	
		ble 	$t4, $s1, exponencial
		jr	$ra
	
	par_cos:
		add.s	$f14, $f14, $f23
			
	computa_divisor_cosseno:
		addi 	$s6, $s6, 1	#contador recebe +1
		mul	$s1, $s6, 2	#2*n
		
		j 	cosseno
	
	fim:	
		#reinicializando registradores para reutilizar no cosseno
		li	$s1, 1
		li 	$s3, 1		#valor inicial do fatorial
		li 	$t3, 1 		#variavel do loop do fatorial
		
		li	$t4, 1		#variavel do loop do exponencial
		li	$s4, 1
		mtc1	$s4, $f8
		cvt.s.w	$f8, $f8 	#vai receber o exponencial
		
		#printa mensagem "Seno = "
		li	$v0, 4
		la	$a0, sen
		syscall
		
		#printa resultado do seno
		li	$v0, 2
		mov.s	$f12, $f13
		syscall
		
		#\n
		li	$v0, 4
		la	$a0, novalinha
		syscall
		
		j	cosseno
	
	fim2: 
		#printa mensagem "Cosseno = "
		li	$v0, 4
		la	$a0, cos
		syscall
		
		#Como reutilizei as função de fatorial e exponecial do seno, preciso aqui fazer alguns ajustes
		add.s	$f14, $f14, $f7		#A serie de Taylor do cosseno inicia em 1 e não com o valor digitado,
		sub.s	$f14, $f14, $f6		#então eu adiciono 1 no meu resultado e subtraio o valor digitado do resultado
						#(famosa gambiarra)
		
		#printa o resultado de cosseno
		li	$v0, 2
		mov.s	$f12, $f14
		syscall
		
		#\n
		li	$v0, 4
		la	$a0, novalinha
		syscall
		
		#printa mensagem "Tangente = "
		li	$v0, 4
		la	$a0, tg
		syscall
		
		#Calcula a tg = sen/cos e printa o resultado
		div.s $f15, $f13, $f14
		li	$v0, 2
		mov.s	$f12, $f15
		syscall
		
		#finaliza o programa
		li	$v0, 10
		syscall
		
