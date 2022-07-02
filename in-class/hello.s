;;; 
;;; hello.s
;;; Print Hello, world!
;;;

section .data

msg:		db		"Hello, world!", 10		; If dd MSGLEN has to /4
MSGLEN:		equ		($ - msg)

SYS_WRITE: equ 1
STDOUT: equ 1
SYS_EXIT: equ 60

section .text

global _start
_start:

	; SYS_WRITE: Print msg to standard output
	mov		rax,	SYS_WRITE	; 1 = SYS_WRITE code
	mov		rdi,	STDOUT		; 1 = standard output
	mov 	rsi, 	msg 		; Address of text
	mov		rdx,	MSGLEN		; Length to print
	syscall

	; SYS_EXIT: End the program
	mov		rax, 	SYS_EXIT	; 60 = SYS_EXIT
	mov 	rdi, 	0			; Exit code
	syscall
