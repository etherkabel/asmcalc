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
    mov r8, rax

    mov rdi, b
    call atoi
    mov r9, rax

    add r8, r9
    mov rax, r8

    mov rdi, rax         ; Результат
    mov rsi, result_str  ; Адрес для строки
    call itoa

    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 64
    syscall

exit:
	mov rdi, [result]
	mov rax, 60
	syscall