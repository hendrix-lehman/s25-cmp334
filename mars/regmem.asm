 #
# 0010 => 2 ; multiply 0010 times 2 => 0100 => 4

################################################################
#             text segment                                     #
################################################################
	.text 
	.globl __start

__start:
	li $t1, 0x0a0f0806 # 00001010 00001111 00001000 00000110
	sw $t1, num # this instruction stores a word (4 bytes or 32 bits) from $t1 to num
	#sh $t1, num # this instruction stores half word (2 bytes or 16 bits) from $t1 to num
	# sb $t1, num # this instruction stores a byte (06) from $t1 to num
	
	#lh $t2, num
	lb $t2, num
	
	li $t0, 7 # last "index" in the list
	li $s0, 0 # current "index"
	li $s1, 0 # mem address base
loop:
	beq $t0, $s0, exit
	
	lw $t3, list($s1)
	
	# print item from list
	add $a0, $t3, $zero
	li $v0, 1
	syscall
	
	addi $s1, $s1, 4
	addi $s0, $s0, 1
	j loop
	
	#lw $t3, list # this is 4 from the list
	#lw $t4, list + 4 # this is 6 from the list
	#lw $t5, list + 8 # this is 1 from the list
	#lw $t6, list + 12 # this is 9 from the list

exit:
	li $v0, 10
	syscall
	

################################################################
#            data segment                                      #
################################################################	
	.data 
	# num is a representation of an int data type in Java. It uses 4 bytes or 32 bits in size.
num: 	.space 4
list:	.word 4, 6, 1, 9, 12, 8, 32