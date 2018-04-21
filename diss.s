	.file	"main.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.section	.rodata
.LC1:
	.string	"epsilon = %lf\n"
.LC2:
	.string	"order = %i\n"
.LC3:
	.string	"coeff %d"
.LC4:
	.string	" = %lf %lf\n"
.LC5:
	.string	"initial = %lf %lf\n"
.LC6:
	.string	"root = %e %ei\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.file 1 "main.c"
	.loc 1 25 0
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 152
	.cfi_offset 3, -24
	.loc 1 27 0
	pxor	xmm0, xmm0
	movsd	QWORD PTR [rbp-96], xmm0
	.loc 1 28 0
	mov	DWORD PTR [rbp-100], 0
	.loc 1 32 0
	lea	rax, [rbp-96]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC1
	mov	eax, 0
	call	__isoc99_scanf
	.loc 1 35 0
	lea	rax, [rbp-100]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC2
	mov	eax, 0
	call	__isoc99_scanf
	.loc 1 39 0
	mov	eax, DWORD PTR [rbp-100]
	add	eax, 1
	cdqe
	sal	rax, 3
	mov	rdi, rax
	call	malloc
	mov	QWORD PTR [rbp-56], rax
.LBB2:
	.loc 1 40 0
	mov	DWORD PTR [rbp-20], 0
	jmp	.L2
.L3:
	.loc 1 41 0 discriminator 3
	mov	eax, DWORD PTR [rbp-20]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-56]
	lea	rbx, [rdx+rax]
	mov	edi, 16
	call	malloc
	mov	QWORD PTR [rbx], rax
	.loc 1 42 0 discriminator 3
	mov	eax, DWORD PTR [rbp-20]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-56]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	pxor	xmm0, xmm0
	movsd	QWORD PTR [rax], xmm0
	.loc 1 43 0 discriminator 3
	mov	eax, DWORD PTR [rbp-20]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-56]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	add	rax, 8
	pxor	xmm0, xmm0
	movsd	QWORD PTR [rax], xmm0
	.loc 1 40 0 discriminator 3
	add	DWORD PTR [rbp-20], 1
.L2:
	.loc 1 40 0 is_stmt 0 discriminator 1
	mov	eax, DWORD PTR [rbp-100]
	add	eax, 1
	cmp	eax, DWORD PTR [rbp-20]
	jg	.L3
.LBE2:
	.loc 1 46 0 is_stmt 1
	mov	QWORD PTR [rbp-64], OFFSET FLAT:.LC3
	.loc 1 47 0
	mov	QWORD PTR [rbp-72], OFFSET FLAT:.LC4
	.loc 1 48 0
	mov	DWORD PTR [rbp-132], 0
.LBB3:
	.loc 1 49 0
	mov	eax, DWORD PTR [rbp-100]
	mov	DWORD PTR [rbp-24], eax
	jmp	.L4
.L5:
	.loc 1 50 0 discriminator 3
	lea	rdx, [rbp-132]
	mov	rax, QWORD PTR [rbp-64]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf
	.loc 1 51 0 discriminator 3
	mov	eax, DWORD PTR [rbp-132]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-56]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, [rax+8]
	mov	eax, DWORD PTR [rbp-132]
	cdqe
	lea	rcx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-56]
	add	rax, rcx
	mov	rcx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-72]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf
	.loc 1 49 0 discriminator 3
	sub	DWORD PTR [rbp-24], 1
.L4:
	.loc 1 49 0 is_stmt 0 discriminator 1
	cmp	DWORD PTR [rbp-24], 0
	jns	.L5
.LBE3:
	.loc 1 54 0 is_stmt 1
	mov	QWORD PTR [rbp-64], OFFSET FLAT:.LC5
	.loc 1 55 0
	lea	rax, [rbp-128]
	lea	rdx, [rax+8]
	lea	rcx, [rbp-128]
	mov	rax, QWORD PTR [rbp-64]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf
	.loc 1 57 0
	mov	DWORD PTR [rbp-28], 0
	.loc 1 59 0
	lea	rax, [rbp-128]
	mov	QWORD PTR [rbp-40], rax
	.loc 1 60 0
	mov	ecx, DWORD PTR [rbp-100]
	mov	rdx, QWORD PTR [rbp-40]
	mov	rax, QWORD PTR [rbp-56]
	mov	esi, ecx
	mov	rdi, rax
	call	apply_function
	mov	QWORD PTR [rbp-80], rax
	.loc 1 61 0
	mov	rax, QWORD PTR [rbp-80]
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-80]
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm1, xmm0
	mov	rax, QWORD PTR [rbp-80]
	add	rax, 8
	movsd	xmm2, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-80]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	QWORD PTR [rbp-48], xmm0
	.loc 1 63 0
	jmp	.L6
.L9:
	.loc 1 64 0
	mov	rax, QWORD PTR [rbp-40]
	mov	QWORD PTR [rbp-88], rax
	.loc 1 65 0
	mov	ecx, DWORD PTR [rbp-100]
	mov	rdx, QWORD PTR [rbp-88]
	mov	rax, QWORD PTR [rbp-56]
	mov	esi, ecx
	mov	rdi, rax
	call	newton_step
	mov	QWORD PTR [rbp-40], rax
	.loc 1 66 0
	mov	ecx, DWORD PTR [rbp-100]
	mov	rdx, QWORD PTR [rbp-40]
	mov	rax, QWORD PTR [rbp-56]
	mov	esi, ecx
	mov	rdi, rax
	call	apply_function
	mov	QWORD PTR [rbp-80], rax
	.loc 1 67 0
	mov	rax, QWORD PTR [rbp-80]
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-80]
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm1, xmm0
	mov	rax, QWORD PTR [rbp-80]
	add	rax, 8
	movsd	xmm2, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-80]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	QWORD PTR [rbp-48], xmm0
	.loc 1 68 0
	add	DWORD PTR [rbp-28], 1
.L6:
	.loc 1 63 0
	movsd	xmm1, QWORD PTR [rbp-96]
	movsd	xmm0, QWORD PTR [rbp-96]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR [rbp-48]
	ucomisd	xmm1, xmm0
	jbe	.L7
	.loc 1 63 0 is_stmt 0 discriminator 1
	cmp	DWORD PTR [rbp-28], 99
	jle	.L9
.L7:
	.loc 1 72 0 is_stmt 1
	mov	rax, QWORD PTR [rbp-40]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-40]
	mov	rax, QWORD PTR [rax]
	movapd	xmm1, xmm0
	mov	QWORD PTR [rbp-152], rax
	movsd	xmm0, QWORD PTR [rbp-152]
	mov	edi, OFFSET FLAT:.LC6
	mov	eax, 2
	call	printf
	.loc 1 74 0
	mov	eax, 0
	.loc 1 75 0
	add	rsp, 152
	pop	rbx
	pop	rbp
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
	.loc 1 80 0
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR [rbp-24], rdi
	mov	DWORD PTR [rbp-28], esi
.LBB4:
	.loc 1 81 0
	mov	DWORD PTR [rbp-4], 0
	jmp	.L13
.L14:
	.loc 1 82 0 discriminator 3
	mov	eax, DWORD PTR [rbp-4]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-24]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	mov	eax, DWORD PTR [rbp-4]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-24]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rbp-4]
	mov	esi, edx
	movapd	xmm1, xmm0
	mov	QWORD PTR [rbp-40], rax
	movsd	xmm0, QWORD PTR [rbp-40]
	mov	edi, OFFSET FLAT:.LC7
	mov	eax, 2
	call	printf
	.loc 1 81 0 discriminator 3
	add	DWORD PTR [rbp-4], 1
.L13:
	.loc 1 81 0 is_stmt 0 discriminator 1
	mov	eax, DWORD PTR [rbp-4]
	cmp	eax, DWORD PTR [rbp-28]
	jle	.L14
.LBE4:
	.loc 1 84 0 is_stmt 1
	mov	edi, 10
	call	putchar
	.loc 1 85 0
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
	.loc 1 90 0
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR [rbp-8], rdi
	.loc 1 91 0
	mov	rax, QWORD PTR [rbp-8]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-8]
	mov	rax, QWORD PTR [rax]
	movapd	xmm1, xmm0
	mov	QWORD PTR [rbp-16], rax
	movsd	xmm0, QWORD PTR [rbp-16]
	mov	edi, OFFSET FLAT:.LC8
	mov	eax, 2
	call	printf
	.loc 1 92 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	print_complex, .-print_complex
	.globl	calculate_derivative
	.type	calculate_derivative, @function
calculate_derivative:
.LFB5:
	.loc 1 97 0
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 40
	.cfi_offset 3, -24
	mov	QWORD PTR [rbp-40], rdi
	mov	DWORD PTR [rbp-44], esi
	.loc 1 98 0
	mov	eax, DWORD PTR [rbp-44]
	cdqe
	sal	rax, 3
	mov	rdi, rax
	call	malloc
	mov	QWORD PTR [rbp-32], rax
.LBB5:
	.loc 1 99 0
	mov	DWORD PTR [rbp-20], 1
	jmp	.L17
.L18:
	.loc 1 100 0 discriminator 3
	mov	eax, DWORD PTR [rbp-20]
	cdqe
	sal	rax, 3
	lea	rdx, [rax-8]
	mov	rax, QWORD PTR [rbp-32]
	lea	rbx, [rdx+rax]
	mov	edi, 16
	call	malloc
	mov	QWORD PTR [rbx], rax
	.loc 1 101 0 discriminator 3
	mov	eax, DWORD PTR [rbp-20]
	cdqe
	sal	rax, 3
	lea	rdx, [rax-8]
	mov	rax, QWORD PTR [rbp-32]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR [rbp-20]
	mov	edx, DWORD PTR [rbp-20]
	movsx	rdx, edx
	lea	rcx, [0+rdx*8]
	mov	rdx, QWORD PTR [rbp-40]
	add	rdx, rcx
	mov	rdx, QWORD PTR [rdx]
	movsd	xmm1, QWORD PTR [rdx]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR [rax], xmm0
	.loc 1 102 0 discriminator 3
	mov	eax, DWORD PTR [rbp-20]
	cdqe
	sal	rax, 3
	lea	rdx, [rax-8]
	mov	rax, QWORD PTR [rbp-32]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	add	rax, 8
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR [rbp-20]
	mov	edx, DWORD PTR [rbp-20]
	movsx	rdx, edx
	lea	rcx, [0+rdx*8]
	mov	rdx, QWORD PTR [rbp-40]
	add	rdx, rcx
	mov	rdx, QWORD PTR [rdx]
	add	rdx, 8
	movsd	xmm1, QWORD PTR [rdx]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR [rax], xmm0
	.loc 1 99 0 discriminator 3
	add	DWORD PTR [rbp-20], 1
.L17:
	.loc 1 99 0 is_stmt 0 discriminator 1
	mov	eax, DWORD PTR [rbp-20]
	cmp	eax, DWORD PTR [rbp-44]
	jle	.L18
.LBE5:
	.loc 1 104 0 is_stmt 1
	mov	rax, QWORD PTR [rbp-32]
	.loc 1 105 0
	add	rsp, 40
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	calculate_derivative, .-calculate_derivative
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2b3
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF34
	.byte	0xc
	.long	.LASF35
	.long	.LASF36
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
	.uleb128 0x4
	.byte	0x8
	.long	0x72
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
	.uleb128 0x5
	.long	.LASF37
	.byte	0x1
	.byte	0x19
	.long	0x57
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ac
	.uleb128 0x6
	.long	.LASF13
	.byte	0x1
	.byte	0x1b
	.long	0x8e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x6
	.long	.LASF14
	.byte	0x1
	.byte	0x1c
	.long	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x6
	.long	.LASF15
	.byte	0x1
	.byte	0x1d
	.long	0x1ac
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x6
	.long	.LASF16
	.byte	0x1
	.byte	0x27
	.long	0x1bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x6
	.long	.LASF17
	.byte	0x1
	.byte	0x2e
	.long	0x6c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x6
	.long	.LASF18
	.byte	0x1
	.byte	0x2f
	.long	0x6c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x6
	.long	.LASF19
	.byte	0x1
	.byte	0x30
	.long	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0x6
	.long	.LASF20
	.byte	0x1
	.byte	0x39
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x6
	.long	.LASF21
	.byte	0x1
	.byte	0x3a
	.long	0x1c2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x6
	.long	.LASF22
	.byte	0x1
	.byte	0x3b
	.long	0x1c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x6
	.long	.LASF23
	.byte	0x1
	.byte	0x3c
	.long	0x1c2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x6
	.long	.LASF24
	.byte	0x1
	.byte	0x3d
	.long	0x8e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x7
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x18b
	.uleb128 0x6
	.long	.LASF25
	.byte	0x1
	.byte	0x28
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x8
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x6
	.long	.LASF26
	.byte	0x1
	.byte	0x31
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x8e
	.long	0x1bc
	.uleb128 0xa
	.long	0x65
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x1c2
	.uleb128 0x4
	.byte	0x8
	.long	0x8e
	.uleb128 0xb
	.long	.LASF28
	.byte	0x1
	.byte	0x50
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x222
	.uleb128 0xc
	.long	.LASF16
	.byte	0x1
	.byte	0x50
	.long	0x1bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF14
	.byte	0x1
	.byte	0x50
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x8
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x6
	.long	.LASF27
	.byte	0x1
	.byte	0x51
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LASF29
	.byte	0x1
	.byte	0x5a
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x24e
	.uleb128 0xc
	.long	.LASF30
	.byte	0x1
	.byte	0x5a
	.long	0x1c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xd
	.long	.LASF31
	.byte	0x1
	.byte	0x61
	.long	0x1bc
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.long	.LASF19
	.byte	0x1
	.byte	0x61
	.long	0x1bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.long	.LASF14
	.byte	0x1
	.byte	0x61
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x6
	.long	.LASF32
	.byte	0x1
	.byte	0x62
	.long	0x1bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x8
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x6
	.long	.LASF33
	.byte	0x1
	.byte	0x63
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
.LASF14:
	.string	"order"
.LASF20:
	.string	"runs"
.LASF34:
	.string	"GNU C11 5.4.0 20160609 -masm=intel -mtune=generic -march=x86-64 -g -fno-omit-frame-pointer -fno-stack-protector"
.LASF17:
	.string	"acceptString"
.LASF29:
	.string	"print_complex"
.LASF24:
	.string	"distance"
.LASF11:
	.string	"float"
.LASF36:
	.string	"/media/sf_Studies/Archi 2"
.LASF1:
	.string	"unsigned char"
.LASF15:
	.string	"initial"
.LASF0:
	.string	"long unsigned int"
.LASF2:
	.string	"short unsigned int"
.LASF30:
	.string	"complex"
.LASF32:
	.string	"derivative"
.LASF12:
	.string	"double"
.LASF37:
	.string	"main"
.LASF23:
	.string	"current_value"
.LASF3:
	.string	"unsigned int"
.LASF13:
	.string	"epsilon"
.LASF18:
	.string	"acceptString_part2"
.LASF10:
	.string	"long long unsigned int"
.LASF28:
	.string	"print_polynomial"
.LASF27:
	.string	"printIndex"
.LASF25:
	.string	"initIndex"
.LASF7:
	.string	"sizetype"
.LASF9:
	.string	"long long int"
.LASF35:
	.string	"main.c"
.LASF8:
	.string	"char"
.LASF19:
	.string	"coefficient"
.LASF33:
	.string	"index"
.LASF5:
	.string	"short int"
.LASF22:
	.string	"current"
.LASF16:
	.string	"coefficients"
.LASF6:
	.string	"long int"
.LASF26:
	.string	"coefficientindex"
.LASF4:
	.string	"signed char"
.LASF31:
	.string	"calculate_derivative"
.LASF21:
	.string	"last"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
