	.file	"lex.yy.c"
	.text
.lcomm yy_buffer_stack_top,8,8
.lcomm yy_buffer_stack_max,8,8
.lcomm yy_buffer_stack,8,8
.lcomm yy_hold_char,1,1
.lcomm yy_n_chars,4,4
	.globl	yyleng
	.bss
	.align 4
yyleng:
	.space 4
.lcomm yy_c_buf_p,8,8
.lcomm yy_init,4,4
.lcomm yy_start,4,4
.lcomm yy_did_buffer_switch_on_eof,4,4
	.globl	yyin
	.align 8
yyin:
	.space 8
	.globl	yyout
	.align 8
yyout:
	.space 8
	.globl	yylineno
	.data
	.align 4
yylineno:
	.long	1
	.section .rdata,"dr"
	.align 32
yy_accept:
	.word	0
	.word	0
	.word	0
	.word	7
	.word	5
	.word	4
	.word	4
	.word	5
	.word	5
	.word	5
	.word	0
	.word	1
	.word	2
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	3
	.word	0
	.align 32
yy_ec:
	.ascii "\0\1\1\1\1\1\1\1\1\2\3\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\2\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\4\4\4\4\4\4\4\4\4\4\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\5\1\6\1\7\1\10\1\1\1\11\1\1\1\12\13\14\15\1\16\17\20\21\1\1\22\23\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1"
	.align 16
yy_meta:
	.ascii "\0\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1"
	.align 32
yy_base:
	.word	0
	.word	0
	.word	18
	.word	39
	.word	40
	.word	40
	.word	40
	.word	21
	.word	31
	.word	30
	.word	18
	.word	28
	.word	27
	.word	14
	.word	17
	.word	18
	.word	22
	.word	14
	.word	11
	.word	15
	.word	8
	.word	11
	.word	0
	.word	4
	.word	0
	.word	0
	.word	40
	.word	40
	.word	0
	.align 32
yy_def:
	.word	0
	.word	28
	.word	28
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	0
	.word	27
	.align 32
yy_nxt:
	.word	0
	.word	4
	.word	5
	.word	6
	.word	27
	.word	27
	.word	27
	.word	7
	.word	27
	.word	27
	.word	27
	.word	26
	.word	25
	.word	24
	.word	27
	.word	27
	.word	23
	.word	22
	.word	8
	.word	9
	.word	5
	.word	6
	.word	21
	.word	20
	.word	19
	.word	7
	.word	18
	.word	17
	.word	16
	.word	15
	.word	14
	.word	12
	.word	11
	.word	13
	.word	12
	.word	11
	.word	8
	.word	9
	.word	10
	.word	27
	.word	3
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.align 32
yy_chk:
	.word	0
	.word	28
	.word	1
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	25
	.word	24
	.word	23
	.word	0
	.word	0
	.word	22
	.word	21
	.word	1
	.word	1
	.word	2
	.word	2
	.word	20
	.word	19
	.word	18
	.word	2
	.word	17
	.word	16
	.word	15
	.word	14
	.word	13
	.word	12
	.word	11
	.word	10
	.word	9
	.word	8
	.word	2
	.word	2
	.word	7
	.word	3
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
	.word	27
.lcomm yy_last_accepting_state,4,4
.lcomm yy_last_accepting_cpos,8,8
	.globl	yy_flex_debug
	.bss
	.align 4
yy_flex_debug:
	.space 4
	.globl	yytext
	.align 8
yytext:
	.space 8
	.globl	xVal
	.align 8
xVal:
	.space 8
	.globl	yVal
	.align 8
yVal:
	.space 8
	.section .rdata,"dr"
.LC0:
	.ascii "%lf\0"
.LC1:
	.ascii "Token: XVAL (x=%.2f)\12\0"
.LC2:
	.ascii "Token: YVAL (y=%.2f)\12\0"
.LC3:
	.ascii "Token: CUSTOM_OP\0"
.LC4:
	.ascii "Unexpected character: %s\12\0"
	.align 8
.LC5:
	.ascii "fatal flex scanner internal error--no action found\0"
	.text
	.globl	yylex
	.def	yylex;	.scl	2;	.type	32;	.endef
	.seh_proc	yylex
yylex:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	leaq	80(%rsp), %rbp
	.seh_setframe	%rbp, 80
	.seh_endprologue
	movl	yy_init(%rip), %eax
	testl	%eax, %eax
	jne	.L37
	movl	$1, yy_init(%rip)
	movl	yy_start(%rip), %eax
	testl	%eax, %eax
	jne	.L3
	movl	$1, yy_start(%rip)
.L3:
	movq	yyin(%rip), %rax
	testq	%rax, %rax
	jne	.L4
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, yyin(%rip)
.L4:
	movq	yyout(%rip), %rax
	testq	%rax, %rax
	jne	.L5
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, yyout(%rip)
.L5:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L6
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L7
.L6:
	call	yyensure_buffer_stack
	movq	yyin(%rip), %rax
	movq	yy_buffer_stack(%rip), %rdx
	movq	yy_buffer_stack_top(%rip), %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rbx
	movl	$16384, %edx
	movq	%rax, %rcx
	call	yy_create_buffer
	movq	%rax, (%rbx)
.L7:
	call	yy_load_buffer_state
.L37:
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -16(%rbp)
	movzbl	yy_hold_char(%rip), %edx
	movq	-16(%rbp), %rax
	movb	%dl, (%rax)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	yy_start(%rip), %eax
	movl	%eax, -4(%rbp)
.L8:
.L12:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	cltq
	leaq	yy_ec(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movb	%al, -29(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_accept(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	testw	%ax, %ax
	je	.L10
	movl	-4(%rbp), %eax
	movl	%eax, yy_last_accepting_state(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, yy_last_accepting_cpos(%rip)
	jmp	.L10
.L11:
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_def(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -4(%rbp)
	cmpl	$27, -4(%rbp)
	jle	.L10
	movzbl	-29(%rbp), %eax
	cltq
	leaq	yy_meta(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movb	%al, -29(%rbp)
.L10:
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-29(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_chk(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	cmpl	%eax, -4(%rbp)
	jne	.L11
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-29(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_nxt(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -4(%rbp)
	addq	$1, -16(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cmpw	$40, %ax
	jne	.L12
	nop
.L13:
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_accept(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jne	.L14
	movq	yy_last_accepting_cpos(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	yy_last_accepting_state(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_accept(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -28(%rbp)
.L14:
	movq	-24(%rbp), %rax
	movq	%rax, yytext(%rip)
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	movl	%eax, yyleng(%rip)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, yy_hold_char(%rip)
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
	movq	-16(%rbp), %rax
	movq	%rax, yy_c_buf_p(%rip)
.L15:
	cmpl	$8, -28(%rbp)
	ja	.L16
	movl	-28(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L18(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L18(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L18:
	.long	.L26-.L18
	.long	.L25-.L18
	.long	.L24-.L18
	.long	.L23-.L18
	.long	.L38-.L18
	.long	.L21-.L18
	.long	.L20-.L18
	.long	.L19-.L18
	.long	.L17-.L18
	.text
.L26:
	movzbl	yy_hold_char(%rip), %edx
	movq	-16(%rbp), %rax
	movb	%dl, (%rax)
	movq	yy_last_accepting_cpos(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	yy_last_accepting_state(%rip), %eax
	movl	%eax, -4(%rbp)
	jmp	.L13
.L25:
	movq	yytext(%rip), %rax
	addq	$1, %rax
	leaq	xVal(%rip), %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	__mingw_sscanf
	movsd	xVal(%rip), %xmm0
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	__mingw_printf
	movl	$1, %eax
	jmp	.L27
.L24:
	movq	yytext(%rip), %rax
	addq	$1, %rax
	leaq	yVal(%rip), %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	__mingw_sscanf
	movsd	yVal(%rip), %xmm0
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__mingw_printf
	movl	$2, %eax
	jmp	.L27
.L23:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$3, %eax
	jmp	.L27
.L21:
	movq	yytext(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	__mingw_printf
	movl	$1, %ecx
	call	exit
.L20:
	movq	yyout(%rip), %rcx
	movl	yyleng(%rip), %eax
	movslq	%eax, %rdx
	movq	yytext(%rip), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	fwrite
	jmp	.L28
.L17:
	movl	$0, %eax
	jmp	.L27
.L19:
	movq	yytext(%rip), %rax
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	movl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -36(%rbp)
	movzbl	yy_hold_char(%rip), %edx
	movq	-16(%rbp), %rax
	movb	%dl, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	56(%rax), %eax
	testl	%eax, %eax
	jne	.L29
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	28(%rax), %eax
	movl	%eax, yy_n_chars(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	yyin(%rip), %rdx
	movq	%rdx, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$1, 56(%rax)
.L29:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movl	yy_n_chars(%rip), %eax
	cltq
	addq	%rax, %rdx
	movq	yy_c_buf_p(%rip), %rax
	cmpq	%rax, %rdx
	jb	.L30
	movq	yytext(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, yy_c_buf_p(%rip)
	call	yy_get_previous_state
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	yy_try_NUL_trans
	movl	%eax, -40(%rbp)
	movq	yytext(%rip), %rax
	movq	%rax, -24(%rbp)
	cmpl	$0, -40(%rbp)
	je	.L31
	movq	yy_c_buf_p(%rip), %rax
	addq	$1, %rax
	movq	%rax, yy_c_buf_p(%rip)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	-40(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L12
.L31:
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -16(%rbp)
	jmp	.L13
.L30:
	call	yy_get_next_buffer
	cmpl	$2, %eax
	je	.L32
	cmpl	$2, %eax
	jg	.L39
	testl	%eax, %eax
	je	.L34
	cmpl	$1, %eax
	jne	.L39
	movl	$0, yy_did_buffer_switch_on_eof(%rip)
	call	yywrap
	testl	%eax, %eax
	je	.L35
	movq	yytext(%rip), %rax
	movq	%rax, yy_c_buf_p(%rip)
	movl	yy_start(%rip), %eax
	subl	$1, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	$8, %eax
	movl	%eax, -28(%rbp)
	jmp	.L15
.L35:
	movl	yy_did_buffer_switch_on_eof(%rip), %eax
	testl	%eax, %eax
	jne	.L40
	movq	yyin(%rip), %rax
	movq	%rax, %rcx
	call	yyrestart
	jmp	.L40
.L34:
	movq	yytext(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, yy_c_buf_p(%rip)
	call	yy_get_previous_state
	movl	%eax, -4(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	yytext(%rip), %rax
	movq	%rax, -24(%rbp)
	jmp	.L12
.L32:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movl	yy_n_chars(%rip), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, yy_c_buf_p(%rip)
	call	yy_get_previous_state
	movl	%eax, -4(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	yytext(%rip), %rax
	movq	%rax, -24(%rbp)
	jmp	.L13
.L40:
	nop
	jmp	.L39
.L16:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L38:
	nop
	jmp	.L37
.L39:
	nop
.L28:
	jmp	.L37
.L27:
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC6:
	.ascii "fatal flex scanner internal error--end of buffer missed\0"
	.align 8
.LC7:
	.ascii "fatal error - scanner input buffer overflow\0"
.LC8:
	.ascii "input in flex scanner failed\0"
	.align 8
.LC9:
	.ascii "out of dynamic memory in yy_get_next_buffer()\0"
	.text
	.def	yy_get_next_buffer;	.scl	3;	.type	32;	.endef
	.seh_proc	yy_get_next_buffer
yy_get_next_buffer:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$104, %rsp
	.seh_stackalloc	104
	leaq	96(%rsp), %rbp
	.seh_setframe	%rbp, 96
	.seh_endprologue
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	yytext(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	addq	%rax, %rdx
	movq	yy_c_buf_p(%rip), %rax
	cmpq	%rax, %rdx
	jnb	.L42
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L42:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	52(%rax), %eax
	testl	%eax, %eax
	jne	.L43
	movq	yy_c_buf_p(%rip), %rdx
	movq	yytext(%rip), %rax
	subq	%rax, %rdx
	cmpq	$1, %rdx
	jne	.L44
	movl	$1, %eax
	jmp	.L45
.L44:
	movl	$2, %eax
	jmp	.L45
.L43:
	movq	yy_c_buf_p(%rip), %rdx
	movq	yytext(%rip), %rax
	subq	%rax, %rdx
	movl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -40(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L46
.L47:
	movq	-16(%rbp), %rdx
	leaq	1(%rdx), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -8(%rbp)
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	addl	$1, -20(%rbp)
.L46:
	movl	-20(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L47
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	56(%rax), %eax
	cmpl	$2, %eax
	jne	.L48
	movl	$0, yy_n_chars(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movl	%edx, 28(%rax)
	jmp	.L49
.L48:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	subl	-40(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.L50
.L56:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	yy_c_buf_p(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	subq	%rax, %rdx
	movl	%edx, -52(%rbp)
	movq	-48(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L51
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	addl	%eax, %eax
	movl	%eax, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jg	.L52
	movq	-48(%rbp), %rax
	movl	24(%rax), %edx
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	leal	7(%rax), %ecx
	testl	%eax, %eax
	cmovs	%ecx, %eax
	sarl	$3, %eax
	addl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, 24(%rax)
	jmp	.L53
.L52:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	leal	(%rax,%rax), %edx
	movq	-48(%rbp), %rax
	movl	%edx, 24(%rax)
.L53:
	movq	-48(%rbp), %rax
	movl	24(%rax), %eax
	addl	$2, %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	yyrealloc
	movq	-48(%rbp), %rdx
	movq	%rax, 8(%rdx)
	jmp	.L54
.L51:
	movq	-48(%rbp), %rax
	movq	$0, 8(%rax)
.L54:
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L55
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L55:
	movq	-48(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-52(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, yy_c_buf_p(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	subl	-40(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -28(%rbp)
.L50:
	cmpl	$0, -28(%rbp)
	jle	.L56
	cmpl	$8192, -28(%rbp)
	jle	.L57
	movl	$8192, -28(%rbp)
.L57:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	36(%rax), %eax
	testl	%eax, %eax
	je	.L58
	movl	$42, -32(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L59
.L61:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rcx
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	addq	%rdx, %rax
	movl	-32(%rbp), %edx
	movb	%dl, (%rax)
	addl	$1, -36(%rbp)
.L59:
	movl	-36(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.L60
	movq	yyin(%rip), %rax
	movq	%rax, %rcx
	call	getc
	movl	%eax, -32(%rbp)
	cmpl	$-1, -32(%rbp)
	je	.L60
	cmpl	$10, -32(%rbp)
	jne	.L61
.L60:
	cmpl	$10, -32(%rbp)
	jne	.L62
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	movl	-40(%rbp), %eax
	movslq	%eax, %r8
	movl	-36(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -36(%rbp)
	cltq
	addq	%r8, %rax
	addq	%rcx, %rax
	movl	-32(%rbp), %edx
	movb	%dl, (%rax)
.L62:
	cmpl	$-1, -32(%rbp)
	jne	.L63
	movq	yyin(%rip), %rax
	movq	%rax, %rcx
	call	ferror
	testl	%eax, %eax
	je	.L63
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L63:
	movl	-36(%rbp), %eax
	movl	%eax, yy_n_chars(%rip)
	jmp	.L64
.L58:
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	$0, (%rax)
	jmp	.L65
.L67:
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L66
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L66:
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	$0, (%rax)
	movq	yyin(%rip), %rax
	movq	%rax, %rcx
	call	clearerr
.L65:
	movq	yyin(%rip), %r8
	movl	-28(%rbp), %eax
	movslq	%eax, %rcx
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movl	-40(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	fread
	movl	%eax, yy_n_chars(%rip)
	movl	yy_n_chars(%rip), %eax
	testl	%eax, %eax
	jne	.L64
	movq	yyin(%rip), %rax
	movq	%rax, %rcx
	call	ferror
	testl	%eax, %eax
	jne	.L67
.L64:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movl	%edx, 28(%rax)
.L49:
	movl	yy_n_chars(%rip), %eax
	testl	%eax, %eax
	jne	.L68
	cmpl	$0, -40(%rbp)
	jne	.L69
	movl	$1, -24(%rbp)
	movq	yyin(%rip), %rax
	movq	%rax, %rcx
	call	yyrestart
	jmp	.L70
.L69:
	movl	$2, -24(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$2, 56(%rax)
	jmp	.L70
.L68:
	movl	$0, -24(%rbp)
.L70:
	movl	yy_n_chars(%rip), %edx
	movl	-40(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	cmpl	%eax, %ecx
	jle	.L71
	movl	yy_n_chars(%rip), %edx
	movl	-40(%rbp), %eax
	addl	%eax, %edx
	movl	yy_n_chars(%rip), %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, -60(%rbp)
	movl	-60(%rbp), %eax
	movslq	%eax, %rdx
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	yy_buffer_stack(%rip), %rcx
	movq	yy_buffer_stack_top(%rip), %r8
	salq	$3, %r8
	addq	%r8, %rcx
	movq	(%rcx), %rbx
	movq	%rax, %rcx
	call	yyrealloc
	movq	%rax, 8(%rbx)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L72
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L72:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-60(%rbp), %edx
	subl	$2, %edx
	movl	%edx, 24(%rax)
.L71:
	movl	yy_n_chars(%rip), %edx
	movl	-40(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, yy_n_chars(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movl	yy_n_chars(%rip), %eax
	cltq
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, yytext(%rip)
	movl	-24(%rbp), %eax
.L45:
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.def	yy_get_previous_state;	.scl	3;	.type	32;	.endef
	.seh_proc	yy_get_previous_state
yy_get_previous_state:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	yy_start(%rip), %eax
	movl	%eax, -4(%rbp)
	movq	yytext(%rip), %rax
	movq	%rax, -16(%rbp)
	jmp	.L74
.L80:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L75
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	cltq
	leaq	yy_ec(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	jmp	.L76
.L75:
	movl	$1, %eax
.L76:
	movb	%al, -17(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_accept(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	testw	%ax, %ax
	je	.L78
	movl	-4(%rbp), %eax
	movl	%eax, yy_last_accepting_state(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, yy_last_accepting_cpos(%rip)
	jmp	.L78
.L79:
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_def(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -4(%rbp)
	cmpl	$27, -4(%rbp)
	jle	.L78
	movzbl	-17(%rbp), %eax
	cltq
	leaq	yy_meta(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movb	%al, -17(%rbp)
.L78:
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-17(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_chk(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	cmpl	%eax, -4(%rbp)
	jne	.L79
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-17(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_nxt(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -4(%rbp)
	addq	$1, -16(%rbp)
.L74:
	movq	yy_c_buf_p(%rip), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L80
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	yy_try_NUL_trans;	.scl	3;	.type	32;	.endef
	.seh_proc	yy_try_NUL_trans
yy_try_NUL_trans:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -16(%rbp)
	movb	$1, -1(%rbp)
	movl	16(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_accept(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	testw	%ax, %ax
	je	.L84
	movl	16(%rbp), %eax
	movl	%eax, yy_last_accepting_state(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, yy_last_accepting_cpos(%rip)
	jmp	.L84
.L85:
	movl	16(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_def(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, 16(%rbp)
	cmpl	$27, 16(%rbp)
	jle	.L84
	movzbl	-1(%rbp), %eax
	cltq
	leaq	yy_meta(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movb	%al, -1(%rbp)
.L84:
	movl	16(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-1(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_chk(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	cmpl	%eax, 16(%rbp)
	jne	.L85
	movl	16(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-1(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_nxt(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, 16(%rbp)
	cmpl	$27, 16(%rbp)
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L86
	movl	16(%rbp), %eax
	jmp	.L88
.L86:
	movl	$0, %eax
.L88:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "flex scanner push-back overflow\0"
	.text
	.def	yyunput;	.scl	3;	.type	32;	.endef
	.seh_proc	yyunput
yyunput:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -8(%rbp)
	movzbl	yy_hold_char(%rip), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	addq	$2, %rax
	cmpq	%rax, -8(%rbp)
	jnb	.L90
	movl	yy_n_chars(%rip), %eax
	addl	$2, %eax
	movl	%eax, -28(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	cltq
	addq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	jmp	.L91
.L92:
	subq	$1, -24(%rbp)
	subq	$1, -16(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-16(%rbp), %rax
	movb	%dl, (%rax)
.L91:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	cmpq	-24(%rbp), %rax
	jb	.L92
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	cltq
	addq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	cltq
	addq	%rax, 24(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	movl	%eax, yy_n_chars(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movl	%edx, 28(%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	addq	$2, %rax
	cmpq	%rax, -8(%rbp)
	jnb	.L90
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L90:
	subq	$1, -8(%rbp)
	movl	16(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movq	24(%rbp), %rax
	movq	%rax, yytext(%rip)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, yy_hold_char(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, yy_c_buf_p(%rip)
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	input;	.scl	3;	.type	32;	.endef
	.seh_proc	input
input:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	yy_c_buf_p(%rip), %rax
	movzbl	yy_hold_char(%rip), %edx
	movb	%dl, (%rax)
	movq	yy_c_buf_p(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L94
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movl	yy_n_chars(%rip), %eax
	cltq
	addq	%rdx, %rax
	movq	yy_c_buf_p(%rip), %rdx
	cmpq	%rax, %rdx
	jnb	.L95
	movq	yy_c_buf_p(%rip), %rax
	movb	$0, (%rax)
	jmp	.L94
.L95:
	movq	yy_c_buf_p(%rip), %rdx
	movq	yytext(%rip), %rax
	subq	%rax, %rdx
	movl	%edx, -4(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	addq	$1, %rax
	movq	%rax, yy_c_buf_p(%rip)
	call	yy_get_next_buffer
	cmpl	$2, %eax
	je	.L96
	cmpl	$2, %eax
	jg	.L94
	testl	%eax, %eax
	je	.L97
	cmpl	$1, %eax
	je	.L98
	jmp	.L94
.L96:
	movq	yyin(%rip), %rax
	movq	%rax, %rcx
	call	yyrestart
.L98:
	call	yywrap
	testl	%eax, %eax
	je	.L99
	movl	$0, %eax
	jmp	.L100
.L99:
	movl	yy_did_buffer_switch_on_eof(%rip), %eax
	testl	%eax, %eax
	jne	.L101
	movq	yyin(%rip), %rax
	movq	%rax, %rcx
	call	yyrestart
.L101:
	call	input
	jmp	.L100
.L97:
	movq	yytext(%rip), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, yy_c_buf_p(%rip)
	nop
.L94:
	movq	yy_c_buf_p(%rip), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	movb	$0, (%rax)
	movq	yy_c_buf_p(%rip), %rax
	addq	$1, %rax
	movq	%rax, yy_c_buf_p(%rip)
	movq	yy_c_buf_p(%rip), %rax
	movzbl	(%rax), %eax
	movb	%al, yy_hold_char(%rip)
	movl	-8(%rbp), %eax
.L100:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyrestart
	.def	yyrestart;	.scl	2;	.type	32;	.endef
	.seh_proc	yyrestart
yyrestart:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L103
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L104
.L103:
	call	yyensure_buffer_stack
	movq	yyin(%rip), %rax
	movq	yy_buffer_stack(%rip), %rdx
	movq	yy_buffer_stack_top(%rip), %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rbx
	movl	$16384, %edx
	movq	%rax, %rcx
	call	yy_create_buffer
	movq	%rax, (%rbx)
.L104:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L105
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L106
.L105:
	movl	$0, %eax
.L106:
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	yy_init_buffer
	call	yy_load_buffer_state
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	yy_switch_to_buffer
	.def	yy_switch_to_buffer;	.scl	2;	.type	32;	.endef
	.seh_proc	yy_switch_to_buffer
yy_switch_to_buffer:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	call	yyensure_buffer_stack
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L108
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L109
.L108:
	movl	$0, %eax
.L109:
	cmpq	16(%rbp), %rax
	je	.L113
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L112
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L112
	movq	yy_c_buf_p(%rip), %rax
	movzbl	yy_hold_char(%rip), %edx
	movb	%dl, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	yy_c_buf_p(%rip), %rdx
	movq	%rdx, 16(%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movl	%edx, 28(%rax)
.L112:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rax, (%rdx)
	call	yy_load_buffer_state
	movl	$1, yy_did_buffer_switch_on_eof(%rip)
	jmp	.L107
.L113:
	nop
.L107:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	yy_load_buffer_state;	.scl	3;	.type	32;	.endef
	.seh_proc	yy_load_buffer_state
yy_load_buffer_state:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	28(%rax), %eax
	movl	%eax, yy_n_chars(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, yy_c_buf_p(%rip)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, yytext(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, yyin(%rip)
	movq	yy_c_buf_p(%rip), %rax
	movzbl	(%rax), %eax
	movb	%al, yy_hold_char(%rip)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "out of dynamic memory in yy_create_buffer()\0"
	.text
	.globl	yy_create_buffer
	.def	yy_create_buffer;	.scl	2;	.type	32;	.endef
	.seh_proc	yy_create_buffer
yy_create_buffer:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	$64, %ecx
	call	yyalloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L116
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L116:
	movq	-8(%rbp), %rax
	movl	24(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	addl	$2, %eax
	cltq
	movq	%rax, %rcx
	call	yyalloc
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L117
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L117:
	movq	-8(%rbp), %rax
	movl	$1, 32(%rax)
	movq	16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	yy_init_buffer
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	yy_delete_buffer
	.def	yy_delete_buffer;	.scl	2;	.type	32;	.endef
	.seh_proc	yy_delete_buffer
yy_delete_buffer:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L126
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L122
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L123
.L122:
	movl	$0, %eax
.L123:
	cmpq	16(%rbp), %rax
	jne	.L124
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	$0, (%rax)
.L124:
	movq	16(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L125
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	yyfree
.L125:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	yyfree
	jmp	.L119
.L126:
	nop
.L119:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	yy_init_buffer;	.scl	3;	.type	32;	.endef
	.seh_proc	yy_init_buffer
yy_init_buffer:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	yy_flush_buffer
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movl	$1, 52(%rax)
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L128
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L129
.L128:
	movl	$0, %eax
.L129:
	cmpq	16(%rbp), %rax
	je	.L130
	movq	16(%rbp), %rax
	movl	$1, 44(%rax)
	movq	16(%rbp), %rax
	movl	$0, 48(%rax)
.L130:
	cmpq	$0, 24(%rbp)
	je	.L131
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	fileno
	movl	%eax, %ecx
	call	isatty
	testl	%eax, %eax
	jle	.L131
	movl	$1, %edx
	jmp	.L132
.L131:
	movl	$0, %edx
.L132:
	movq	16(%rbp), %rax
	movl	%edx, 36(%rax)
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	yy_flush_buffer
	.def	yy_flush_buffer;	.scl	2;	.type	32;	.endef
	.seh_proc	yy_flush_buffer
yy_flush_buffer:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L138
	movq	16(%rbp), %rax
	movl	$0, 28(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movb	$0, (%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	addq	$1, %rax
	movb	$0, (%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movl	$1, 40(%rax)
	movq	16(%rbp), %rax
	movl	$0, 56(%rax)
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L136
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L137
.L136:
	movl	$0, %eax
.L137:
	cmpq	16(%rbp), %rax
	jne	.L133
	call	yy_load_buffer_state
	jmp	.L133
.L138:
	nop
.L133:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	yypush_buffer_state
	.def	yypush_buffer_state;	.scl	2;	.type	32;	.endef
	.seh_proc	yypush_buffer_state
yypush_buffer_state:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L144
	call	yyensure_buffer_stack
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L142
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L142
	movq	yy_c_buf_p(%rip), %rax
	movzbl	yy_hold_char(%rip), %edx
	movb	%dl, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	yy_c_buf_p(%rip), %rdx
	movq	%rdx, 16(%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movl	%edx, 28(%rax)
.L142:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L143
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L143
	movq	yy_buffer_stack_top(%rip), %rax
	addq	$1, %rax
	movq	%rax, yy_buffer_stack_top(%rip)
.L143:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rax, (%rdx)
	call	yy_load_buffer_state
	movl	$1, yy_did_buffer_switch_on_eof(%rip)
	jmp	.L139
.L144:
	nop
.L139:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	yypop_buffer_state
	.def	yypop_buffer_state;	.scl	2;	.type	32;	.endef
	.seh_proc	yypop_buffer_state
yypop_buffer_state:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L152
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L152
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L149
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L150
.L149:
	movl	$0, %eax
.L150:
	movq	%rax, %rcx
	call	yy_delete_buffer
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	$0, (%rax)
	movq	yy_buffer_stack_top(%rip), %rax
	testq	%rax, %rax
	je	.L151
	movq	yy_buffer_stack_top(%rip), %rax
	subq	$1, %rax
	movq	%rax, yy_buffer_stack_top(%rip)
.L151:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L145
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L145
	call	yy_load_buffer_state
	movl	$1, yy_did_buffer_switch_on_eof(%rip)
	jmp	.L145
.L152:
	nop
.L145:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "out of dynamic memory in yyensure_buffer_stack()\0"
	.text
	.def	yyensure_buffer_stack;	.scl	3;	.type	32;	.endef
	.seh_proc	yyensure_buffer_stack
yyensure_buffer_stack:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	jne	.L154
	movq	$1, -16(%rbp)
	movq	-16(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rcx
	call	yyalloc
	movq	%rax, yy_buffer_stack(%rip)
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	jne	.L155
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L155:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	yy_buffer_stack(%rip), %rax
	movq	%rdx, %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	memset
	movq	-16(%rbp), %rax
	movq	%rax, yy_buffer_stack_max(%rip)
	movq	$0, yy_buffer_stack_top(%rip)
	jmp	.L153
.L154:
	movq	yy_buffer_stack_max(%rip), %rax
	subq	$1, %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	cmpq	%rax, %rdx
	jb	.L153
	movq	$8, -8(%rbp)
	movq	yy_buffer_stack_max(%rip), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	yy_buffer_stack(%rip), %rax
	movq	%rax, %rcx
	call	yyrealloc
	movq	%rax, yy_buffer_stack(%rip)
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	jne	.L157
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L157:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_max(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	%rcx, %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	memset
	movq	-16(%rbp), %rax
	movq	%rax, yy_buffer_stack_max(%rip)
.L153:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC13:
	.ascii "out of dynamic memory in yy_scan_buffer()\0"
	.text
	.globl	yy_scan_buffer
	.def	yy_scan_buffer;	.scl	2;	.type	32;	.endef
	.seh_proc	yy_scan_buffer
yy_scan_buffer:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$1, 24(%rbp)
	jbe	.L159
	movq	24(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L159
	movq	24(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L160
.L159:
	movl	$0, %eax
	jmp	.L161
.L160:
	movl	$64, %ecx
	call	yyalloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L162
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L162:
	movq	24(%rbp), %rax
	subl	$2, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 32(%rax)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movl	24(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 28(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 36(%rax)
	movq	-8(%rbp), %rax
	movl	$1, 40(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 52(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	yy_switch_to_buffer
	movq	-8(%rbp), %rax
.L161:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	yy_scan_string
	.def	yy_scan_string;	.scl	2;	.type	32;	.endef
	.seh_proc	yy_scan_string
yy_scan_string:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	yy_scan_bytes
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC14:
	.ascii "out of dynamic memory in yy_scan_bytes()\0"
.LC15:
	.ascii "bad buffer in yy_scan_bytes()\0"
	.text
	.globl	yy_scan_bytes
	.def	yy_scan_bytes;	.scl	2;	.type	32;	.endef
	.seh_proc	yy_scan_bytes
yy_scan_bytes:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	addl	$2, %eax
	cltq
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	yyalloc
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L166
	leaq	.LC14(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L166:
	movl	$0, -4(%rbp)
	jmp	.L167
.L168:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -4(%rbp)
.L167:
	movl	-4(%rbp), %eax
	cmpl	24(%rbp), %eax
	jl	.L168
	movl	24(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	24(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	yy_scan_buffer
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L169
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	yy_fatal_error
.L169:
	movq	-32(%rbp), %rax
	movl	$1, 32(%rax)
	movq	-32(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC16:
	.ascii "%s\12\0"
	.text
	.def	yy_fatal_error;	.scl	3;	.type	32;	.endef
	.seh_proc	yy_fatal_error
yy_fatal_error:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	16(%rbp), %rax
	movq	%rax, %r8
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdx
	call	__mingw_fprintf
	movl	$2, %ecx
	call	exit
	nop
	.seh_endproc
	.globl	yyget_lineno
	.def	yyget_lineno;	.scl	2;	.type	32;	.endef
	.seh_proc	yyget_lineno
yyget_lineno:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	yylineno(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyget_in
	.def	yyget_in;	.scl	2;	.type	32;	.endef
	.seh_proc	yyget_in
yyget_in:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	yyin(%rip), %rax
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyget_out
	.def	yyget_out;	.scl	2;	.type	32;	.endef
	.seh_proc	yyget_out
yyget_out:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	yyout(%rip), %rax
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyget_leng
	.def	yyget_leng;	.scl	2;	.type	32;	.endef
	.seh_proc	yyget_leng
yyget_leng:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	yyleng(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyget_text
	.def	yyget_text;	.scl	2;	.type	32;	.endef
	.seh_proc	yyget_text
yyget_text:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	yytext(%rip), %rax
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyset_lineno
	.def	yyset_lineno;	.scl	2;	.type	32;	.endef
	.seh_proc	yyset_lineno
yyset_lineno:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	movl	%eax, yylineno(%rip)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyset_in
	.def	yyset_in;	.scl	2;	.type	32;	.endef
	.seh_proc	yyset_in
yyset_in:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, yyin(%rip)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyset_out
	.def	yyset_out;	.scl	2;	.type	32;	.endef
	.seh_proc	yyset_out
yyset_out:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, yyout(%rip)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyget_debug
	.def	yyget_debug;	.scl	2;	.type	32;	.endef
	.seh_proc	yyget_debug
yyget_debug:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	yy_flex_debug(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyset_debug
	.def	yyset_debug;	.scl	2;	.type	32;	.endef
	.seh_proc	yyset_debug
yyset_debug:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	movl	%eax, yy_flex_debug(%rip)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.def	yy_init_globals;	.scl	3;	.type	32;	.endef
	.seh_proc	yy_init_globals
yy_init_globals:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	$0, yy_buffer_stack(%rip)
	movq	$0, yy_buffer_stack_top(%rip)
	movq	$0, yy_buffer_stack_max(%rip)
	movq	$0, yy_c_buf_p(%rip)
	movl	$0, yy_init(%rip)
	movl	$0, yy_start(%rip)
	movq	$0, yyin(%rip)
	movq	$0, yyout(%rip)
	movl	$0, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	yylex_destroy
	.def	yylex_destroy;	.scl	2;	.type	32;	.endef
	.seh_proc	yylex_destroy
yylex_destroy:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	jmp	.L191
.L195:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L192
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L193
.L192:
	movl	$0, %eax
.L193:
	movq	%rax, %rcx
	call	yy_delete_buffer
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	$0, (%rax)
	call	yypop_buffer_state
.L191:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L194
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L195
.L194:
	movq	yy_buffer_stack(%rip), %rax
	movq	%rax, %rcx
	call	yyfree
	movq	$0, yy_buffer_stack(%rip)
	call	yy_init_globals
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyalloc
	.def	yyalloc;	.scl	2;	.type	32;	.endef
	.seh_proc	yyalloc
yyalloc:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	malloc
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyrealloc
	.def	yyrealloc;	.scl	2;	.type	32;	.endef
	.seh_proc	yyrealloc
yyrealloc:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	realloc
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	yyfree
	.def	yyfree;	.scl	2;	.type	32;	.endef
	.seh_proc	yyfree
yyfree:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	free
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	yywrap
	.def	yywrap;	.scl	2;	.type	32;	.endef
	.seh_proc	yywrap
yywrap:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	$1, %eax
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev3, Built by MSYS2 project) 14.2.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	getc;	.scl	2;	.type	32;	.endef
	.def	ferror;	.scl	2;	.type	32;	.endef
	.def	clearerr;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fileno;	.scl	2;	.type	32;	.endef
	.def	isatty;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	realloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
