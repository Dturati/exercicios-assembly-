# David Turati
# Disciplina de Arquitetura de computadores II - UFMT
# Algoritmo para converção de polegadas para centimetros
# Algoritimo desenvolvivo com o simulardor MIPS MARS

.data
	contanteUm: .float 1.0
	constante: .float 2.54
	valorPolegada: .float 1.0
	exibePolegada: .word 1
	centimetro: .float 0.0
	cont: .word 20
 	MSG: .asciiz "\n Bem Vindo \n"
 	pulaLinha: .asciiz "\n"
 	espaco: .asciiz " "
 	umaPolegada: .asciiz " polegadas é "
 	emCentimetro: .asciiz " centimetros"
 	fim: .asciiz "Fim\n"
 
  .text
  	li $v0, 4
  	la $a0, MSG
  	syscall 
  	
  	jal calcula
  
  	calcula:
  		#lwc1 $f1, ValorPolegada
  		
  		#carrega valor da memória para registrador $t1
  		lw $t1, cont
  		
  		#imprime valor do registrador $t1
  		#li $v0, 1 #carrega instrução de impreção
  		#move $a0, $t1  #carrega valor do registrador $t1 para registrador temporario
  		#syscall    
  		 
  		#exibe valor da polegada 
  		lw $t0, exibePolegada
  		li $v0, 1
  		move $a0, $t0
  		syscall 
  		
  		add $t0, $t0, 1
  		sw $t0, exibePolegada
  		
  		
  		#exibe valor polegada
  		li $v0, 4
  		la $a0, umaPolegada
  		syscall 
  		

  		
  		#calcula polegadas para centimetros
  		lwc1 $f1, constante #carrega valor da constante para calculo
  		lwc1 $f2, valorPolegada #carrega valor da polegada a ser calculada
  		mul.s  $f3, $f2, $f1  #armazena resultado em $f3
  		
  		#incrementa valor da polegada para calculo
  		lwc1 $f4, contanteUm
  		add.s  $f2, $f2, $f4
  		swc1 $f2, valorPolegada #atualiza proximo valor da polegada a ser calculada para centimetro
  		
  		#imprime valor do centimentro convertido de polegada
  		movf.s  $f12, $f3
  		li $v0, 2
  		syscall 
  		
  		#imprime menssagem na tela em centimestros
  		li $v0, 4 #carrega instrução para impreção de string na tela
  		la $a0, emCentimetro #imprime string da memória na tela
  		syscall 
  		
  		
  		#pula uma linha
  		li $v0, 4
  		la $a0, pulaLinha
  		syscall 
  		
  		#contador do loop
  		addi $t1, $t1, -1 #subtrai contador
  		sw $t1, cont #atualiza valor na variável
  		
  		#chama o mesmo procedimento
  		beqz $t1, fimPrograma #se for zero vai pra rotina fimPrograma
  		bnez $t1, calcula #repete loop até que o registrador seja 0
  		
  		
   fimPrograma:
   		li $v0, 4
   		la $a0, fim
   		syscall 
   		
   		li $v0, 10
   		syscall  
