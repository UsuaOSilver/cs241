;;;
;;; lower-case.s
;;;	Combining loop & if/else example
;;;

section .data

string: 	db		"THE cat IN the HAT", 10
STRLEN:		equ		$ - string

section .text

global _start
_start:

	mov 	rdi, 	0

start_do:

	mov 	al, 	byte [string + rdi]

	cmp 	al, 	65
	jnge	end_if
	cmp		al,		90
	jnle	end_if

	add		al,		32						; Make lowercase
	mov		byte [string + rdi],	al

end_if:

	inc		rdi
	cmp		rdi,	STRLEN
	jb		start_do

	; Print string
	mov		rax,	1
	mov		rdi,	1
	mov		rsi,	string
	mov		rdx,	STRLEN
	syscall

	; Exit
	mov 	rax,	60
	mov		rdi,	0
	syscall
	
