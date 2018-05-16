; Infinite loop (e9 fd ff)
;loop:
;	jmp loop

; Data Register 32-bit data register: EAX
; EAX => 16-bit AX the primary accumulator: used in input/output and most arithmetic instructions
; AX => two 8-bit AH & AL
mov ah, 0x0e	; tty mode
mov al, 'H'
int 0x10		; interupt
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10		; repeated 'l'
mov al, 'o'
int 0x10
mov al, ','
int 0x10		; interupt
mov al, ' '
int 0x10
mov al, 'W'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'c'
int 0x10
mov al, 'o'
int 0x10
mov al, 'm'
int 0x10
mov al, 'e'
int 0x10
mov al, ' '
int 0x10
mov al, 't'
int 0x10
mov al, 'o'
int 0x10
mov al, ' '
int 0x10
mov al, 'K'
int 0x10
mov al, 'a'
int 0x10
mov al, 'y'
int 0x10
mov al, 'O'
int 0x10
mov al, 'S'
int 0x10
mov al, '!'
int 0x10


jmp $ 			; jump to current address => infinite loop


; Fill with 510 zeros minus the size of the previous code
times 510-($-$$) db 0

; Magic Number
dw 0xaa55
