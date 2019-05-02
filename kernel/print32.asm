[bits 32] ;using 32 bit mode (protected)

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f ;color byte

print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY

print_string_pm_loop:
    mov al, [ebx] ;address of character
    mov ah, WHITE_ON_BLACK

    cmp al, 0
    je print_string_pm_done

    mov [edx], ax ;write char + color to video mem
    add ebx, 1 ;next char
    add edx, 2 ;next video mem position

    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret