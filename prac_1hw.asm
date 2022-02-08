section .data
msg: db "Rithika Kathirvel",10
l: equ $-msg
msg_1: db "Thai street, selvanagar",10
l_1: equ $-msg_1
msg1: db "Trichy, Tamil Nadu",10
l1: equ $-msg1

section .bss

section .text
global _start:
_start:
  mov eax,4
  mov ebx,1
  mov ecx,msg
  mov edx,l
  int 80h

  mov eax,4
  mov ebx,1
  mov ecx,msg_1
  mov edx,l_1
  int 80h

  mov eax,4
  mov ebx,1
  mov ecx,msg1
  mov edx,l1
  int 80h
  
  mov eax,1
  mov ebx,0
  int 80h


 
   
