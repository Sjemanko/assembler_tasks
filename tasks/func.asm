.data
	# int func(int a, int b) { return a + b; } 
	# fn zwraca wartoœci przez rejestr $v0 
	

	a: .word 1
	b: .word 2
	c: .word 3
	d: .word 4

.text
	
	# inicjalizacja rejestrów 
	lw $a0, a		# $a0 = a
	lw $a1, b		# $a1 = b
	lw $a2, c		# $a2 = c
	lw $a3, d		# $a3 = d
	
	jal f			# f(a,b,c,d)
	
	move $a0, $v0		# $a0 = f(a,b,c,d)
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
	
	f: addi $sp, $sp, -12
	
	sw $a1, 8($sp)
	sw $a0, 4($sp)
	sw $ra, 0($sp)
	
	jal func
	move $a0, $v0
	add $a1, $a2, $a3
	
	jal func
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	jr $ra
	
	func: add $v0, $a0, $a1
	jr $ra
	
	

