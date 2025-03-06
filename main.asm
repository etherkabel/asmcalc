global _start
extern atoi
extern itoa

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
    call atoi

    mov rdi, b
    call atoi

    mov rax, [a]
    mov rbx, [b]
    add rax, rbx
    mov [result], rax

    mov rdi, result

exit:
	mov rdi, [result]
	mov rax, 60
	syscall