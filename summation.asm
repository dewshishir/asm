.model small
 .stack 100h
 .data
 msg1 db 'Enter first digit: $'
 msg2 db 0Dh, 0Ah, 'Enter second digit: $'
 msg3 db 0Dh, 0Ah, 'Sum is: $'
 result db ?
 msg4 db 0Dh, 0Ah, 'this is not valid input try again $'
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
 jl check
 cmp al, '9'
 jg check
 sub al, '0'
 mov bl, al
 mov ah, 09h
 lea dx, msg2
int 21h
 mov ah, 01h
 int 21h
 sub al, '0'
 add bl, al
 mov ah, 09h
 lea dx, msg3
 int 21h
 add bl, '0'
 mov ah, 02h
 mov dl, bl
 int 21h
 jmp exit
 check:
 mov ah, 09h
 lea dx, msg4
 int 21h
 jmp exit
 exit:
 mov ah, 4Ch
 int 21h
 end main
