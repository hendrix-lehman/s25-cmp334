# All about registers
#
#
#
################################################################
#             text segment                                     #
################################################################
	.text 
	.globl __start

__start:
	li $t0, 15
	li $t1, 12
	add $t2, $t0, $t1
	sw $t2, buffer
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall

exit:
	li $v0, 10
	syscall
	

################################################################
#            data segment                                      #
################################################################	
	.data 
begin: 	.ascii "start"
	.align 2
buffer: .space 6
end: 	.ascii "end"