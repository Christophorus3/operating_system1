[bits 16]

switch_to_pm:
    cli ; 1.: disable interrupts
    lgdt [gdt_descriptor] ; 2.: load GDT descriptor
    mov eax, cr0
    or eax, 0x1 ; 3.: set 32 bit mode in cr0
    mov cr0, eax
    jmp CODE_SEG:init_pm ; what??

[bits 32]
init_pm: ; using 32bit instructions
    mov ax, DATA_SEG ; 5.: update segment registers
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000 ; 6.: update stack right at top of free space
    mov esp, ebp

    call BEGIN_PM