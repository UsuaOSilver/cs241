section .text
    ;rdi = addr dest
    ;rsi = addr src
global _start
_start:
    
    mov rcx, 0
    
.first_loop:

    cmp byte[rdi], 0
    je .end_first_loop
    
    inc rdi
    
.end_first_loop:
    dec rdi
    
    rep movsb
    mov rax, rdi
    ret
    
    