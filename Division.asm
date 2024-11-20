.MODEL SMALL
.STACK 100H
.DATA
 A DB "ENTER NUMERATOR : $"
 B DB "ENTER NOMINATOR : $"
 ERROR DB "SYNTAX ERROR $"
 QUOTIENT DB "QUOTIENT IS : $"
 REMAINDER DB "REMAINDER IS : $"

.CODE
 MAIN PROC
 MOV AX,@DATA
 MOV DS,AX

 LEA DX,A
 MOV AH,9
 INT 21H
 
 MOV AH,1
 INT 21H

 SUB AL,48
 MOV BL,AL

 MOV AH,2
 MOV DL,0DH
 INT 21H
 MOV DL,0AH
 INT 21H

 LEA DX,B
 MOV AH,9
 INT 21H

 MOV AH,1
 INT 21H

 SUB AL,48
 MOV BH,AL

 MOV AH,2
 MOV DL,0DH
 INT 21H
 MOV DL,0AH
 INT 21H

 CMP BH,0
 JE ERR

 MOV AL,BL
 MOV AH,0

 DIV BH

 ADD AL,48
 MOV BL,AL

 ADD AH,48
 MOV BH,AH

 LEA DX,QUOTIENT
 MOV AH,9
 INT 21H

 MOV AH,2
 MOV DL,BL
 INT 21H

 MOV AH,2
 MOV DL,0DH
 INT 21H
 MOV DL,0AH
 INT 21H

 LEA DX,REMAINDER
 MOV AH,9
 INT 21H

 MOV AH,2
 MOV DL,BH
 INT 21H

 MOV AH,4CH
 INT 21H

 ERR:
 LEA DX,ERROR
 MOV AH,9
 INT 21H

 MOV AH,4CH
 INT 21H

 MAIN ENDP
 END MAIN





