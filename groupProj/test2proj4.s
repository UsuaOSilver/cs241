section .text

global _start
_start:
    ;rdi = addr dest
    ;rsi = addr src
    ; rdx = n
    mov rcx, 0

    rep scasb
    
    dec rdi

.loop: 
    
    cmp byte[rdi], 0
    je .end_loop
    cmp byte[rsi], 0
    je .end_loop
    cmp rdx, 0
    je .end_loop
    
    movsb 
    dec rdx
    
.end_loop:

    mov rax, rdi
    
    ret