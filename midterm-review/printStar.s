;;;
;;; PrintStar.s
;;;
;;; Print a square of star w rdi param
;;;

section .data

newline: db 10
star:    db '*'

section .text

;; Print 1 star
print1:
	mov rax, 1
	mov rdi, 1
	mov rsi, star
	mov rdx, 1
	syscall

;; Print square
print_stars:

	mov rdi, 5
	mov rcx, rdi
	mov r10, rdi

	;Plan to write if/else rather than loop
	; cmp & jg/je/jle instead start_loop
	
	
	

	
