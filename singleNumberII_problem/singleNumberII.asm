	.file	"singleNumberII.c"
	.text
	.globl	singleNumber
	.type	singleNumber, @function
singleNumber:
.LFB39:
	.cfi_startproc
	endbr64
#APP
# 11 "singleNumberII.c" 1
	push %rbx
	push %rdi
	push %rsi
	mov $10000, %edi
	mov $4, %esi
	call calloc
	mov %rax, %rbx
	push %rbx
	mov $10000, %rdi
	mov $4, %rsi
	call calloc
	mov %rax, %rdx
	pop %rbx
	pop %rsi
	pop %rdi
	xor %rax, %rax
outerloop:
	dec %rsi
	cmp $0, %rsi
	jl finalloop
	xor %rcx, %rcx
innerloop:
	cmp %rcx, %rax
	je innerloop_end
	push %rax
	mov (%rbx, %rcx, 4), %eax
	cmp %eax, (%rdi, %rsi, 4)
	pop %rax
	je innerloop_end
	inc %rcx
	jmp innerloop
innerloop_end:
	cmp %rcx, %rax
	jne skipnew
	push %rdx
	mov (%rdi, %rsi, 4), %edx
	mov %edx, (%rbx, %rax, 4)
	pop %rdx
	inc %rax
skipnew:
	incl (%rdx, %rcx, 4)
	jmp outerloop
finalloop:
	cmp $0, %rax
	je out
	cmpl $1, (%rdx, %rax, 4)
	je out
	dec %rax
	jmp finalloop
	out:
	mov (%rbx, %rax, 4), %eax
	pop %rbx
	ret
	
# 0 "" 2
#NO_APP
	ud2
	.cfi_endproc
.LFE39:
	.size	singleNumber, .-singleNumber
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, %rbx
	movl	$0, (%rax)
	movl	$0, 4(%rax)
	movl	$1, 8(%rax)
	movl	$0, 12(%rax)
	movl	$4, %esi
	movq	%rax, %rdi
	call	singleNumber
	movl	%eax, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movl	$0, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
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
