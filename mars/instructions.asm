################################################################
#             text segment                                     #
################################################################
	.text 
	.globl __start

__start:
# R-type instructions
	# the value at register t1 will be the result obtained by adding register t2 and t3
	add $t1, $t2, $t3 # register addressing
	
# I-type instructions
	# the value at register t1 will be the result obtained by adding register t2 and 124
	addi $t1, $t2, 124 # immediate addressing

	li $t2, 0x10010000 # register t2 has a valid data segment address 
	lw $t1, 100($t2) # base addressing
	
	beq $t1, $t2, exit # pc-relative addressing

# J-type instructions
	jal printHello
	
	j next # pseudo direct addressing
	
next:
	li $v0, 1
	addi $a0, $zero, 10
	syscall
	
exit:
	li $v0, 10
	syscall
	
printHello:
	li $v0, 4
	la $a0, hello
	syscall
	
	jr $ra # register direct addressing

################################################################
#            data segment                                      #
################################################################	
	.data 
hello:	.asciiz "Hello, world!\n"