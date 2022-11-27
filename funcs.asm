	.intel_syntax noprefix
	.section	.rodata
.LC4:
	.string	"-c"
.LC5:
	.string	"%lf %lf"
.LC6:
	.string	"%lf\n"
.LC8:
	.string	"Program execution time: %lf\n"
.LC9:
	.string	"-f"
.LC10:
	.string	"r"
.LC11:
	.string	"w"
	.align 8
.LC12:
	.string	"Please enter one of the following keys: -f, -c"
	.text
	.globl	f
	.type	f, @function
f:
	push	rbp
	mov	rbp, rsp
	movsd	xmm2, xmm0 # xmm0 - double x
	movsd	xmm0, xmm2
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm2
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm2
	movsd	xmm0, xmm2
	addsd	xmm0, xmm0
	mulsd	xmm0, xmm2
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	subsd	xmm0, xmm2
	movsd	xmm1, QWORD PTR .LC0[rip]
	subsd	xmm0, xmm1
	pop	rbp
	ret
	.size	f, .-f
	.globl	solve
	.type	solve, @function
solve:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	movsd	QWORD PTR -24[rbp], xmm0 # xmm0 - double a
	movsd	QWORD PTR -32[rbp], xmm1 # xmm1 - double b
	movsd	QWORD PTR -40[rbp], xmm2 # xmm2 - double e
	jmp	.L4
.L7:
	movsd	xmm0, QWORD PTR -24[rbp]
	addsd	xmm0, QWORD PTR -32[rbp]
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax                # xmm0 - arg1 - double x
	call	f
	movsd	QWORD PTR -48[rbp], xmm0
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rax                # xmm0 - arg1 - double x
	call	f
	movsd	xmm1, QWORD PTR -48[rbp]
	mulsd	xmm1, xmm0
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jbe	.L10
	movsd	xmm0, QWORD PTR -8[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
	jmp	.L4
.L10:
	movsd	xmm0, QWORD PTR -8[rbp]
	movsd	QWORD PTR -32[rbp], xmm0
.L4:
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
	comisd	xmm0, QWORD PTR -40[rbp]
	ja	.L7
	movsd	xmm0, QWORD PTR -24[rbp]
	addsd	xmm0, QWORD PTR -32[rbp]
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	leave
	ret
	.size	solve, .-solve
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC3:
	.long	2696277389
	.long	1051772663
	.align 8
.LC7:
	.long	0
	.long	1093567616
