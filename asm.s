calculate_derivative:
; Generic start
push rbp
mov rbp, rsp

push rbx
; Increase stack size.
sub rsp, 40

mov [rbp-40], rdi               ; coefficients
mov [rbp-44], esi               ; order
mov	eax, [rbp-44]
sal	rax, 3
mov	rdi, rax
call	malloc
mov [rbp-24], rax               ; derivative

; loop start with index=1
mov	DWORD [rbp-28], 1           ; index
jmp	.L1

.L2:

;
  mov	eax, [rbp-28]
  sal	rax, 3
  lea	rdx, [rax-8]
  mov	rax, [rbp-24]
  lea	rbx, [rdx+rax]           ; placed in index - 1
  mov	edi, 16                  ; sizeof double * 2
  call	malloc
  mov [rbx], rax

  mov	eax, [rbp-28]           ; index
  cdqe
  sal	rax, 3
  lea	rdx, [rax-8]
  mov	rax, [rbp-24]
  add	rax, rdx
  mov	rax, [rax]
  pxor	xmm0, xmm0
  cvtsi2sd	xmm0, [rbp-28]
  mov	edx, [rbp-28]
  movsx	rdx, edx
  lea	rcx, [0+rdx*8]
  mov	rdx, [rbp-40]
  add	rdx, rcx
  mov	rdx, [rdx]
  movsd	xmm1, [rdx]
  mulsd	xmm0, xmm1
  movsd	[rax], xmm0
  mov	eax, [rbp-28]
  cdqe
  sal	rax, 3
  lea	rdx, [rax-8]
  mov	rax, [rbp-24]
  add	rax, rdx
  mov	rax, [rax]
  add	rax, 8
  pxor	xmm0, xmm0
  cvtsi2sd	xmm0,  [rbp-28]
  mov	edx,  [rbp-28]
  movsx	rdx, edx
  lea	rcx, [0+rdx*8]
  mov	rdx, [rbp-40]
  add	rdx, rcx
  mov	rdx, [rdx]
  add	rdx, 8
  movsd	xmm1, [rdx]
  mulsd	xmm0, xmm1
  movsd [rax], xmm0
  add	DWORD [rbp-28], 1

.L1:
; oder must be bigger \ eaqual to index.
; if so, move to .L2
  mov	eax,  [rbp-28]
  cmp	eax,  [rbp-44]
  jle	.L1

; return derivative
  mov	rax, [rbp-24]
  add	rsp, 40

  ; Pop used registers and return.
  pop	rbx
  pop	rbp

  ret
