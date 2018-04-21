section .data
  neg_1:
    dq -1.0
section .text
  global invert_complex, add_complex, subtract_complex
;  global add_complex, subtract_complex
  extern malloc, free, scanf, printf

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
