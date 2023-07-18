	.file	"reverse_integer.c"
	.text
	.globl	reverse
	.type	reverse, @function
reverse:
.LFB23:
	.cfi_startproc
	endbr64
#APP
# 4 "reverse_integer.c" 1
	push %rdi
	xorl %ecx, %ecx
	mov %edi, %eax
	cmpl $-2147483648, %eax
	je end
	testl %eax, %eax
	jge positive
	negl %eax
	positive:
	testl %eax, %eax
	je end
	cmpl $214748364, %ecx
	jg earlyend
	cmpl $-214748364, %ecx
	jl earlyend
	imul $10, %ecx
	movl $10, %ebx
	xorl %edx, %edx
	divl %ebx
	addl %edx, %ecx
	jmp positive
	earlyend:
	movl $0, %ecx
	end:
	mov %ecx, %eax
	pop %rdi
	test %edi, %edi
	jg out
	negl %eax
	out:
	ret
	
# 0 "" 2
#NO_APP
	ud2
	.cfi_endproc
.LFE23:
	.size	reverse, .-reverse
	.globl	reverse1
	.type	reverse1, @function
reverse1:
.LFB24:
	.cfi_startproc
	endbr64
	movl	$0, %eax
	cmpl	$-2147483648, %edi
	je	.L2
	testl	%edi, %edi
	js	.L4
	movl	$1, %eax
	movl	$0, %ecx
	jle	.L6
.L5:
	movl	$0, %ecx
.L7:
	leal	(%rcx,%rcx,4), %r8d
	movslq	%edi, %rdx
	imulq	$1717986919, %rdx, %rdx
	sarq	$34, %rdx
	movl	%edi, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	leal	(%rdx,%rdx,4), %ecx
	addl	%ecx, %ecx
	movl	%edi, %esi
	subl	%ecx, %esi
	leal	(%rsi,%r8,2), %ecx
	movl	%edi, %esi
	movl	%edx, %edi
	cmpl	$9, %esi
	jle	.L6
	leal	214748364(%rcx), %edx
	cmpl	$429496728, %edx
	jbe	.L7
	movl	$0, %eax
	ret
.L6:
	imull	%ecx, %eax
	ret
.L4:
	negl	%edi
	movl	$-1, %eax
	jmp	.L5
.L2:
	ret
	.cfi_endproc
.LFE24:
	.size	reverse1, .-reverse1
	.globl	ten
	.type	ten, @function
ten:
.LFB25:
	.cfi_startproc
	endbr64
#APP
# 56 "reverse_integer.c" 1
	lea (%edi, %edi, 8), %edi
	movl %edi, %eax
	ret
	
# 0 "" 2
#NO_APP
	ud2
	.cfi_endproc
.LFE25:
	.size	ten, .-ten
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$-120, %edi
	call	reverse
	movl	%eax, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
