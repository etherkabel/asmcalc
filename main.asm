global _start
extern trn_str
extern trn_int

section .bss
a resb 64
b resb 64
result resb 64
result_str resb 64

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

    mov rdi, a
    call trn_int

    mov rdi, b
    call trn_int

    mov r8, a
    mov r9, b
    add r8, r9
    mov rax, r9
    mov [result], rax

    mov rdi, result
    mov rsi, result_str
    call trn_str

    mov rax, 1
    mov rdi, 1
    mov rsi, result_str
    mov rdx, 64
    syscall
exit:
	mov rdi, [result]
	mov rax, 60
	syscall
