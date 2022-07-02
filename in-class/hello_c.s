;;;
;;; hello_c.s
;;; Print Helloworld!using the C-standard library
;;;
section .data

msg: 	db		"HEllo, world", 10, 0

section .text

global main

extern printf

main:
	push rbp
	mov rbp, rsp

	mov rdi, msg
	call printf

	mov rax,0
	pop rbp
	ret
