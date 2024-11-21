TITLE Sum of Squares (SimpleSumSquares.asm)

; Program to calculate the sum of squares of first n natural numbers
; Demonstrates `loopnz`, `shl`, and `movsx`

INCLUDE Irvine32.inc

.data
num DWORD 5          ; Number of natural numbers
sum DWORD ?        ; Store the result
msg BYTE "Sum of squares: ", 0

.code
main PROC
    mov ecx, num        ;counter register set to num(number of natural numbers)
    mov eax, 0          ;accumalator register is 0
    mov ebx, 1          

calculate:
    mov edx, ebx        ; Copy current number
    shl edx, 1          ; Multiply by 2
    imul edx, ebx       ; Calculate square (n * n)
    add eax, edx        ; Add square to sum
    inc ebx             ; Increment number
    loopnz calculate    ; Repeat for next number

    mov sum, eax        

    lea edx, msg        
    call WriteString    
    mov eax, sum        
    call WriteDec       
    call Crlf           

    exit
main endp
end main