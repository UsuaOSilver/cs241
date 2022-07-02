
section .data
	newline: 	db	10
	star:		db	"*"
	space:		db	" "
	
section .text
global _start
_start:

print_parallelogram:
	; r10 = r
	; r8 = c
	; rdx = 5
	
	mov rdi, 1
	
	.while_print_row:
		mov r8, 1
	
		cmp r10, rdx
		jg  .end_while
	
	.while_print_space: 
		cmp r8, r10
		jg  .while_print_col
		call print_space
		inc r8
		jmp .while_print_space
	
	.while_print_col:
		cmp r8, rdx
		setg r8
		call print_star
		inc r8
		jmp .while_print_col
	
	call print_nl
	inc r10
	jmp .while_print_row

	.end_while:
		mov rax, 60
		mov rdi, 0
		syscall	
	
	;;; Functions
	print_star:
		mov rax, 1
		mov rdi, 1
		mov rsi, star
		mov rdx, 1
		syscall
		ret
	
	print_space:
		mov rax, 1
		mov rdi, 1
		mov rsi, " "
		mov rdx, 1
		syscall
		ret
	
	print_nl:
		mov rax, 1
		mov rdi, 1
		mov rsi, newline
		mov rdx, 1
		syscall
		ret


