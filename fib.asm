.data 
	n: .word 5
	
.text
	lw $a0, n
	
fib:	addi $sp, $sp, -12		# przesuniêcie wskaŸnika stosu do zrobienia miejsca dla 3 elementów
	
	sw $a0, 8($sp)			# w³o¿enie argumentu n na pierwszy element zarezerwowanego miejsca na stosie 
	sw $ra, 4($sp)			# Rejestr powrotny 
	sw $t0, 0($sp)			# Rejestr tymczasowy
	
	bne $a0, $zero, test_1		
	add $v0, $zero, $a0
	j koniec 
	
test_1: addi $t0, $zero, 1
	bne $a0, $t0, rek
	addi $v0, $zero, 1
	j koniec 

rek: 	addi $a0, $a0, -1
	jal fib				# wywo³anie procedury fib na arg n - 1
	
	move $t0, $v0			# zapisanie wyniku funkcji dla fib (n-1)
	
	addi $a0, $a0, -1		# wywo³anie procedury fib na arg n - 2
	jal fib 			
	
	add $v0, $t0, $v0		# ustaw fib(n-1) + fib(n-2)

koniec: 
	lw $t0, 0($sp)			# odwrotne zwolnienie miejsca ze stosu
	lw $ra, 4($sp)
	lw $a0, 8($sp)			 
	addi $sp, $sp, 12
	
	jr $ra
				
			