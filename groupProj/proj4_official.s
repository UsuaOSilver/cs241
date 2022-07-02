;;;
;;; proj4.s
;;;
;;; In this project, your task is to implement a few different C-style string 
;;; instructions in assembly, using the string instructions and, when applicable, 
;;; the repetition prefixes.

/* Appends a copy of source onto the end of destination. Assumes that
   writing strlen(source) many characters past the end of destination is
   safe to do. Returns destination.
*/
char* strcat(char* destination, char* source)
{
    // Find the end of destination
    while(*destination != 0)
        ++destination;

    // Copy source
    while(*source != 0) {
        *destination = *source;
        ++destination;
        ++source;
    }

    // Copy final NUL
    *destination = 0;
    return destination;
}

/* Assembly */

strcat:
    ; rdi = dest addr.
    ; rsi = src addr.
    
.begin_loop:

    cmp byte[rdi], 0
    je .continue_loop
    inc rdi
    jmp .begin_loop
    
.continue_loop:

    cmp byte[rsi], 0
    je .end_loop
    
    movsb
    
    jmp .continue_loop

.end_loop:

    mov byte[rdi], 0
    
    ret
    
====================================================================================

/* Appends a copy of the first n characters of source onto the end of 
   destination. Returns destination.
*/
char* strncat(char* destination, char* source, unsigned long n)
{
    // Find the end of destination
    while(*destination != 0)
        ++destination;

    // Copy source
    while(*source != 0 and n != 0) {
        *destination = *source;
        ++destination;
        ++source;
        --n;
    }

    // Copy final NUL
    *destination = 0;
    return destination;

}

/* Assembly */
strncat:
    ; rdi = dest addr.
    ; rsi = src addr.
    ; rdx = num characters
    
.begin_loop:

    cmp byte[rdi], 0
    je .continue_loop
    inc rdi
    jmp .begin_loop
    
.continue_loop:

    cmp byte[rsi], 0
    je .end_loop
    cmp n, 0
    je .end_loop

    movsb
    
    dec n
    jmp .continue_loop

.end_loop:

    mov byte[rdi], 0
    
    ret
    
====================================================================================

/* Returns a pointer to the first occurrence of the character c in string s.
   If c never occurs in s, then it returns the null pointer.
*/
char* strchr(char* s, char c)
{
    while(*s != 0 and *s != c) 
        ++s;

    if(*s == 0)
        return nullptr;
    else
        return s;
}

/* Assembly */
strchr:
    ; rdi = s addr.
    ; al = char c.
    
    mov al, c 
    mov rdi, s 
    mov rcx, 0
    
    repne scasb
    
    dec rdi

    ret
====================================================================================
