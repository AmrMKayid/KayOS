; mov ah, 0x0e	; tty mode
;
; mov al, 'X'
; jmp print
; endprint:
;
; print:
;     int 0x10
;     jmp endprint

print:
    pusha


; keep this in mind:
; while (string[i] != 0) { print string[i]; i++ }

; the comparison for string end (null byte)
start:
    mov al, [bx]  ; 'bx' is the base address for the string
    cmp al, 0
    je done

    mov ah, 0x0e
    int 0x10      ; 'al' already contains the char

    add bx, 1
    jmp start


done:
    popa
    ret


print_nl:
    pusha

    mov ah, 0x0e
    mov al, 0x0a  ; newline char
    int 0x10

    ; a control character or mechanism used to reset a device's position
    ; to the beginning of a line of text.
    mov al, 0x0d  ; carriage return
    int 0x10

    popa
    ret
