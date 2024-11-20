.model small
 .stack 100h
 .data
 msg1 db 'Enter first digit: $'
 msg2 db 0Dh, 0Ah, 'Enter second digit: $'
 msg3 db 0Dh, 0Ah, 'Result is: $'
 result db ?
 msg4 db 0Dh, 0Ah, 'This is not valid input. Try again. $'
 .code
 main:
 mov ax, @data
 mov ds, ax
 mov ah, 09h
 lea dx, msg1
 int 21h
 mov ah, 01h
 int 21h
 cmp al, '0'
 jl invalid_input
 cmp al, '9'
 jg invalid_input
 sub al, '0'
 mov bl, al
 mov ah, 09h
 lea dx, msg2
 int 21h
mov ah, 01h
 int 21h 
 cmp al, '0'
 jl invalid_input
 cmp al, '9'
 jg invalid_input
 sub al, '0'
 sub bl, al
 mov ah, 09h
 lea dx, msg3
 int 21h
 cmp bl, 0
 jge positive_result
 mov ah, 02h
 mov dl, '-'
 int 21h
 neg bl
 positive_result:
 add bl, '0'
 mov ah, 02h   
mov dl, bl
 int 21h
 jmp exit
 invalid_input:
 mov ah, 09h
 lea dx, msg4
 int 21h
 exit:
 mov ah, 4Ch
 int 21h
 end main
