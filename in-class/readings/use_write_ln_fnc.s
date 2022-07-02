;;;
;;; use_write_ln_fnc.s
;;; test write_ln_fnc
;;;
;;; Only print newline w/o msg??
;;; => Problem with include?
;;;

section .data

%include "write_ln_fnc.s"

msg: 	db		"Hello, word!"
MSGLEN: equ		$-msg

section .text

global _start
_start:

	mov rsi, msg
	mov rdx, MSGLEN
	call write_ln

	mov rax, 60
	mov rdi, 0
	syscall
