section .data
  neg_1:
    dq -1.0
  _1:
    dq 1.0

section .text
  global invert_complex, add_complex, subtract_complex, multiply_complex
  extern malloc, free, scanf, printf
  global power_complex

; ==== Power complex ====

power_complex:
  push	rbp
  mov	  rbp, rsp

  ; Extend stack & get parameters.
  sub 	rsp, 32
  mov	  [rbp - 24], rdi
  mov	  [rbp - 28], esi

  ; Create container for a result.
  mov	  edi, 16
  call	malloc
  mov	 [rbp - 16], rax

  ; Check power == 0 ?
  cmp  word[rbp - 28], 0
  jg	.not_zero
  ; Power == 0.
  ; Return 1.0 0.0i .
  mov	rax, [rbp - 16]
  movsd	xmm0, [_1]
  movsd	[rax], xmm0
  mov	rax, [rbp - 16]
  add	rax, 8
  pxor	xmm0, xmm0
  movsd	[rax], xmm0
  mov	rax, [rbp - 16]
  jmp	.end

  .not_zero:
  ; Check power == 1 ?
  cmp	word[rbp - 28], 1
  jne	.not_one
  ; Power == 1.
  ; Return a copy of the value passed.
  mov	rax, [rbp -24]
  movsd	xmm0, [rax]
  mov	rax, [rbp - 16]
  movsd	[rax], xmm0
  mov	rax, [rbp - 16]
  lea rdx, [rax + 8]
  mov	rax, [rbp - 24]
  movsd	xmm0, [rax + 8]
  movsd	[rdx], xmm0
  mov	rax, [rbp - 16]
  jmp	.end
  .not_one:
  ; Power > 1
  ; Clear result container.
  mov	rdi, [rbp - 16]
  call	free

  ; Call power_complex recursively.
  mov	eax, [rbp - 28]
  ; Power--;
  lea	edx, [rax - 1]
  mov	esi, edx
  mov	rdi, [rbp - 24]
  call	power_complex
  mov	[rbp - 8], rax

  ; Multiply result by the value passed.
  mov	rsi, [rbp - 24]
  mov	rdi, rax
  call multiply_complex
  mov	[rbp - 16], rax

  ; Free allocated memory in multiply_complex.
  mov	rdi, [rbp - 8]
  call free

  mov	rax, [rbp - 16]
.end:
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
; Generic start
push rbp
mov rbp, rsp

; Increase stack size.
sub rsp, 32

  ; Save rdi and rsi on stack and allocate memory for the new complex number.
	mov	[rbp-24], rdi
	mov	[rbp-32], rsi
  mov edi, 16
	call	malloc

  ; Save allocated memory address on stack.
	mov	[rbp-8], rax

  ; Take first parameter from rdi (saved on stack).
	mov	rax, [rbp-24]
	movsd	xmm1, [rax]
  ; Take first parameter from rsi (saved on stack).
	mov	rax, [rbp-32]
	movsd	xmm0, [rax]

  ; Add the real part of the numbers.
	addsd	xmm0 ,xmm1

  ; Copy real sum to new complex number's real.
	mov	rax, [rbp-8]
	movsd	[rax], xmm0
  ;get first imaginery number
	mov	rax, [rbp-8]
	add	rax, 8
  ;get second imaginery number
	mov	rdx, [rbp-24]
	add	rdx, 8
  ; save second imaginery to xmm1
	movsd	xmm1, [rdx]
	mov	rax, [rbp-32]
	add	rdx, 8
  ; save first imaginery to xmm0
	movsd	xmm0, [rdx]
  ; add imaginery part
	addsd	xmm0, xmm1
  ; Save the number to the newely allocated area.
	movsd	[rax], xmm0

  ; Return address of new number.
	mov	rax, [rbp-8]

  ; Reset rbp & rsp and return.
	leave
	ret


  ; ==== Subtract complex ====
  subtract_complex:
  ; Generic start
  push rbp
  mov rbp, rsp

  ; Increase stack size.
  sub rsp, 32

  ; Save rdi and rsi on stack and allocate memory for the new complex number.
  mov	[rbp-24], rdi
  mov	[rbp-32], rsi
  mov	rdi, 16
  call	malloc

  ; Save allocated memory address on stack.
  mov	[rbp-8], rax

  ; Take first parameter from rdi (saved on stack).
  mov	rax, [rbp-24]
  movsd	xmm0, [rax]

  ; Take first parameter from rsi (saved on stack).
  mov	rax, [rbp-32]
  movsd	xmm1, [rax]

  ; Subtract the real part of the numbers.
  subsd	xmm0, xmm1

  ; Copy real distance(diffrence) to new complex number's real.
  mov	rax, [rbp-8]
  movsd	[rax], xmm0

  ;get first imaginery number
  mov rax, [rbp-8]
  add	rax, 8
  ;get second imaginery number
  mov	rdx, [rbp-24]
  add	rdx, 8
  ; save second imaginery to xmm1
  movsd	xmm0, [rdx]
  mov	rdx, [rbp-32]
  add	rdx, 8
  ; save first imaginery to xmm0
  movsd	xmm1, [rdx]
  ; Subtract imaginery part
  subsd	xmm0, xmm1
  ; Save the number to the newely allocated area.
  movsd	[rax], xmm0

  ; Return address of new number.
  mov	rax, [rbp-8]

  ; Reset rbp & rsp and return.
  leave
  ret

; ======= Multiply complex =======
  multiply_complex:
  ; Generic start
  push rbp
  mov rbp, rsp

  ; Increase stack size.
  sub rsp, 32

  ; Save rdi and rsi on stack and allocate memory for the new complex number.
  mov	[rbp-24], rdi
  mov	[rbp-32], rsi
  mov	rdi, 16
  call	malloc

  ; Save allocated memory address on stack.
  mov	[rbp-8], rax

  ; Take first parameter from rdi (saved on stack).
  mov	rax, [rbp-24]
  movsd	xmm1, [rax]

  ; Take first parameter from rsi (saved on stack).
  mov	rax, [rbp-32]
  movsd	xmm0, [rax]

  ; Multiply the real part.
  mulsd	xmm0, xmm1

  ; Get the imaginery first number and save to xmm2
  mov	rax,[rbp-24]
  add	rax, 8
  movsd	xmm2, [rax]
  ; Get the imaginery second number and save to xmm1
  mov	rax, [rbp-32]
  add	rax, 8
  movsd	xmm1, [rax]
  ; Multiply the imaginery part
  mulsd	xmm1, xmm2
  ;Subtract the imaginery from real and save in new area allocated.
  subsd	xmm0, xmm1
  mov	rax, [rbp-8]
  movsd	[rax], xmm0
  mov	rax, [rbp-8]
  ; Rdx will get the imaginery part of the final number.
  lea rdx, [rax+8]
  ; Get the first's real num to xmm1
  mov	rax, [rbp-24]
  movsd	xmm1, [rax]
  ; Get the second's imaginery num to xmm0
  mov	rax, [rbp-32]
  add	rax, 8
  movsd	xmm0, [rax]
  ; Multiply both.
  mulsd	xmm1, xmm0
  ; Get the first's imaginery num to xmm2
  mov	rax, [rbp-24]
  add	rax, 8
  movsd	xmm2, [rax]
  ; Get the second's real num to xmm0
  mov	rax, [rbp-32]
  movsd	xmm0, [rax]
  ; Multiply and add
  mulsd	xmm0, xmm2
  addsd	xmm0, xmm1
  movsd	[rdx], xmm0,
  ; Return address of new number.
  mov	rax, [rbp-8]

  ; Reset rbp & rsp and return.
  leave
  ret
