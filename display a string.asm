.model small
 .stack 100h
 .data
 msg1 db 'This is a string $'
 .code
 main:
 mov ax, @data
 mov ds, ax
 mov ah, 09h
 lea dx, msg1
 int 21h
 mov ah, 4Ch
 int 21h
 end main



