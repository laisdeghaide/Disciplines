#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001
#	Data: 16/11/2020
#	Programa que calcula o Fibonacci de um número

.data
	prompt: .asciiz "Digite um número: "
	nova_linha: .asciiz "\n"
	resultado: .asciiz "O valor do Fibonacci do número digitado é: "
	
.text
	main: 
		li	$v0, 4
		la 	$a0, prompt
		syscall				#imprime a mensagem de prompt
		
		li 	$v0, 5
		syscall
		move 	$a0, $v0 		#recebe o valor que o usuario digitou e coloca em a0
		
		jal	fibonacci
		
		move	$a1, $v0		#o valor que foi posto em $v0 na função fibonacci será atribuido ao a1
						#para não dar conflito na hora de printar a mensagem de resultado com o valor do resultado
		j fim
		
	fibonacci:
		addi 	$sp, $sp, 12 		#criando pilha 
		sw	$ra, 0($sp)		#empilho registrador $ra	
		sw	$s0, -4($sp)		#empilho registrador $s0
		sw	$s1, -8($sp)		#empilho registrador $s1
		
		add 	$s0, $a0, $zero 	#registrador $s0 receberá o valor de $a0
		
		addi 	$t1, $zero, 1		#t1 vai receber 1, para que eu possa fazer o (n-1)
		
		beq	$s0, $zero, casobase1	#caso base: s0 == 0
		beq	$s0, $t1, casobase2	#caso base s0 == 1
		
		addi 	$a0, $s0, -1		#decremento a0
		jal 	fibonacci		#primeira chamada recusiva com (n-1)
		
		add 	$s1, $zero, $v0		#s1 recebe fibonacci(n-1)
		
		addi 	$a0, $s0, -2		
		jal	fibonacci		#segunda chamada recursiva com (n-2)
		
		add	$v0, $v0, $s1		#v0 = fib(n-2) + fib(n-1)
	
	fim_fibonacci:
		lw 	$ra, 0($sp)       	#lê a pilha
		lw 	$s0, -4($sp)
		lw 	$s1, -8($sp)
		addi 	$sp, $sp, -12       	#volta o ponteiro para primeira posição
		
		jr 	$ra
		
	casobase2: 
		li	$v0, 1			
		j	fim_fibonacci
	
	casobase1: 
		li	$v0, 0
		j 	fim_fibonacci
		
	fim:
		li 	$v0, 4
		la 	$a0, resultado
		syscall				#printa mensagem de saida
		
		move 	$a0, $a1
		li 	$v0, 1	
		syscall				#printa resultado

		li 	$v0, 10			#encerra o programa
		syscall
