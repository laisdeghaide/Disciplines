#pi.asm
#
#DDA  10.11.2020
#
#
#DESC : calcula pi usando a série 
#\begin{equation*}
#	\frac{\pi}{4} = 1 - \frac{1}{3} + \frac{1}{5} - \frac{1}{7} + \frac{1}{9} - \frac{1}{11} + \frac{1}{13} - \frac{1}{15} + \frac{1}{17} - \cdots 
#\end{equation*}
#
#------------------------------------------------------------------

.data

numIter:  .word 100

str1: .asciiz	"A serie para "
str2: .asciiz	" iteracoes, retorna o valor:"  

.text
		li	$s7, 0		#contador de iteracoes
						
		#termo zero da série
		li	$s0, 0
		mtc1	$s0, $f0
		cvt.s.w	$f0, $f0
		
		#divisor da fracao
		li	$s1, 1
		mtc1	$s1, $f1
		cvt.s.w	$f1, $f1
		mov.s	$f7, $f1  #cte 1
		
		la		$s6, numIter	#carrega o num de iteracoes
		lw		$s6, 0($s6)	
FOR:	
		beq		$s7, $s6, SAI1
		
		#divisor da fracao
		mtc1	$s1, $f1
		cvt.s.w	$f1, $f1

		#computa a fracao
		div.s	$f3, $f7, $f1
		
		#testa se eh uma iteracao par ou impar
		#par -> termo positivo, impar -> termo negativo
		andi	$t0, $s7, 1 #se t0 for 1 eh impar, senao (0) eh par
		beq	$t0, $zero, PAR
		#impar
		sub.s	$f0, $f0, $f3
		j	SAIIF

		
PAR:	#par
		add.s	$f0, $f0, $f3
		
SAIIF:	
		addi	$s1, $s1, 2
		addi	$s7, $s7, 1
		j	FOR
SAI1:
		#primeira parte da resposta
		li		$v0, 4
		la		$a0, str1
		syscall
		#numero de iteracoes
		li		$v0, 1
		move	$a0, $s6
		syscall
		#segunda parte da resposta
		li		$v0, 4
		la		$a0, str2
		syscall
		#aprox. de pi
		
		li	$s5, 4
		mtc1	$s5, $f5
		cvt.s.w	$f5, $f5
		
		mul.s	$f0, $f0, $f5
		li	$v0, 2
		mov.s	$f12, $f0
		syscall
		 	
		#return 0
		li		$v0, 10
		syscall
		
		
		

