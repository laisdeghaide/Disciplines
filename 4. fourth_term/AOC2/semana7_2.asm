#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001
#	Data: 14/12/2020
#	Programa para analise de Hazards

.data
	array: .space 2968 	#array com 742 inteiros
	nova_linha: .asciiz "\n"

.text
	main:
		addi	$t0, $t0, 2968	#tamanho constante do array
		addi 	$t1, $zero, 0	#contador de 1 a 742
	
	loop:
		bge	$t1, $t0, fim		
		lw	$t2, array($t1)
		lw	$t3, array+4($t1)
		lw	$t4, array+8($t1)
		lw	$t5, array+12($t1)
		
				
		add 	$t2, $t2, 1
		add 	$t3, $t3, 1
		add 	$t4, $t4, 1
		add 	$t5, $t5, 1
		
		sw	$t2, array($t1)
		sw	$t3, array+4($t1)
		sw	$t4, array+8($t1)	
		sw	$t5, array+12($t1)

		addi 	$t1, $t1, 16

		j 	loop
		
	fim:
		lw	$t2, array($t1)
		lw	$t3, array+4($t1)
		
		add 	$t2, $t2, 1
		add 	$t3, $t3, 1
		
		sw	$t2, array($t1)
		sw	$t3, array+4($t1)
		
		li 	$v0, 10			#encerra o programa
		syscall
