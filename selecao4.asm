# David Turati
# Disciplina de Arquitetura de computadores II - UFMT
# algoritmo que diz se uma siga XX da entrada do teclado pertence a região Sul ou Centro Oeste Sudeste Norte e Nordeste pra tres regioes cada

.data
	buffer: .space 4
	sigla: .asciiz 
	#string de menssagens ao usuário
	digiteUmaSigla: .asciiz "Digite uma sigla:"
	
	centroOeste: .asciiz  "MT","","MS","","GO"
		sul: .asciiz  "","","SC","","PR","","RS"
		norte: .asciiz "","","RR","","AC","","AM"
		nordeste: .asciiz "","","BA","","CA","","PE"
		sudeste: .asciiz "","","SP","","RJ","","ES"
		
	regiaoCentroOeste: .asciiz "Região centro oeste"
	regiaoSul: .asciiz "Região Sul"
	regiaoNorte: .asciiz "Norte"
	regiaoNordeste: .asciiz "Nordeste"
	regiaoSudeste: .asciiz "Sudeste"
	
	pulaLinha: .asciiz "\n"
	fim: .asciiz "\nFIM\n"
.text
	li $v0, 4
	la $a0, digiteUmaSigla
	syscall 
	
	li $v0, 8 #instrução para leitura de string
	la $a0, buffer
	li $a1, 8
	move $s2, $a0
	syscall 
	
	#indice atual do vetor
	li $s0, 0
	li $s3,0
	#indice máximo
	li $s1, 6
	li $s4, 2
	
	enquantoCentroOeste: #verifica se está no centro oeste
		la $t1, centroOeste 	#carrega valores  array no registrador $t1
		mul $t2, $s0, 2	        #utiliza multiplos de dois para acessar cada registro do array
		add $t1, $t1, $t2 	#soma o endereço do array com a posição
		
		li $t2, 4
		la $t2, ($t1) 		#carrega o valor da posição atual
		add $s0, $s0, 1		# pula para o proximo item
		
		
		#não sei exatamente o que faz, mas funcionol
		lhu $t4,0($s2)
		lhu $t5,($t2)
		
		sub $t6,$t4,$t5
		
		li $v0, 4
		la $a0, pulaLinha
		syscall 
		
		beqz $t6, eCentroOeste                  #se o registrador for zero diz que é centro oeste
		bne $s0, $s1, enquantoCentroOeste	#enquanto não chegamos ao ultimo item, continuamos iterando
		
		
		
		#indice atual do vetor
		li $s0, 0
		li $s3, 0
		#indice máximo
		li $s1, 6
		li $s4, 2
		
	enquantoSul:
		la $t1, sul 	#carrega valores  array no registrador $t1
		mul $t3, $s0, 2	        #utiliza multiplos de dois para acessar cada registro do array
		add $t1, $t1, $t3 	#soma o endereço do array com a posição
		
		la $t3, ($t1) 		#carrega o valor da posição atual
		add $s0, $s0, 1		# pula para o proximo item
		
		
		#não sei exatamente o que faz, mas de novo funcionol
		
		lbu $t4,($t3)
		lbu $t2,1($t3)
		add $t4,$t4,$t2
		
		lbu $t5,($s2)
		lbu $t7,1($s2)
		add $t5,$t7,$t5
		
		sub $t6,$t4,$t5
			
		li $v0, 1
		move $a0, $t5
		#syscall
		
		li $v0, 4
		la $a0, pulaLinha
		syscall 
		
		beqz $t6, eSul
	
		bne $s0, $s1, enquantoSul	#enquanto não chegamos ao ultimo item, continuamos iterando
		
	
	#indice atual do vetor
	li $s0, 0
	li $s3,0
	#indice máximo
	li $s1, 6
	li $s4, 2
	
	enquantoNorte:
		la $t1, norte 	#carrega valores  array no registrador $t1
		mul $t3, $s0, 2	        #utiliza multiplos de dois para acessar cada registro do array
		add $t1, $t1, $t3 	#soma o endereço do array com a posição
		
		la $t3, ($t1) 		#carrega o valor da posição atual
		add $s0, $s0, 1		# pula para o proximo item
		
		
		#não sei exatamente o que faz, mas de novo funcionol
		
		lbu $t4,($t3)
		lbu $t2,1($t3)
		add $t4,$t4,$t2
		
		lbu $t5,($s2)
		lbu $t7,1($s2)
		add $t5,$t7,$t5
		
		sub $t6,$t4,$t5
			
		
		li $v0, 4
		la $a0, pulaLinha
		syscall 
		
		beqz $t6, eNorte
	
		bne $s0, $s1, enquantoNorte	#enquanto não chegamos ao ultimo item, continuamos iterando
		
	#indice atual do vetor
	li $s0, 0
	li $s3,0
	#indice máximo
	li $s1, 6
	li $s4, 2
		
	enquantoNordeste:
		la $t1, nordeste 	#carrega valores  array no registrador $t1
		mul $t3, $s0, 2	        #utiliza multiplos de dois para acessar cada registro do array
		add $t1, $t1, $t3 	#soma o endereço do array com a posição
		
		la $t3, ($t1) 		#carrega o valor da posição atual
		add $s0, $s0, 1		# pula para o proximo item
		
		
		#não sei exatamente o que faz, mas de novo funcionol
		
		lbu $t4,($t3)
		lbu $t2,1($t3)
		add $t4,$t4,$t2
		
		lbu $t5,($s2)
		lbu $t7,1($s2)
		add $t5,$t7,$t5
		
		sub $t6,$t4,$t5
			
		li $v0, 1
		move $a0, $t5
		#syscall
		
		li $v0, 4
		la $a0, pulaLinha
		syscall 
		
		beqz $t6, eNordeste
	
		bne $s0, $s1, enquantoNordeste	#enquanto não chegamos ao ultimo item, continuamos iterando
	
	#indice atual do vetor
	li $s0, 0
	li $s3,0
	#indice máximo
	li $s1, 6
	li $s4, 2
		
	enquantoSudeste:
		la $t1, sudeste	#carrega valores  array no registrador $t1
		mul $t3, $s0, 2	        #utiliza multiplos de dois para acessar cada registro do array
		add $t1, $t1, $t3 	#soma o endereço do array com a posição
		
		la $t3, ($t1) 		#carrega o valor da posição atual
		add $s0, $s0, 1		# pula para o proximo item
		
		
		#não sei exatamente o que faz, mas de novo funcionol
		
		lbu $t4,($t3)
		lbu $t2,1($t3)
		add $t4,$t4,$t2
		
		lbu $t5,($s2)
		lbu $t7,1($s2)
		add $t5,$t7,$t5
		
		sub $t6,$t4,$t5
			
		li $v0, 1
		move $a0, $t5
		#syscall
		
		li $v0, 4
		la $a0, pulaLinha
		syscall 
		
		beqz $t6, eSudeste
	
		bne $s0, $s1, enquantoSudeste	#enquanto não chegamos ao ultimo item, continuamos iterando
		
		beq $s1,6, fimPrograma
		

	fimPrograma:		#Rotina finaliza programa
		li $v0, 4
		la $a0, fim
		syscall 
		
		li $v0, 10
		syscall 
		
	eCentroOeste:		# Rotina diz se é da região Centro Oeste
		li $v0, 4
		la $a0, regiaoCentroOeste
		syscall 
		
		li $v0, 10
		syscall 
		
	eSul:			# Rotina diz se é da região Sul
		li $v0,4
		la $a0, regiaoSul
		syscall 
		
		li $v0, 10
		syscall 
	
		
	eNorte:			# Rotina diz se é da região Norte
		li $v0,4
		la $a0, regiaoNorte
		syscall 
		
		li $v0, 10
		syscall 
	
	eNordeste:			# Rotina diz se é da região Nordeste
		li $v0,4
		la $a0, regiaoNordeste
		syscall 
		
		li $v0, 10
		syscall 
	eSudeste:			# Rotina diz se é da região Sudeste
		li $v0,4
		la $a0, regiaoSudeste
		syscall 
		
		li $v0, 10
		syscall 
	
		
