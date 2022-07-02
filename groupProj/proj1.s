;;;
;;; proj1.s
;;;
;;; Group3
;;;
;;; An assembly program which prompts the user for their name, 
;;; printing What is your name? 
;;; and then accepts up to 255 characters of input, 
;;; and then prints out Hello,name, nice to meet you! followed by a newline.
;;;

section .data

prompt: 		db		"What is your name?"
prompt_len: 	equ		$-prompt

buffer:			times 255 db '!'

resp1: 			db		"Hello, "
resp1_len:		equ		$-resp1
resp2:			db		", nice to meet you!", 10
resp2_len:		equ		$-resp2

; Delete below after finish (cant modify .data section)
SYS_WRITE: 	equ		1
SYS_READ: 	equ		0
SYS_EXIT: 	equ		60
STDOUT:		equ		1
STDIN:		equ		0

section .text

global _start
_start:

	;INPUT name
	mov 	rax,	SYS_READ
	mov 	rdi,	STDIN
	mov		rsi,	buffer
	mov		rdx,	255 		; doesnt print out name -- skip input if mv rdx, rax
	syscall
	
	mov r10, rax
	sub r10, 1

	;PRINT greeting
	mov 	rax,	SYS_WRITE
	mov		rdi, 	STDOUT
	mov		rsi,	prompt
	mov		rdx,	prompt_len
	syscall
	
	;RESPONSE
	;resp1
	mov		rax,	SYS_WRITE
	mov		rdi,	STDOUT
	mov		rsi,	resp1
	mov		rdx, 	resp1_len
	syscall	

	;Name
	mov		rax,	SYS_WRITE
	mov		rdi,	STDOUT
	mov		rsi, 	buffer
	mov		rdx,	r10
	syscall

	;resp2
	mov		rax,	SYS_WRITE
	mov		rdi,	STDOUT
	mov		rsi, 	resp2
	mov		rdx,	resp2_len
	syscall

	;EXIT
	mov 	rax, 	SYS_EXIT
	mov		rdi, 	0
	syscall
	

;;;Q
;;; How to save & carry buffer length after syscall input -> syscall output?
	
