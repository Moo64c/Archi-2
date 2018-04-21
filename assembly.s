section .data
  neg_1:
    dq -1.0
section .text
;  global invert_complex
  global add_complex, subtract_complex
  extern malloc, free, scanf, printf

; ==== Invert complex ====
invert_complex:
  push rbp
  mov rbp, rsp

  ; Save registers.

  ; Get pointer.
  mov rax, [rbp+8]
  ; Get first value (real number)
  movq xmm0, [rax]
  ; Get second value (imaginery)
  movq xmm6, [rax+8]

  ; Number of bytes to allocate.
  mov rdi, 16
  call malloc
  ; Copy number.
  movq [rax], xmm0
  ; Load a register with all 1s
  mulss xmm6, [neg_1]
  movq [rax + 8], xmm6

  ; Restore registers.

  ; Return.
  pop rbp
  ret


; ==== Add complex ====
add_complex:
push rbp
mov rbp, rsp

; Save registers.
push r10
push r11
push r12
push r13

; Get pointer.
mov rax, [rdi+8]
mov rbx, [rsi+8]

; Get first value (real number) from number 1
mov r10, [rax]
; Get second value (imaginery) from number 1
mov r11, [rax+8]
; Get first value (real number) from number 2
mov r12, [rbx]
; Get second value (imaginery) from number 2
mov r13, [rbx+8]

; Number of bytes to allocate.
mov rdi, 16
call malloc
; add numbers.
add r10, r12
add r11, r13
; Copy number.
mov [rax], r10
mov [rax+8], r11

; Restore registers.
pop r11
pop r10
pop r12
pop r13

; Return.
pop rbp
ret


; ==== Substract complex ====

subtract_complex:
push rbp
mov rbp, rsp

; Save registers.
push r10
push r11
push r12
push r13

; Get pointer.
mov rax, [rdi+8]
mov rbx, [rsi+8]

; Get first value (real number) from number 1
mov r10, [rax]
; Get second value (imaginery) from number 1
mov r11, [rax+8]
; Get first value (real number) from number 2
mov r12, [rbx]
; Get second value (imaginery) from number 2
mov r13, [rbx+8]

; Number of bytes to allocate.
mov rdi, 16
call malloc
; Substract numbers.
sbb r10, r12
sbb r11, r13
; Copy number.
mov [rax], r10
mov [rax+8], r11

; Restore registers.
pop r11
pop r10
pop r12
pop r13

; Return.
pop rbp
ret
