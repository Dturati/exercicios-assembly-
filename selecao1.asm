# David Turati
# Algoritmo para verificar se um número é divisível por 3 e por 6
# disciplina de Arquitetura de Computadores II
# Algoritimo criado e executado no simulador MARS 


.data
	numero: .word 0
	eDiviviselPorTres: .asciiz "\n É divisivel por três \n"
	nDiviviselPorTres: .asciiz "\n É divisivel por três \n"
	eDiviviselPorSeis: .asciiz "\n É divisivel por seis \n"
	digiteUmNumero: .asciiz "Digite um número:"
	pulaLinha: .asciiz "\n"
	fimPrograma: .asciiz "\n Fim \n"
	divPorTres: .word 3
	divPorSeis: .word 6
	
.text
	.glob inicio
	
	rotinaLeitura:
		#exibe menssagem na tela
		li $v0, 4  #carrega instrução para imprimir string na tela
		la $a0, digiteUmNumero 
		syscall 
		
		#ler valor do teclado
		li $v0, 5 #carrega instrução para leitura do teclado
		syscall 
		sw $v0, numero
		
		#pula uma linha
		li $v0, 4 #carrega instruçõa para imprimir string na tela, nesse caso pular uma linha
		la $a0, pulaLinha
		syscall 
		
		#imprime numero lido na tela
		li $v0, 1
		lw $t1, numero #carrega valor da palavra no resgitrador $t1
		move $a0, $t1
		syscall 
		
		#pula uma linha
		li $v0, 4 #carrega instruçõa para imprimir string na tela, nesse caso pular uma linha
		la $a0, pulaLinha
		syscall 
		
		#faz divisão
		lw $t1, numero #carrega valor da memória para registador
		lw $t3, divPorTres
		div $t3, $t1, $t3
		mfhi $s3
		
		
		#faz divisão por 6
		lw $t6, numero
		lw $t7, divPorSeis
		div $t6, $t6,$t7
		mfhi $s6
		
		
		#imprime resultado da divisão por 3
		li $v0, 1
		move $a0, $t3
		syscall 
		
		#pula uma linha
		li $v0, 4 #carrega instruçõa para imprimir string na tela, nesse caso pular uma linha
		la $a0, pulaLinha
		syscall 
		
		#imprime o resultado da divisão por 6
		li $v0, 1
		move $a0, $t6
		syscall 
		
		#pula uma linha
		li $v0, 4 #carrega instruçõa para imprimir string na tela, nesse caso pular uma linha
		la $a0, pulaLinha
		syscall 
		
		#imprime resto da divisão por 3
		li $v0, 1
		move $a0, $s3
		syscall 
		
		#pula uma linha
		li $v0, 4 #carrega instruçõa para imprimir string na tela, nesse caso pular uma linha
		la $a0, pulaLinha
		syscall 
		
		#imprime resto da divisão por 6
		li $v0, 1
		move $a0, $s6
		syscall 
		
		beqz  $s3, divisivelPorTres #se for divisivel por 3 salta para rotina divisivelPorTres
		beqz  $s3, divisivelPorTres # se for divisivel por seis salta para rotina divisivelPorSeis
		jal fimDoPrograma 
	
	divisivelPorTres:
		li $v0, 4
		la $a0, eDiviviselPorTres
		syscall 
		beqz $s6, divisivelPorSeis #se for divisível por seis salta para a rotina divisivelPorSeis
		jal fimDoPrograma
		
	divisivelPorSeis:
		li $v0, 4
		la $a0, eDiviviselPorSeis
		syscall 
		jal fimDoPrograma
		
	fimDoPrograma:
		li $v0, 4
		la $a0, fimPrograma
		syscall 
		
	
	
