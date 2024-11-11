.data
 
word: .asciiz "hello world!"

.text
# li $t0, 8			# t0 = 8
# li $v0, 1			# syscall_number = 1
# add $a0, $t0, $zero		# a0 = 8 + 0
# syscall

la $t1, word
li $v0, 4
add $a0, $t1, $zero
syscall

li $v0, 10
syscall