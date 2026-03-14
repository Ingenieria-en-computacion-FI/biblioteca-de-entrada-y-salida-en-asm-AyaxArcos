SECTION .bss
char_out resb 1

SECTION .text
global print_char

; ---------------------------------
; print_char
; Entrada:
;   AL = caracter a imprimir
; ---------------------------------
print_char:
    push ebp
    mov ebp, esp

    mov [char_out], al

    push ebx
    push ecx
    push edx

    mov eax, 4         
    mov ebx, 1          
    mov ecx, char_out
    mov edx, 1
    int 0x80

    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret
