	.file	"Sumavectores.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan no componentes del vector"
	.align 8
.LC3:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Vectores:%u\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.section	.text.startup,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L14
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$67108864, %ebp
	call	strtol
	cmpl	$67108864, %eax
	cmovbe	%eax, %ebp
	testl	%ebp, %ebp
	je	.L3
	pxor	%xmm1, %xmm1
	leal	-1(%rbp), %eax
	xorl	%ebx, %ebx
	movsd	.LC1(%rip), %xmm3
	addq	$1, %rax
	cvtsi2sd	%ebp, %xmm1
	mulsd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm4
	cvtsi2sd	%ebx, %xmm0
	mulsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm2
	subsd	%xmm0, %xmm4
	addsd	%xmm1, %xmm2
	movsd	%xmm4, v2(,%rbx,8)
	movsd	%xmm2, v1(,%rbx,8)
	addq	$1, %rbx
	cmpq	%rax, %rbx
	jne	.L4
	movq	%rsp, %rsi
	xorl	%edi, %edi
	salq	$3, %rbx
	call	clock_gettime
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	v1(%rax), %xmm0
	addq	$8, %rax
	addsd	v2-8(%rax), %xmm0
	movsd	%xmm0, v3-8(%rax)
	cmpq	%rax, %rbx
	jne	.L5
.L6:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	%ebp, %edx
	pxor	%xmm0, %xmm0
	movl	$.LC3, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC2(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L15
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L6
.L14:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
.L15:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE4:
	.section	.text.startup
.LHOTE4:
	.comm	v3,536870912,32
	.comm	v2,536870912,32
	.comm	v1,536870912,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	2576980378
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
