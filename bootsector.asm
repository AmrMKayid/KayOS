[org 0x7c00] ; tell the assembler that our offset is bootsector code

mov bx, WELCOME
call print

call print_nl

mov bx, KayOS
call print

call print_nl

mov dx, 0x12fe
call print_hex

jmp $ 			; jump to current address => infinite loop


; include subroutines
%include "boot_sect_print.asm"
%include "boot_sect_hex.asm"


; Data

WELCOME:
    db 'Welcome to KayOS!', 0

KayOS:
    db 'The Greatest OS Everrr!!!', 0

; Fill with 510 zeros minus the size of the previous code
times 510-($-$$) db 0

; Magic Number
dw 0xaa55


; Infinite loop (e9 fd ff)
;loop:
;	jmp loop

; Data Register 32-bit data register: EAX
; EAX => 16-bit AX the primary accumulator: used in input/output and most arithmetic instructions
; AX => two 8-bit AH & AL
