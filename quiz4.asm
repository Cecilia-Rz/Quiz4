section .data
    x dd 4       ; Define a integer (4) for x
    y dd 12      ; Define a integer (12) for y
    z dd 36      ; Define a integer (36) for z
    result dd 0  ; Reserve space for the result

section .text
    global _start

_start:
    ; Load arguments into registers
    mov eax, [x] ; Load x into EAX (first argument)
    mov ebx, [y] ; Load y into EBX (second argument)
    mov ecx, [z] ; Load z into ECX (third argument)

    ; Call the add function
    call add_integers

    ; Store the result from EAX into the result variable
    mov [result], eax

    ; Exit the program
    mov eax, 1    ; sys_exit system call number
    xor ebx, ebx  ; Exit code 0
    int 0x80      ; Call kernel

; Function to add three integers
; Parameters: 
;   eax = x
;   ebx = y
;   ecx = z
; Returns:
;   eax = result (sum of x, y, and z)
add_integers:
    ; Add the integers
    add eax, ebx ; eax = eax + ebx
    add eax, ecx ; eax = eax + ecx
    ret          ; Return to caller
