
.section .text

.global __start

__start:

  # linux file descriptors
  ; STDIN = 0
  ; STDOUT = 1
  ; STDERR = 2

  # print message
  li $v0, 4004
  li $a0, 1
  la $a1, msg
  li $a2, 14
  syscall

  # exit
  li $v0, 4001
  li $a0, 0
  syscall

.section .data

msg:
  .asciiz "Hello, world!\n"
