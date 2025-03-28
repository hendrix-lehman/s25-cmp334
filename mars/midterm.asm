
.text

	li $t0, 1
	ble $t0, 5, exit

	la $t0, hello
	
exit:
	li $v0, 10
	syscall


.data

hello: .asciiz  "hello there"
