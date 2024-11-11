.data
	f: .word 0
	g: .word 0
	h: .word 0
	i: .word 5
	j: .word 3
	
	A: .word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	B: .word 3, 3, 3, 3, 3, 3, 3, 3, 3, 3
	
.text
	
	## DEKLARACJA
	
	lw $s0, f		# $s0 = 0
	lw $s1, g		# $s1 = 0
	lw $s2, h		# $s2 = 0
	lw $s3, i		# $s3 = 5
	lw $s4, j		# $s4 = 3
	
	la $s6, A		# $s6 = &A
	la $s7, B		# $s7 = &B
	
	## LOGIKA		B[8] = A[i] + A[j]
	
	sll $t0, $s3, 2		# $t0 = i * 4 = 5 * 4 = 20
	sll $t1, $s4, 2		# $t1 = j * 4 = 3 * 4 = 12
	
	add $t0, $s6, $t0	# $t0 = &A + $t0 = &A + 20
	add $t1, $s6, $t1	# $t1 = &A + $t1 = &A + 12
	
	lw $t0, 0($t0)		# $t0 = A[i]
	lw $t1, 0($t1) 		# $t1 = A[j]
	
	add $t0, $t0, $t1	# $t0 = $t0 + $t1
	sw $t0, 32($s7)		# B[8] = $t0 + $t1
	
	
	
	