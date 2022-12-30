; Hello world program - nasmtutor
; intruduction of sys_exit

SECTION .data

msg   db    'Hello World',0Ah

SECTION .text
global _start


_start:
  mov edx, 13
  mov ecx, msg
  mov ebx,  1
  mov eax,  4
  int 80h

  mov ebx, 0        ; 0 is passed to function meaning "zero errors"
  mov eax, 1        ; sys_exit code
  int 80h
