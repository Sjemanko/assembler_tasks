.data
	D: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	a: .word 2
	b: .word 4

.text
	## LOGIKA		for i < a -> for j < b -> D[4*j] = i+j
	
	lw $s0, a		# $s0 = a
	lw $s1, b		# $s1 = b
	
	li $t0, 0		# $t0 (i) = 0
	li $t1, 0		# $t1 (j) = 0
	
	la $s2, D
	
	################################################################
	
	loop:
		slt $t3, $t0, $s0			# $t3 = $t0 < a ? 1 : 0 
		beq $t3, $zero, Exit			# if $t3 == 0 -> goto Exit
		loop2: 
			sll $t5, $t1, 4			# $t5 = shift_left($t1, 4) = 4 * (4 * j)
		
			add $t6, $t0, $t1		# $t6 = i+j
			add $s3, $t5, $s2		# $s3 = $t5 + &D = 16*j + &D

			sw $t6, 0($s3)			# $s3 = $t6 => (16*j + &D) = i + j
			
			addi $t1, $t1, 1		# j++
			
			slt $t4, $t1, $s1		# $t4 = $t1 < b ? 1 : 0
			bne $t4, $zero, loop2		# if $t4 != 0 -> goto loop
			
		addi $t0, $t0, 1			# i++
		li $t1, 0				# j = 0
		j loop					# goto loop
	Exit:
	li $v0, 10					# $v0 = 10 -> exit code
	syscall
	
	
	
	
