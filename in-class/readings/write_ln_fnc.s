;;;
;;; write_ln_fnc.s
;;; Function to add a new line at the end of the string
;;;

section .data

newline:		db		10

section .text

write_ln:

	; rdi = addr.
	; rsi = length

	mov rax, 1
	mov rdi, 1
	mov rsi, rdi
	mov rdx, rsi
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall

	ret
