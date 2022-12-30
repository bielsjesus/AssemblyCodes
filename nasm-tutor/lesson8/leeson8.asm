;Hello World proram (Passando argumentos)

%include       'functions.asm'

SECTION .text
global   _start

_start:

   pop   ecx            ; Tira da pilha o número de argumentos passados.



proximoArg:

   cmp   ecx, 0h        ;Verifica se ainda há argumetnos na stack
   jz    acabouArgs     ; Se acabou, pula para subrotina que fecha o prog
   pop   eax            ; Se ainda houver, passa o argumento para eax
   call  sprintLF       ; Chama a função sprintLF que imprime o argumetno
   dec   ecx            ; Decrementa o ECX para irmos para o proximo arg.
   jmp   proximoArg     ; Reinicia o loop.
   

acabouArgs:

   call  quit           ; Encerra o programa.
