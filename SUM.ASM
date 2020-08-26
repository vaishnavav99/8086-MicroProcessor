.MODEL SMALL
.STACK 100H

.DATA
 num1 db ?
 num2 db ?
 result db ?
 msg1 db 10,13,"enter number of element : $"
 msg2 db 10,13,"enter second number to add : $"
 msg3 db 10,13,"result of addition is : $"


.CODE
.STARTUP
mov cl,0h
 mov dx,offset msg1
 CALL PRINT
 CALL READ
 mov num1,al
X: cmp num1,0
 je L
 dec num1
 mov dx,offset msg2
 CALL PRINT
 CALL READ
 mov num2,al
 cmp cl,num2
dec num1
jle X
jg Y

Y:mov cl,num2
jmp X



L: mov ah,0h
 	aaa
 	add ah,30h
 	add al,30h
 	mov bx,ax
 	mov ah,2
 	mov dl,bh
 	int 21h
 	mov ah,2
 	mov dl,bl
	mov ah,4ch
 	int 21h	
 int 21h
.EXIT
READ PROC NEAR
	 mov ah,1
	 int 21h
	 sub al,30h
	RET
READ ENDP

PRINT PROC NEAR
	 mov ah,9H
	 int 21h
	
	RET
PRINT ENDP

end 
