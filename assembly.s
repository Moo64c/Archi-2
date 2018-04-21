section .data
  neg_1:
    dq -1.0
  _1:
    dq 1.0

section .text
  global invert_complex
  extern malloc, free, scanf, printf, multiply_complex


; ==== Power complex ====
power_complex:
; Standard start.
	push   rbp
	mov	   rbp, rsp
  ; Allocate some room on the stack.
	sub	   rsp, 32
	mov  	 [rbp - 24], rdi
	mov	   [rbp - 28], rsi
  ; Allocate room for a result.
	mov    rdi, 16
	call	 malloc
  mov    [rbp - 16], rax

  ; If power <= 0 ?
	cmp	   qword[rbp - 28], 0
	jg	   .power_complex_not_zero_power

  ; Power of zero. Assign 1 and 0.
	mov    rax, [rbp - 16]
  ; Save 1 in the double real value.
	movsd	 xmm0, [_1]
	movsd  [rax], xmm0
	mov	   rax, [rbp - 16]
	add	   rax, 8
  ; Save 0 in the imaginery value.
	pxor	 xmm0, xmm0
	movsd	 [rax], xmm0
	mov	   rax, [rbp - 16]
	jmp	.power_complex_end
.power_complex_not_zero_power:
  ; power == 1 ?
	cmp	   qword[rbp - 28], 1
	jne	   .power_complex_recursively
  ; Power == 1.
  ; Load the values into the local result holder and return.
	mov	   rax, [rbp - 24]
	movsd	 xmm0, [rax]
	mov	   rax, [rbp - 16]
	movsd	 [rax], xmm0
	mov	   rax, [rbp - 16]
	mov	   rax, [rbp - 24]
	movsd	 xmm0, [rax + 8]
	movsd	 [rdx], xmm0
	mov	   rax, [rbp - 16]
	jmp	   .power_complex_end
.power_complex_recursively:
  ; Recursive call for results.
  ; Free temporary result holder.
	mov	   rax, [rbp - 16]
	mov	   rdi, rax
	call	 free


  ; Call power_complex again with power - 1 before multiplying.
	mov	   rax, [rbp - 28]
	lea	   rdx, [rax - 1]
	mov	   rax, [rbp - 24]
	mov	   rsi, rdx
	mov	   rdi, rax
	call	 power_complex

  ; Multiply the values (should happen [rbp-28] times).
	mov	   [rbp - 8], rax
	mov	   rdx, [rbp - 24]
	mov	   rax, [rbp - 8]
	mov	   rsi, rdx
	mov	   rdi, rax
	call	 multiply_complex

  ; Free unused result pointers.
	mov	   [rbp - 16], rax
	mov	   rax, [rbp - 8]
	mov	   rdi, rax
	call	 free
  
  ; Return result.
	mov	   rax, [rbp - 16]
.power_complex_end:
; End function.
	leave
	ret

; ==== Invert complex ====
invert_complex:
  ; Generic start
	push rbp
	mov rbp, rsp

  ; Increase stack size.
	sub rsp, 32

  ; Save rdi on stack and allocate memory for the new complex number.
	mov    [rbp - 24], rdi
	mov	   rdi, 16
	call malloc
  ; Save allocated memory address on stack.
  mov    [rbp-8], rax

  ; Take first parameter from rdi (saved on stack).
	mov    rax, [rbp-24]
	movsd  xmm0, [rax]
  ; Copy real number to new complex number's real.
	mov	   rax, [rbp-8]
	movsd	 [rax], xmm0

  ; Save the imaginery number.
	mov	   rax, [rbp-8]
	add	   rax, 8
	mov	   rdx, [rbp-24]
	add	   rdx, 8
  ; rdx points to original, rax to newely allocated one.

  ; Negate the imaginery number
	movsd	 xmm1, [rdx]
	pxor	 xmm0, xmm0
	subsd	 xmm0, xmm1
  ; Save the number to the newely allocated area.
	movsd	 [rax], xmm0

  ; Return address of new number.
	mov	   rax, [rbp-8]

  ; Reset rbp & rsp and return.
	leave
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


; ; ==== Substract complex ====
;
; subtract_complex:
; push rbp
; mov rbp, rsp
;
; ; Save registers.
; push r10
; push r11
; push r12
; push r13
;
; ; Get pointer.
; mov rax, [rdi+8]
; mov rbx, [rsi+8]
;
; ; Get first value (real number) from number 1
; mov r10, [rax]
; ; Get second value (imaginery) from number 1
; mov r11, [rax+8]
; ; Get first value (real number) from number 2
; mov r12, [rbx]
; ; Get second value (imaginery) from number 2
; mov r13, [rbx+8]
;
; ; Number of bytes to allocate.
; mov rdi, 16
; call malloc
; ; Substract numbers.
; sbb r10, r12
; sbb r11, r13
; ; Copy number.
; mov [rax], r10
; mov [rax+8], r11
;
; ; Restore registers.
; pop r11
; pop r10
; pop r12
; pop r13
;
; ; Return.
; pop rbp
; ret
