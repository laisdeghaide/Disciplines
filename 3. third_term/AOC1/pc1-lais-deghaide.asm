#	Module Name: pc1-la�s-deghaide
#	Function: Print String
#	Nome: La�s Saloum Deghaide
#	Matr�cula: 11821BCC001
#	Data de inicio/fim da implementa��o 28/08-28/08
#	Linguagem: Assembly MIPS
#

.data
	Hello: .asciiz "\n***Hello, World!***\n"

.text
.global main
main:	li $v0, 4	#carregando o numero de registro 4 que significa printar uma string
	la $a0, Hello	#endere�o da cadeia a ser impressa
	syscall		#executa o programa
	li $v0,10	#carregando o numero de registro 10 que significa terminar o programa
	syscall		#executa 
