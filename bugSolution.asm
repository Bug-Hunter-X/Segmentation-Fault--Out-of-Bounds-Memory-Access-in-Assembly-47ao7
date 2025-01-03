; Corrected code with boundary checks
section .data
    myArray times 100 dw 0 ; Example array, Adjust size as needed
section .text
    global _start
_start:
    mov ecx, someIndex ; someIndex is provided from somewhere else
    cmp ecx, 100 ; Check if the index is within bounds (0-99 for this array)
    jl check_lower_bound ; Jump to check_lower_bound if ecx < 100
    jmp out_of_bounds ; Jump to out_of_bounds if ecx >= 100 
    check_lower_bound:
        cmp ecx, 0 ; Check if the index is within bounds (0-99)
        jge access_memory ; Jump to access_memory if ecx >= 0
        jmp out_of_bounds ; Jump to out_of_bounds if ecx < 0
    access_memory:
        mov eax, [myArray + ecx*2] ; Access memory safely
        ; ... further operations using eax ...
        jmp exit_program ; Exit after processing
    out_of_bounds:
        ; Handle out-of-bounds error (e.g., exit with an error code)
        mov eax, 1 ; sys_exit syscall number
        xor ebx, ebx ; exit code 0
        int 0x80
    exit_program:
        mov eax, 1 ; sys_exit syscall number
        xor ebx, ebx ; exit code 0
        int 0x80