#       David Turati
#	algoritmo pra encontrar a hipotenusa de um triângulo retangulo
#	Disciplina de Arquitetura de computadores II - UFMT 



.data
	inicioPrograma: .asciiz "\ncálculo de ipotenusa\n"
	num1: .word 0
	num2: .word 0
	resulatadoCalc: .float 
	pulaLinha: .asciiz "\n"
	resultado: .asciiz "Resultado\n"
	digite: .asciiz "\nDigite um valor:"
	finalPrograma: .asciiz "\nfim do programa\n"
	
#inicio do programa
.text
	
	inicio:
		jal procedimentoMSG     #salta para procedimento
		jal procedimentoLeitura #salta para procedimento
		jal procedimentoResultado #salta para resultado
		jal procedimentoFim     #salta para procedimento
		syscall 
	 
	procedimentoMSG:
		#carrega o modo de impressão no registrador $vo
		li $v0, 4
		la $a0, inicioPrograma
		syscall 
	
		#pula uma linha
		li $v0, 4
		la $a0, pulaLinha
		syscall
	
	procedimentoLeitura:
		#exibe menssagem ao usuário
		
		li  $v0,4      #carrega modo de impressão de string
		la  $a0,digite #exibe menssagem na tela
		syscall 
		li $v0, 5 #configura modo leitura
		syscall 
		sw  $v0, num1
		
		
		li  $v0,4      #carrega modo de impressão de string
		la  $a0,digite #exibe menssagem na tela
		syscall 
		li $v0, 5
		syscall 
		sw $v0, num2
				
	
	procedimentoResultado:
		#usa o método de peitágoras a² + b² = c² 
		li $v0, 1
		lw $t0, num1
		move $a0, $t0
		syscall 
		
		#pula uma linha
		li $v0, 4
		la $a0, pulaLinha
		syscall
		
		li $v0, 1
		lw $t1, num2
		move $a0, $t1
		syscall 
		
		mul  $t0, $t0, $t0 #eleva ao quadrado
		mul $t1, $t1, $t1 #eleva ao quadrado
		
		#pula uma linha
		li $v0, 4
		la $a0, pulaLinha
		syscall
		
		add $t0, $t0, $t1 #faz adição
		
		#resultado da soma
		#li $v0, 1
		#move $a0, $t0
		#syscall 
		
		#pula uma linha
		li $v0, 4
		la $a0, pulaLinha
		syscall
		
		#converte para ponto flutuante
		mtc1 $t0, $f1
		cvt.s.w	$f2, $f1
		
		#pula uma linha
		li $v0, 4
		la $a0, pulaLinha
		syscall
		
		swc1 $f2, resulatadoCalc #carrega o valor do regstrador na memória
		
		#recarrega valor de ponto flutuante no registrador
		lwc1 $f12, resulatadoCalc
		
		
		#encontra a raiz quadrada
		sqrt.s $f12, $f12
	
		#guarda valor na memória
		swc1  $f12, resulatadoCalc
		 
		
		#imprime resultado
		li $v0,2
		la $a0, resulatadoCalc
		syscall 
		
		
	procedimentoFim:
		li $v0, 4 #carrega instrução para imprimir string
		la $a0, finalPrograma #imprime string
		syscall 
		
		li $v0,10 #carrega instrução pra fim do programa
		syscall
		 
		
		
		 
		  
	
	
	
