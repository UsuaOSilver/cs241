;;;
;;; proj3.s
;;;
;;; Random Number Generation - In this assignment you’ll use the bitwise operations, 
;;; shifts, and rotates to implement the xoroshiro64** pseudo-random number generator.
;;; 
;;; xoroshiro64.s
;;;
;;; Questions marked with ;;;;
;;;
section .data

s0:         dd      137546 
s1:         dd      729 

buffer:     dd      0            

section .text

global _start
_start:

    push rbp
    mov rbp, rsp

.loop:

    call next
    mov dword [buffer], eax ; Return value from next in eax

    mov rax, 1          ; Write syscall
    mov rdi, 1          ; Stdout
    mov rsi, buffer     ; Address 
    mov rdx, 4          ; Length
    syscall

    jmp .loop

    pop rbp

    mov rax, 60
    mov rdi, 0
    syscall

next: 

    push rbp
    mov rbp, rsp
    
    ; Next function here. 
    mov edi, dword[s0]
    mov esi, dword[s1]

    ; Multiplication constants
    mov rdx, 0xb9E3779BB
    mov ecx, 5
    
    mov ebx, edi
    mul edx        ;;;; how can ebx able to store result when mul 64bit??
    rol ebx, 5     ; rotate eax 5
    mul ecx        ; mul by 5                      
    ; Confusing whether to use eax to store dword[s0] 
    ; (need to store s0 but eax is the output and keep changing)
    mov eax, dword[ebx] ; Store result in eax
    
    xor esi, edi
    
    mov ebx, edi
    rol ebx, 26
    xor ebx, esi
    mov edx, esi
    shl edx, 9
    xor ebx, edx
    mov dword[s0], ebx
    
    mov ebx, esi
    rol ebx, 13
    mov dword[s1], ebx    
    
    pop rbp
    
    ; Return results in eax.
    ret 