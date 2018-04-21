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
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 296
	.cfi_offset 3, -24
	.loc 1 23 0
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-24], rax
	xor	eax, eax
	.loc 1 25 0
	pxor	xmm0, xmm0
	movsd	QWORD PTR [rbp-288], xmm0
	.loc 1 26 0
	mov	DWORD PTR [rbp-304], 0
	.loc 1 30 0
	lea	rax, [rbp-288]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC1
	mov	eax, 0
	call	__isoc99_scanf
	.loc 1 33 0
	lea	rax, [rbp-304]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC2
	mov	eax, 0
	call	__isoc99_scanf
	.loc 1 37 0
	mov	eax, DWORD PTR [rbp-304]
	add	eax, 1
	cdqe
	sal	rax, 3
	mov	rdi, rax
	call	malloc
	mov	QWORD PTR [rbp-264], rax
.LBB2:
	.loc 1 38 0
	mov	DWORD PTR [rbp-300], 0
	jmp	.L2
.L3:
	.loc 1 39 0 discriminator 3
	mov	eax, DWORD PTR [rbp-300]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-264]
	lea	rbx, [rdx+rax]
	mov	edi, 16
	call	malloc
	mov	QWORD PTR [rbx], rax
	.loc 1 40 0 discriminator 3
	mov	eax, DWORD PTR [rbp-300]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-264]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	pxor	xmm0, xmm0
	movsd	QWORD PTR [rax], xmm0
	.loc 1 41 0 discriminator 3
	mov	eax, DWORD PTR [rbp-300]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-264]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	add	rax, 8
	pxor	xmm0, xmm0
	movsd	QWORD PTR [rax], xmm0
	.loc 1 38 0 discriminator 3
	add	DWORD PTR [rbp-300], 1
.L2:
	.loc 1 38 0 is_stmt 0 discriminator 1
	mov	eax, DWORD PTR [rbp-304]
	add	eax, 1
	cmp	eax, DWORD PTR [rbp-300]
	jg	.L3
.LBE2:
.LBB3:
	.loc 1 45 0 is_stmt 1
	mov	eax, DWORD PTR [rbp-304]
	mov	DWORD PTR [rbp-296], eax
	jmp	.L4
.L5:
	.loc 1 46 0 discriminator 3
	mov	edx, DWORD PTR [rbp-296]
	lea	rax, [rbp-224]
	mov	r8d, OFFSET FLAT:.LC3
	mov	ecx, OFFSET FLAT:.LC3
	mov	esi, OFFSET FLAT:.LC4
	mov	rdi, rax
	mov	eax, 0
	call	sprintf
	.loc 1 47 0 discriminator 3
	mov	eax, DWORD PTR [rbp-296]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-264]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, [rax+8]
	mov	eax, DWORD PTR [rbp-296]
	cdqe
	lea	rcx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-264]
	add	rax, rcx
	mov	rcx, QWORD PTR [rax]
	lea	rax, [rbp-224]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf
	.loc 1 45 0 discriminator 3
	sub	DWORD PTR [rbp-296], 1
.L4:
	.loc 1 45 0 is_stmt 0 discriminator 1
	cmp	DWORD PTR [rbp-296], 0
	jns	.L5
.LBE3:
	.loc 1 55 0 is_stmt 1
	lea	rax, [rbp-224]
	mov	ecx, OFFSET FLAT:.LC3
	mov	edx, OFFSET FLAT:.LC3
	mov	esi, OFFSET FLAT:.LC5
	mov	rdi, rax
	mov	eax, 0
	call	sprintf
	.loc 1 56 0
	lea	rax, [rbp-240]
	lea	rdx, [rax+8]
	lea	rcx, [rbp-240]
	lea	rax, [rbp-224]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf
	.loc 1 58 0
	mov	DWORD PTR [rbp-292], 0
	.loc 1 60 0
	lea	rax, [rbp-240]
	mov	QWORD PTR [rbp-280], rax
	.loc 1 61 0
	mov	ecx, DWORD PTR [rbp-304]
	mov	rdx, QWORD PTR [rbp-280]
	mov	rax, QWORD PTR [rbp-264]
	mov	esi, ecx
	mov	rdi, rax
	call	apply_function
	mov	QWORD PTR [rbp-256], rax
	.loc 1 62 0
	mov	rax, QWORD PTR [rbp-256]
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-256]
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm1, xmm0
	mov	rax, QWORD PTR [rbp-256]
	add	rax, 8
	movsd	xmm2, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-256]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	call	sqrt
	movq	rax, xmm0
	mov	QWORD PTR [rbp-272], rax
	.loc 1 64 0
	jmp	.L6
.L9:
	.loc 1 65 0
	mov	rax, QWORD PTR [rbp-280]
	mov	QWORD PTR [rbp-248], rax
	.loc 1 66 0
	mov	ecx, DWORD PTR [rbp-304]
	mov	rdx, QWORD PTR [rbp-248]
	mov	rax, QWORD PTR [rbp-264]
	mov	esi, ecx
	mov	rdi, rax
	call	newton_step
	mov	QWORD PTR [rbp-280], rax
	.loc 1 67 0
	mov	ecx, DWORD PTR [rbp-304]
	mov	rdx, QWORD PTR [rbp-280]
	mov	rax, QWORD PTR [rbp-264]
	mov	esi, ecx
	mov	rdi, rax
	call	apply_function
	mov	QWORD PTR [rbp-256], rax
	.loc 1 68 0
	mov	rax, QWORD PTR [rbp-256]
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-256]
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm1, xmm0
	mov	rax, QWORD PTR [rbp-256]
	add	rax, 8
	movsd	xmm2, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-256]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	call	sqrt
	movq	rax, xmm0
	mov	QWORD PTR [rbp-272], rax
	.loc 1 69 0
	add	DWORD PTR [rbp-292], 1
.L6:
	.loc 1 64 0
	movsd	xmm1, QWORD PTR [rbp-288]
	movsd	xmm0, QWORD PTR [rbp-272]
	ucomisd	xmm0, xmm1
	jbe	.L7
	.loc 1 64 0 is_stmt 0 discriminator 1
	cmp	DWORD PTR [rbp-292], 99
	jle	.L9
.L7:
	.loc 1 73 0 is_stmt 1
	mov	edi, OFFSET FLAT:.LC6
	mov	eax, 0
	call	printf
	.loc 1 74 0
	mov	rax, QWORD PTR [rbp-280]
	mov	rdi, rax
	call	print_complex
	.loc 1 76 0
	mov	eax, 0
	.loc 1 77 0
	mov	rbx, QWORD PTR [rbp-24]
	xor	rbx, QWORD PTR fs:40
	je	.L11
	call	__stack_chk_fail
.L11:
	add	rsp, 296
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
	.loc 1 82 0
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
	.loc 1 83 0
	mov	DWORD PTR [rbp-4], 0
	jmp	.L14
.L15:
	.loc 1 84 0 discriminator 3
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
	.loc 1 83 0 discriminator 3
	add	DWORD PTR [rbp-4], 1
.L14:
	.loc 1 83 0 is_stmt 0 discriminator 1
	mov	eax, DWORD PTR [rbp-4]
	cmp	eax, DWORD PTR [rbp-28]
	jle	.L15
.LBE4:
	.loc 1 86 0 is_stmt 1
	mov	edi, 10
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
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR [rbp-8], rdi
	.loc 1 93 0
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
	.loc 1 94 0
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
	.loc 1 121 0
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
	.loc 1 122 0
	mov	eax, DWORD PTR [rbp-44]
	cdqe
	sal	rax, 3
	mov	rdi, rax
	call	malloc
	mov	QWORD PTR [rbp-24], rax
.LBB5:
	.loc 1 123 0
	mov	DWORD PTR [rbp-28], 1
	jmp	.L18
.L19:
	.loc 1 124 0 discriminator 3
	mov	eax, DWORD PTR [rbp-28]
	cdqe
	sal	rax, 3
	lea	rdx, [rax-8]
	mov	rax, QWORD PTR [rbp-24]
	lea	rbx, [rdx+rax]
	mov	edi, 16
	call	malloc
	mov	QWORD PTR [rbx], rax
	.loc 1 125 0 discriminator 3
	mov	eax, DWORD PTR [rbp-28]
	cdqe
	sal	rax, 3
	lea	rdx, [rax-8]
	mov	rax, QWORD PTR [rbp-24]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR [rbp-28]
	mov	edx, DWORD PTR [rbp-28]
	movsx	rdx, edx
	lea	rcx, [0+rdx*8]
	mov	rdx, QWORD PTR [rbp-40]
	add	rdx, rcx
	mov	rdx, QWORD PTR [rdx]
	movsd	xmm1, QWORD PTR [rdx]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR [rax], xmm0
	.loc 1 126 0 discriminator 3
	mov	eax, DWORD PTR [rbp-28]
	cdqe
	sal	rax, 3
	lea	rdx, [rax-8]
	mov	rax, QWORD PTR [rbp-24]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	add	rax, 8
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR [rbp-28]
	mov	edx, DWORD PTR [rbp-28]
	movsx	rdx, edx
	lea	rcx, [0+rdx*8]
	mov	rdx, QWORD PTR [rbp-40]
	add	rdx, rcx
	mov	rdx, QWORD PTR [rdx]
	add	rdx, 8
	movsd	xmm1, QWORD PTR [rdx]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR [rax], xmm0
	.loc 1 123 0 discriminator 3
	add	DWORD PTR [rbp-28], 1
.L18:
	.loc 1 123 0 is_stmt 0 discriminator 1
	mov	eax, DWORD PTR [rbp-28]
	cmp	eax, DWORD PTR [rbp-44]
	jle	.L19
.LBE5:
	.loc 1 128 0 is_stmt 1
	mov	rax, QWORD PTR [rbp-24]
	.loc 1 129 0
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
	.long	0x2a4
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF33
	.byte	0xc
	.long	.LASF34
	.long	.LASF35
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
	.long	.LASF36
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
	.uleb128 0xd
	.long	.LASF29
	.byte	0x1
	.byte	0x79
	.long	0x19d
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.long	.LASF30
	.byte	0x1
	.byte	0x79
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.long	.LASF14
	.byte	0x1
	.byte	0x79
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x5
	.long	.LASF31
	.byte	0x1
	.byte	0x7a
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x5
	.long	.LASF32
	.byte	0x1
	.byte	0x7b
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
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
.LASF14:
	.string	"order"
.LASF18:
	.string	"runs"
.LASF35:
	.string	"/users/studs/bsc/2016/rotemmia/Archi/Archi-2"
.LASF17:
	.string	"acceptString"
.LASF27:
	.string	"print_complex"
.LASF22:
	.string	"distance"
.LASF11:
	.string	"float"
.LASF1:
	.string	"unsigned char"
.LASF15:
	.string	"initial"
.LASF0:
	.string	"long unsigned int"
.LASF2:
	.string	"short unsigned int"
.LASF28:
	.string	"complex"
.LASF31:
	.string	"derivative"
.LASF12:
	.string	"double"
.LASF36:
	.string	"main"
.LASF21:
	.string	"current_value"
.LASF3:
	.string	"unsigned int"
.LASF13:
	.string	"epsilon"
.LASF10:
	.string	"long long unsigned int"
.LASF26:
	.string	"print_polynomial"
.LASF25:
	.string	"printIndex"
.LASF23:
	.string	"initIndex"
.LASF7:
	.string	"sizetype"
.LASF9:
	.string	"long long int"
.LASF34:
	.string	"main.c"
.LASF8:
	.string	"char"
.LASF30:
	.string	"coefficient"
.LASF32:
	.string	"index"
.LASF33:
	.string	"GNU C11 5.4.0 20160609 -masm=intel -mtune=generic -march=x86-64 -g -fno-omit-frame-pointer -fstack-protector-strong"
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
.LASF4:
	.string	"signed char"
.LASF29:
	.string	"calculate_derivative"
.LASF19:
	.string	"last"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
