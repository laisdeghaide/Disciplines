# Programa da Lista de Exercícios LE3
# John Cunha - 09.12.2020
# DESC: Programa que implementa um array de 742 posições e roda um loop de tamanho do array e armazena, a cada iteração, no array seu valor na posição i + 1

.data

.align 4
array:	.space 2968	# declarando o espaço do meu array, 742*4, pois cada inteiro no MIPS ocupa 4 bytes (32bits)

.text

main:
	li	$s0, 0	# i
	li	$s1, 742
	li	$t0, 0	# indice do array

FOR:
	beq	$s0, $s1, SAI	# se s0 == s1 então o programa pula para SAI, c.c. continua a execução linha por linha
	
	lw	$t1, array($t0)	# carregando o valor do array na posição do indice em t1
	addi	$t1, $t1, 1	# incrementando o valor carregado do array
	sw	$t1, array($t0)	# salvando no array o valor calculado
	
	addi	$s0, $s0, 1	# incrementando o i
	addi	$t0, $t0, 4	# incrementando o indice do array
	
	j	FOR	# jump para o loop
	
SAI:
	li	$v0, 10	# encerra o programa
	syscall