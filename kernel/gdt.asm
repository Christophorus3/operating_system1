gdt_start:
    ; gdt starts with 8 Bytes zeros
    dd 0x0 ;dd: double word, 32 bits
    dd 0x0

gdt_code:
    ; GDT entry for code segment. base = 0x00000000, length = 0xfffff
    ; for flags, refer to os-dev.pdf document, page 36
    ; this is a struct in asm
    ; dw: word, 16 bit
    ; db: byte, 8 bit
    dw 0xffff   ; segment length, bits 0-15
    dw 0x0      ; segment base, bits 0-15
    db 0x0      ; segment base, bits 16-23
    db 10011010b    ; flags, 8 bits
    db 11001111b    ; flags, 4 bits + segment length, bits 16-19
    db 0x0      ; segment base, bits 24-31

gdt_data:
    ; GDT entry for data segment. 
    dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0
gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1 ; size word (16bit), always 1 less of its true size
    dd gdt_start ; address double word (32bit)

; some constants for later use:
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start