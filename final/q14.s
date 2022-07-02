;;;
;;; q14.s
;;;
;;; Using the string instructions where appropriate, write the definition of a function streq which returns 1 if 
;;; two C-style (NUL-terminated) strings are character-for-character equal, and false otherwise. 
;;; You can assume that both strings have the same length, given by rdx.


streq:
    ; rdi = pointer to string a
    ; rsi = pointer to string b
    ; rdx = length of a and b
    ; Returns in rax 1 (true, a == b) or 0 (a != b)
    
    add rdx, rdi
    
.begin_loop:
    cmp rdi, rdx
    je .end_loop

    cmpsb
    je .begin_loop
    
    mov rax, 0
    ret
    
.end_loop:
    mov rax, 1
    ret 