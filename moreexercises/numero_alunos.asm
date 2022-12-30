; Olá! esse simples programa irá solicitar ao usuário o
; número de alunos e o númerod e alinas e então printará
; na tela. VAmos praticar Assembly?
; 
; Se não entender o qeu está acontecendo aqui, visite o
; o diretorio chamado nasm_tutor, lá terá a explicação 
; das coisas aqui.

SECTION .data

mensagem1      db       'Informe o número de alunos: ', 0h
mensagem2      db       'Informe o número de alunas: ', 0h

mensagem3      db       'Número de alunos na turma: ', 0h
mensagem4      db       'Número de alunas na turma: ', 0h

SECTION .bss

alunos:        resb        100
alunas:        resb        100


SECTION .text
global _start

_start:
   mov   eax, mensagem1          ; Move o endereço da mensagem1 para EAX.
   call  prints                  ; Chama a função prints.                '
   
   mov   edx, 100                
   mov   ecx, alunos 
   mov   ebx, 0
   mov   eax, 3
   int   80h

   mov   eax, mensagem2          ; Move o endereço da mensagem2 para EAX.
   call  prints                  ; Chama a função prints.                '

   mov   edx, 100
   mov   ecx, alunas
   mov   ebx, 0
   mov   eax, 3
   int   80h

   mov   eax, mensagem3          ; Move o endereço da mensagem3 para EAX.
   call  prints                  ; Chama a função prints.                '

   mov   eax, alunos           ; passamos o endereço do buffer que contém  input do usuário.
   call  prints                ; chama a função prints para imprimir a input do usuário

   mov   eax, mensagem4          ; Move o endereço da mensagem4 para EAX.
   call  prints                  ; Chama a função prints.                '

   mov   eax, alunas           ; Passamos o buffer que contém  input do usuário.
   call  prints                ; chama a função prints para imprimir a input do usuário

   call  quit
    


; Daqui para baixo para saber a explicação disso tudo
; visite os diretorios "lesson" a partir do 4.
; Os nomes da funções estarão difrentes mais a funcionalidade são as mesmas.
; Nos diretorios lesson apartir do 5, há um arquivo chamado functions.asm, de uma
; olhada nele também.
tamanhostring:

   push  ebx
   mov   ebx,  eax

proximochar:

   cmp   byte[eax], 0h
   jz    terminado
   inc   eax
   jmp   proximochar

terminado:
   sub   eax, ebx
   pop   ebx 
   ret


prints:

   push  edx
   push  ecx
   push  ebx
   push  eax
   call  tamanhostring
   
   mov   edx, eax
   pop   eax
   mov   ecx, eax
   mov   ebx, 1
   mov   eax, 4
   int   80h

   pop   edx
   pop   ecx
   pop   ebx
   ret

quit:

   mov   ebx, 0
   mov   eax, 1
   int   80h
   ret

