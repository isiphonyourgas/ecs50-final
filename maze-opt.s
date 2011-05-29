	.file	"maze.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"(%d, %d) \n"
	.text
	.p2align 4,,15
.globl find_path
	.type	find_path, @function
find_path:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movl	%esi, -8(%ebp)
	movl	16(%ebp), %esi
	movl	%ebx, -12(%ebp)
	movl	12(%ebp), %ebx
	movl	%edi, -4(%ebp)
	movl	8(%ebp), %edi
	testl	%esi, %esi
	js	.L8
	movl	%ebx, %eax
	shrl	$31, %eax
	testb	%al, %al
	jne	.L8
	cmpl	$7, %esi
	jg	.L8
	cmpl	$7, %ebx
	jg	.L8
	leal	(%edi,%ebx,8), %edx
	xorl	%eax, %eax
	cmpb	$88, (%edx,%esi)
	je	.L2
	cmpl	$1, %esi
	jne	.L12
	testl	%ebx, %ebx
	movb	$1, %al
	je	.L2
.L12:
	movb	$88, (%edx,%esi)
	leal	1(%esi), %edx
	movl	%edx, 8(%esp)
	movl	%edx, -28(%ebp)
	movl	%ebx, 4(%esp)
	movl	%edi, (%esp)
	call	find_path
	movl	-28(%ebp), %edx
	cmpl	$1, %eax
	je	.L14
	leal	-1(%esi), %edx
	movl	%edx, 8(%esp)
	movl	%edx, -28(%ebp)
	movl	%ebx, 4(%esp)
	movl	%edi, (%esp)
	call	find_path
	movl	-28(%ebp), %edx
	cmpl	$1, %eax
	je	.L14
	leal	-1(%ebx), %edx
	movl	%edx, 4(%esp)
	movl	%edx, -28(%ebp)
	movl	%esi, 8(%esp)
	movl	%edi, (%esp)
	call	find_path
	movl	-28(%ebp), %edx
	cmpl	$1, %eax
	je	.L16
	addl	$1, %ebx
	movl	%esi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%edi, (%esp)
	call	find_path
	movl	%eax, %edx
	xorl	%eax, %eax
	cmpl	$1, %edx
	jne	.L2
	movl	%esi, 12(%esp)
.L13:
	movl	%ebx, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$1, %eax
	jmp	.L2
	.p2align 4,,7
	.p2align 3
.L8:
	xorl	%eax, %eax
.L2:
	movl	-12(%ebp), %ebx
	movl	-8(%ebp), %esi
	movl	-4(%ebp), %edi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L14:
	movl	%edx, 12(%esp)
	jmp	.L13
	.p2align 4,,7
	.p2align 3
.L16:
	movl	%esi, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$1, %eax
	jmp	.L2
	.size	find_path, .-find_path
	.section	.rodata.str1.1
.LC1:
	.string	"r"
.LC2:
	.string	"No path was found."
.LC3:
	.string	"(7, 7)"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$96, %esp
	cmpl	$2, 8(%ebp)
	movl	%ebx, 88(%esp)
	movl	%esi, 92(%esp)
	je	.L20
.L18:
	xorl	%eax, %eax
	movl	88(%esp), %ebx
	movl	92(%esp), %esi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L20:
	movl	12(%ebp), %eax
	leal	16(%esp), %esi
	movl	$.LC1, 4(%esp)
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	fopen
	movl	$11, 4(%esp)
	movl	%esi, (%esp)
	movl	%eax, %ebx
	movl	%eax, 8(%esp)
	call	fgets
	leal	24(%esp), %eax
	movl	%ebx, 8(%esp)
	movl	$11, 4(%esp)
	movl	%eax, (%esp)
	call	fgets
	leal	32(%esp), %eax
	movl	%ebx, 8(%esp)
	movl	$11, 4(%esp)
	movl	%eax, (%esp)
	call	fgets
	leal	40(%esp), %eax
	movl	%ebx, 8(%esp)
	movl	$11, 4(%esp)
	movl	%eax, (%esp)
	call	fgets
	leal	48(%esp), %eax
	movl	%ebx, 8(%esp)
	movl	$11, 4(%esp)
	movl	%eax, (%esp)
	call	fgets
	leal	56(%esp), %eax
	movl	%ebx, 8(%esp)
	movl	$11, 4(%esp)
	movl	%eax, (%esp)
	call	fgets
	leal	64(%esp), %eax
	movl	%ebx, 8(%esp)
	movl	$11, 4(%esp)
	movl	%eax, (%esp)
	call	fgets
	leal	72(%esp), %eax
	movl	%ebx, 8(%esp)
	movl	$11, 4(%esp)
	movl	%eax, (%esp)
	call	fgets
	movl	$7, 8(%esp)
	movl	$7, 4(%esp)
	movl	%esi, (%esp)
	call	find_path
	testl	%eax, %eax
	je	.L21
	movl	$.LC3, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	xorl	%eax, %eax
	movl	88(%esp), %ebx
	movl	92(%esp), %esi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L21:
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	jmp	.L18
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.5.2-8ubuntu4) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
