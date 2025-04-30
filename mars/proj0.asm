## Start of file CMP_334_Project0.asm
##
## Question:
##
## This program ask the user to enter a number 1 to 5. 
## If the user enters a number less than 1 or bigger than 5, the program prints
## out "Number is invalid.". If the number entered is valid, the program prints
## out "The item selected is " plus the selected programming language from the
## space-separated list progLanguages.
##
## For example, if user enters the number 2, the program output should be:
##
## Enter a number 1 to 5: 2
## The item selected is Dart
##
## Complete the MIPS assembly instructions, to select and print out the correct 
## programming language based on the user input.
##
## Hint: Use "selected" space to store the selected language as you loop 
## the progLanguages string char by char (one byte at a time) 
##
###############################################################################
#                                                                             #
#                               text segment                                  #
#                                                                             #
###############################################################################

	.text
	.globl __start
__start:

	# print "Enter a number 1 to 5: "
	la $a0, prompt
	li $v0, 4
	syscall
	
	# capture user input
	li $v0, 5
	syscall
	
	# save input into register $s0 
	add $s0, $v0, $zero
	
	# validate input. number must be between 1 and 5
	bgt $s0, 5, __invalid_input
	blt $s0, 1, __invalid_input
	
	# print "The item selected is "
	la $a0, result
	li $v0, 4
	syscall

#
# DO NOT MAKE ANY CHANGES ABOVE THIS LINE
#
#--------------------------your code below this line--------------------------#




	
#--------------------------your code above this line--------------------------#
#
# DO NOT MAKE ANY CHANGES BELOW THIS LINE
#
__exit:
	li $v0, 10
	syscall
		
__invalid_input:
	# print "Number is invalid."
	la $a0, invalid
	li $v0, 4
	syscall

	j __exit

###############################################################################
#                                                                             #
#                               data segment                                  #
#                                                                             #
###############################################################################
	.data
# List of important programming languagues from 2010-2019
# The list is separated by space. 
# E.g. "Rust" is the first item in the list. "Swift" is the fifth item
#
progLanguages: 	.asciiz "Rust Dart Kotlin TypeScript Swift"

prompt:			.asciiz "Enter a number 1 to 5: "

invalid:		.asciiz "Number is invalid."

result:			.asciiz "The item selected is "
				.align 2
selected:		.space 10
##
## End of file CMP_334_Project0.asm