	.file	"maze.c"
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"No path was found."
.LC2:
	.string	"(7, 7)"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$96, %esp
	cmpl	$2, 8(%ebp)
	jne	.L2
	movl	$.LC0, %edx
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, 88(%esp)
	movl	$0, 92(%esp)
	jmp	.L3
.L4:
	leal	24(%esp), %eax
	movl	92(%esp), %edx
	sall	$3, %edx
	leal	(%eax,%edx), %edx
	movl	88(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$11, 4(%esp)
	movl	%edx, (%esp)
	call	fgets
	addl	$1, 92(%esp)
.L3:
	cmpl	$7, 92(%esp)
	jle	.L4
	movl	$7, 8(%esp)
	movl	$7, 4(%esp)
	leal	24(%esp), %eax
	movl	%eax, (%esp)
	call	find_path
	testl	%eax, %eax
	jne	.L5
	movl	$.LC1, %eax
	movl	%eax, (%esp)
	call	printf
	jmp	.L2
.L5:
	movl	$.LC2, %eax
	movl	%eax, (%esp)
	call	printf
.L2:
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.section	.rodata
.LC3:
	.string	"(%d, %d) \n"
	.text
.globl find_path
	.type	find_path, @function
find_path:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	cmpl	$0, 12(%ebp)
	js	.L7
	cmpl	$0, 16(%ebp)
	js	.L7
	cmpl	$7, 12(%ebp)
	jg	.L7
	cmpl	$7, 16(%ebp)
	jle	.L8
.L7:
	movl	$0, %eax
	jmp	.L9
.L8:
	movl	12(%ebp), %eax
	sall	$3, %eax
	movl	%eax, %edx
	addl	8(%ebp), %edx
	movl	16(%ebp), %eax
	leal	(%edx,%eax), %eax
	movzbl	(%eax), %eax
	cmpb	$88, %al
	jne	.L10
	movl	$0, %eax
	jmp	.L9
.L10:
	cmpl	$0, 12(%ebp)
	jne	.L11
	cmpl	$1, 16(%ebp)
	jne	.L11
	movl	$1, %eax
	jmp	.L9
.L11:
	movl	12(%ebp), %eax
	sall	$3, %eax
	movl	%eax, %edx
	addl	8(%ebp), %edx
	movl	16(%ebp), %eax
	leal	(%edx,%eax), %eax
	movb	$88, (%eax)
	movl	16(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	find_path
	cmpl	$1, %eax
	jne	.L12
	movl	16(%ebp), %eax
	leal	1(%eax), %edx
	movl	$.LC3, %eax
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$1, %eax
	jmp	.L9
.L12:
	movl	16(%ebp), %eax
	subl	$1, %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	find_path
	cmpl	$1, %eax
	jne	.L13
	movl	16(%ebp), %eax
	leal	-1(%eax), %edx
	movl	$.LC3, %eax
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$1, %eax
	jmp	.L9
.L13:
	movl	12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	find_path
	cmpl	$1, %eax
	jne	.L14
	movl	12(%ebp), %eax
	leal	-1(%eax), %ecx
	movl	$.LC3, %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$1, %eax
	jmp	.L9
.L14:
	movl	12(%ebp), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	find_path
	cmpl	$1, %eax
	jne	.L15
	movl	12(%ebp), %eax
	leal	1(%eax), %ecx
	movl	$.LC3, %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$1, %eax
	jmp	.L9
.L15:
	movl	$0, %eax
.L9:
	leave
	ret
	.size	find_path, .-find_path
	.ident	"GCC: (Ubuntu/Linaro 4.5.2-8ubuntu4) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
