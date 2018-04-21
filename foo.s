	.file	"main.c"
	.text
.Ltext0:
	.section	.rodata
.LC1:
	.string	"epsilon = %lf\n"
.LC2:
	.string	"order = %i\n"
.LC3:
	.string	"%lf"
.LC4:
	.string	"coeff %d = %s %s\n"
.LC5:
	.string	"initial = %s %s\n"
.LC6:
	.string	"root = "
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.file 1 "main.c"
	.loc 1 23 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$296, %rsp
	.cfi_offset 3, -24
	.loc 1 23 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 25 0
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -288(%rbp)
	.loc 1 26 0
	movl	$0, -304(%rbp)
	.loc 1 30 0
	leaq	-288(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 33 0
	leaq	-304(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 37 0
	movl	-304(%rbp), %eax
	addl	$1, %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -264(%rbp)
.LBB2:
	.loc 1 38 0
	movl	$0, -300(%rbp)
	jmp	.L2
.L3:
	.loc 1 39 0 discriminator 3
	movl	-300(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-264(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	$16, %edi
	call	malloc
	movq	%rax, (%rbx)
	.loc 1 40 0 discriminator 3
	movl	-300(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-264(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 41 0 discriminator 3
	movl	-300(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-264(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	$8, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 38 0 discriminator 3
	addl	$1, -300(%rbp)
.L2:
	.loc 1 38 0 is_stmt 0 discriminator 1
	movl	-304(%rbp), %eax
	addl	$1, %eax
	cmpl	-300(%rbp), %eax
	jg	.L3
.LBE2:
.LBB3:
	.loc 1 45 0 is_stmt 1
	movl	-304(%rbp), %eax
	movl	%eax, -296(%rbp)
	jmp	.L4
.L5:
	.loc 1 46 0 discriminator 3
	movl	-296(%rbp), %edx
	leaq	-224(%rbp), %rax
	movl	$.LC3, %r8d
	movl	$.LC3, %ecx
	movl	$.LC4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 47 0 discriminator 3
	movl	-296(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-264(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	8(%rax), %rdx
	movl	-296(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-264(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rcx
	leaq	-224(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 45 0 discriminator 3
	subl	$1, -296(%rbp)
.L4:
	.loc 1 45 0 is_stmt 0 discriminator 1
	cmpl	$0, -296(%rbp)
	jns	.L5
.LBE3:
	.loc 1 55 0 is_stmt 1
	leaq	-224(%rbp), %rax
	movl	$.LC3, %ecx
	movl	$.LC3, %edx
	movl	$.LC5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 56 0
	leaq	-240(%rbp), %rax
	leaq	8(%rax), %rdx
	leaq	-240(%rbp), %rcx
	leaq	-224(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 58 0
	movl	$0, -292(%rbp)
	.loc 1 60 0
	leaq	-240(%rbp), %rax
	movq	%rax, -280(%rbp)
	.loc 1 61 0
	movl	-304(%rbp), %ecx
	movq	-280(%rbp), %rdx
	movq	-264(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	apply_function
	movq	%rax, -256(%rbp)
	.loc 1 62 0
	movq	-256(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	-256(%rbp), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-256(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm2
	movq	-256(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	call	sqrt
	movq	%xmm0, %rax
	movq	%rax, -272(%rbp)
	.loc 1 64 0
	jmp	.L6
.L9:
	.loc 1 65 0
	movq	-280(%rbp), %rax
	movq	%rax, -248(%rbp)
	.loc 1 66 0
	movl	-304(%rbp), %ecx
	movq	-248(%rbp), %rdx
	movq	-264(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	newton_step
	movq	%rax, -280(%rbp)
	.loc 1 67 0
	movl	-304(%rbp), %ecx
	movq	-280(%rbp), %rdx
	movq	-264(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	apply_function
	movq	%rax, -256(%rbp)
	.loc 1 68 0
	movq	-256(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	-256(%rbp), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-256(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm2
	movq	-256(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	call	sqrt
	movq	%xmm0, %rax
	movq	%rax, -272(%rbp)
	.loc 1 69 0
	addl	$1, -292(%rbp)
.L6:
	.loc 1 64 0
	movsd	-288(%rbp), %xmm1
	movsd	-272(%rbp), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.L7
	.loc 1 64 0 is_stmt 0 discriminator 1
	cmpl	$99, -292(%rbp)
	jle	.L9
.L7:
	.loc 1 73 0 is_stmt 1
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	.loc 1 74 0
	movq	-280(%rbp), %rax
	movq	%rax, %rdi
	call	print_complex
	.loc 1 76 0
	movl	$0, %eax
	.loc 1 77 0
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L11
	call	__stack_chk_fail
.L11:
	addq	$296, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
.LC7:
	.string	"(%lf + %lf) * x^%d"
	.text
	.globl	print_polynomial
	.type	print_polynomial, @function
print_polynomial:
.LFB3:
	.loc 1 82 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
.LBB4:
	.loc 1 83 0
	movl	$0, -4(%rbp)
	jmp	.L14
.L15:
	.loc 1 84 0 discriminator 3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movl	%edx, %esi
	movapd	%xmm0, %xmm1
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movl	$.LC7, %edi
	movl	$2, %eax
	call	printf
	.loc 1 83 0 discriminator 3
	addl	$1, -4(%rbp)
.L14:
	.loc 1 83 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jle	.L15
.LBE4:
	.loc 1 86 0 is_stmt 1
	movl	$10, %edi
	call	putchar
	.loc 1 87 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	print_polynomial, .-print_polynomial
	.section	.rodata
.LC8:
	.string	"%e %ei\n"
	.text
	.globl	print_complex
	.type	print_complex, @function
print_complex:
.LFB4:
	.loc 1 92 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 93 0
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	movl	$.LC8, %edi
	movl	$2, %eax
	call	printf
	.loc 1 94 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	print_complex, .-print_complex
	.globl	apply_function
	.type	apply_function, @function
apply_function:
.LFB5:
	.loc 1 99 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	%rdx, -56(%rbp)
	.loc 1 101 0
	movl	$16, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	.loc 1 102 0
	movq	-16(%rbp), %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 103 0
	movq	-16(%rbp), %rax
	addq	$8, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
.LBB5:
	.loc 1 104 0
	movl	$0, -20(%rbp)
	jmp	.L18
.L19:
.LBB6:
	.loc 1 106 0 discriminator 3
	movl	-20(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	power_complex
	movq	%rax, -8(%rbp)
	.loc 1 107 0 discriminator 3
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	multiply_complex
	movq	%rax, -8(%rbp)
	.loc 1 109 0 discriminator 3
	movq	-16(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 110 0 discriminator 3
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	-16(%rbp), %rdx
	addq	$8, %rdx
	movsd	(%rdx), %xmm1
	movq	-8(%rbp), %rdx
	addq	$8, %rdx
	movsd	(%rdx), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 112 0 discriminator 3
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
.LBE6:
	.loc 1 104 0 discriminator 3
	addl	$1, -20(%rbp)
.L18:
	.loc 1 104 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jle	.L19
.LBE5:
	.loc 1 115 0 is_stmt 1
	movq	-16(%rbp), %rax
	.loc 1 116 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	apply_function, .-apply_function
	.globl	multiply_complex
	.type	multiply_complex, @function
multiply_complex:
.LFB6:
	.loc 1 121 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 122 0
	movl	$16, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	.loc 1 123 0
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm2
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 124 0
	movq	-8(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm2
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx)
	.loc 1 125 0
	movq	-8(%rbp), %rax
	.loc 1 126 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	multiply_complex, .-multiply_complex
	.globl	power_complex
	.type	power_complex, @function
power_complex:
.LFB7:
	.loc 1 131 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	.loc 1 133 0
	movl	$16, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	.loc 1 135 0
	cmpl	$0, -28(%rbp)
	jg	.L24
	.loc 1 137 0
	movq	-16(%rbp), %rax
	movsd	.LC9(%rip), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 138 0
	movq	-16(%rbp), %rax
	addq	$8, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 139 0
	movq	-16(%rbp), %rax
	jmp	.L25
.L24:
	.loc 1 142 0
	cmpl	$1, -28(%rbp)
	jne	.L26
	.loc 1 143 0
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-16(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 144 0
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movsd	8(%rax), %xmm0
	movsd	%xmm0, (%rdx)
	.loc 1 145 0
	movq	-16(%rbp), %rax
	jmp	.L25
.L26:
	.loc 1 149 0
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 150 0
	movl	-28(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	power_complex
	movq	%rax, -8(%rbp)
	.loc 1 151 0
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	multiply_complex
	movq	%rax, -16(%rbp)
	.loc 1 154 0
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 155 0
	movq	-16(%rbp), %rax
.L25:
	.loc 1 156 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	power_complex, .-power_complex
	.globl	calculate_derivative
	.type	calculate_derivative, @function
calculate_derivative:
.LFB8:
	.loc 1 162 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	.loc 1 163 0
	movl	-44(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -24(%rbp)
.LBB7:
	.loc 1 164 0
	movl	$1, -28(%rbp)
	jmp	.L28
.L29:
	.loc 1 165 0 discriminator 3
	movl	-28(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	$16, %edi
	call	malloc
	movq	%rax, (%rbx)
	.loc 1 166 0 discriminator 3
	movl	-28(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sd	-28(%rbp), %xmm0
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movsd	(%rdx), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 167 0 discriminator 3
	movl	-28(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	$8, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sd	-28(%rbp), %xmm0
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	addq	$8, %rdx
	movsd	(%rdx), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 164 0 discriminator 3
	addl	$1, -28(%rbp)
.L28:
	.loc 1 164 0 is_stmt 0 discriminator 1
	movl	-28(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jle	.L29
.LBE7:
	.loc 1 169 0 is_stmt 1
	movq	-24(%rbp), %rax
	.loc 1 170 0
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	calculate_derivative, .-calculate_derivative
	.globl	divide_complex
	.type	divide_complex, @function
divide_complex:
.LFB9:
	.loc 1 175 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 176 0
	movl	$16, %edi
	call	malloc
	movq	%rax, -24(%rbp)
	.loc 1 178 0
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	invert_complex
	movq	%rax, -16(%rbp)
	.loc 1 179 0
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	print_complex
	.loc 1 181 0
	movq	-16(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	multiply_complex
	movq	%rax, -24(%rbp)
	.loc 1 182 0
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movsd	.LC10(%rip), %xmm0
	movapd	%xmm0, %xmm1
	movq	%rax, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	call	pow
	movsd	%xmm0, -56(%rbp)
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	.LC11(%rip), %xmm1
	call	powf
	cvtss2sd	%xmm0, %xmm0
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	.loc 1 185 0
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm0
	divsd	-8(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 186 0
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	-24(%rbp), %rdx
	addq	$8, %rdx
	movsd	(%rdx), %xmm0
	divsd	-8(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 189 0
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 190 0
	movq	-24(%rbp), %rax
	.loc 1 191 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	divide_complex, .-divide_complex
	.globl	add_complex
	.type	add_complex, @function
add_complex:
.LFB10:
	.loc 1 196 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 197 0
	movl	$16, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	.loc 1 198 0
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 199 0
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	-24(%rbp), %rdx
	addq	$8, %rdx
	movsd	(%rdx), %xmm1
	movq	-32(%rbp), %rdx
	addq	$8, %rdx
	movsd	(%rdx), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 200 0
	movq	-8(%rbp), %rax
	.loc 1 201 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	add_complex, .-add_complex
	.globl	subtract_complex
	.type	subtract_complex, @function
subtract_complex:
.LFB11:
	.loc 1 206 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 212 0
	movl	$16, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	.loc 1 213 0
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 214 0
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	-24(%rbp), %rdx
	addq	$8, %rdx
	movsd	(%rdx), %xmm0
	movq	-32(%rbp), %rdx
	addq	$8, %rdx
	movsd	(%rdx), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 219 0
	movq	-8(%rbp), %rax
	.loc 1 220 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	subtract_complex, .-subtract_complex
	.globl	newton_step
	.type	newton_step, @function
newton_step:
.LFB12:
	.loc 1 237 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movq	%rdx, -72(%rbp)
	.loc 1 238 0
	movl	$16, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	.loc 1 241 0
	movl	-60(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	calculate_derivative
	movq	%rax, -32(%rbp)
	.loc 1 243 0
	movq	-72(%rbp), %rdx
	movl	-60(%rbp), %ecx
	movq	-56(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	apply_function
	movq	%rax, -24(%rbp)
	.loc 1 244 0
	movl	-60(%rbp), %eax
	leal	-1(%rax), %ecx
	movq	-72(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	apply_function
	movq	%rax, -16(%rbp)
	.loc 1 246 0
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	divide_complex
	movq	%rax, -8(%rbp)
	.loc 1 249 0
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 250 0
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 253 0
	movq	-8(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	subtract_complex
	movq	%rax, -40(%rbp)
	.loc 1 254 0
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 256 0
	movq	-40(%rbp), %rax
	.loc 1 257 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	newton_step, .-newton_step
	.section	.rodata
	.align 8
.LC9:
	.long	0
	.long	1072693248
	.align 8
.LC10:
	.long	0
	.long	1073741824
	.align 4
.LC11:
	.long	1073741824
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x57a
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF53
	.byte	0xc
	.long	.LASF54
	.long	.LASF55
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF12
	.uleb128 0x4
	.long	.LASF29
	.byte	0x1
	.byte	0x17
	.long	0x57
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x18d
	.uleb128 0x5
	.long	.LASF13
	.byte	0x1
	.byte	0x19
	.long	0x88
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x5
	.long	.LASF14
	.byte	0x1
	.byte	0x1a
	.long	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x5
	.long	.LASF15
	.byte	0x1
	.byte	0x1b
	.long	0x18d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x5
	.long	.LASF16
	.byte	0x1
	.byte	0x25
	.long	0x19d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0x5
	.long	.LASF17
	.byte	0x1
	.byte	0x2c
	.long	0x1a9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x5
	.long	.LASF18
	.byte	0x1
	.byte	0x3a
	.long	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -308
	.uleb128 0x5
	.long	.LASF19
	.byte	0x1
	.byte	0x3b
	.long	0x1a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x5
	.long	.LASF20
	.byte	0x1
	.byte	0x3c
	.long	0x1a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.uleb128 0x5
	.long	.LASF21
	.byte	0x1
	.byte	0x3d
	.long	0x1a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x5
	.long	.LASF22
	.byte	0x1
	.byte	0x3e
	.long	0x88
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x6
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x16b
	.uleb128 0x5
	.long	.LASF23
	.byte	0x1
	.byte	0x26
	.long	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -316
	.byte	0
	.uleb128 0x7
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x5
	.long	.LASF24
	.byte	0x1
	.byte	0x2d
	.long	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.byte	0
	.byte	0
	.uleb128 0x8
	.long	0x88
	.long	0x19d
	.uleb128 0x9
	.long	0x65
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x1a3
	.uleb128 0xa
	.byte	0x8
	.long	0x88
	.uleb128 0x8
	.long	0x6c
	.long	0x1b9
	.uleb128 0x9
	.long	0x65
	.byte	0xc7
	.byte	0
	.uleb128 0xb
	.long	.LASF26
	.byte	0x1
	.byte	0x52
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x213
	.uleb128 0xc
	.long	.LASF16
	.byte	0x1
	.byte	0x52
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF14
	.byte	0x1
	.byte	0x52
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x7
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x5
	.long	.LASF25
	.byte	0x1
	.byte	0x53
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LASF27
	.byte	0x1
	.byte	0x5c
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x23f
	.uleb128 0xc
	.long	.LASF28
	.byte	0x1
	.byte	0x5c
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x4
	.long	.LASF30
	.byte	0x1
	.byte	0x63
	.long	0x1a3
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x2da
	.uleb128 0xc
	.long	.LASF16
	.byte	0x1
	.byte	0x63
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.long	.LASF14
	.byte	0x1
	.byte	0x63
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xc
	.long	.LASF31
	.byte	0x1
	.byte	0x63
	.long	0x1a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x5
	.long	.LASF32
	.byte	0x1
	.byte	0x65
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x7
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x5
	.long	.LASF33
	.byte	0x1
	.byte	0x68
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x7
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x5
	.long	.LASF34
	.byte	0x1
	.byte	0x6a
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF35
	.byte	0x1
	.byte	0x79
	.long	0x1a3
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x326
	.uleb128 0xc
	.long	.LASF36
	.byte	0x1
	.byte	0x79
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF37
	.byte	0x1
	.byte	0x79
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.long	.LASF32
	.byte	0x1
	.byte	0x7a
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x4
	.long	.LASF38
	.byte	0x1
	.byte	0x83
	.long	0x1a3
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x380
	.uleb128 0xc
	.long	.LASF28
	.byte	0x1
	.byte	0x83
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF39
	.byte	0x1
	.byte	0x83
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x5
	.long	.LASF32
	.byte	0x1
	.byte	0x85
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.long	.LASF40
	.byte	0x1
	.byte	0x96
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x4
	.long	.LASF41
	.byte	0x1
	.byte	0xa2
	.long	0x19d
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x3ec
	.uleb128 0xc
	.long	.LASF42
	.byte	0x1
	.byte	0xa2
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.long	.LASF14
	.byte	0x1
	.byte	0xa2
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x5
	.long	.LASF43
	.byte	0x1
	.byte	0xa3
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x5
	.long	.LASF33
	.byte	0x1
	.byte	0xa4
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF44
	.byte	0x1
	.byte	0xaf
	.long	0x1a3
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x454
	.uleb128 0xc
	.long	.LASF36
	.byte	0x1
	.byte	0xaf
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.long	.LASF37
	.byte	0x1
	.byte	0xaf
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x5
	.long	.LASF32
	.byte	0x1
	.byte	0xb0
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.long	.LASF45
	.byte	0x1
	.byte	0xb2
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.long	.LASF46
	.byte	0x1
	.byte	0xb6
	.long	0x88
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x4
	.long	.LASF47
	.byte	0x1
	.byte	0xc4
	.long	0x1a3
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x4a0
	.uleb128 0xc
	.long	.LASF36
	.byte	0x1
	.byte	0xc4
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF37
	.byte	0x1
	.byte	0xc4
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.long	.LASF32
	.byte	0x1
	.byte	0xc5
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x4
	.long	.LASF48
	.byte	0x1
	.byte	0xce
	.long	0x1a3
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x4ec
	.uleb128 0xc
	.long	.LASF36
	.byte	0x1
	.byte	0xce
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF37
	.byte	0x1
	.byte	0xce
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.long	.LASF32
	.byte	0x1
	.byte	0xd4
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xd
	.long	.LASF49
	.byte	0x1
	.byte	0xed
	.long	0x1a3
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.long	.LASF16
	.byte	0x1
	.byte	0xed
	.long	0x19d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xc
	.long	.LASF14
	.byte	0x1
	.byte	0xed
	.long	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0xc
	.long	.LASF21
	.byte	0x1
	.byte	0xed
	.long	0x1a3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x5
	.long	.LASF32
	.byte	0x1
	.byte	0xee
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x5
	.long	.LASF43
	.byte	0x1
	.byte	0xf1
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.long	.LASF50
	.byte	0x1
	.byte	0xf3
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.long	.LASF51
	.byte	0x1
	.byte	0xf4
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.long	.LASF52
	.byte	0x1
	.byte	0xf6
	.long	0x1a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF49:
	.string	"newton_step"
.LASF27:
	.string	"print_complex"
.LASF14:
	.string	"order"
.LASF38:
	.string	"power_complex"
.LASF36:
	.string	"complex1"
.LASF37:
	.string	"complex2"
.LASF32:
	.string	"result"
.LASF46:
	.string	"norma"
.LASF11:
	.string	"float"
.LASF31:
	.string	"value"
.LASF47:
	.string	"add_complex"
.LASF34:
	.string	"step"
.LASF17:
	.string	"acceptString"
.LASF18:
	.string	"runs"
.LASF39:
	.string	"power"
.LASF22:
	.string	"distance"
.LASF48:
	.string	"subtract_complex"
.LASF55:
	.string	"/media/sf_Studies/Archi 2"
.LASF1:
	.string	"unsigned char"
.LASF44:
	.string	"divide_complex"
.LASF15:
	.string	"initial"
.LASF0:
	.string	"long unsigned int"
.LASF2:
	.string	"short unsigned int"
.LASF28:
	.string	"complex"
.LASF43:
	.string	"derivative"
.LASF35:
	.string	"multiply_complex"
.LASF12:
	.string	"double"
.LASF53:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fno-omit-frame-pointer -fstack-protector-strong"
.LASF26:
	.string	"print_polynomial"
.LASF29:
	.string	"main"
.LASF45:
	.string	"inverted_denominator"
.LASF21:
	.string	"current_value"
.LASF3:
	.string	"unsigned int"
.LASF13:
	.string	"epsilon"
.LASF52:
	.string	"divide_result"
.LASF10:
	.string	"long long unsigned int"
.LASF40:
	.string	"recursive_result"
.LASF51:
	.string	"derivative_value"
.LASF25:
	.string	"printIndex"
.LASF23:
	.string	"initIndex"
.LASF7:
	.string	"sizetype"
.LASF30:
	.string	"apply_function"
.LASF9:
	.string	"long long int"
.LASF54:
	.string	"main.c"
.LASF8:
	.string	"char"
.LASF42:
	.string	"coefficient"
.LASF33:
	.string	"index"
.LASF5:
	.string	"short int"
.LASF20:
	.string	"current"
.LASF16:
	.string	"coefficients"
.LASF6:
	.string	"long int"
.LASF24:
	.string	"coefficientindex"
.LASF50:
	.string	"function_value"
.LASF4:
	.string	"signed char"
.LASF41:
	.string	"calculate_derivative"
.LASF19:
	.string	"last"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
