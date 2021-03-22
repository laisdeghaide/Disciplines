#
#	Module Name: pc6-laís-deghaide
#	Function: Recursão
#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001
#	Data de inicio/fim da implementação 25/11 - 26/11
#	Linguagem: Assembly MIPS
#

.data
	x: .asciiz "X = "
	imprime: .asciiz "Print: "
	hifen: .asciiz " - "
	num: .word 0

.text

	addi $t1, $zero, 0

	li $v0, 4
	la $a0, x		#imprime X =
	syscall
	
	li $v0, 5		#le o numero e guarda em $v0
	syscall
	
	sw $v0, num		#salva o numero em num
	
	move $t0, $v0		#move o num1 para $t0

	
	li $v0, 4
	la $a0, imprime		#imprime Print: 
	syscall
	
			
	lw $a0, num
	jal rec			#chama a função
	
	sw $v0, num		#salva num2 em $v0
	
	move $sp, $fp		#retorna o sp para a posição original da pilha
	li $v0, 10		#encerra o programa
	syscall
	
	
rec: 
	move $fp, $sp		#coloca o frame pointer na posição inicial da pilha
	
	sub $sp, $sp, 8
	sw $ra, ($sp)
	sw $s0, 4($sp)
	
	
	li $v0, 1			#caso base
	beq $a0, -1, rec2		#caso seja igual a -1 ele vai pra funcao rec2"
		
			
	move $s0, $a0
	sub $a0, $a0, 1			#diminiu uma unidade 
	jal rec				#chama rec de num - 1		
	beq $s0, $t1, pula		#pula na primeira vez para nao imprimir o traço
	
	
	li $v0, 4
	la $a0, hifen			#imprime o hifen
	syscall
		

pula:		
	li $v0, 1
	move $a0, $s0			#imprime o numero dado
	syscall	
	
		
rec2:
		
	lw $ra, ($sp)
	lw $s0, 4($sp)
	add $sp, $sp, 8
 	jr $ra	
	
	
	
	 
