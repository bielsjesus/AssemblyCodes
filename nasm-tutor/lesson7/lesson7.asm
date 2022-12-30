; Hello World prpgram (Imprimindo com Line Feed)

%include    'functions.asm'

SECTION .data

msg1     db    'Hello World, testabdo função com line fedd',0h
msg2     db    'Bom, Deu certo, Graças a Deus!', 0h

SECTION .text
global _start

_start:

   mov   eax, msg1
   call  sprintLF

   mov   eax, msg2
   call  sprintLF
   
   call  quit
