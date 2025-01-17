section .data
array dd 10, 20, 30, 40, 50
array_size equ $ - array ; Calculate the size of the array

section .bss
result resd 1 ; Reserve space for the result

section .text
    global _start

_start:
    ; Get the array index from the user (example - replace with your input method)
    mov ecx, 2 ; Example index

    ; Bounds check
    cmp ecx, array_size / 4 ; check if index is within bounds. Div by 4 because each element takes 4 bytes
    jge out_of_bounds ; Jump if out of bounds

    mov eax, [array + ecx*4] ; Access array element safely
    mov [result], eax ; Store result

    ; Exit program gracefully
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80

out_of_bounds:
    ; Handle out-of-bounds error - could display error message, exit with error code, etc.
    mov eax, 1 ; sys_exit
    mov ebx, 1 ; Exit with error code 1
    int 0x80