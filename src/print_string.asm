SECTION .text
global print_string

; ---------------------------------
; print_string
; Entrada:
;   EAX = direccion de cadena
;   cadena terminada en 0
; ---------------------------------

print_string:

    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx
    push esi

    mov esi, eax        
    
    xor edx, edx        
.len_loop:
    cmp byte [esi + edx], 0
    je .len_done
    inc edx
    jmp .len_loop

.len_done:
    mov eax, 4          
    mov ebx, 1          
    mov ecx, esi

    int 0x80

    pop esi
    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret
