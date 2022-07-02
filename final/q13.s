;;;
;;; q13.s
;;;
;;; Calculate 1/e
;;;

section .data

    dbl_one:    dq      1.0
    
section .text 

compute_inv_e:
    
    push rbp
    mov rbp, rsp
    
    mov rax, qword[dbl_one]
    mov qword[rsp-8], rax       ;E
    mov qword[rsp-16], rax      ;s
    mov qword[rsp-24], rax      ;i
    mov rdi, 3.0                ;n
    
    finit
    
.begin_loop:
    ; Update E = E * -1/i
    fld qword[rsp-24]           ; st(0) = i
    fld qword[rsp-16]           ; st(0) = s
    fdiv st0, st1               ; st(0) = s/i
    
    fmul qword[rsp-8]           ; st(0) = E * s/i
    fstp qword[rsp-8]           ; E = st(0), then pop st(0)
    
    ffree st0                   ; now st(0) = i
    
    ; Stack empty. Update sign s = -s
    fld qword[rsp-16]           ; st(0) = s   
    fchs                        ; st(0) = -st(0)
    fstp qword[rsp-16]          ; s = st(0), then pop st(0)
    
    ; Stack empty. Update i = i + 1
    fld qword[dbl_one]          ; st(0) = 1.0
    fld qword[rsp-24]           ; st(0) = i, st(1) = 1.0
    fadd st1                    ; st(0) = i + 1.0
    fstp qword[rsp-24]          ; i = st(0), then pop
    ffree st0                   ; pop 1.0
    
    ; Stack empty. Compare
    fld qword[rsp - 24]         ; st(0) = i
    fld qword[rdi]              ; st(0) = 3.0, st(1) = i
    fucomi st1                  ; Compare st(0) with st(1)
    ffree st0
    ffree st1
    
    ja .begin_loop

    ; Stack empty.
    movsd xmm0, qword[rsp-8]    ; xmm0 = E
    
    pop rbp
    ret
    