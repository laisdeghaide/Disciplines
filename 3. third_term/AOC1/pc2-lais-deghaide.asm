#
#	Module Name: pc2-laís-deghaide
#	Function: Divisão entre dois inteiros
#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001
#	Data de inicio/fim da implementação 06/09-06/09
#	Linguagem: Assembly MIPS
#

.data
	Linha: .asciiz "++++++++++++++++++++++++++++++"
	Prog: .asciiz "Programa para efetuar divisao inteira"
	Dividendo: .asciiz "Dividendo: "
	Divisor: .asciiz "Divisor: "
	Resultado: .asciiz "Resultado: "
	Resto: .asciiz "Resto: "
	Pula: .asciiz "\n"
	Aviso: .asciiz "\nDivisao nao permitida por zero, digite outro numero.\n"

.text

.global main

main:   li $v0, 4	#carregando o numero de registro 4 que significa printar uma string
	la $a0, Linha	#imprime Linha
	syscall		#executa o programa
	li $v0, 4
	la $a0, Pula
	syscall
	li $v0, 4
	la $a0, Prog	#imprime Prog
	syscall
	li $v0, 4
	la $a0, Pula
	syscall
	li $v0, 4
	la $a0, Dividendo	#imprime Dividendo
	syscall
	li $v0, 5            #programa recebe do usuario o numero a ser lido
	syscall              
	la $t1, 0($v0)       #primeiro numero (dividendo) salvo em $t1	
top:	li $v0, 4
	la $a0, Divisor	     #imprime Divisor
	syscall
	li $v0, 5	#programa recebe o segundo numero que sera o divisor
	syscall
	la $t2, 0($v0)	     #salvo em t2
	beqz $t2, next       #verifica se o divisor é igual a zero
	j continue           #se o divisor nao for zero, vai para label continue
	next: j warning       #se for zero, vai para o label warning	
continue:
	div $t3, $t1, $t2    #realiza a divisão e armazena o resultado em $t3
	mfhi $t4             #recupera o valor do resto armzenado em hi e o coloca em $t4
	li $v0, 4
	la $a0, Pula
	syscall
	li $v0, 4
	la $a0, Resultado
	syscall
	li $v0, 1            #comando para imprimir um inteiro
	la $a0, ($t3)        #imprime o resultado da divisão
	syscall
	li $v0, 4
	la $a0, Pula
	syscall
	li $v0, 4
	la $a0, Resto
	syscall
	li $v0, 1
	la $a0, ($t4)        #imprime o resto da divisão 
	syscall
	li $v0, 4
	la $a0, Pula
	syscall
	li $v0, 4	
	la $a0, Linha
	syscall
	li $v0,10            #encerra o programa
	syscall
	li $v0, 4
	la $a0, Pula
	syscall
	warning: li $v0, 4
	la $a0, Aviso         #faz com que exiba uma mensagem avisando que não é possível o divisor ser 0
	syscall
	li $v0, 4
	la $a0, Pula
	syscall
        j top                #Pula pro label top para se digitar outro divisor


