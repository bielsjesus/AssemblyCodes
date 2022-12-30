; Hello World Program (Subroutines)


SECTION .data

msg   db    'Hello World, edited',0Ah

SECTION .text

global _start

_start:

   mov   eax, msg    ; Move o endreço da nossa string para EAX.                    
   call  strlen      ; Chama a nossa função to calcular o tamanho da string.

   mov   edx, eax    ; Nossa função deixou o resultado em EAX, esttamos passando para EDX.
   mov   ecx, msg    ; Masi uma vez estamos movendo o endereço da nossa strings para ECX.
   mov   ebx, 1
   mov   eax, 4
   int   80h

   mov   ebx, 0
   mov   eax, 1
   int   80h


strlen:     ; Nossa primeria declaração de função

   push  ebx            ; Preserva o valor de EBX para possamos usar ele para outra tarefa.
   mov   ebx, eax       ; Faz com que EBX e EAX apontem para o mesmo endereço


nextchar:               ; Vai "Iterando" sobre a string.
   cmp   byte[eax], 0   ; Compara o btte que está em EAX com zero.
   jz    finished       ; SE for igual, ele pula para a nossa função finished
   inc   eax            ; incrementa em 1 byte EAX, se a comparação anterior não for atendida.
   jmp   nextchar       ; Reiniciaa o loop.


finished:               ; Faz o cálculo do tamanho da string e retorna a execução.
   sub   eax, ebx       ; EAX aponta para o final e EBX para o inicio da string, fazendo essa sub conseguimos  
                        ; pegar q quantidade de bytes que fica entre o endereços que estão em EAX e EBX.
                        ; Estamos fazendo final - inicial = número de bytes entre o inicio e o final da string.
                        ; Esse núemro de bytes é justamente o tamanho da string. 
            
   pop   ebx            ; Devolve o valor original de ebx.
   ret                  ; retorna para onde a função foi chamada.

