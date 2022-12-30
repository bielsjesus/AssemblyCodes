; Funções que serão usados dentro do nosso binário

;------------------------------------------
;int slen(String message)
; Função para o calculo do tamanho da string

slen:
  
   push  ebx
   mov   ebx, eax

nextchar:
   cmp   byte[eax], 0
   jz    finished
   inc   eax
   jmp   nextchar

finished:
   sub   eax, ebx
   pop   ebx
   ret



;------------------------------------------
; void sprint  (string message)
; Função para imprimir a mensagem

sprint:
   push  edx
   push  ecx
   push  ebx 
   push  eax
   call  slen

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



;-------------------------------------------
; void exit()
;  fecha o programa e recupera o recursos
quit:

   mov   ebx, 0
   mov   eax, 1
   int   80h
   ret   
