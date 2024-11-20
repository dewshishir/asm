.model small
 .stack 100h
 .data
 msg1 db 'Enter an uppercase letter: $'
 msg2 db 0Dh, 0Ah, 'The lowercase letter is: $'
 errorMsg db 0Dh, 0Ah, 'Invalid input. Please enter an uppercase letter. $'
 .code
 main:
 mov ax, @data
 mov ds, ax
 mov ah, 09h
 lea dx, msg1
 int 21h
 mov ah, 01h
 int 21h
 cmp al, 'A'
 jl invalid
 cmp al, 'Z'
 jg invalid
 mov bl,al
 add bl,32
 mov ah, 09h
 lea dx, msg2
 int 21h
 mov ah, 02h
mov dl, bl
 int 21h
 jmp exit
 invalid:
 mov ah, 09h
 lea dx, errorMsg
 int 21h
 exit:
 mov ah, 4Ch
 int 21h
 end main
