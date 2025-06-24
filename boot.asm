[BITS 16]
[ORG 0x7C00]

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    call clear_screen

main_loop:
    mov si, msg_menu
    call print_string

    call get_char

    cmp al, '1'
    je show_logo

    cmp al, 'Q'
    je quit

    jmp main_loop

; Limpa a tela usando BIOS
clear_screen:
    mov ah, 0x06    ; Scroll up
    mov al, 0       ; Scroll entire screen
    mov bh, 0x07    ; Attribute: light grey on black
    mov cx, 0       ; Upper left corner (row=0, col=0)
    mov dx, 0x184F  ; Lower right corner (row=24, col=79)
    int 0x10
    ret

; Print da  string terminada em  zero
print_string:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp print_string
.done:
    ret

;lê um caractere do teclado
get_char:
    mov ah, 0x00
    int 0x16
    ret

; logo
show_logo:
    call clear_screen
    mov si, msg_logo
    call print_string
    jmp main_loop

; saionara
quit:
    call clear_screen
    mov si, msg_quit
    call print_string
    jmp hang

;hang
hang:
    cli
.hang_loop:
    hlt
    jmp .hang_loop

; msgs do menu do bxl
msg_menu db "BxL Bootloader:", 0xA
         db "1 - Show logo", 0xA
         db "Q - Quit", 0xA
         db "Choose the option: ", 0

msg_logo db 0xA, "BxL v1", 0

msg_quit db 0xA, "Leaving... Bye!", 0

times 510 - ($ - $$) db 0
dw 0xAA55
