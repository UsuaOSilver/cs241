;;;
;;; hello10.s
;;; Print Hello 10 times (Using 'times' directive)
;;;

section .data

msg: 		times 10 db		"Hello!", 10
MSGLEN: 	equ		$ - msg

SYS_WRITE: 	equ 	1
SYS_EXIT:	equ 	60
STDOUT:		equ 	1

section .text

global _start
_start:

	mov		rax, 	SYS_WRITE
	mov 	rdi, 	STDOUT
	mov		rsi,	msg
	mov		rdx,	MSGLEN
	syscall

	mov		rax, 	SYS_EXIT
	mov		rdi, 	0
	syscall
	
