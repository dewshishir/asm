.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "ENTER FIRST NUMBER: $"
    MSG2 DB "ENTER SECOND NUMBER: $"
    MSG3 DB "SMALLEST NUMBER IS: $" 
    MSG4 DB "BOTH ARE EQUAL $"
    
    NUM1 DB 0       
    NUM2 DB 0        

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

   
    LEA DX, MSG1
    MOV AH, 9
    INT 21H    
    

   
    MOV AH, 1
    INT 21H
    SUB AL, 30H      
    MOV NUM1, AL

    
  
    MOV AH, 2
    MOV DL, 0DH  
    INT 21H
    MOV DL, 0AH
    INT 21H
    
   
    LEA DX, MSG2
    MOV AH, 9
    INT 21H     
    
    

  
    MOV AH, 1
    INT 21H
    SUB AL, 30H       
    MOV NUM2, AL


    MOV AL, NUM1
    CMP AL, NUM2
    JL DISPLAY_FIRST 
    JE EQUAL 
    
    

    MOV AH, 2
    MOV DL, 0DH  
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
    
    MOV AL, NUM2
    ADD AL, 30H       
    MOV DL, AL
    MOV AH, 2
    INT 21H     
    
    JMP EXIT
          

DISPLAY_FIRST: 

 
    MOV AH, 2
    MOV DL, 0DH  
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
    
    MOV AL, NUM1
    ADD AL, 30H       
    MOV DL, AL
    MOV AH, 2
    INT 21H           
    
    JMP EXIT 
    
    
EQUAL:  
       

    MOV AH, 2
    MOV DL, 0DH  
    INT 21H
    MOV DL, 0AH
    INT 21H  

    LEA DX, MSG4
    MOV AH, 9
    INT 21H

EXIT: 

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
