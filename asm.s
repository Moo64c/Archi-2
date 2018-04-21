; ===== Divide complex ======
divide_complex:
; Generic start
push rbp
mov rbp, rsp

; Increase stack size.
sub rsp, 64

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

mov	[rbp-16], rax
mov	rdx ,[rbp-16]
mov	rax, [rbp-40]
mov	rsi, rdx
mov	rdi, rax
call	multiply_complex

mov	[rbp-24], rax
mov	rax, [rbp-48]
mov	rax, [rax]
movsd	.LC9(%rip), %xmm0
movapd	%xmm0, %xmm1
mov		[rbp-56], rax
movsd	xmm0, [rbp-56]
call	pow
movsd	[rbp-56], xmm0
mov	rax, [rbp-48]
add	rax, 8
