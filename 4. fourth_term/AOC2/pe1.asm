#	Name: Laís Saloum Deghaide
#	Matrícula: 11821BCC001
#	Data: 09/11/2020

.text
	addi $s0, $zero, 10 	#s0 = 10
	addi $s1, $zero, 20 	#s1 = 20
	addi $s2, $zero, 30 	#s2 = 30
	
	mul $s0, $s0, $s0 	#s0 = 10 * 10  (a*a)
	mul $s2, $s2, $s2 	#s2 = 30 * 30  (c*c)
	 
	div $t0, $s2, $s0	#t0 = s2 / s1  (c*c) / (a*a)
	add $v1, $t0, $s1 	#v1 = t0 + s1  ((c*c) / (a*a)) + b
	
	li $v0, 10	#encerra o programa
	syscall

#OBS: guardei o resultado no registrador $v1, pois utilizei o $v0 para finalizar o programa
