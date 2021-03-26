
.model small

.stack 100h

.data
 
msg1 DB 'Enter limit: $'
msg2 DB 10,13,'Enter numbers:$'
msg3 DB 10,13,'largest number is:$'
msg4 DB 10,13,'Position:$'
newline DB 10,13,'$'
array DW 50 DUP(?)
limit DW ?
count DW ?
pos DW ?
res DW ?
.code

.startup
 
  MOV DX,OFFSET msg1
  CALL displaymsg
  
  CALL readnum
  MOV limit,SI
  
  MOV  DX,OFFSET msg2
  CALL displaymsg
  
  MOV  DX,OFFSET newline
  CALL displaymsg
  
  MOV count,0000H
  MOV DI,OFFSET array
  
lar:  CALL readnum
      MOV [DI],SI
      
      ADD DI,0002H
      INC count
      MOV BX,count
      CMP BX,limit
      JNZ lar


      MOV DI,OFFSET array
      MOV AX,[DI]
      MOV count,0001H
      MOV pos,0001H
back: INC count
      ADD DI,0002H
      CMP [DI],AX
      JG ass
      MOV BX,count
      CMP BX,limit
      JNZ back
      JMP print


ass:  MOV AX,[DI]
      MOV res,AX
      MOV BX,count
      MOV pos,BX
      CMP BX,limit
      JNZ back
      

print:MOV DX,OFFSET msg3
      CALL displaymsg
     
      MOV SI,res
      CALL displaynum

      MOV DX,OFFSET msg4
      CALL displaymsg

      MOV SI,pos
      CALL displaynum

.exit

displaymsg PROC NEAR
 	MOV AH,09H
        INT 21H
        
        RET
displaymsg ENDP
displaynum PROC NEAR
	MOV AX,SI
	MOV CX,0000H
	MOV DX,0000H
back1:	MOV BX,000AH
	DIV BX
	PUSH DX
	INC CX
	MOV DX,0000H
	CMP AX,0000H
	JNZ back1
	
there:	POP AX
	
	ADD AH,30H
	ADD AL,30H
	MOV DL,AL
	MOV AH,02H
	INT 21H
	DEC CX
	CMP CX,0000H
	JNZ there
	
	RET
displaynum ENDP
	

readnum PROC NEAR
	
	MOV SI,0000H
	MOV DX,0000h
	MOV BX,000AH
first:	MOV AH,01H
	INT 21H

	CMP AL,30H
	JB here
	CMP AL,39H
	JA here
        
	SUB AL,30H
	MOV CL,AL
	MOV CH,00H
	
	

	MOV AX,SI
	MOV SI,CX
	

	
	
	MUL BX
	ADD AX,CX
	MOV SI,AX
	
	JMP first
	
here:	MOV AX,SI
	RET
	

readnum ENDP



end
