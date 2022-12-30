; Hello World (Adicionando um null byte no final da string.)
; Nosso programa imprmia a segunda strijg duas vezes pois nao achava o
; o byte nulo no final indicando o final da string.

%include       'functions.asm'

SECTION .data

msg1     db    'Primeira string',0Ah, 0h
msg2     db    'Segunda string',0Ah, 0h

SECTION .text
global _start

_start:

   mov   eax,  msg1     ; Move o endereço da primeira string para EAX
   call  sprint         ; Chama a função para imprimir a primeira string

   mov   eax,  msg2     ; Move o endereço da segunda string para EAX
   call  sprint         ; Chama a função para imprimir a segunda string

   call  quit           ; Chama a função quit que encerra o programa 
