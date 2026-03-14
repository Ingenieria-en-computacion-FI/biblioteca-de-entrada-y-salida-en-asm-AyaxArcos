SECTION .text
global scan_string

; ---------------------------------
; scan_string
; Entrada:
;   EAX = buffer destino
;   EBX = tamaño máximo
; ---------------------------------

scan_string:

    push ebp
    mov ebp, esp

push ecx
    push edx
    push esi
    push edi

    mov esi, eax        
    mov edx, ebx        
    cmp edx, 1
    jbe .solo_cero      

    dec edx

    mov eax, 3          
    mov ebx, 0          
    mov ecx, esi        
    int 0x80 

    cmp eax, 1
    jl .poner_cero

    mov edi, esi
    add edi, eax
    mov byte [edi], 0

    mov edi, esi
    add edi, eax
    dec edi
    cmp byte [edi], 10      
    jne .fin
    mov byte [edi], 0
    dec eax
    jmp .fin

.solo_cero:
    mov byte [esi], 0
    xor eax, eax
    jmp .fin

.poner_cero:
    mov byte [esi], 0
    xor eax, eax

.fin:
    pop edi
    pop esi
    pop edx
    pop ecx

    mov esp, ebp
    pop ebp
    ret
