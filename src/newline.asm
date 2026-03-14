extern print_char
global newline

SECTION .text

newline:

    push ebp
    mov ebp, esp

    push eax            
    mov al, 10          
    call print_char
    pop eax

    mov esp, ebp
    pop ebp
    ret
