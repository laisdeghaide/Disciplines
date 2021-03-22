#
#	Module Name: pc1-laís-deghaide
#	Function: Manipulação de arrays para calculo de cpf
#	Nome: Laís Saloum Deghaide
#	Matrícula: 11821BCC001
#	Data de inicio/fim da implementação 21/09-23/09
#	Linguagem: Assembly MIPS
#

.data 
	Input: .asciiz "Input ID Digits: "
	Output: .asciiz "Output CPF: "
	iddigit: .space 36	
	cpfdigit: .space 45
	hifen: .asciiz  "-"

.text

main:
	li $v0, 4
        la $a0, Input	#imprime Input
        syscall
        
        li $v0, 5
        syscall
        
        move $a0, $v0 	#salvei o valor digitado em $v0 no $s0
           
        li $a1, 10		#load 10 em a1
        addi $s0, $zero, 36	#s0 recebe 36
        addi $s6, $zero, 45	#s6 recebe 45
        
cpf:
	beqz $s0, exit		#se o s0 chegar em zero, vai pro exit
	subi $s0, $s0, 4	#vai subtraindo 4 bits a cada repeticao da funcao
	
	div $a0, $a1		#divido o numero digitado pelo usuario por 10
	mflo $a0		
	mfhi $s1
	sb $s1, iddigit($s0)	#salvo o resultado da divisao no array iddigit
	
	j cpf

exit:
	li $t3, 10		#load 10 em t3
	li $t4, 11		#load 11 em t4
	move $t0, $zero		#t0 é o ponteiro para o primeiro valor do array
	move $s0, $zero	
		
	li $t6, 10

	
	jal  primeiro		#chamo a label para calcular o primeiro digito apos o hifen
	move $t0, $zero
	move $s1, $zero
	li $t3, 11		#altera o t3 para 11 pra fazer a multiplicacao do segundo termo
	jal segundo
	move $s5, $zero
	jal transfere
	
	
output:
	li $v0, 4		
	la $a0, Output 						# Syscall para printar a string output
	syscall

	li $s5, 0
	li $s6, 36
	li $s7, 45
imprime:
		
	lb $a0, cpfdigit($s5)	#carrega o valor do array na posicao s5
	li $v0, 1		#imprime o valor
	syscall
	
	addi $s5,$s5, 4		#pula pra proxima posicao
	
	beq $s5,$s6, imprime_hifen	#se s5 chegar em 36, imprime hifen
		
	j imprime
	
imprime_hifen:
	li $v0, 4
	la $a0, hifen
	syscall
		
imprime_doisultimos:
	addi $s6, $zero, 36
	lb $a0, cpfdigit($s6)
	li $v0, 1
	syscall

	addi $s6,$s6, 4
	lb $a0, cpfdigit($s6)
	li $v0, 1
	syscall
	
	li $v0,10
	syscall
	
transfere:
	beq $s5, 36, insere_doisultimos	#se o s5 for igual 36 pula para o insere_doisultimos
	lb $s4, iddigit($s5)		#copia o valor do elemento do array de indice $s5 para $s4
	sb $s4, cpfdigit($s5)		#copia os valores de iddigit para cpfdigit
	addi $s5, $s5, 4		#passa para a proxima posicao do array
	j transfere
	
		
insere_doisultimos:
		addi $s6, $zero, 36	#s6 recebe 36
		beq $s6, 44, imprime	#se s6 chegar em 44, vai pra imprime
		sb $s0, cpfdigit($s6)	#copia o primeiro valor calculado para a posicao s6 do array cpfdigit
		addi $s6, $s6, 4	#vai para a proxima posicao do array
		sb $s1, cpfdigit($s6)	#copia o segundo valor
		jal output
	
primeiro:
	beq  $t0, 36, multiplica	#se o valor do registrador t0 chegar em 36, vai para a multiplica
	
	lb $t1, iddigit($t0)	#insiro o primeiro valor do meu array
	mul $t2, $t1, $t3	#multiplico o primeiro valor por 10, o segundo por 9, terceiro por 8 e assim vai
	addi $t0, $t0, 4	#indo para o prox int do array
	subi $t3, $t3, 1 	#subtraio 1 do 10, depois de 9, depois de 8 e assim vai
	add $s0, $t2, $s0	#somatorio de todas as multiplicacoes feitas
	
	j primeiro

 multiplica:
 	mul $s0, $s0, 10	#multiplico o somatorio que esta salvo em s0 por 10 e guardo o resultado no s0
 	div $s0, $t4		#divido o resultado por 11
 	mfhi $s0		#guardo o novo resultado em s0
 	move $t8, $s0
 	beq $s0, $t6, resto101
 	
 	jr $ra	
 	
resto101:
	move $s0, $zero
	jr $ra
 
 segundo:
 	beq  $t0, 36, multiplica2
	
	lb $t1, iddigit($t0)	#primeiro valor do meu array
	mul $t2, $t1, $t3
	addi $t0, $t0, 4	#indo para o prox int
	subi $t3, $t3, 1 	#subtraio 1 do 10, 1 do 9, e assim por diante
	add $s1, $t2, $s1	#somatorio
	
	j segundo

multiplica2: 
	mul $t2, $t8, 2		#multiplico o primeiro termo calculado apos o hifen por 2
	add $s1, $t2, $s1 	#somo o valor do somatorio calculado no segundo com a multiplicacao feita a cima eguardo no s1
	mul $s1, $s1, 10	#multiplico o valor total por 10
 	div $s1, $t4		#divido o resultado por 11
 	mfhi $s1		#salvo o resto em s1, que sera o segundo valor apos o hifen
 	beq $s1, $t6, resto102
 	jr $ra	
 
	
resto102:
	move $s1, $zero
	 jr $ra
