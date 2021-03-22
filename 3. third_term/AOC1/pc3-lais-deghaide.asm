#
#	Module Name: pc3-laís-deghaide
#	Function: Conjectura de Collatz
#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001
#	Data de inicio/fim da implementação 11/09-13/09
#	Linguagem: Assembly MIPS
#

.data 
	K: .asciiz "Valor: "
	Seq: .asciiz "Sequencia: "
      	Espaço: .asciiz " "
.text
	
main:
	li $v0, 4
        la $a0, K	#imprime Valor
        syscall
		
	li $a1, 2				
	li $a3, 3
        
        li $v0, 5	# lê o valor
        syscall
        
        move $a2,$v0
        
        li $v0, 4
        la $a0, Seq	#imprime Seq
        syscall
        
        li $s4, 1	
        beq $a2, $s4, exit	#se o valor digitado for igual a 1, encerra o programa
        
        li $v0, 1
        move $a0, $a2 
        syscall
             
        li $v0, 4
        la $a0, Espaço
        syscall
        
        jal Collatz
        
Collatz:
	   addi $t0, $zero, 2 	#move o 2 para t0
     	   div $a2, $t0
   	   mfhi $t0		# resto da divisao foi para t0
    	   beq $t0, $zero, par	#se resto for igual a zero chama a funcao par
    	   j impar

par:				#se for par
	div $t1, $a2, 2		#faz a divisao k/2
	move $a0, $t1		#move o resultado da divisao para a0 para poder imprimir
	li $v0, 1		#imprime na tela o resultado da divisao
	syscall
	
	beq $t1, $s4, exit  #verifica se o resultado da divisao é igual a 1
	
	li $v0, 4
	la $a0, Espaço
	syscall
	
	move $a2, $t1
	
	j Collatz
	
impar:
	mul $s0,$a3,$a2		#multiplica o resultado por tres e salva em s0		
	add $a2,$s0,$s4		#soma 1 ao s0 e devolve para o a2
	beq $a2, $s4, exit
	  
        slt $t0, $v0, $zero	 # Se o munero digitado for negativo, para o programa
        bne $t0, $zero, exit
	
	li $v0, 1
	move $a0, $a2	#imprime o inteiro que eta em t1 (resultado da divisoa)
	syscall
	
	li $v0, 4
	la $a0, Espaço
	syscall
  
	j Collatz


exit:
        li $v0, 10 		#termina o programa
        syscall
