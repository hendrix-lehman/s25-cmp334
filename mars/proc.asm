#

################################################################
#             text segment                                     #
################################################################
	.text 
	.globl __start

__start:

	li $a0, 12
	jal print_int
	
	la $a0, names
	li $a1, 5
	jal print_names


exit:
	li $v0, 10
	syscall

# Prints a number in the terminal
#
# input(s):
# $a0 contains the number value to print
# output: none
print_int:
	li $v0, 1
	syscall
	
	jr $ra
	
# print list of names
#
# inputs:
# $a0 contains the memory address to list of names 
# $a1 contains the size of the list
print_names:
	li $t0, 0 # count
	add $t1, $a0, $zero # saving mem address of names
	add $t2, $a1, $zero # saving list size
	li $t3, 0 # name length
	
	loop:
		beq $t0, $t2, end_loop
		
		add $a0, $t1, $t3
		li $v0, 4
		syscall
		
		# what should $t1 and $t3 be incremented to
		addi $t3, $t3, 5
		
	
		addi $t0, $t0, 1
		j loop
		
	end_loop:
		jr	$ra

# find null after string or asciiz
#
# input:
# $a0 contain mem address to asciiz
# output:
# $a0 word length
word_length:
	add $t4, $a0, $zero # saving input
	
	li $t5, 0 # count
	lb $t6, ($t4)
	_loop:
		beq	$t6, 0, _done
	
		j _loop
	
	_done:
		jr $ra

################################################################
#            data segment                                      #
################################################################	
	.data 
	
names:		.asciiz	"jose", "jane", "mike", "kayla", "alec"

