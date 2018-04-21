section .data
  neg_1:
    dq -1.0
  _1:
    dq 1.0

section .text
  global invert_complex, add_complex, subtract_complex, multiply_complex, divide_complex, newton_step, calculate_derivative
  extern malloc, free, scanf, printf
  global power_complex, apply_function

; ==== Apply function ===
apply_function:
	push rbp
	mov	rbp, rsp

  ; Allocate 64 bytes and pull parameters.
  sub rsp, 64
	mov	[rbp - 40], rdi
	mov	[rbp - 44], esi
	mov	[rbp - 56], rdx

  ; Result container.
	mov	edi, 16
	call	malloc
	mov	[rbp - 16], rax

  ; Init  0 = result[0], result[1]
	pxor	xmm0, xmm0
	movsd	[rax], xmm0
	add	rax, 8
	movsd	[rax], xmm0
	mov	word[rbp - 20], 0
	jmp	.check_loop_condition
.loop_start:
  ; Raise the value by the current order.
	mov	edx, [rbp - 20]
	mov	rax, [rbp - 56]
	mov	esi, edx
	mov	rdi, rax
	call power_complex
	mov	[rbp - 8], rax

  ; Extend result.
	mov	eax, [rbp - 20]
	cdqe
	lea	rdx, [rax * 8]

  ; Multiply (value)^order by the coefficient.
	mov	rax, [rbp - 40]
	add	rax, rdx
	mov	rdx, [rax]
	mov	rsi, rdx
	mov	rdi, [rbp - 8]
	call multiply_complex
	mov	[rbp - 8], rax

  ; Add the result to current values in the result contianer.
  movsd	xmm0, [rax]
	mov	rax, [rbp - 16]
	movsd	xmm1, [rax]
	addsd	xmm0, xmm1
	movsd	[rax], xmm0

  ; Do the imaginery part as well.
	add	rax, 8
	mov	rdx, [rbp - 16]
	add rdx, 8
	movsd	xmm1, [rdx]
	mov	rdx, [rbp - 8]
	add	rdx, 8
	movsd	xmm0, [rdx]
	addsd	xmm0, xmm1
	movsd	[rax], xmm0
  ; Clear used temperories.
	mov	rdi, [rbp - 8]
	call free

  ; index++
	add	word[rbp - 20], 1
.check_loop_condition:
  ; index > order ?
	mov	eax, [rbp - 20]
	cmp	eax, [rbp - 44]
	jle	.loop_start
  ; End loop, return result.
	mov	rax, [rbp - 16]
	leave
	ret



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

  ; ===== Divide complex ======
  divide_complex:
  ; Generic start
  push rbp
  mov rbp, rsp

  ; Increase stack size.
  sub rsp, 48

  ; Save rdi and rsi on stack and allocate memory for the new complex number.
  mov	[rbp-40], rdi
  mov	[rbp-48], rsi
  mov	rdi, 16
  call	malloc

  ; Get complex2 to rax, and use the invert_complex function.
  mov	[rbp-24], rax
  mov	rax, [rbp-48]
  mov	rdi, rax
  call	invert_complex

  ; rax - get complex1 and put it in rdi
  ; rdx - get the result from invert_complex fun and put it in rsi
  mov	[rbp-16], rax
  mov	rdx ,[rbp-16]
  mov	rax, [rbp-40]
  mov	rsi, rdx
  mov	rdi, rax
  call	multiply_complex


  mov	[rbp-24], rax
  ; xmm1 get complex2 real part
  mov	rax, [rbp-48]
	movsd	xmm1, [rax]
  mulsd xmm1, xmm1
	; mov	rax, [rbp-24]
	; movsd	xmm0, [rax]
	; mulsd	xmm1, xmm0

  ; xmm1 get complex2 imaginery part
	mov	rax, [rbp-48]
	add	rax, 8
	movsd	xmm0, [rax]
	mulsd	xmm0, xmm0
  ; Add both values
	addsd	xmm0, xmm1
  ; Divide norma(sum above) from result(result of multiply_complex) real part
	movsd	[rbp-8], xmm0
	mov	rax, [rbp-24]
	movsd	xmm0, [rax]
	divsd	xmm0, [rbp-8]
  ; rax- result real number, rdx- result imaginery number
	mov	rax, [rbp-24]
	movsd	[rax], xmm0
	mov	rax, [rbp-24]
	add	rax, 8
	mov	rdx, [rbp-24]
	add	rdx, 8
	movsd	xmm0, [rdx]
  ; Divide norma from result imaginery part
  ; Update result
	divsd	xmm0, [rbp-8]
	movsd	[rax], xmm0
	mov	rax, [rbp-16]
	mov	rdi, rax
	call	free

  ; Return address of new number.
  mov	rax, [rbp-24]

  ; Reset rbp & rsp and return.
  leave
  ret

;=======Newton step ===========
  newton_step:
  ; Generic start
  push rbp
  mov rbp, rsp

  ; Increase stack size.
  sub rsp, 80

  ; Saves: rdi -coefficients, esi -order, rdx- current_value
  ; and allocate memory for the new complex number(result).
  	mov	[rbp-56], rdi
  	mov	[rbp-60], esi
  	mov	[rbp-72], rdx
  	mov	edi, 16
  	call	malloc
  	mov	[rbp-40], rax

  	mov	edx, [rbp-60]                  ; order
  	mov	rax, [rbp-56]                  ; coefficients
  	mov	esi, edx
  	mov	rdi, rax
  	call	calculate_derivative
  	mov	[rbp-32], rax                  ; derivative

  	mov	rdx, [rbp-72]                  ; current_value
  	mov	ecx, [rbp-60]                  ; order
  	mov	rax, [rbp-56]                  ; coefficients
  	mov	esi, ecx
  	mov	rdi, rax
  	call	apply_function
  	mov	[rbp-24], rax                  ; function value

  	mov	eax, [rbp-60]                  ; order
  	lea	ecx, [eax-1]                   ; order -1
  	mov	rdx, [rbp-72]                  ; current_value
  	mov	rax, [rbp-32]                  ; derivative
  	mov	esi, ecx
  	mov	rdi, rax
  	call	apply_function
  	mov	[rbp-16], rax                  ; derivative_value

  	mov	rdx, [rbp-16]                  ; derivative_value
  	mov	rax, [rbp-24]                  ; function_value
  	mov	rsi, rdx
  	mov	rdi, rax
  	call	divide_complex
  	mov	[rbp-8], rax                   ; divide_result

  	mov	rax, [rbp-24]
  	mov	rdi, rax
  	call	free
  	mov	rax, [rbp-16]
  	mov	rdi, rax
  	call	free

  	mov	rdx, [rbp-8]                   ; divide_result
  	mov	rax, [rbp-72]                  ; current_value
  	mov	rsi, rdx
  	mov	rdi, rax
  	call	subtract_complex
  	mov	[rbp-40], rax                  ; result

  	mov	rax, [rbp-8]
  	mov	rdi, rax
  	call	free

    ; Return address of result.
    mov	rax, [rbp-40]

    ; Reset rbp & rsp and return.
    leave
    ret

    calculate_derivative:
    .LFB5:

    	push	rbp
    	mov	rbp, rsp
    	push	rbx
    	sub	rsp, 40
    	mov	QWORD [rbp-40], rdi
    	mov	DWORD [rbp-44], esi
    	mov	eax, DWORD [rbp-44]
    	cdqe
    	sal	rax, 3
    	mov	rdi, rax
    	call	malloc
    	mov	QWORD [rbp-24], rax
    .LBB5:
    	mov	DWORD [rbp-28], 1
    	jmp	.L18
    .L19:
    	mov	eax, DWORD [rbp-28]
    	cdqe
    	sal	rax, 3
    	lea	rdx, [rax-8]
    	mov	rax, QWORD [rbp-24]
    	lea	rbx, [rdx+rax]
    	mov	edi, 16
    	call	malloc
    	mov	QWORD [rbx], rax
    	mov	eax, DWORD [rbp-28]
    	cdqe
    	sal	rax, 3
    	lea	rdx, [rax-8]
    	mov	rax, QWORD [rbp-24]
    	add	rax, rdx
    	mov	rax, QWORD [rax]
    	pxor	xmm0, xmm0
    	cvtsi2sd	xmm0, DWORD [rbp-28]
    	mov	edx, DWORD [rbp-28]
    	movsx	rdx, edx
    	lea	rcx, [0+rdx*8]
    	mov	rdx, QWORD [rbp-40]
    	add	rdx, rcx
    	mov	rdx, QWORD [rdx]
    	movsd	xmm1, QWORD [rdx]
    	mulsd	xmm0, xmm1
    	movsd	QWORD [rax], xmm0
    	mov	eax, DWORD [rbp-28]
    	cdqe
    	sal	rax, 3
    	lea	rdx, [rax-8]
    	mov	rax, QWORD [rbp-24]
    	add	rax, rdx
    	mov	rax, QWORD [rax]
    	add	rax, 8
    	pxor	xmm0, xmm0
    	cvtsi2sd	xmm0, DWORD [rbp-28]
    	mov	edx, DWORD [rbp-28]
    	movsx	rdx, edx
    	lea	rcx, [0+rdx*8]
    	mov	rdx, QWORD [rbp-40]
    	add	rdx, rcx
    	mov	rdx, QWORD [rdx]
    	add	rdx, 8
    	movsd	xmm1, QWORD [rdx]
    	mulsd	xmm0, xmm1
    	movsd	QWORD [rax], xmm0
    	add	DWORD [rbp-28], 1
    .L18:
    	mov	eax, DWORD [rbp-28]
    	cmp	eax, DWORD [rbp-44]
    	jle	.L19
    .LBE5:
    	mov	rax, QWORD [rbp-24]
    	add	rsp, 40
    	pop	rbx
    	pop	rbp
    	ret
