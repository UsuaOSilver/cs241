;;;
;;;proj2.s
;;;
;;; Computing π w 12 iterations
;;;

section .data

zero:	dq		0.0
one:    dq      1.0
two:    dq      2.0
four:   dq      4.0
negone: dq      -1.0
limit:  dq      0.000001

format: db      "%f", 10, 0

section .text

extern printf

global main
main:

	push rbp
	mov rbp, rsp

	;; Compute pi
	movsd xmm0, qword [limit]
	call compute_pi
	; Return val in xmm0

	;; Print result
	mov rdi, format
	mov al, 1
	call printf

	mov rax, 0
	pop rbp
	ret

compute_pi:
	push rbp
	mov rbp, rsp

	; xmm0 = aPproximation lim
	; Return result in xmm0

	; YOUR CODE HERE
	
	; p = 3
	fld qword[one]       		; st(0) = 1.0
	fld qword[two]       		; st(0) = 2.0, st(1) = 1.0
	fadd st1					; st(0) = 3.0
	fstp qword[rsp-8]			; p = 3.0, then pop st(0)
	ffree st0					; free st(0) = 1.0
	
	mov rax, qword[one]
	mov qword[rsp-24], rax      ;i
	mov qword[rsp-32], rax      ;d
	mov qword[rsp-40], rax      ;s/d
	mov rax, qword[four]
    mov qword[rsp-16], rax      ;s

	finit
	
.begin_loop:

	; Update p = p + s/d
	fld qword[rsp-32]       ; st(0) = d
	fld qword[rsp-16]       ; st(0) = s, st(1) = d
	fdiv st0, st1       	; st(0) = s/d
	fst qword[rsp-40]		; Store s/d for later
	
	fadd qword[rsp-8]		; st(0) = s/d + p
	fstp qword[rsp-8]		; p = st(0), then pop st(0)
	
	ffree st0				; load twice -> pop&free
	
	;Stack empty. Update sign s = -s
	fld qword[rsp-16]       ; st(0) = s   
    fchs                    ; st(0) = -st(0)
    fstp qword[rsp-16]      ; s = st(0), then pop st(0)
	
	; Stack empty. Update d = 2i*(2i+1)*(2i+2)
	fld qword[one]      	; st(0) = 1.0
	fld qword[two]   	    ; st(0) = 2.0, st(1) = 1.0
	fld qword[rsp-24]     	; st(0) = i, st(1) = 2.0, st(2) = 1.0
	fmul st1				; st(0) = 2.0
	fst qword[rsp-32]		; d = 2.0
	fadd st2				; st(0) = 3.0
	fmul qword[rsp-32]		; st(0) = 2.0 * 3.0
	fstp qword[rsp-32]		; d = 2.0 * 3.0 
	fld qword[rsp-24]     	; st(0) = i, st(1) = 2.0, st(2) = 1.0
	fmul st1				; st(0) = 2.0
	fadd st1				; st(0) = 4.0
	fmul qword[rsp-32]		; st(0) = 2.0 * 3.0 * 4.0
	fstp qword[rsp-32]		; d = 2.0 * 3.0 * 4.0, then pop st(0)
	
	ffree st0
	ffree st1
	
	; Stack empty. Compare
	fld qword[rsp-40]       ; st(0) = s/d
	fabs       				; st(0) = abs(s/d)
	fld qword[limit]        ; st(0) = 0.000001, st(1) = abs(s/d)
	fucomi st1				; Compare st(0) with st(1)
	ffree st0
	ffree st1
	
	jb .begin_loop
	
	; Stack empty.
	movsd xmm0, qword[rsp-8] ; xmm0 = p
	
	pop rbp
	ret
