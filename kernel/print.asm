print:
    pusha

    ; keep this in mind:
    ; while (string[i] != 0) { print string[i]; i++ }

    ; the comparison for string end (null byte)

start:
    mov al, [bx] ;bx is starting address of the string
    cmp al, 0 ;if == 0 end of string
    je done

    mov ah, 0x0e ;terminal mode
    int 0x10

    add bx, 1 ;go to next byte
    jmp start

done:
    popa
    ret


print_nl:
    pusha

    mov ah, 0x0e
    mov al, 0x0a ;newline character
    int 0x10
    mov al, 0x0d ;carriage return char
    int 0x10

    popa
    ret