; Hello World prpgram (Recebendo input do usuário)
; A seção .bss é uma área do programa que usada para 
; reservar espaço na memória para variaveis não inicializadas.
; Ela será usada aqui para segura um dado qeu o Usuário inserir.


%include       'functions.asm'

SECTION .data

msg1     db    'Por favor, insira o seu nome: ',0h ; Mensagem que será impressa ao pedir o nome
msg2     db    'Ola, ', 0h      ; Menssagem que será impresssa junto com a entrada do user.


SECTION .bss

sinput:   resb  255     ; Reservará 255 bytes para armazenar a entrada do user.


SECTION .text
global _start

_start:

   mov   eax, msg1
   call  sprint

   mov   edx, 255      ; Quatidade de bytes a serem reservados
   mov   ecx, sinput   ; espaço reservado para armazernar a input (conhecido como buffer)
   mov   ebx, 0        ; Ler do arquivo STDIN
   mov   eax, 3        ; OPCAODE da syscall sys_read
   int   80h

   mov   eax, msg2
   call  sprint

   mov   eax, sinput   ; Move nosso buffer para a ser impresso pela função sprint
   call  sprint        ; Usamos a sprint porque a input do usuário já tem Linefeed)

   call  quit

