global _start

section .bss
a resb 64
b resb 64
result resb 64

; цифры в ascii таблице - от 48 (0) до 57 (9)

section .text
_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, a
    mov rdx, 64
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, b
    mov rdx, 64
    syscall

    xor rcx, rcx
a_to_int:
    cmp byte [a + rcx], 0
    je b_to_int
    movzx rax, byte [a + rcx]
    sub rax, '0'

    ; ФОРМУЛА - ((ASCII КОД) - 48) * 10^N + ...
