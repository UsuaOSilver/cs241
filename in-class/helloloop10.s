;;;
;;; helloloop10.s
;;; Print Hello 10 times (Using 'loop'instrcution)
;;;

section .data

msg: 		db		"Hello!", 10
MSGLEN: 	equ		$ - msg

SYS_WRITE: 	equ 	1
SYS_EXIT:	equ 	60
STDOUT:		equ 	1

section .text

global _start
_start:

	mov		rcx,	10

start_loop:
	mov		rax, 	SYS_WRITE
	mov 	rdi, 	STDOUT
	mov		rsi,	msg
	mov		rdx,	MSGLEN

	mov 	r15,	rcx
	syscall
	mov		rcx,	r15

	loop start_loop					;; --rcx, jump to start_loop if rcx !=0

	mov		rax, 	SYS_EXIT
	mov		rdi, 	0
	syscall
	
