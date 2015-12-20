# David Turati
# Algoritmo para calcular custo de uma parede de tijolos
# Disciplina de Arquitetura de computadores II - UFMT

.data
	comprimentoTijolo: .float 0.0
	alturaTijolo: .float 0.0
	comprimentoParede: .float 0.0 
	alturaParede: .float 0.0
	custoMieiroTijolo: .float 0.0
	porcentagem: .float 0.1
	
	pulaLinha: .asciiz "\n"
	digiteComprimentoTijolo: .asciiz "Digite comprimento tijolo em cm:"
	digiteAlturaTijolo: .asciiz "Digite altura tijolo em cm:"
	digiteComprimentoParede: .asciiz "digite comprimento parede em cm:"
	digiteAlturaParede: .asciiz "Digite altura parede em cm:"
	digiteCustoMieiroTijolo: .asciiz "Digite custo mieiro tijolo em R$:"
	fim: .asciiz "\n Fim \n"
		
.text
	
	#imprime string na tela
	li $v0, 4 #carrega instrução para impressão de string na tela
	la $a0, digiteComprimentoTijolo
	syscall 
	
	#faz leitura de comprimento de tijolo
	li $v0, 6 #carrega instrução para leitura de ponto flutuante
	syscall 
	movf.s $f1, $f0
	swc1 $f0, comprimentoTijolo
	
	
	#imprime string na tela
	li $v0, 4
	la $a0, digiteAlturaTijolo
	syscall 
	
	#faz leitura de altura do tijolo
	li $v0, 6 #carrega instrução para leitura de float
	syscall 
	movf.s $f2, $f0 #move o valor no registrador de leitura para registrado $f1
	swc1  $f2, alturaTijolo #salva valor do registrador na memória
	
	
	
	#imprime string na tela
	li $v0, 4
	la $a0, digiteComprimentoParede
	syscall 
	
	#faz leitura de altura da parede
	li $v0, 6
	syscall 
	movf.s $f3, $f0
	swc1 $f3, comprimentoParede
	
	#imprime string na tela
	li $v0, 4
	la $a0, digiteAlturaParede
	syscall 
	
	#faz leitura altura da parede
	li $v0, 6
	syscall 
	movf.s $f4, $f0
	swc1 $f4, alturaParede
	
	#imprime string na tela
	li $v0, 4
	la $a0, digiteCustoMieiroTijolo
	syscall 
	
	li $v0, 6
	syscall 
	movf.s $f5, $f0
	swc1 $f5, custoMieiroTijolo
	
	#pula linha
	li $v0, 4 #carrega instrução para impressão de inteiro na tela
	la $a0, pulaLinha
	syscall 
	

	
	
	jal calculaArea #salta para rotina calculaArea
	jal fimPrograma #salta para rotina fimPrograma
	
calculaArea:
	lwc1 $f9, porcentagem #carrega valor da variável para o registrador
	
	mul.s  $f6, $f3, $f4 #calcula a área da parede a armazena no registrador $f6
	#retira 10% de argamassa da área da parede
	mul.s $f9, $f6, $f9 #encontra porcentagem de 10% de argamassa e armazana em $f9
	sub.s $f6, $f6, $f9 #retira 10% de áreda to total da parede e armazena em $f6, 10% é argamassa
	
	mul.s $f7, $f1,$f2 #calcula a área do tijolo e armazena no registrador $f7
	
	div.s $f8, $f6, $f7 #divive a área da parede pela área do tijolo, dado o total de tijolos
	
	mul.s $f9, $f8, $f5
	
	#imprime float
	li $v0, 2 #carrega instrução para impressão de float na tela
	#lwc1  $f12, custoMieiroTijolo
	movf.s $f12, $f9
	syscall 
	
fimPrograma:
	li $v0, 4
	la $a0, fim
	syscall 
	
	
