;;;
;;; arithmetics.s
;;;
;;; using arithmetic ops
;;;
;;; 1. wrong combo of operands w 3 operands
;;; 2. arithmetic & print in the same syscall not working??
;;;
;;; Only need syscall for read/write/exit

section .data

msg1: 		db		"Enter 1st number: "
MSG1LEN:	equ 	$ - msg1
;num1:
msg2:		db		"Enter 2nd number: "
MSG2LEN: 	equ		$ - msg2

section .text

global _start
_start:

;	mov r10, 0

;	mov		r8,		10
;	mov		r9,		2
;;	imul	r10,	r8,		r9
;	imul	r8,		r9
;	mov 	rdx,	3
;	mov		rax,	1
;	mov		rdi,	1
;	mov		rsi,	r8
;	syscall	


%exit
	mov rax, 60
	mov rdi, 0
	syscall
