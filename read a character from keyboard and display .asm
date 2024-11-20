
.model small
 .stack 100h
 .data
 msg1 db 'Input: $'
 msg2 db 0Dh, 0Ah, 'Output: $'
 msg3 db 0Dh, 0Ah, 'this in not character $'
 .code
 main:
 mov ax, @data
 mov ds, ax
 mov ah, 09h
 lea dx, msg1
 int 21h
 mov ah, 01h
 int 21h
 mov cl, al
 cmp cl,'A'
 jl no_text
 cmp cl,'Z'
 jle Out_put
cmp cl,'a'
 jl no_text
 cmp cl,'z'
 jle Out_put
 Out_put:
 mov ah, 09h
 lea dx, msg2
 int 21h
 mov ah, 02h
 mov dl, cl
 int 21h
 jmp end_program
 no_text:
 mov ah,09h
 lea dx,msg3
 int 21h
 jmp end_program
 end_Program:
 mov ah, 4Ch
 int 21h
 end main




