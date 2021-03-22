#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001
#	Data: 14/12/2020
#	Programa para analise de Hazards

.data
	array: .space 2968 	#array com 742 inteiros

.text
	main:
		addi	$t0, $t0, 2968	#tamanho constante do array
		addi 	$t1, $zero, 0	#contador de 1 a 742
	
	loop:
		bge	$t1, $t0, fim
		
		lw	$t2, array($t1)
		add 	$t2, $t2, 1
		sw	$t2, array($t1)
		
		addi 	$t1, $t1, 4
				
		j 	loop
		
	fim:
		li 	$v0, 10			#encerra o programa
		syscall
