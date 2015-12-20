# David Turati
# Disciplina de Arquitetura de computadores II - UFMT
# Imprima uma PA(Soma dos n termos), onde são fornecidos o primeiro termo, a razão e a quantidade de termos desejada.

.data
	#dados de leitura
	primeiroTermo: .word 0
	razao: .word 0
	quantidadeTermos: .word 0
	resultado: .word 0
	dois: .word 2
	
	#menssagens ao usuário
	digiteTermo: .asciiz "Digite o primeiro termo:"
	digiteRazao: .asciiz "Digite a razão:"
	digiteQuantidade:.asciiz "Digite a quantidade desejada:"
	
	pulaLinha: .asciiz "\n"
	
	fim: .asciiz "\nFim\n"
	
.text
	
	li $v0, 4
	la $a0, digiteTermo
	syscall 
	
	li $v0, 5
	syscall 
	sw $v0, primeiroTermo #salva o valor na variável na memória
	move $t1, $v0 #armazena o valor digitado no registrador $t1
	 
	
	li $v0, 4
	la $a0, digiteRazao
	syscall 
	
	li $v0, 5
	syscall 
	sw $v0, razao # armazena o valor do registrador na memória
	move $t2, $v0
	
	
	li $v0, 4
	la $a0, digiteQuantidade
	syscall 
	
	li $v0, 5
	syscall 
	sw $v0, quantidadeTermos #armazenavalor digitado na memória
	move $t3, $v0
	
	
	addi $t3, $t3, -1
	
	
	#loop para calcular ultimo termo
	jal ultimoTermo
	
	ultimoTermo:
		
		#se for zero salta para a rotina calculaPA
		beqz  $t3, calculaPA
		
		#calcula temo um a um
		add $t1, $t1, $t2
		
		addi $t3, $t3,-1 #subtrai um
		
		
		jal ultimoTermo
	
	#verifica de já contou até o ultimo termo
	
	calculaPA:
		#li $v0, 1
		#move $a0, $t1
		#syscall 
		
		lw  $t4, primeiroTermo
		lw $t3, quantidadeTermos
		
		add $t1, $t4, $t1
		mul $t1, $t1, $t3
		
		div $t1, $t1, 2
		
		#pula linha 
		li $v0, 4
		la $a0, pulaLinha
		
		li $v0, 1
		move $a0, $t1
		syscall
		 
		
		li $v0, 4
		la $a0, fim
		syscall 
		
		#finaliza programa
		li $v0, 10
		syscall 
		
	
	
	
	
	
