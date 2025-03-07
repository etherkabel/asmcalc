section .text
global itoa

itoa:
    ; Вход: rdi - число, rsi - указатель на строку
    ; Выход: строка в rsi
    mov rax, rdi        ; Копируем число в rax
    mov rcx, 10         ; Основание (десятичная система)
    mov rbx, rsi        ; Сохраняем указатель на строку

    ; Обнуляем строку
    mov byte [rbx], 0

    ; Преобразование числа в строку
itoa_loop:
    xor rdx, rdx        ; Обнуляем rdx перед делением
    div rcx              ; Делим rax на 10
    add dl, '0'         ; Преобразуем остаток в символ
    dec rbx             ; Двигаем указатель влево
    mov [rbx], dl      ; Сохраняем символ в строке
    test rax, rax       ; Проверяем, не ноль ли rax
    jnz itoa_loop       ; Если не ноль, продолжаем

    ; Возвращаем указатель на начало строки
    mov rsi, rbx
    ret
