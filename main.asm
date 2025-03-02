global _start

section .bss
a resb 16
b resb 16

section .text
_start:
	mov rax, 0
	mov rdi, 0
	mov rsi, a
	mov rdx, 16
	syscall 

	mov rax, 0
	mov rdi, 0
	mov rsi, b
	mov rdx, 16
	syscall 

	mov ax, [a]
	mov bx, [b]
	add ax, bx
	mov di, ax
exit:
	mov rax, 60
	syscall
