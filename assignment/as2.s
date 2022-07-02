;;;
;;; as2.s
;;;
;;; Converting binary to decimal
;;;

section .data

BUFLEN: 	equ					20
buffer:		times BUFLEN db		0	; Buffer of 20 '\0's
newline:	db					10	; Single newline

section .text

global _start
_start:

	mov 	rsi,	1
	mov		rdi,	10
	call 	print_int

	mov 	rsi,	1
	mov		rdi,	186562354
	call	print_int

	mov 	rsi,	1
	mov 	rdi, 0xdeadbeef12345678         ; = 16045690981402826360 decimal
    call 	print_int

    ; End program
    mov     rax,  60 
    mov     rdi,  0 
    syscall

print_int:

    ; Your printing code here 
	push rbp
    mov rbp, rsp
    sub rsp, 8

	mov r10, 19
	mov r11, 48
	mov rax, rdi

 loop_begin:
 	mov rdx, 0
 	mov r8, 10
 	div r8
 	add rdx, r11
 	mov byte[buffer + r10], dl

	dec r10
	cmp r10, 0
	jge loop_begin

 .end_loop:

 	mov rax, 1
 	mov rdi, 1
 	mov rsi, buffer
 	mov rdx, BUFLEN
 	syscall

 	mov rax, 1
 	mov rdi, 1
 	mov rsi, newline
 	mov rdx, 1
 	syscall

    add rsp, 8
    pop rbp

    ret         ; Return from print_int function
