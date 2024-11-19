.data
	# 000123897
	string: .asciiz "000123897"
.text

	la $a0, string			# $a0 = &string
	
	
	# pêtla for po string
	
		# element = load byte 
		
		# if element == digit (ascii - 48 >= 0 && ascii - 48 <= 9)
			# save digit to new word (?)
			# element += 1
			
		# else if (ascii === 000) 
			# end for, return 0
		
		# else 	
			# return -1
	
	