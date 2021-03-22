#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001
#	Data: 16/11/2020
#	Programa que calcula a media dos resultados em um array tamanho 10


.data
	array: .space 40 			#array com 10 inteiros
	prompt: .asciiz "Digite 10 números: "
	ponto: .asciiz ": "
	nova_linha: .asciiz "\n"
	resultado: .asciiz "Resultado: "
	
.text
	main:
		addi 	$t0, $t0, 40 		#tamanho constante do array
		addi 	$t9, $t9, 1 		#contador i = 1 até 10
		addi 	$s5, $s5, 10 		#divisor
		
		li 	$v0, 4
		la 	$a0, prompt
		syscall				#imprime a mensagem de prompt
		
		li 	$v0, 4
		la 	$a0, nova_linha
		syscall				#imprime nova linha
		
	input:
		beq 	$t1, $t0, continue 	#compara t1 == t0 (se já recebeu os 10 numeros, vai pra função total)
		
		move 	$a0, $t9 
		li 	$v0, 1
		syscall				#imprime valores de 1 a 10 para o usuario inserir o valor
		
		li	 $v0, 4
		la 	$a0, ponto
		syscall
		
		li 	$v0, 5
		syscall
		move 	$t2, $v0 		#recebe o valor que o usuario digitou e coloca em t2
		
		sw 	$t2, array($t1)		#armazena o valor que está em t2 no array
		addi 	$t1, $t1, 4 		#mudo o ponteiro do array para a proxima posição
		addi 	$t9, $t9, 1		#incremento o contador 
		
		j 	input 
				
	continue:
		move 	$t1, $zero 		#apenas retorno o ponteiro do array para zero para poder usá-lo novamente
		
	total:
		beq	$t1, $t0, media 	#se t1 == t0 (significa que já percorreu todo o array)
		lw 	$t2, array($t1) 
		add 	$s1, $s1, $t2 		#s1 recebe a soma de cada valor no array
		addi 	$t1, $t1, 4 		#vai para a proxima posição do array
		
		j 	total

	media:
		div 	$t3, $s1, $s5		#divisão s1 / s5
		
	output:
		li 	$v0, 4
		la 	$a0, nova_linha
		syscall
		
		li 	$v0, 4
		la 	$a0, resultado
		syscall
		
		move 	$a0, $t3
		li 	$v0, 1			#resultado
		syscall	
		
		li 	$v0, 10			#encerra o programa
		syscall
