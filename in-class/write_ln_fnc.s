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
	mov rdx, rsi
	mov r10, rdx
	syscall

	mov rax, 1
	mov rdi, 1
	mov rdx, newline
	mov r10, 1
	syscall

	ret
