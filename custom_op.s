	.file	"custom_op.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Expected x-value like x3\0"
.LC1:
	.ascii "Expected y-value like y4\0"
.LC2:
	.ascii "Expected 'custom_operation'\0"
	.align 8
.LC3:
	.ascii "Using custom instruction: x\302\262 + y\302\262 - 2xy\0"
	.align 8
.LC4:
	.ascii "Result for x=%.2f, y=%.2f is: %.2f\12\0"
	.text
	.globl	computeExpression
	.def	computeExpression;	.scl	2;	.type	32;	.endef
	.seh_proc	computeExpression
computeExpression:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	yylex
	movl	%eax, -4(%rbp)
	cmpl	$1, -4(%rbp)
	je	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L1
.L2:
	call	yylex
	movl	%eax, -4(%rbp)
	cmpl	$2, -4(%rbp)
	je	.L4
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L1
.L4:
	call	yylex
	movl	%eax, -4(%rbp)
	cmpl	$3, -4(%rbp)
	je	.L5
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L1
.L5:
	movq	.refptr.xVal(%rip), %rax
	movsd	(%rax), %xmm1
	movq	.refptr.xVal(%rip), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm0, %xmm1
	movq	.refptr.yVal(%rip), %rax
	movsd	(%rax), %xmm2
	movq	.refptr.yVal(%rip), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	.refptr.xVal(%rip), %rax
	movsd	(%rax), %xmm0
	movapd	%xmm0, %xmm2
	addsd	%xmm0, %xmm2
	movq	.refptr.yVal(%rip), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm0, %xmm2
	subsd	%xmm2, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movq	.refptr.yVal(%rip), %rax
	movsd	(%rax), %xmm2
	movq	.refptr.xVal(%rip), %rax
	movsd	(%rax), %xmm1
	movsd	-16(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movapd	%xmm2, %xmm3
	movapd	%xmm3, %xmm2
	movq	%xmm3, %rcx
	movapd	%xmm1, %xmm3
	movapd	%xmm3, %xmm1
	movq	%xmm3, %rdx
	movapd	%xmm0, %xmm3
	movq	%rax, %r9
	movq	%rcx, %r8
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	__mingw_printf
	nop
.L1:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev3, Built by MSYS2 project) 14.2.0"
	.def	yylex;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.yVal, "dr"
	.globl	.refptr.yVal
	.linkonce	discard
.refptr.yVal:
	.quad	yVal
	.section	.rdata$.refptr.xVal, "dr"
	.globl	.refptr.xVal
	.linkonce	discard
.refptr.xVal:
	.quad	xVal
