; Hello World (Incuindo aquivo externo)

%include       'functions.asm'

SECTION .data

msg1     db    'Primeira string',0Ah
msg2     db    'Segunda string',0Ah

SECTION .text
global _start

_start:

   mov   eax,  msg1     ; Move o endereço da primeira string para EAX
   call  sprint         ; Chama a função para imprimir a primeira string

   mov   eax,  msg2     ; Move o endereço da segunda string para EAX
   call  sprint         ; Chama a função para imprimir a segunda string

   call  quit           ; Chama a função quit que encerra o programa 
