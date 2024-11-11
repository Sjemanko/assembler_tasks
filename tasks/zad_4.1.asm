.data
	f: .word 0
	g: .word 0
	h: .word 0
	i: .word 5
	j: .word 3
	
	A: .word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	B: .word 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
	
	
		

.text
	
	## DEKLARACJA
	
	lw $s0, f		# $s0 = 0
	lw $s1, g		# $s1 = 0
	lw $s2, h		# $s2 = 0
	lw $s3, i		# $s3 = 5
	lw $s4, j		# $s4 = 3
	
	la $s6, A		# $s6 = &A
	la $s7, B		# $s7 = &B
	
	## LOGIKA		B[8] = A[i-j]
	
	# obliczanie offsetu tablicy A, zapisanie do rejestru $t1
	sub $t0, $s3, $s4	# $t0 = i-j = 2
	sll $t0, $t0, 2		# $t0 = shift_left($t0, 2)  = $t0 * 4 = 2 * 4 = 8
	
	add $t0, $s6, $t0	# $t0 = &A + $t0 = &A + 8
	lw $t0, 0($t0)		# $t0 = A[i-j]	
	sw $t0, 32($s7)		# B[8] = &A + 8
	
	
	
	