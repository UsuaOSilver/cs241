;;;
;;; replace_char.s
;;; Replace all occurances of one char with another
;;;

section .data

string: 	db		"The cat in the hat "
STRLEN:		equ		$ - string

section .text

global _start
_start:

	; al = the char to search for
	; bl = the replacement char
	; rdi = address of the string
	; rcx = length of the string

	mov 	al, 	' '			; Replace all spaces
	mov 	bl, 	10			; Replace w newline
	mov 	rdi, 	string		; Addr. of string
	mov 	rcx, 	STRLEN		; Length of string

	; ------------------------------------------------------
	; find the end of the string
	add 	rcx, 	rdi			; Now, rcx points 1b beyond the string

.begin_while:
	cmp 	rdi, 	rcx
	je		.end_while

	cmp 	byte [rdi], al
	jne 	.end_if

	mov 	byte [rdi], bl

.end_if:

	inc 	rdi
	jmp		.begin_while

.end_while:

	;-------------------------------------------------------

	; Print string and exit
	mov rax, 1
	mov rdi, 1
	mov rsi, string
	mov rdx, STRLEN
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
