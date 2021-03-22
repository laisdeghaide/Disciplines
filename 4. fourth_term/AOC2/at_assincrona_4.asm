#	Programa que calcula raizes de segundo grau utilizando pilha
#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001


.data

	a: .asciiz "a = " 		
	b: .asciiz "b = " 		
	c: .asciiz "c = " 		
	x1: .asciiz "\nx1 = "
	x2: .asciiz "\nx2 = "
	negativo: .asciiz "\nPossui raiz complexas"
	constante: .float 4.0
	num_2: .float 2.0
	
.text
	.globl main
	
	main:
		sub $sp, $sp, 128
		li $v0, 4		#printa a string "a =" com o syscall 4
		la $a0, a 		
		syscall			
	
		li $v0, 6	        #le um float com o syscall 6
        	syscall				
	
		swc1 $f0, 0($sp)	#armazena o "a" na pilha
	
		li $v0, 4		#printa a string "b =" com o syscall 4
		la $a0, b		
		syscall			
	
		li $v0, 6	        #le um float com o syscall 6
        	syscall				
	
		swc1 $f0, 32($sp)	#armazena o "b" na pilha
		
		li $v0, 4		#printa a string "c =" com o syscall 4
		la $a0, c		
		syscall
	
		li $v0, 6	       	 #le um float com o syscall 6
        	syscall			
	
		swc1  $f0, 64($sp)	#armazena o "c" na pilha
		
		jal delta
		jal raizes
		jal fim

delta:	
		lwc1 $f0, 64($sp)	#desempilha o "c"
		lwc1 $f1, 32($sp)	#desempilha o "b"
		lwc1 $f2, 0($sp)	#desempilha o "a"
		addi $sp, $sp, 96	#retorno o ponteiro para a primeira posição dele
		
		
		mul.s $f3, $f1, $f1	#$f3 recebe o b ^ 2
		mul.s $f4, $f2, $f0 	#$f4 recebe a * c
		l.s $f6, constante	#move a constante 4.0 para f6
		mul.s $f5, $f4, $f6	#$f5 recebe 4.0 * a * c
		sub.s $f7, $f3, $f5	#$f7 recebe b^2 - 4 * a *c
		
		
		mfc1 $t1, $f7		#resultado de delta armazenado em t1, convertido para inteiro
    		bltz $t1, deltaNegativo #se o delta for menor que zero, vai para a função deltaNegativo
	
		sub $sp, $sp, 96	#ponteiro apontado para a ultima posição do vetor
		swc1 $f0, 0($sp)	#empilha novamente o "c" na primeira posição do vetor
		swc1 $f1, 32($sp)	#empilha novamente o "b" na segunda posição do vetor
		swc1 $f2, 64($sp)	#empilha novamente o "a" na terceira posição do vetor
		swc1 $f7, 96($sp) 	#empilha o resultado do delta na quarta posição da pilha
		
				
		jr $ra
		

deltaNegativo: 
		li $v0, 4		# Printa a string negativo com o syscall 4
		la $a0, negativo		
		syscall
		
		li $v0, 10		# Fim do programa
		syscall
		

raizes: 
		lwc1 $f7, 96($sp)	#desempilha o delta
		lwc1 $f2, 64($sp)	#desempilha o "a"
		lwc1 $f1, 32($sp)	#desempilha o "b"
		lwc1 $f0, 0($sp)	#desempilha o "c"
		addi $sp, $sp, 128 	#retorna o ponteiro para a primeira posição do vetor
		
		
		sqrt.s $f7, $f7		#$f7 recebe a raíz do delta
		neg.s $f1, $f1		#$f1 recebe o "b" negado
		add.s $f2, $f2, $f2 	#$f2 recebe 2 * a
		
		#x2
		sub.s $f8, $f1, $f7	#$f8 recebe -b - sqrt(delta)
		div.s $f9, $f8, $f2	#$f9 recebe (-b - sqrt(delta)) / 2 * a
		

		sub $sp, $sp, 64	#aponta o ponteiro para a próxima posição livre		
		swc1 $f9, 0($sp)	#empilha na primeira posição do vetor o x2
		
		
		
		#x1
		add.s $f8, $f1, $f7 	#$f8 recebe -b + sqrt(delta)
		div.s $f9, $f8, $f2	#$f9 recebe (-b + sqrt(delta)) / 2 * a
		
		swc1 $f9, 32($sp)	#empilha na primeira posição do vetor o x1
		
		
		jr $ra		
		
		
fim: 	
		lwc1 $f12, 32($sp) 	#desempilha "x1"
		
		li $v0, 4		#printa a string "x1 = "
		la $a0, x1	
		syscall
		
		li $v0, 2
		syscall
		
		lwc1 $f12, 0($sp)	#desempilha "x2"
		addi $sp, $sp, 64	#retorna o ponteiro para primeira posição do vetor
		
		li $v0, 4		#printa a string "x1 = "
		la $a0, x2	
		syscall			
		
		li $v0, 2
		syscall
		
		li $v0, 10		#fim do programa
		syscall