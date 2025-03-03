#сука ничего не работает
global _start

section .bss
a resw 1
b resw 1

section .text
_start:
	mov rax, 0
	mov rdi, 0
	mov rsi, a
	mov rdx, 2
	syscall

	mov [a + 1], 0

	mov rax, 0
	mov rdi, 0
	mov rsi, b
	mov rdx, 2
	syscall

	mov [b + 1], 0

	push [a]
	call str_to_int
	pop [a]

	push [b]
	call str_to_int
	pop [b]

	mov ax, [a]
	mov bx, [b]
	add ax, bx

	xor rdi, rdi
	mov di, ax
	jmp exit
str_to_int:
    mov rsi, rsp
    sub [rsi + 0], '0'
    sub [rsi + 1], '0'
    sub [rsi + 2], '0'
    pop eax
    xor eax, eax
    push rsi
    ret
exit:
	mov rax, 60
	syscall
