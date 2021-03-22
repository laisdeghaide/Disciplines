#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001
#	Data: 16/11/2020
#	Programa que calcula a soma dos números impares

.data
	prompt: .asciiz "Digite 10 números: "
	ponto: .asciiz ": "
	nova_linha: .asciiz "\n"
	resultado: .asciiz "Resultado: "

.text
	main:
		addi	$t0, $zero, 1 		#contador i = 1 até 11 (n incluso)
		addi 	$s1, $zero, 2 		#valor 2 para fazer a divisão e checar se é impar
		addiu 	$s2, $zero, 0 		#$s2 será a minha soma incremental, inicializo com 0
				
		li	$v0, 4
		la 	$a0, prompt
		syscall				#imprime a mensagem de prompt
		
		li 	$v0, 4
		la 	$a0, nova_linha
		syscall				#imprime nova linha
		
	input:
		beq 	$t0, 11, output		#compara se já recebeu os 10 numeros
		
		move 	$a0, $t0 
		li 	$v0, 1
		syscall				#imprime valores de 1 a 10 para o usuario inserir o valor
		
		li 	$v0, 4
		la 	$a0, ponto
		syscall
		
		li 	$v0, 5
		syscall
		addiu $t1, $v0, 0		#recebe o valor que o usuario digitou e coloca em t1
		
		addiu 	$t0, $t0, 1		#incremento o contador 
		
		j 	impares
	
	impares:
		li 	$t2, 0
		div 	$t1, $s1		#divido o numero recebido por 2
		mfhi 	$t2			#pego o resto
		
		beq 	$t2, 1, soma_impares 	#se o resto = 1 então é impar
		
		j 	input 			#se não, volta para receber outro numero
	
	soma_impares:
		addu 	$s2, $s2, $t1		
		j 	input

	output:
		li 	$v0, 4
		la 	$a0, resultado
		syscall
		
		li 	$v0, 1 
		move 	$a0, $s2  
		syscall
		
		li $v0, 10	#encerra o programa
		syscall
		
