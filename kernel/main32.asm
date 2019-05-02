[org 0x7c00]

    mov bp, 0x9000 ;set base pointer for stack
    mov sp, bp ;set stack pointer

    mov bx, MSG_REALMODE
    call print

    call switch_to_pm
    jmp $ ;is never run... ;-)

    %include "kernel/print.asm"
    %include "kernel/gdt.asm"
    %include "kernel/print32.asm"
    %include "kernel/switch_pm.asm"

[bits 32]
BEGIN_PM: ;will get there after switch
    mov ebx, MSG_PROTMODE
    call print_string_pm
    jmp $

MSG_REALMODE db "Started in 16-bit real mode...", 0
MSG_PROTMODE db "Switched to 32-bit protected mode...", 0

; bootsector
times 510 - ($-$$) db 0
dw 0xaa55