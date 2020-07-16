	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	_str_new                ## -- Begin function str_new
	.p2align	4, 0x90
_str_new:                               ## @str_new
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	incl	%edi
	callq	_malloc
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_dup                    ## -- Begin function dup
	.p2align	4, 0x90
_dup:                                   ## @dup
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	callq	_strlen
	movl	%eax, %edi
	callq	_str_new
	movq	%rax, %rbx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	_strcpy
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_cat                    ## -- Begin function cat
	.p2align	4, 0x90
_cat:                                   ## @cat
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %r15
	callq	_strlen
	movl	%eax, %r12d
	movq	%r14, %rdi
	callq	_strlen
	movl	%eax, %ebx
	addl	%r12d, %ebx
	movl	%ebx, %edi
	callq	_str_new
	movq	%rax, %rbp
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	_strcpy
	movslq	%r12d, %rdi
	addq	%rbp, %rdi
	movq	%r14, %rsi
	callq	_strcpy
	movslq	%ebx, %rax
	movb	$0, (%rbp,%rax)
	movq	%rbp, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_cat3                   ## -- Begin function cat3
	.p2align	4, 0x90
_cat3:                                  ## @cat3
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %rbp
	movq	%rdx, (%rsp)            ## 8-byte Spill
	movq	%rsi, %r15
	movq	%rdi, %r12
	callq	_strlen
	movl	%eax, %r13d
	movq	%r15, %rdi
	callq	_strlen
	movl	%eax, %ebx
	movq	%rbp, %rdi
	callq	_strlen
	movl	%eax, %ebp
	addl	%r13d, %ebx
	addl	%ebx, %ebp
	movl	%ebp, %edi
	callq	_str_new
	movq	%rax, %r14
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	_strcpy
	movslq	%r13d, %rdi
	addq	%r14, %rdi
	movq	%r15, %rsi
	callq	_strcpy
	movslq	%ebx, %rdi
	addq	%r14, %rdi
	movq	(%rsp), %rsi            ## 8-byte Reload
	callq	_strcpy
	movslq	%ebp, %rax
	movb	$0, (%r14,%rax)
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_cat4                   ## -- Begin function cat4
	.p2align	4, 0x90
_cat4:                                  ## @cat4
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, %r12
	movq	%rcx, 16(%rsp)          ## 8-byte Spill
	movq	%rdx, %rbx
	movq	%rdx, 8(%rsp)           ## 8-byte Spill
	movq	%rsi, %rbp
	movq	%rsi, (%rsp)            ## 8-byte Spill
	movq	%rdi, %r14
	callq	_strlen
	movl	%eax, %r15d
	movq	%rbp, %rdi
	callq	_strlen
	movl	%eax, %ebp
	movq	%rbx, %rdi
	callq	_strlen
	movl	%eax, %ebx
	movq	%r12, %rdi
	callq	_strlen
	movl	%eax, %r13d
	addl	%r15d, %ebp
	addl	%ebp, %ebx
	addl	%ebx, %r13d
	movl	%r13d, %edi
	callq	_str_new
	movq	%rax, %r12
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	_strcpy
	movslq	%r15d, %rdi
	addq	%r12, %rdi
	movq	(%rsp), %rsi            ## 8-byte Reload
	callq	_strcpy
	movslq	%ebp, %rdi
	addq	%r12, %rdi
	movq	8(%rsp), %rsi           ## 8-byte Reload
	callq	_strcpy
	movslq	%ebx, %rdi
	addq	%r12, %rdi
	movq	16(%rsp), %rsi          ## 8-byte Reload
	callq	_strcpy
	movslq	%r13d, %rax
	movb	$0, (%r12,%rax)
	movq	%r12, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_cat5                   ## -- Begin function cat5
	.p2align	4, 0x90
_cat5:                                  ## @cat5
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r8, %r13
	movq	%r8, 48(%rsp)           ## 8-byte Spill
	movq	%rcx, %r12
	movq	%rcx, 24(%rsp)          ## 8-byte Spill
	movq	%rdx, %rbp
	movq	%rdx, 40(%rsp)          ## 8-byte Spill
	movq	%rsi, %rbx
	movq	%rsi, 32(%rsp)          ## 8-byte Spill
	movq	%rdi, 16(%rsp)          ## 8-byte Spill
	callq	_strlen
	movl	%eax, 12(%rsp)          ## 4-byte Spill
	movq	%rbx, %rdi
	callq	_strlen
	movl	%eax, %r15d
	movq	%rbp, %rdi
	callq	_strlen
	movl	%eax, %r14d
	movq	%r12, %rdi
	callq	_strlen
	movl	%eax, %ebx
	movq	%r13, %rdi
	callq	_strlen
	movl	%eax, %ebp
	movl	12(%rsp), %r12d         ## 4-byte Reload
	addl	%r12d, %r15d
	addl	%r15d, %r14d
	addl	%r14d, %ebx
	addl	%ebx, %ebp
	movl	%ebp, %edi
	callq	_str_new
	movq	%rax, %r13
	movq	%rax, %rdi
	movq	16(%rsp), %rsi          ## 8-byte Reload
	callq	_strcpy
	movslq	%r12d, %rdi
	addq	%r13, %rdi
	movq	32(%rsp), %rsi          ## 8-byte Reload
	callq	_strcpy
	movslq	%r15d, %rdi
	addq	%r13, %rdi
	movq	40(%rsp), %rsi          ## 8-byte Reload
	callq	_strcpy
	movslq	%r14d, %rdi
	addq	%r13, %rdi
	movq	24(%rsp), %rsi          ## 8-byte Reload
	callq	_strcpy
	movslq	%ebx, %rdi
	addq	%r13, %rdi
	movq	48(%rsp), %rsi          ## 8-byte Reload
	callq	_strcpy
	movslq	%ebp, %rax
	movb	$0, (%r13,%rax)
	movq	%r13, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_assert                 ## -- Begin function assert
	.p2align	4, 0x90
_assert:                                ## @assert
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	testb	$1, %dil
	jne	LBB6_2
## %bb.1:                               ## %then_0
	movq	__func7_str1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movl	$1, %edi
	callq	_exit
LBB6_2:                                 ## %endif_0
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_prepart                ## -- Begin function prepart
	.p2align	4, 0x90
_prepart:                               ## @prepart
	.cfi_startproc
## %bb.0:
	movl	$0, -4(%rsp)
	movl	$0, -8(%rsp)
	movslq	-8(%rsp), %rax
	cmpb	$0, (%rdi,%rax)
	jne	LBB7_2
	jmp	LBB7_5
	.p2align	4, 0x90
LBB7_4:                                 ## %endif_0
                                        ##   in Loop: Header=BB7_2 Depth=1
	incl	-8(%rsp)
	movslq	-8(%rsp), %rax
	cmpb	$0, (%rdi,%rax)
	je	LBB7_5
LBB7_2:                                 ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movslq	-8(%rsp), %rax
	movzbl	(%rdi,%rax), %eax
	movq	__func8_str1(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB7_4
## %bb.3:                               ## %then_0
                                        ##   in Loop: Header=BB7_2 Depth=1
	movl	-8(%rsp), %eax
	incl	%eax
	movl	%eax, -4(%rsp)
	jmp	LBB7_4
LBB7_5:                                 ## %break_0
	movl	-4(%rsp), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_getprefix              ## -- Begin function getprefix
	.p2align	4, 0x90
_getprefix:                             ## @getprefix
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	callq	_prepart
	movl	%eax, %r15d
	leal	1(%r15), %edi
	callq	_malloc
	movq	%rax, %rbx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	%r15d, %edx
	callq	_memcpy
	movslq	%r15d, %rax
	movb	$0, (%rbx,%rax)
	movq	%rbx, %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_last               ## -- Begin function get_last
	.p2align	4, 0x90
_get_last:                              ## @get_last
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	callq	_prepart
	movl	%eax, %r14d
	movq	%r15, %rdi
	callq	_strlen
	movl	%eax, %ebp
	subl	%r14d, %ebp
	leal	1(%rbp), %edi
	callq	_malloc
	movq	%rax, %rbx
	movslq	%r14d, %rsi
	addq	%r15, %rsi
	movq	%rax, %rdi
	movl	%ebp, %edx
	callq	_memcpy
	movslq	%ebp, %rax
	movb	$0, (%rbx,%rax)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_exists                 ## -- Begin function exists
	.p2align	4, 0x90
_exists:                                ## @exists
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	xorl	%esi, %esi
	callq	_open
	testl	%eax, %eax
	js	LBB10_1
## %bb.2:                               ## %else_0
	movl	%eax, %edi
	callq	_close
	movb	$1, %al
	popq	%rcx
	retq
LBB10_1:                                ## %then_0
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_isdir                  ## -- Begin function isdir
	.p2align	4, 0x90
_isdir:                                 ## @isdir
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_opendir
	testq	%rax, %rax
	je	LBB11_1
## %bb.2:                               ## %else_0
	movq	%rax, %rdi
	callq	_closedir
	movb	$1, %al
	popq	%rcx
	retq
LBB11_1:                                ## %then_0
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_node_init              ## -- Begin function node_init
	.p2align	4, 0x90
_node_init:                             ## @node_init
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	xorl	%esi, %esi
	movl	$32, %edx
	callq	_memset
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_node_new               ## -- Begin function node_new
	.p2align	4, 0x90
_node_new:                              ## @node_new
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movl	$32, %edi
	callq	_malloc
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	_node_init
	movq	%rbx, %rax
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_node_append            ## -- Begin function node_append
	.p2align	4, 0x90
_node_append:                           ## @node_append
	.cfi_startproc
## %bb.0:
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	LBB14_2
## %bb.1:                               ## %then_0
	movq	%rax, 8(%rsi)
	movq	%rsi, (%rax)
LBB14_2:                                ## %endif_0
	movq	%rsi, 8(%rdi)
	movq	%rdi, (%rsi)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_node_exclude           ## -- Begin function node_exclude
	.p2align	4, 0x90
_node_exclude:                          ## @node_exclude
	.cfi_startproc
## %bb.0:
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	testq	%rax, %rax
	je	LBB15_2
## %bb.1:                               ## %then_0
	movq	%rcx, 8(%rax)
LBB15_2:                                ## %endif_0
	testq	%rcx, %rcx
	je	LBB15_4
## %bb.3:                               ## %then_1
	movq	%rax, (%rcx)
LBB15_4:                                ## %endif_1
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_node_foreach           ## -- Begin function node_foreach
	.p2align	4, 0x90
_node_foreach:                          ## @node_foreach
	.cfi_startproc
## %bb.0:
	testq	%rdi, %rdi
	je	LBB16_5
## %bb.1:                               ## %else_0
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rsp, %rax
	leaq	-16(%rax), %rbx
	movq	%rbx, %rsp
	movq	%rdi, -16(%rax)
	movq	%rsp, %rax
	leaq	-16(%rax), %r12
	movq	%r12, %rsp
	movl	$0, -16(%rax)
	cmpq	$0, (%rbx)
	je	LBB16_4
	.p2align	4, 0x90
LBB16_3:                                ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	movl	(%r12), %edx
	movq	%r14, %rsi
	callq	*%r15
	movq	(%rbx), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rbx)
	incl	(%r12)
	cmpq	$0, (%rbx)
	jne	LBB16_3
LBB16_4:                                ## %break_0
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
LBB16_5:                                ## %then_0
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_node_search            ## -- Begin function node_search
	.p2align	4, 0x90
_node_search:                           ## @node_search
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testq	%rdi, %rdi
	je	LBB17_1
## %bb.3:                               ## %else_0
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rsp, %rax
	leaq	-16(%rax), %rbx
	movq	%rbx, %rsp
	movq	%rdi, -16(%rax)
	movq	%rsp, %rax
	leaq	-16(%rax), %r12
	movq	%r12, %rsp
	movl	$0, -16(%rax)
	cmpq	$0, (%rbx)
	jne	LBB17_5
	jmp	LBB17_1
	.p2align	4, 0x90
LBB17_7:                                ## %else_1
                                        ##   in Loop: Header=BB17_5 Depth=1
	movq	(%rbx), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rbx)
	incl	(%r12)
	cmpq	$0, (%rbx)
	je	LBB17_1
LBB17_5:                                ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	movl	(%r12), %edx
	movq	%r14, %rsi
	callq	*%r15
	testb	$1, %al
	je	LBB17_7
## %bb.6:                               ## %then_1
	movq	(%rbx), %rax
	jmp	LBB17_2
LBB17_1:                                ## %then_0
	xorl	%eax, %eax
LBB17_2:                                ## %then_0
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__func20                ## -- Begin function _func20
	.p2align	4, 0x90
__func20:                               ## @_func20
	.cfi_startproc
## %bb.0:
	cmpq	%rsi, 24(%rdi)
	sete	%al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_node_search_by_data    ## -- Begin function node_search_by_data
	.p2align	4, 0x90
_node_search_by_data:                   ## @node_search_by_data
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rax
	leaq	__func20(%rip), %rsi
	movq	%rax, %rdx
	callq	_node_search
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_init              ## -- Begin function list_init
	.p2align	4, 0x90
_list_init:                             ## @list_init
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	xorl	%esi, %esi
	movl	$24, %edx
	callq	_memset
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_new               ## -- Begin function list_new
	.p2align	4, 0x90
_list_new:                              ## @list_new
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movl	$24, %edi
	callq	_malloc
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	_list_init
	movq	%rbx, %rax
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_append            ## -- Begin function list_append
	.p2align	4, 0x90
_list_append:                           ## @list_append
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	testq	%rdi, %rdi
	je	LBB22_2
## %bb.1:
	movq	%rsi, %r15
	testq	%rsi, %rsi
	je	LBB22_2
## %bb.4:                               ## %else_0
	movq	%rdi, %rbx
	callq	_node_new
	movq	%rax, %r14
	movq	%r15, 24(%rax)
	cmpq	$0, (%rbx)
	je	LBB22_5
## %bb.6:                               ## %else_1
	movq	8(%rbx), %rdi
	movq	%r14, %rsi
	callq	_node_append
	jmp	LBB22_7
LBB22_2:                                ## %then_0
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB22_5:                                ## %then_1
	movq	%r14, (%rbx)
LBB22_7:                                ## %endif_1
	movq	%r14, 8(%rbx)
	incq	16(%rbx)
	movb	$1, %al
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_extend            ## -- Begin function list_extend
	.p2align	4, 0x90
_list_extend:                           ## @list_extend
	.cfi_startproc
## %bb.0:
	testq	%rdi, %rdi
	je	LBB23_7
## %bb.1:
	testq	%rsi, %rsi
	je	LBB23_7
## %bb.2:                               ## %else_0
	movq	8(%rdi), %rax
	movq	16(%rsi), %rcx
	addq	%rcx, 16(%rdi)
	testq	%rax, %rax
	je	LBB23_8
## %bb.3:                               ## %else_1
	movq	(%rsi), %rcx
	movq	%rcx, 8(%rax)
	cmpq	$0, (%rsi)
	je	LBB23_6
## %bb.4:                               ## %else_1
	movq	8(%rsi), %rcx
	testq	%rcx, %rcx
	je	LBB23_6
## %bb.5:                               ## %then_2
	movq	(%rsi), %rcx
	movq	%rax, (%rcx)
	movq	8(%rsi), %rax
	movq	%rax, 8(%rdi)
LBB23_6:                                ## %endif_2
	movb	$1, %al
	retq
LBB23_7:                                ## %then_0
	xorl	%eax, %eax
	retq
LBB23_8:                                ## %then_1
	movq	(%rsi), %rax
	movq	%rax, (%rdi)
	movq	8(%rsi), %rax
	movq	%rax, 8(%rdi)
	movb	$1, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_subst             ## -- Begin function list_subst
	.p2align	4, 0x90
_list_subst:                            ## @list_subst
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdx, %rbx
	movq	(%rdi), %rdi
	callq	_node_search_by_data
	testq	%rax, %rax
	je	LBB24_1
## %bb.2:                               ## %else_0
	movq	%rbx, 24(%rax)
	movb	$1, %al
	popq	%rbx
	retq
LBB24_1:                                ## %then_0
	xorl	%eax, %eax
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_node_remove       ## -- Begin function list_node_remove
	.p2align	4, 0x90
_list_node_remove:                      ## @list_node_remove
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	(%rsi), %r15
	movq	8(%rsi), %r12
	movq	%rsi, %rdi
	callq	_node_exclude
	cmpq	%rbx, (%r14)
	je	LBB25_1
## %bb.2:                               ## %endif_0
	cmpq	%rbx, 8(%r14)
	je	LBB25_3
LBB25_4:                                ## %endif_1
	movq	%rbx, %rdi
	callq	_free
	decq	16(%r14)
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
LBB25_1:                                ## %then_0
	movq	%r12, (%r14)
	cmpq	%rbx, 8(%r14)
	jne	LBB25_4
LBB25_3:                                ## %then_1
	movq	%r15, 8(%r14)
	jmp	LBB25_4
	.cfi_endproc
                                        ## -- End function
	.globl	_list_remove            ## -- Begin function list_remove
	.p2align	4, 0x90
_list_remove:                           ## @list_remove
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	callq	_node_search_by_data
	testq	%rax, %rax
	je	LBB26_1
## %bb.2:                               ## %else_0
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_list_node_remove
	movb	$1, %al
	popq	%rbx
	retq
LBB26_1:                                ## %then_0
	xorl	%eax, %eax
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_foreach           ## -- Begin function list_foreach
	.p2align	4, 0x90
_list_foreach:                          ## @list_foreach
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movl	$0, 12(%rsp)
	movq	(%rdi), %rax
	movq	%rax, 16(%rsp)
	cmpq	$0, 16(%rsp)
	je	LBB27_3
	.p2align	4, 0x90
LBB27_2:                                ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rax
	movq	24(%rax), %rdi
	movl	12(%rsp), %edx
	movq	%r14, %rsi
	callq	*%rbx
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rsp)
	incl	12(%rsp)
	cmpq	$0, 16(%rsp)
	jne	LBB27_2
LBB27_3:                                ## %break_0
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_foreach2          ## -- Begin function list_foreach2
	.p2align	4, 0x90
_list_foreach2:                         ## @list_foreach2
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rcx, %r14
	movq	%rdx, %rbx
	movq	(%rdi), %rax
	movq	%rax, 16(%rsp)
	movq	(%rsi), %rax
	movq	%rax, 8(%rsp)
	movl	$0, 4(%rsp)
	cmpq	$0, 16(%rsp)
	jne	LBB28_2
	jmp	LBB28_4
	.p2align	4, 0x90
LBB28_3:                                ## %body_0
                                        ##   in Loop: Header=BB28_2 Depth=1
	movq	16(%rsp), %rax
	movq	24(%rax), %rdi
	movq	8(%rsp), %rax
	movq	24(%rax), %rsi
	movl	4(%rsp), %ecx
	movq	%r14, %rdx
	callq	*%rbx
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rsp)
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 8(%rsp)
	incl	4(%rsp)
	cmpq	$0, 16(%rsp)
	je	LBB28_4
LBB28_2:                                ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	testq	%rax, %rax
	jne	LBB28_3
LBB28_4:                                ## %break_0
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_compare           ## -- Begin function list_compare
	.p2align	4, 0x90
_list_compare:                          ## @list_compare
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	16(%rdi), %rax
	cmpq	16(%rsi), %rax
	jne	LBB29_1
## %bb.3:                               ## %else_0
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsp, %rax
	leaq	-16(%rax), %r12
	movq	%r12, %rsp
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rbx
	movq	%rbx, %rsp
	movq	(%rdi), %rdx
	movq	%rdx, -16(%rax)
	movq	(%rsi), %rax
	movq	%rax, -16(%rcx)
	movq	%rsp, %rax
	leaq	-16(%rax), %r13
	movq	%r13, %rsp
	movl	$0, -16(%rax)
	cmpq	$0, (%r12)
	jne	LBB29_5
	jmp	LBB29_8
	.p2align	4, 0x90
LBB29_7:                                ## %else_1
                                        ##   in Loop: Header=BB29_5 Depth=1
	movq	(%r12), %rax
	movq	8(%rax), %rax
	movq	%rax, (%r12)
	movq	(%rbx), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rbx)
	incl	(%r13)
	cmpq	$0, (%r12)
	je	LBB29_8
LBB29_5:                                ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	LBB29_8
## %bb.6:                               ## %body_0
                                        ##   in Loop: Header=BB29_5 Depth=1
	movq	(%r12), %rax
	movq	24(%rax), %rdi
	movq	(%rbx), %rax
	movq	24(%rax), %rsi
	movl	(%r13), %ecx
	movq	%r14, %rdx
	callq	*%r15
	testb	$1, %al
	jne	LBB29_7
LBB29_1:                                ## %then_0
	xorl	%eax, %eax
	jmp	LBB29_2
LBB29_8:                                ## %break_0
	movb	$1, %al
LBB29_2:                                ## %then_0
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_search            ## -- Begin function list_search
	.p2align	4, 0x90
_list_search:                           ## @list_search
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testq	%rdi, %rdi
	je	LBB30_1
## %bb.3:                               ## %else_0
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rsp, %rax
	leaq	-16(%rax), %rbx
	movq	%rbx, %rsp
	movq	(%rdi), %rcx
	movq	%rcx, -16(%rax)
	movq	%rsp, %rax
	leaq	-16(%rax), %r12
	movq	%r12, %rsp
	movl	$0, -16(%rax)
	cmpq	$0, (%rbx)
	jne	LBB30_5
	jmp	LBB30_1
	.p2align	4, 0x90
LBB30_7:                                ## %else_1
                                        ##   in Loop: Header=BB30_5 Depth=1
	movq	(%rbx), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rbx)
	incl	(%r12)
	cmpq	$0, (%rbx)
	je	LBB30_1
LBB30_5:                                ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rax
	movq	24(%rax), %rdi
	movl	(%r12), %edx
	movq	%r14, %rsi
	callq	*%r15
	testb	$1, %al
	je	LBB30_7
## %bb.6:                               ## %then_1
	movq	(%rbx), %rax
	movq	24(%rax), %rax
	jmp	LBB30_2
LBB30_1:                                ## %then_0
	xorl	%eax, %eax
LBB30_2:                                ## %then_0
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_map               ## -- Begin function list_map
	.p2align	4, 0x90
_list_map:                              ## @list_map
	.cfi_startproc
## %bb.0:
	testq	%rdi, %rdi
	je	LBB31_7
## %bb.1:                               ## %else_0
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r12
	movq	%rsp, %rax
	leaq	-16(%rax), %r13
	movq	%r13, %rsp
	movl	$0, -16(%rax)
	movq	%rsp, %rax
	leaq	-16(%rax), %rbx
	movq	%rbx, %rsp
	movq	(%rdi), %rcx
	movq	%rcx, -16(%rax)
	callq	_list_new
	movq	%rax, %r15
	cmpq	$0, (%rbx)
	jne	LBB31_3
	jmp	LBB31_6
	.p2align	4, 0x90
LBB31_5:                                ## %endif_1
                                        ##   in Loop: Header=BB31_3 Depth=1
	incl	(%r13)
	movq	(%rbx), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rbx)
	cmpq	$0, (%rbx)
	je	LBB31_6
LBB31_3:                                ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rax
	movq	24(%rax), %rdi
	movl	(%r13), %edx
	movq	%r14, %rsi
	callq	*%r12
	testq	%rax, %rax
	je	LBB31_5
## %bb.4:                               ## %then_1
                                        ##   in Loop: Header=BB31_3 Depth=1
	movq	%r15, %rdi
	movq	%rax, %rsi
	callq	_list_append
	jmp	LBB31_5
LBB31_6:                                ## %break_0
	movq	%r15, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB31_7:                                ## %then_0
	xorl	%eax, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_map_append             ## -- Begin function map_append
	.p2align	4, 0x90
_map_append:                            ## @map_append
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	testq	%rdi, %rdi
	je	LBB32_3
## %bb.1:
	movq	%rsi, %r15
	testq	%rsi, %rsi
	je	LBB32_3
## %bb.2:
	movq	%rdx, %r14
	testq	%rdx, %rdx
	je	LBB32_3
## %bb.5:                               ## %else_0
	movq	%rdi, %rbx
	callq	_node_new
	movq	%rax, %r12
	movq	%r15, 16(%rax)
	movq	%r14, 24(%rax)
	cmpq	$0, (%rbx)
	je	LBB32_6
## %bb.7:                               ## %else_1
	movq	8(%rbx), %rdi
	movq	%r12, %rsi
	callq	_node_append
	jmp	LBB32_8
LBB32_3:                                ## %then_0
	xorl	%eax, %eax
	jmp	LBB32_4
LBB32_6:                                ## %then_1
	movq	%r12, (%rbx)
LBB32_8:                                ## %endif_1
	movq	%r12, 8(%rbx)
	incq	16(%rbx)
	movb	$1, %al
LBB32_4:                                ## %then_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_f                      ## -- Begin function f
	.p2align	4, 0x90
_f:                                     ## @f
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	16(%rdi), %rdi
	callq	_strcmp
	testl	%eax, %eax
	sete	%al
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_map_list_node_get      ## -- Begin function map_list_node_get
	.p2align	4, 0x90
_map_list_node_get:                     ## @map_list_node_get
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rax
	movq	(%rdi), %rdi
	leaq	_f(%rip), %rsi
	movq	%rax, %rdx
	callq	_node_search
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_map_reset              ## -- Begin function map_reset
	.p2align	4, 0x90
_map_reset:                             ## @map_reset
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdx, %rbx
	callq	_map_list_node_get
	movq	%rbx, 24(%rax)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_map_remove             ## -- Begin function map_remove
	.p2align	4, 0x90
_map_remove:                            ## @map_remove
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	callq	_map_list_node_get
	testq	%rax, %rax
	je	LBB36_1
## %bb.3:                               ## %else_0
	movq	24(%rax), %r14
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_list_node_remove
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB36_1:                                ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_map_get                ## -- Begin function map_get
	.p2align	4, 0x90
_map_get:                               ## @map_get
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_map_list_node_get
	testq	%rax, %rax
	je	LBB37_2
## %bb.1:                               ## %then_0
	movq	24(%rax), %rax
	popq	%rcx
	retq
LBB37_2:                                ## %else_0
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_map_foreach            ## -- Begin function map_foreach
	.p2align	4, 0x90
_map_foreach:                           ## @map_foreach
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movq	(%rdi), %rax
	movq	%rax, (%rsp)
	cmpq	$0, (%rsp)
	je	LBB38_3
	.p2align	4, 0x90
LBB38_2:                                ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	movq	16(%rax), %rdi
	movq	24(%rax), %rsi
	movq	%r14, %rdx
	callq	*%rbx
	movq	(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rsp)
	cmpq	$0, (%rsp)
	jne	LBB38_2
LBB38_3:                                ## %break_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_set                    ## -- Begin function set
	.p2align	4, 0x90
_set:                                   ## @set
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movl	$8, %edi
	callq	_malloc
	movq	%rax, %r15
	movq	%rbx, (%rax)
	movq	_settings(%rip), %rdi
	movq	%r14, %rsi
	callq	_map_get
	testq	%rax, %rax
	je	LBB39_1
## %bb.2:                               ## %else_0
	movq	_settings(%rip), %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	_map_reset
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB39_1:                                ## %then_0
	movq	%rax, %rdi
	callq	_free
	movq	_settings(%rip), %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	_map_append
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get                    ## -- Begin function get
	.p2align	4, 0x90
_get:                                   ## @get
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movq	_settings(%rip), %rdi
	movq	%rax, %rsi
	callq	_map_get
	movq	(%rax), %rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_isalpha                ## -- Begin function isalpha
	.p2align	4, 0x90
_isalpha:                               ## @isalpha
	.cfi_startproc
## %bb.0:
	movq	__func42_str1(%rip), %rax
	cmpb	(%rax), %dil
	setae	%al
	movq	__func42_str2(%rip), %rcx
	cmpb	(%rcx), %dil
	setbe	%cl
	andb	%al, %cl
	movq	__func42_str3(%rip), %rax
	cmpb	(%rax), %dil
	setae	%dl
	movq	__func42_str4(%rip), %rax
	cmpb	(%rax), %dil
	setbe	%al
	andb	%dl, %al
	orb	%cl, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_isdigit                ## -- Begin function isdigit
	.p2align	4, 0x90
_isdigit:                               ## @isdigit
	.cfi_startproc
## %bb.0:
	movq	__func43_str1(%rip), %rax
	cmpb	(%rax), %dil
	setae	%cl
	movq	__func43_str2(%rip), %rax
	cmpb	(%rax), %dil
	setbe	%al
	andb	%cl, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_isalnum                ## -- Begin function isalnum
	.p2align	4, 0x90
_isalnum:                               ## @isalnum
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	callq	_isalpha
	movl	%eax, %ebp
	movl	%ebx, %edi
	callq	_isdigit
	orb	%bpl, %al
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_lex_init               ## -- Begin function lex_init
	.p2align	4, 0x90
_lex_init:                              ## @lex_init
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	_exists
	testb	$1, %al
	jne	LBB44_2
## %bb.1:                               ## %then_0
	movq	__func45_str1(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	_printf
	movq	__func45_str2(%rip), %rdi
	callq	_fatal
LBB44_2:                                ## %endif_0
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_open
	movl	%eax, _lstate(%rip)
	movq	%rbx, _lstate+280(%rip)
	movl	$1, _lstate+268(%rip)
	movw	$1, _lstate+262(%rip)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_getcc                  ## -- Begin function getcc
	.p2align	4, 0x90
_getcc:                                 ## @getcc
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	cmpb	$0, _lstate+288(%rip)
	je	LBB45_2
## %bb.1:                               ## %then_0
	movb	_lstate+288(%rip), %al
	movb	%al, 7(%rsp)
	movb	$0, _lstate+288(%rip)
	movb	7(%rsp), %al
	popq	%rcx
	retq
LBB45_2:                                ## %else_0
	movl	_lstate(%rip), %edi
	leaq	7(%rsp), %rsi
	movl	$1, %edx
	callq	_read
	testl	%eax, %eax
	je	LBB45_5
## %bb.3:                               ## %else_1
	incw	_lstate+262(%rip)
	movb	7(%rsp), %al
	popq	%rcx
	retq
LBB45_5:                                ## %then_1
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_fill                   ## -- Begin function fill
	.p2align	4, 0x90
_fill:                                  ## @fill
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	leaq	_lstate(%rip), %r15
	callq	_getcc
	movl	%eax, %ebx
	testb	%al, %al
	jne	LBB46_3
	jmp	LBB46_2
	.p2align	4, 0x90
LBB46_6:                                ## %endif_2
                                        ##   in Loop: Header=BB46_3 Depth=1
	incl	_lstate+264(%rip)
	callq	_getcc
	movl	%eax, %ebx
	testb	%al, %al
	jne	LBB46_3
LBB46_2:                                ## %then_0
	movq	__func47_str1(%rip), %rdi
	callq	_fatal
	movl	$1, %edi
	callq	_exit
LBB46_3:                                ## %endif_0
                                        ## =>This Inner Loop Header: Depth=1
	movzbl	%bl, %ebp
	movl	%ebp, %edi
	callq	*%r14
	testb	$1, %al
	je	LBB46_7
## %bb.4:                               ## %then_1
                                        ##   in Loop: Header=BB46_3 Depth=1
	movslq	_lstate+264(%rip), %rax
	movb	%bl, 6(%rax,%r15)
	cmpl	$255, _lstate+264(%rip)
	jb	LBB46_6
## %bb.5:                               ## %then_2
                                        ##   in Loop: Header=BB46_3 Depth=1
	movq	__func47_str2(%rip), %rdi
	callq	_fatal
	jmp	LBB46_6
LBB46_7:                                ## %else_1
	movl	%ebp, %edi
	callq	_lex_putback
	movslq	_lstate+264(%rip), %rax
	movb	$0, 6(%rax,%r15)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_blank                  ## -- Begin function blank
	.p2align	4, 0x90
_blank:                                 ## @blank
	.cfi_startproc
## %bb.0:
	movq	__func48_str1(%rip), %rax
	cmpb	(%rax), %dil
	sete	%cl
	movq	__func48_str2(%rip), %rax
	cmpb	(%rax), %dil
	sete	%al
	orb	%cl, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_minus                  ## -- Begin function minus
	.p2align	4, 0x90
_minus:                                 ## @minus
	.cfi_startproc
## %bb.0:
	movq	__func49_str1(%rip), %rax
	cmpb	(%rax), %dil
	sete	%al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_slash                  ## -- Begin function slash
	.p2align	4, 0x90
_slash:                                 ## @slash
	.cfi_startproc
## %bb.0:
	movq	__func50_str1(%rip), %rax
	cmpb	(%rax), %dil
	sete	%cl
	movq	__func50_str2(%rip), %rax
	cmpb	(%rax), %dil
	sete	%al
	orb	%cl, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_rarrow                 ## -- Begin function rarrow
	.p2align	4, 0x90
_rarrow:                                ## @rarrow
	.cfi_startproc
## %bb.0:
	movq	__func51_str1(%rip), %rax
	cmpb	(%rax), %dil
	sete	%cl
	movq	__func51_str2(%rip), %rax
	cmpb	(%rax), %dil
	sete	%al
	orb	%cl, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_larrow                 ## -- Begin function larrow
	.p2align	4, 0x90
_larrow:                                ## @larrow
	.cfi_startproc
## %bb.0:
	movq	__func52_str1(%rip), %rax
	cmpb	(%rax), %dil
	sete	%cl
	movq	__func52_str2(%rip), %rax
	cmpb	(%rax), %dil
	sete	%al
	orb	%cl, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eq                     ## -- Begin function eq
	.p2align	4, 0x90
_eq:                                    ## @eq
	.cfi_startproc
## %bb.0:
	movq	__func53_str1(%rip), %rax
	cmpb	(%rax), %dil
	sete	%al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bang                   ## -- Begin function bang
	.p2align	4, 0x90
_bang:                                  ## @bang
	.cfi_startproc
## %bb.0:
	movq	__func54_str1(%rip), %rax
	cmpb	(%rax), %dil
	sete	%al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_id                     ## -- Begin function id
	.p2align	4, 0x90
_id:                                    ## @id
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movl	%edi, %ebx
	callq	_isalnum
	movq	__func55_str1(%rip), %rcx
	cmpb	(%rcx), %bl
	sete	%cl
	orb	%cl, %al
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_digit                  ## -- Begin function digit
	.p2align	4, 0x90
_digit:                                 ## @digit
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_isalnum
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_cpp_com                ## -- Begin function cpp_com
	.p2align	4, 0x90
_cpp_com:                               ## @cpp_com
	.cfi_startproc
## %bb.0:
	movq	__func57_str1(%rip), %rax
	cmpb	(%rax), %dil
	setne	%al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_gettoken               ## -- Begin function gettoken
	.p2align	4, 0x90
_gettoken:                              ## @gettoken
	.cfi_startproc
## %bb.0:                               ## %again
	pushq	%rax
	.cfi_def_cfa_offset 16
	movzwl	_lstate+4(%rip), %eax
	cmpl	$7, %eax
	jne	LBB57_2
## %bb.1:                               ## %then_0
	callq	_linecnt
	movw	$0, _lstate+262(%rip)
LBB57_2:                                ## %endif_0
	movw	$0, _lstate+4(%rip)
	movl	$0, _lstate+264(%rip)
	.p2align	4, 0x90
LBB57_3:                                ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_getcc
	movb	%al, 7(%rsp)
	movzbl	7(%rsp), %edi
	callq	_blank
	testb	$1, %al
	jne	LBB57_3
## %bb.4:                               ## %break_0
	movzwl	_lstate+262(%rip), %eax
	movw	%ax, _lstate+272(%rip)
	movb	7(%rsp), %al
	movb	%al, _lstate+6(%rip)
	movl	$1, _lstate+264(%rip)
	movzbl	7(%rsp), %edi
	callq	_isalpha
	testb	$1, %al
	jne	LBB57_8
## %bb.5:                               ## %break_0
	movq	__func58_str1(%rip), %rax
	movb	(%rax), %al
	cmpb	%al, 7(%rsp)
	je	LBB57_8
## %bb.6:                               ## %else_2
	movzbl	7(%rsp), %edi
	callq	_isdigit
	testb	$1, %al
	je	LBB57_12
## %bb.7:                               ## %then_3
	movw	$2, _lstate+4(%rip)
	leaq	_digit(%rip), %rdi
	jmp	LBB57_10
LBB57_8:                                ## %then_2
	movw	$1, _lstate+4(%rip)
LBB57_9:                                ## %endif_2
	leaq	_id(%rip), %rdi
LBB57_10:                               ## %endif_2
	callq	_fill
LBB57_11:                               ## %endif_2
	leaq	_lstate(%rip), %rax
	movslq	_lstate+264(%rip), %rcx
	movb	$0, 6(%rcx,%rax)
	movzwl	_lstate+4(%rip), %eax
	popq	%rcx
	retq
LBB57_12:                               ## %else_3
	movw	$3, _lstate+4(%rip)
	movb	7(%rsp), %al
	movq	__func58_str2(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB57_14
## %bb.13:                              ## %then_4
	movw	$7, _lstate+4(%rip)
	jmp	LBB57_11
LBB57_14:                               ## %else_4
	movb	7(%rsp), %al
	movq	__func58_str3(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB57_16
## %bb.15:                              ## %then_5
	leaq	_eq(%rip), %rdi
	jmp	LBB57_10
LBB57_16:                               ## %else_5
	movb	7(%rsp), %al
	movq	__func58_str4(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB57_18
## %bb.17:                              ## %then_6
	leaq	_minus(%rip), %rdi
	jmp	LBB57_10
LBB57_18:                               ## %else_6
	movb	7(%rsp), %al
	movq	__func58_str5(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB57_20
## %bb.19:                              ## %then_7
	callq	_xslash
	jmp	LBB57_11
LBB57_20:                               ## %else_7
	movb	7(%rsp), %al
	movq	__func58_str6(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB57_22
## %bb.21:                              ## %then_8
	leaq	_rarrow(%rip), %rdi
	jmp	LBB57_10
LBB57_22:                               ## %else_8
	movb	7(%rsp), %al
	movq	__func58_str7(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB57_24
## %bb.23:                              ## %then_9
	leaq	_larrow(%rip), %rdi
	jmp	LBB57_10
LBB57_24:                               ## %else_9
	movb	7(%rsp), %al
	movq	__func58_str8(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB57_26
## %bb.25:                              ## %then_10
	leaq	_bang(%rip), %rdi
	jmp	LBB57_10
LBB57_26:                               ## %else_10
	movb	7(%rsp), %al
	movq	__func58_str9(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB57_28
## %bb.27:                              ## %then_11
	movw	$5, _lstate+4(%rip)
	jmp	LBB57_9
LBB57_28:                               ## %else_11
	movb	7(%rsp), %al
	movq	__func58_str10(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB57_30
## %bb.29:                              ## %then_12
	callq	_string
	jmp	LBB57_11
LBB57_30:                               ## %else_12
	cmpb	$0, 7(%rsp)
	jne	LBB57_11
## %bb.31:                              ## %then_13
	movw	$0, _lstate+4(%rip)
	movb	$0, _lstate+6(%rip)
	movl	$0, _lstate+264(%rip)
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_xslash                 ## -- Begin function xslash
	.p2align	4, 0x90
_xslash:                                ## @xslash
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	callq	_getcc
	movq	__func59_str1(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB58_2
## %bb.1:                               ## %then_0
	movzbl	%al, %edi
	callq	_lex_putback
	leaq	_cpp_com(%rip), %rdi
	callq	_fill
	movw	$6, _lstate+4(%rip)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB58_2:                                ## %else_0
	movq	__func59_str2(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB58_12
## %bb.3:                               ## %then_1
	movw	$6, _lstate+4(%rip)
	movb	$0, _lstate+6(%rip)
	movq	__func59_str4(%rip), %rax
	movb	(%rax), %bl
	movq	__func59_str5(%rip), %rax
	movb	(%rax), %bpl
	jmp	LBB58_4
	.p2align	4, 0x90
LBB58_5:                                ## %then_2
                                        ##   in Loop: Header=BB58_4 Depth=1
	movq	__func59_str3(%rip), %rdi
	callq	_fatal
LBB58_4:                                ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_getcc
	movb	%al, 7(%rsp)
	testb	%al, %al
	je	LBB58_5
## %bb.6:                               ## %else_2
                                        ##   in Loop: Header=BB58_4 Depth=1
	cmpb	%bl, 7(%rsp)
	jne	LBB58_10
## %bb.7:                               ## %then_3
                                        ##   in Loop: Header=BB58_4 Depth=1
	callq	_getcc
	movb	%al, 7(%rsp)
	cmpb	%bpl, %al
	je	LBB58_8
## %bb.9:                               ## %else_4
                                        ##   in Loop: Header=BB58_4 Depth=1
	movzbl	7(%rsp), %edi
	callq	_lex_putback
	jmp	LBB58_4
	.p2align	4, 0x90
LBB58_10:                               ## %else_3
                                        ##   in Loop: Header=BB58_4 Depth=1
	movzbl	7(%rsp), %eax
	movq	__func59_str6(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB58_4
## %bb.11:                              ## %then_5
                                        ##   in Loop: Header=BB58_4 Depth=1
	callq	_linecnt
	jmp	LBB58_4
LBB58_12:                               ## %else_1
	movzbl	%al, %edi
	callq	_lex_putback
	leaq	_slash(%rip), %rdi
	callq	_fill
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB58_8:                                ## %then_4
	leaq	_lstate(%rip), %rax
	movslq	_lstate+264(%rip), %rcx
	movb	$0, 6(%rcx,%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_string                 ## -- Begin function string
	.p2align	4, 0x90
_string:                                ## @string
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movw	$4, _lstate+4(%rip)
	movl	$0, _lstate+264(%rip)
	movq	__func60_str1(%rip), %rax
	movb	(%rax), %bl
	leaq	_lstate(%rip), %r14
	callq	_getcc
	movb	%al, 7(%rsp)
	cmpb	%bl, %al
	jne	LBB59_2
LBB59_27:                               ## %break_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.p2align	4, 0x90
LBB59_26:                               ## %endif_12
                                        ##   in Loop: Header=BB59_2 Depth=1
	movslq	_lstate+264(%rip), %rax
	movzbl	7(%rsp), %ecx
	movb	%cl, 6(%rax,%r14)
	incl	_lstate+264(%rip)
	callq	_getcc
	movb	%al, 7(%rsp)
	cmpb	%bl, %al
	je	LBB59_27
LBB59_2:                                ## %else_0
                                        ## =>This Inner Loop Header: Depth=1
	cmpb	$0, 7(%rsp)
	je	LBB59_3
## %bb.4:                               ## %else_1
                                        ##   in Loop: Header=BB59_2 Depth=1
	movzbl	7(%rsp), %eax
	movq	__func60_str3(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB59_24
## %bb.5:                               ## %then_2
                                        ##   in Loop: Header=BB59_2 Depth=1
	callq	_getcc
	movb	%al, 7(%rsp)
	movq	__func60_str4(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB59_8
## %bb.6:                               ## %then_3
                                        ##   in Loop: Header=BB59_2 Depth=1
	movq	__func60_str5(%rip), %rax
	jmp	LBB59_7
	.p2align	4, 0x90
LBB59_3:                                ## %then_1
                                        ##   in Loop: Header=BB59_2 Depth=1
	movq	__func60_str2(%rip), %rdi
	callq	_fatal
	cmpl	$255, _lstate+264(%rip)
	jb	LBB59_26
	jmp	LBB59_25
LBB59_8:                                ## %else_3
                                        ##   in Loop: Header=BB59_2 Depth=1
	movzbl	7(%rsp), %eax
	movq	__func60_str6(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB59_10
## %bb.9:                               ## %then_4
                                        ##   in Loop: Header=BB59_2 Depth=1
	movq	__func60_str7(%rip), %rax
	jmp	LBB59_7
LBB59_10:                               ## %else_4
                                        ##   in Loop: Header=BB59_2 Depth=1
	movzbl	7(%rsp), %eax
	movq	__func60_str8(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB59_12
## %bb.11:                              ## %then_5
                                        ##   in Loop: Header=BB59_2 Depth=1
	movq	__func60_str9(%rip), %rax
	jmp	LBB59_7
LBB59_12:                               ## %else_5
                                        ##   in Loop: Header=BB59_2 Depth=1
	movzbl	7(%rsp), %eax
	movq	__func60_str10(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB59_14
## %bb.13:                              ## %then_6
                                        ##   in Loop: Header=BB59_2 Depth=1
	movq	__func60_str11(%rip), %rax
	jmp	LBB59_7
LBB59_14:                               ## %else_6
                                        ##   in Loop: Header=BB59_2 Depth=1
	movzbl	7(%rsp), %eax
	movq	__func60_str12(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB59_16
## %bb.15:                              ## %then_7
                                        ##   in Loop: Header=BB59_2 Depth=1
	movq	__func60_str13(%rip), %rax
	jmp	LBB59_7
LBB59_16:                               ## %else_7
                                        ##   in Loop: Header=BB59_2 Depth=1
	movzbl	7(%rsp), %eax
	movq	__func60_str14(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB59_18
## %bb.17:                              ## %then_8
                                        ##   in Loop: Header=BB59_2 Depth=1
	movq	__func60_str15(%rip), %rax
	jmp	LBB59_7
LBB59_18:                               ## %else_8
                                        ##   in Loop: Header=BB59_2 Depth=1
	movzbl	7(%rsp), %eax
	movq	__func60_str16(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB59_20
## %bb.19:                              ## %then_9
                                        ##   in Loop: Header=BB59_2 Depth=1
	movq	__func60_str17(%rip), %rax
	jmp	LBB59_7
LBB59_20:                               ## %else_9
                                        ##   in Loop: Header=BB59_2 Depth=1
	movzbl	7(%rsp), %eax
	movq	__func60_str18(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB59_22
## %bb.21:                              ## %then_10
                                        ##   in Loop: Header=BB59_2 Depth=1
	movq	__func60_str19(%rip), %rax
	.p2align	4, 0x90
LBB59_7:                                ## %endif_1
                                        ##   in Loop: Header=BB59_2 Depth=1
	movzbl	(%rax), %eax
	movb	%al, 7(%rsp)
LBB59_24:                               ## %endif_1
                                        ##   in Loop: Header=BB59_2 Depth=1
	cmpl	$255, _lstate+264(%rip)
	jb	LBB59_26
LBB59_25:                               ## %then_12
                                        ##   in Loop: Header=BB59_2 Depth=1
	movq	__func60_str21(%rip), %rdi
	callq	_fatal
	jmp	LBB59_26
LBB59_22:                               ## %else_10
                                        ##   in Loop: Header=BB59_2 Depth=1
	movzbl	7(%rsp), %eax
	movq	__func60_str20(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB59_24
## %bb.23:                              ## %then_11
                                        ##   in Loop: Header=BB59_2 Depth=1
	movb	$0, 7(%rsp)
	cmpl	$255, _lstate+264(%rip)
	jb	LBB59_26
	jmp	LBB59_25
	.cfi_endproc
                                        ## -- End function
	.globl	_tokenize               ## -- Begin function tokenize
	.p2align	4, 0x90
_tokenize:                              ## @tokenize
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbp
	callq	_list_new
	movq	%rax, %r15
	movq	%rbp, %rdi
	callq	_lex_init
	leaq	_lstate+6(%rip), %r14
	.p2align	4, 0x90
LBB60_1:                                ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_gettoken
	movl	%eax, %r12d
	movl	_lstate+264(%rip), %ebx
	leal	1(%rbx), %eax
	movzwl	%ax, %r13d
	leal	40(%r13), %edi
	callq	_malloc
	movq	%rax, %rbp
	movzwl	_lstate+4(%rip), %eax
	movw	%ax, (%rbp)
	movzwl	_lstate+264(%rip), %eax
	movw	%ax, 22(%rbp)
	movq	_lstate+280(%rip), %rax
	movq	%rax, 8(%rbp)
	movl	_lstate+268(%rip), %eax
	movl	%eax, 16(%rbp)
	movzwl	_lstate+272(%rip), %eax
	movw	%ax, 20(%rbp)
	leaq	24(%rbp), %rdi
	movq	%r14, %rsi
	movl	%r13d, %edx
	callq	_memcpy
	addl	$2, %ebx
	movswq	%bx, %rax
	movb	$0, 24(%rbp,%rax)
	movq	%r15, %rdi
	movq	%rbp, %rsi
	callq	_list_append
	testw	%r12w, %r12w
	jne	LBB60_1
## %bb.2:                               ## %break_0
	movl	_lstate+268(%rip), %eax
	addl	%eax, _lines(%rip)
	movq	%r15, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_linecnt                ## -- Begin function linecnt
	.p2align	4, 0x90
_linecnt:                               ## @linecnt
	.cfi_startproc
## %bb.0:
	incl	_lstate+268(%rip)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_lex_putback            ## -- Begin function lex_putback
	.p2align	4, 0x90
_lex_putback:                           ## @lex_putback
	.cfi_startproc
## %bb.0:
	movb	%dil, _lstate+288(%rip)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_cwd                    ## -- Begin function cwd
	.p2align	4, 0x90
_cwd:                                   ## @cwd
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$512, %edi              ## imm = 0x200
	callq	_malloc
	movl	$512, %esi              ## imm = 0x200
	movq	%rax, %rdi
	callq	_getcwd
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_liblist_add            ## -- Begin function liblist_add
	.p2align	4, 0x90
_liblist_add:                           ## @liblist_add
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	leaq	_liblist(%rip), %rdi
	movq	%rax, %rsi
	callq	_list_append
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_getSourceInfoFrom      ## -- Begin function getSourceInfoFrom
	.p2align	4, 0x90
_getSourceInfoFrom:                     ## @getSourceInfoFrom
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	__func66_str1(%rip), %rsi
	movq	%rbx, %rdx
	callq	_cat3
	movq	%rax, %r14
	movw	$0, (%rsp)
	movq	%rbx, 8(%rsp)
	movq	$0, 16(%rsp)
	movq	__func66_str2(%rip), %rsi
	movq	%rax, %rdi
	callq	_cat
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	_exists
	testb	$1, %al
	jne	LBB65_1
## %bb.2:                               ## %else_0
	movq	__func66_str3(%rip), %rsi
	movq	%r14, %rdi
	callq	_cat
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	_exists
	testb	$1, %al
	je	LBB65_3
LBB65_1:                                ## %then_0
	movq	%rbx, %rdi
	callq	_getprefix
	movq	%rax, %rdi
	callq	_chdir
	movw	$1, (%rsp)
	movq	%rbx, 16(%rsp)
	movq	8(%rsp), %rdx
	movw	$1, %ax
	movq	%rbx, %rcx
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB65_3:                                ## %else_1
	movzwl	(%rsp), %eax
	movq	8(%rsp), %rdx
	movq	16(%rsp), %rcx
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_search_in_lib          ## -- Begin function search_in_lib
	.p2align	4, 0x90
_search_in_lib:                         ## @search_in_lib
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_getSourceInfoFrom
	testw	%ax, %ax
	setne	%al
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_getSourceInfo          ## -- Begin function getSourceInfo
	.p2align	4, 0x90
_getSourceInfo:                         ## @getSourceInfo
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$512, %rsp              ## imm = 0x200
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %r14
	leaq	-528(%rbp), %rbx
	movl	$512, %esi              ## imm = 0x200
	movq	%rbx, %rdi
	callq	_getcwd
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_getSourceInfoFrom
	testw	%ax, %ax
	jne	LBB67_5
## %bb.1:                               ## %else_0
	movq	_pdir(%rip), %rdi
	movq	%r14, %rsi
	callq	_getSourceInfoFrom
	testw	%ax, %ax
	jne	LBB67_5
## %bb.2:                               ## %else_1
	leaq	_liblist(%rip), %rdi
	leaq	_search_in_lib(%rip), %rsi
	movq	%r14, %rdx
	callq	_list_search
	testq	%rax, %rax
	je	LBB67_4
## %bb.3:                               ## %then_2
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	_getSourceInfoFrom
	jmp	LBB67_5
LBB67_4:                                ## %else_2
	movq	%rsp, %rax
	leaq	-32(%rax), %rsp
	movw	$0, -32(%rax)
	movq	%r14, -24(%rax)
	movq	$0, -16(%rax)
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movq	%r14, %rdx
LBB67_5:                                ## %then_0
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_openSource             ## -- Begin function openSource
	.p2align	4, 0x90
_openSource:                            ## @openSource
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%edi, %ebp
	testw	%bp, %bp
	je	LBB68_1
## %bb.3:                               ## %else_0
	movq	%rdx, %r15
	movq	%rsi, %r14
	movl	$40, %edi
	callq	_malloc
	movq	%rax, %rbx
	movq	%r15, %rdi
	callq	_tokenize
	movq	%rax, 24(%rbx)
	movq	(%rax), %rax
	movq	%rax, 32(%rbx)
	movq	%r15, 16(%rbx)
	movq	%r14, 8(%rbx)
	movw	%bp, (%rbx)
	movq	%rbx, %rax
	jmp	LBB68_2
LBB68_1:                                ## %then_0
	xorl	%eax, %eax
LBB68_2:                                ## %then_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_info                   ## -- Begin function info
	.p2align	4, 0x90
_info:                                  ## @info
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %r8
	movq	__func70_str1(%rip), %rdi
	movl	$27, %esi
	movl	$36, %edx
	movl	$27, %ecx
	xorl	%eax, %eax
	callq	_printf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_warning                ## -- Begin function warning
	.p2align	4, 0x90
_warning:                               ## @warning
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, %r10
	testq	%rsi, %rsi
	je	LBB70_2
## %bb.1:                               ## %then_0
	movq	%rsi, %rbx
	movq	__func71_str1(%rip), %rdi
	movq	(%rsi), %r8
	movl	8(%rsi), %r9d
	movq	%r10, (%rsp)
	movl	$27, %esi
	movl	$34, %edx
	movl	$27, %ecx
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	callq	_show
	jmp	LBB70_3
LBB70_2:                                ## %else_0
	movq	__func71_str2(%rip), %rdi
	movl	$27, %esi
	movl	$34, %edx
	movl	$27, %ecx
	xorl	%eax, %eax
	movq	%r10, %r8
	callq	_printf
LBB70_3:                                ## %endif_0
	movq	__func71_str3(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	incl	_warncnt(%rip)
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_error                  ## -- Begin function error
	.p2align	4, 0x90
_error:                                 ## @error
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, %r10
	testq	%rsi, %rsi
	je	LBB71_1
## %bb.2:                               ## %else_0
	movq	%rsi, %rbx
	movq	__func72_str2(%rip), %rdi
	movq	(%rsi), %r8
	movl	8(%rsi), %r9d
	movq	%r10, (%rsp)
	movl	$27, %esi
	movl	$35, %edx
	movl	$27, %ecx
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	callq	_show
	jmp	LBB71_3
LBB71_1:                                ## %then_0
	movq	__func72_str1(%rip), %rdi
	movl	$27, %esi
	movl	$35, %edx
	movl	$27, %ecx
	xorl	%eax, %eax
	movq	%r10, %r8
	callq	_printf
LBB71_3:                                ## %endif_0
	movq	__func72_str3(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movl	_errcnt(%rip), %eax
	incl	%eax
	movl	%eax, _errcnt(%rip)
	cmpl	$21, %eax
	jb	LBB71_5
## %bb.4:                               ## %then_1
	movq	__func72_str4(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movl	$-1, %edi
	callq	_exit
LBB71_5:                                ## %endif_1
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_rem                    ## -- Begin function rem
	.p2align	4, 0x90
_rem:                                   ## @rem
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movq	%rdi, %rcx
	movq	__func73_str1(%rip), %rdi
	movl	$27, %esi
	movl	$33, %edx
	movl	$27, %r8d
	xorl	%eax, %eax
	callq	_printf
	testq	%rbx, %rbx
	je	LBB72_2
## %bb.1:                               ## %then_0
	movq	%rbx, %rdi
	callq	_show
	movq	__func73_str2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
LBB72_2:                                ## %endif_0
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_gline                  ## -- Begin function gline
	.p2align	4, 0x90
_gline:                                 ## @gline
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	(%rsi), %rdi
	xorl	%esi, %esi
	callq	_open
	testl	%eax, %eax
	js	LBB73_7
## %bb.1:                               ## %else_0
	movl	%eax, %r15d
	movq	%r14, -48(%rbp)         ## 8-byte Spill
	movl	8(%rbx), %r13d
	movq	%rsp, %rbx
	addq	$-16, %rbx
	movq	%rbx, %rsp
	movq	%rsp, %rax
	leaq	-16(%rax), %r14
	movq	%r14, %rsp
	movq	%rsp, %rcx
	leaq	-16(%rcx), %r12
	movq	%r12, %rsp
	movl	$1, -16(%rax)
	movl	$0, -16(%rcx)
	jmp	LBB73_2
	.p2align	4, 0x90
LBB73_9:                                ## %then_4
                                        ##   in Loop: Header=BB73_2 Depth=1
	incl	(%r14)
LBB73_2:                                ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	%r13d, (%r14)
	je	LBB73_3
## %bb.8:                               ## %else_1
                                        ##   in Loop: Header=BB73_2 Depth=1
	movl	$1, %edx
	movl	%r15d, %edi
	movq	%rbx, %rsi
	callq	_read
	movzbl	(%rbx), %eax
	movq	__func74_str2(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB73_2
	jmp	LBB73_9
LBB73_3:                                ## %then_1
	movq	-48(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB73_4:                                ## %continue_1
                                        ## =>This Inner Loop Header: Depth=1
	movl	$1, %edx
	movl	%r15d, %edi
	movq	%rbx, %rsi
	callq	_read
	testl	%eax, %eax
	je	LBB73_6
## %bb.5:                               ## %else_2
                                        ##   in Loop: Header=BB73_4 Depth=1
	movslq	(%r12), %rax
	movzbl	(%rbx), %ecx
	movb	%cl, (%r14,%rax)
	incl	(%r12)
	movzbl	(%rbx), %eax
	movq	__func74_str1(%rip), %rcx
	cmpb	(%rcx), %al
	jne	LBB73_4
LBB73_6:                                ## %exit
	movl	%r15d, %edi
	callq	_close
	movslq	(%r12), %rax
	movb	$0, (%r14,%rax)
LBB73_7:                                ## %then_0
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_show                   ## -- Begin function show
	.p2align	4, 0x90
_show:                                  ## @show
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$520, %rsp              ## imm = 0x208
	.cfi_def_cfa_offset 544
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movq	__func75_str1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	leaq	8(%rsp), %r14
	xorl	%esi, %esi
	movl	$512, %edx              ## imm = 0x200
	movq	%r14, %rdi
	callq	_memset
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_gline
	movq	__func75_str2(%rip), %rdi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	_printf
	movw	$1, 6(%rsp)
	movzwl	6(%rsp), %eax
	cmpw	12(%rbx), %ax
	jae	LBB74_3
	.p2align	4, 0x90
LBB74_2:                                ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	__func75_str3(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	incw	6(%rsp)
	movzwl	6(%rsp), %eax
	cmpw	12(%rbx), %ax
	jb	LBB74_2
LBB74_3:                                ## %break_0
	movq	__func75_str4(%rip), %rdi
	movl	$27, %esi
	movl	$32, %edx
	movl	$27, %ecx
	xorl	%eax, %eax
	callq	_printf
	addq	$520, %rsp              ## imm = 0x208
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_fatal                  ## -- Begin function fatal
	.p2align	4, 0x90
_fatal:                                 ## @fatal
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %r8
	movq	__func76_str1(%rip), %rdi
	movl	$27, %esi
	movl	$31, %edx
	movl	$27, %ecx
	xorl	%eax, %eax
	callq	_printf
	movl	$1, %edi
	callq	_exit
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_prttype                ## -- Begin function prttype
	.p2align	4, 0x90
_prttype:                               ## @prttype
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	cmpq	$0, 8(%rdi)
	je	LBB76_1
## %bb.20:                              ## %then_0
	movq	__func77_str1(%rip), %rdi
	movq	8(%rbx), %rsi
	xorl	%eax, %eax
	callq	_printf
	popq	%rbx
	retq
LBB76_1:                                ## %else_0
	movzwl	(%rbx), %esi
	cmpl	$2, %esi
	jne	LBB76_3
## %bb.2:                               ## %then_1
	movq	__func77_str2(%rip), %rdi
	movq	32(%rbx), %rsi
	xorl	%eax, %eax
	callq	_printf
	popq	%rbx
	retq
LBB76_3:                                ## %else_1
	movzwl	%si, %eax
	cmpl	$6, %eax
	jne	LBB76_5
## %bb.4:                               ## %then_2
	movq	__func77_str3(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	72(%rbx), %rdi
	callq	_prttype
	popq	%rbx
	retq
LBB76_5:                                ## %else_2
	cmpl	$7, %eax
	jne	LBB76_7
## %bb.6:                               ## %then_3
	movq	%rbx, %rdi
	callq	_print_type_array
	popq	%rbx
	retq
LBB76_7:                                ## %else_3
	cmpl	$5, %eax
	jne	LBB76_9
## %bb.8:                               ## %then_4
	movq	%rbx, %rdi
	callq	_print_type_record
	popq	%rbx
	retq
LBB76_9:                                ## %else_4
	cmpl	$4, %eax
	jne	LBB76_11
## %bb.10:                              ## %then_5
	movq	%rbx, %rdi
	callq	_print_type_enum
	popq	%rbx
	retq
LBB76_11:                               ## %else_5
	cmpl	$3, %eax
	jne	LBB76_13
## %bb.12:                              ## %then_6
	addq	$48, %rbx
	movq	%rbx, %rdi
	callq	_print_type_func
	popq	%rbx
	retq
LBB76_13:                               ## %else_6
	testw	%si, %si
	je	LBB76_14
## %bb.16:                              ## %else_7
	cmpl	$1, %eax
	jne	LBB76_18
## %bb.17:                              ## %then_8
	movq	__func77_str5(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	popq	%rbx
	retq
LBB76_14:                               ## %then_7
	movq	__func77_str4(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	popq	%rbx
	retq
LBB76_18:                               ## %else_8
	movq	__func77_str6(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movl	$1, %edi
	callq	_exit
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_field            ## -- Begin function print_field
	.p2align	4, 0x90
_print_field:                           ## @print_field
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	__func79_str1(%rip), %rdi
	movq	(%rbx), %rsi
	xorl	%eax, %eax
	callq	_printf
	movq	8(%rbx), %rdi
	callq	_prttype
	movq	__func79_str2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_type_record      ## -- Begin function print_type_record
	.p2align	4, 0x90
_print_type_record:                     ## @print_type_record
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	__func78_str1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	96(%rbx), %rdi
	leaq	_print_field(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	movq	__func78_str2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	__func78_str3(%rip), %rdi
	movl	104(%rbx), %esi
	xorl	%eax, %eax
	callq	_printf
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_cons             ## -- Begin function print_cons
	.p2align	4, 0x90
_print_cons:                            ## @print_cons
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__func81_str1(%rip), %rcx
	movq	64(%rdi), %rsi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	_printf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_type_enum        ## -- Begin function print_type_enum
	.p2align	4, 0x90
_print_type_enum:                       ## @print_type_enum
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	__func80_str1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	112(%rbx), %rdi
	leaq	_print_cons(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	movq	__func80_str2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_type_array       ## -- Begin function print_type_array
	.p2align	4, 0x90
_print_type_array:                      ## @print_type_array
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	cmpb	$1, 92(%rdi)
	jne	LBB81_2
## %bb.1:                               ## %then_0
	movq	__func82_str1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	80(%rbx), %rdi
	callq	_prttype
	popq	%rbx
	retq
LBB81_2:                                ## %else_0
	movq	__func82_str2(%rip), %rdi
	movl	88(%rbx), %esi
	xorl	%eax, %eax
	callq	_printf
	movq	80(%rbx), %rdi
	callq	_prttype
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_params           ## -- Begin function print_params
	.p2align	4, 0x90
_print_params:                          ## @print_params
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	cmpb	$1, _needs(%rip)
	jne	LBB82_2
## %bb.1:                               ## %then_0
	movq	__func84_str1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	jmp	LBB82_3
LBB82_2:                                ## %else_0
	movb	$1, _needs(%rip)
LBB82_3:                                ## %endif_0
	movq	__func84_str2(%rip), %rdi
	movq	(%rbx), %rsi
	xorl	%eax, %eax
	callq	_printf
	movq	8(%rbx), %rdi
	callq	_prttype
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_type_func        ## -- Begin function print_type_func
	.p2align	4, 0x90
_print_type_func:                       ## @print_type_func
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	__func83_str1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movb	$0, _needs(%rip)
	movq	(%rbx), %rdi
	leaq	_print_params(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	movq	__func83_str2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	8(%rbx), %rdi
	callq	_prttype
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_basic_new         ## -- Begin function type_basic_new
	.p2align	4, 0x90
_type_basic_new:                        ## @type_basic_new
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, %r15d
	movl	%ecx, %ebp
	movl	%edx, %r14d
	movl	%esi, %ebx
	movq	%rdi, %r12
	movl	$2, %edi
	callq	_type_new
	movl	%ebx, 20(%rax)
	movl	%ebx, 16(%rax)
	movq	%r12, 8(%rax)
	movq	%r12, 32(%rax)
	movl	%r14d, 40(%rax)
	andl	$1, %ebp
	movb	%bpl, 44(%rax)
	andl	$1, %r15d
	movb	%r15b, 45(%rax)
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_basic_eq          ## -- Begin function type_basic_eq
	.p2align	4, 0x90
_type_basic_eq:                         ## @type_basic_eq
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	movq	(%rsi), %rsi
	callq	_strcmp
	testl	%eax, %eax
	sete	%al
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_field_new              ## -- Begin function field_new
	.p2align	4, 0x90
_field_new:                             ## @field_new
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	movl	$32, %edi
	callq	_malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	testq	%rax, %rax
	setne	%dil
	movq	__func87_str1(%rip), %rsi
	callq	_assert
	movq	%r12, (%rbx)
	movq	%r15, 8(%rbx)
	movw	$0, 16(%rbx)
	movq	%r14, 24(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_fpost                  ## -- Begin function fpost
	.p2align	4, 0x90
_fpost:                                 ## @fpost
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	8(%rdi), %rax
	movzwl	(%rsi), %ecx
	movw	%cx, 16(%rdi)
	incw	(%rsi)
	movl	4(%rsi), %ebp
	movl	20(%rax), %edi
	movzbl	2(%rsi), %esi
	callq	_alignment
	addl	%ebp, %eax
	movl	%eax, 4(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_record_new        ## -- Begin function type_record_new
	.p2align	4, 0x90
_type_record_new:                       ## @type_record_new
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	movl	$5, %edi
	callq	_type_new
	movq	%rax, %rbx
	callq	_get_uid
	movl	%eax, 104(%rbx)
	movq	%r14, 96(%rbx)
	movl	$0, 4(%rsp)
	movw	$0, (%rsp)
	movb	24(%rbx), %al
	movb	%al, 2(%rsp)
	movq	96(%rbx), %rdi
	leaq	_fpost(%rip), %rsi
	movq	%rsp, %rdx
	callq	_list_foreach
	movl	4(%rsp), %eax
	movl	%eax, 20(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_fsearch                ## -- Begin function fsearch
	.p2align	4, 0x90
_fsearch:                               ## @fsearch
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	callq	_strcmp
	testl	%eax, %eax
	sete	%al
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_record_get_field  ## -- Begin function type_record_get_field
	.p2align	4, 0x90
_type_record_get_field:                 ## @type_record_get_field
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rax
	movq	96(%rdi), %rdi
	leaq	_fsearch(%rip), %rsi
	movq	%rax, %rdx
	callq	_list_search
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_check_fields           ## -- Begin function check_fields
	.p2align	4, 0x90
_check_fields:                          ## @check_fields
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	movq	(%rsi), %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB91_3
## %bb.1:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB91_3:                                ## %else_0
	movq	8(%rbx), %rdi
	movq	8(%r14), %rsi
	callq	_type_eq
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_record_eq         ## -- Begin function type_record_eq
	.p2align	4, 0x90
_type_record_eq:                        ## @type_record_eq
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	movq	(%rsi), %rsi
	leaq	_check_fields(%rip), %rdx
	xorl	%ecx, %ecx
	callq	_list_compare
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_foreach_struct_field   ## -- Begin function foreach_struct_field
	.p2align	4, 0x90
_foreach_struct_field:                  ## @foreach_struct_field
	.cfi_startproc
## %bb.0:
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_typeRecordCheck        ## -- Begin function typeRecordCheck
	.p2align	4, 0x90
_typeRecordCheck:                       ## @typeRecordCheck
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	leaq	_foreach_struct_field(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_create_constructor     ## -- Begin function create_constructor
	.p2align	4, 0x90
_create_constructor:                    ## @create_constructor
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	8(%rdi), %rax
	movq	16(%rdi), %rdx
	movq	%rsi, %rdi
	movq	%rax, %rsi
	callq	_valueNewImm
	movq	(%rbx), %rdi
	movq	%rax, %rsi
	callq	_bind_value
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_enum_new          ## -- Begin function type_enum_new
	.p2align	4, 0x90
_type_enum_new:                         ## @type_enum_new
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	movl	$4, %edi
	callq	_type_new
	movq	%rax, %rbx
	callq	_get_uid
	movl	%eax, 120(%rbx)
	movl	_cfg+12(%rip), %eax
	movl	%eax, 20(%rbx)
	leaq	_create_constructor(%rip), %rsi
	movq	%r14, %rdi
	movq	%rbx, %rdx
	callq	_list_foreach
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_enum_eq           ## -- Begin function type_enum_eq
	.p2align	4, 0x90
_type_enum_eq:                          ## @type_enum_eq
	.cfi_startproc
## %bb.0:
	movl	8(%rdi), %eax
	cmpl	8(%rsi), %eax
	sete	%al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_array_new         ## -- Begin function type_array_new
	.p2align	4, 0x90
_type_array_new:                        ## @type_array_new
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%edx, %ebp
	movl	%esi, %ebx
	movq	%rdi, %r14
	andb	$1, %bpl
	movl	$7, %edi
	callq	_type_new
	movq	%r14, 80(%rax)
	movl	%ebx, 88(%rax)
	movb	%bpl, 92(%rax)
	testb	%bpl, %bpl
	je	LBB98_2
## %bb.1:                               ## %then_0
	movl	_cfg+20(%rip), %ecx
	movl	%ecx, 20(%rax)
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB98_2:                                ## %else_0
	imull	20(%r14), %ebx
	movl	%ebx, 20(%rax)
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_array_eq          ## -- Begin function type_array_eq
	.p2align	4, 0x90
_type_array_eq:                         ## @type_array_eq
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	movq	(%rsi), %rsi
	callq	_type_eq
	testb	$1, %al
	jne	LBB99_3
LBB99_1:                                ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB99_3:                                ## %else_0
	cmpb	$1, 12(%rbx)
	jne	LBB99_6
## %bb.4:                               ## %else_0
	testb	$1, 12(%r14)
	jne	LBB99_5
LBB99_6:                                ## %else_1
	cmpb	$0, 12(%rbx)
	jne	LBB99_1
## %bb.7:                               ## %else_1
	testb	$1, 12(%r14)
	jne	LBB99_1
## %bb.8:                               ## %else_2
	movl	8(%rbx), %eax
	cmpl	8(%r14), %eax
	jne	LBB99_1
LBB99_5:                                ## %then_1
	movb	$1, %al
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_typeArrayCheck         ## -- Begin function typeArrayCheck
	.p2align	4, 0x90
_typeArrayCheck:                        ## @typeArrayCheck
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	callq	_typeCheck
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_pointer_new       ## -- Begin function type_pointer_new
	.p2align	4, 0x90
_type_pointer_new:                      ## @type_pointer_new
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$6, %edi
	callq	_type_new
	movq	%rbx, 72(%rax)
	movl	_cfg+20(%rip), %ecx
	movl	%ecx, 20(%rax)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_pointer_eq        ## -- Begin function type_pointer_eq
	.p2align	4, 0x90
_type_pointer_eq:                       ## @type_pointer_eq
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	movq	(%rsi), %rsi
	callq	_type_eq
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_typePointerCheck       ## -- Begin function typePointerCheck
	.p2align	4, 0x90
_typePointerCheck:                      ## @typePointerCheck
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	cmpw	$0, (%rdi)
	je	LBB103_1
## %bb.2:                               ## %else_0
	callq	_typeCheck
	popq	%rax
	retq
LBB103_1:                               ## %then_0
	movq	__func104_str1(%rip), %rax
	movq	144(%rdi), %rsi
	movq	%rax, %rdi
	callq	_error
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_func_new          ## -- Begin function type_func_new
	.p2align	4, 0x90
_type_func_new:                         ## @type_func_new
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	%edx, %ebx
	movq	%rsi, %r14
	movq	%rdi, %r15
	movl	$3, %edi
	callq	_type_new
	movl	_cfg+20(%rip), %ecx
	movl	%ecx, 20(%rax)
	movq	%r15, 48(%rax)
	movq	%r14, 56(%rax)
	andl	$1, %ebx
	movb	%bl, 64(%rax)
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_check_param            ## -- Begin function check_param
	.p2align	4, 0x90
_check_param:                           ## @check_param
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	xorl	%edi, %edi
	cmpq	$0, (%rbx)
	setne	%dil
	movq	__func107_str1(%rip), %rsi
	callq	_assert
	xorl	%edi, %edi
	cmpq	$0, (%r14)
	setne	%dil
	movq	__func107_str2(%rip), %rsi
	callq	_assert
	movq	(%rbx), %rdi
	movq	(%r14), %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB105_3
## %bb.1:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB105_3:                               ## %else_0
	movq	8(%rbx), %rdi
	movq	8(%r14), %rsi
	callq	_type_eq
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_function_eq       ## -- Begin function type_function_eq
	.p2align	4, 0x90
_type_function_eq:                      ## @type_function_eq
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	8(%rdi), %rdi
	movq	8(%rsi), %rsi
	callq	_type_eq
	testb	$1, %al
	jne	LBB106_3
## %bb.1:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB106_3:                               ## %else_0
	movq	(%rbx), %rdi
	movq	(%r14), %rsi
	leaq	_check_param(%rip), %rdx
	xorl	%ecx, %ecx
	callq	_list_compare
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_foreach_func_param     ## -- Begin function foreach_func_param
	.p2align	4, 0x90
_foreach_func_param:                    ## @foreach_func_param
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	8(%rdi), %rdi
	callq	_typeCheck
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_typeFuncCheck          ## -- Begin function typeFuncCheck
	.p2align	4, 0x90
_typeFuncCheck:                         ## @typeFuncCheck
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	8(%rdi), %rdi
	callq	_typeCheck
	movq	(%rbx), %rdi
	leaq	_foreach_func_param(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_eq                ## -- Begin function type_eq
	.p2align	4, 0x90
_type_eq:                               ## @type_eq
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movzwl	(%rdi), %eax
	cmpw	(%rsi), %ax
	je	LBB109_3
LBB109_1:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB109_3:                               ## %else_0
	movq	%rsi, %r14
	movq	%rdi, %rbx
	cmpq	$0, 8(%rdi)
	je	LBB109_7
## %bb.4:                               ## %else_0
	movq	8(%r14), %rax
	testq	%rax, %rax
	je	LBB109_7
## %bb.5:                               ## %then_1
	movq	8(%rbx), %rdi
	movq	8(%r14), %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB109_6
LBB109_7:                               ## %endif_1
	movzwl	(%rbx), %eax
	cmpl	$2, %eax
	jne	LBB109_9
## %bb.8:                               ## %then_3
	addq	$32, %rbx
	addq	$32, %r14
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_type_basic_eq
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB109_9:                               ## %else_3
	movzwl	%ax, %eax
	cmpl	$6, %eax
	jne	LBB109_11
## %bb.10:                              ## %then_4
	addq	$72, %rbx
	addq	$72, %r14
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_type_pointer_eq
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB109_11:                              ## %else_4
	cmpl	$7, %eax
	jne	LBB109_13
## %bb.12:                              ## %then_5
	addq	$80, %rbx
	addq	$80, %r14
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_type_array_eq
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB109_6:                               ## %then_2
	movb	$1, %al
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB109_13:                              ## %else_5
	cmpl	$3, %eax
	jne	LBB109_15
## %bb.14:                              ## %then_6
	addq	$48, %rbx
	addq	$48, %r14
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_type_function_eq
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB109_15:                              ## %else_6
	cmpl	$5, %eax
	jne	LBB109_17
## %bb.16:                              ## %then_7
	addq	$96, %rbx
	addq	$96, %r14
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_type_record_eq
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB109_17:                              ## %else_7
	cmpl	$4, %eax
	jne	LBB109_19
## %bb.18:                              ## %then_8
	addq	$112, %rbx
	addq	$112, %r14
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_type_enum_eq
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB109_19:                              ## %else_8
	cmpl	$1, %eax
	jne	LBB109_21
## %bb.20:                              ## %then_9
	movzwl	(%r14), %eax
	cmpl	$1, %eax
	sete	%al
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB109_21:                              ## %else_9
	movq	__func110_str1(%rip), %rsi
	xorl	%edi, %edi
	callq	_assert
	jmp	LBB109_1
	.cfi_endproc
                                        ## -- End function
	.globl	_type_init              ## -- Begin function type_init
	.p2align	4, 0x90
_type_init:                             ## @type_init
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	__func111_str1(%rip), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	_type_basic_new
	movq	%rax, _typeUnit(%rip)
	movq	__func111_str2(%rip), %rdi
	movl	$1, %esi
	movl	$1, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	_type_basic_new
	movq	%rax, _typeBool(%rip)
	leaq	_globalTypeIndex(%rip), %rbx
	movq	__func111_str3(%rip), %rsi
	movq	_typeUnit(%rip), %rdx
	movq	%rbx, %rdi
	callq	_map_append
	movq	__func111_str4(%rip), %rsi
	movq	_typeBool(%rip), %rdx
	movq	%rbx, %rdi
	callq	_map_append
	movq	__func111_str5(%rip), %rdi
	movl	$1, %esi
	movl	$8, %edx
	movl	$1, %ecx
	movl	$1, %r8d
	callq	_type_basic_new
	movq	%rax, 64(%rsp)          ## 8-byte Spill
	movq	__func111_str6(%rip), %rdi
	movl	$2, %esi
	movl	$16, %edx
	movl	$1, %ecx
	movl	$1, %r8d
	callq	_type_basic_new
	movq	%rax, 80(%rsp)          ## 8-byte Spill
	movq	__func111_str7(%rip), %rdi
	movl	$4, %esi
	movl	$32, %edx
	movl	$1, %ecx
	movl	$1, %r8d
	callq	_type_basic_new
	movq	%rax, 32(%rsp)          ## 8-byte Spill
	movq	__func111_str8(%rip), %rdi
	movl	$8, %esi
	movl	$64, %edx
	movl	$1, %ecx
	movl	$1, %r8d
	callq	_type_basic_new
	movq	%rax, %rbp
	movq	__func111_str9(%rip), %rdi
	movl	$16, %esi
	movl	$128, %edx
	movl	$1, %ecx
	movl	$1, %r8d
	callq	_type_basic_new
	movq	%rax, 72(%rsp)          ## 8-byte Spill
	movq	__func111_str10(%rip), %rdi
	movl	$32, %esi
	movl	$256, %edx              ## imm = 0x100
	movl	$1, %ecx
	movl	$1, %r8d
	callq	_type_basic_new
	movq	%rax, 56(%rsp)          ## 8-byte Spill
	movq	__func111_str11(%rip), %rdi
	movl	$64, %esi
	movl	$512, %edx              ## imm = 0x200
	movl	$1, %ecx
	movl	$1, %r8d
	callq	_type_basic_new
	movq	%rax, 48(%rsp)          ## 8-byte Spill
	movq	__func111_str12(%rip), %rdi
	movl	$128, %esi
	movl	$1024, %edx             ## imm = 0x400
	movl	$1, %ecx
	movl	$1, %r8d
	callq	_type_basic_new
	movq	%rax, 40(%rsp)          ## 8-byte Spill
	movq	__func111_str13(%rip), %rdi
	movl	$1, %esi
	movl	$8, %edx
	movl	$1, %ecx
	xorl	%r8d, %r8d
	callq	_type_basic_new
	movq	%rax, %r15
	movq	__func111_str14(%rip), %rdi
	movl	$2, %esi
	movl	$16, %edx
	movl	$1, %ecx
	xorl	%r8d, %r8d
	callq	_type_basic_new
	movq	%rax, %r13
	movq	__func111_str15(%rip), %rdi
	movl	$4, %esi
	movl	$32, %edx
	movl	$1, %ecx
	xorl	%r8d, %r8d
	callq	_type_basic_new
	movq	%rax, %r12
	movq	__func111_str16(%rip), %rdi
	movl	$8, %esi
	movl	$64, %edx
	movl	$1, %ecx
	xorl	%r8d, %r8d
	callq	_type_basic_new
	movq	%rax, %r14
	movq	__func111_str17(%rip), %rdi
	movl	$16, %esi
	movl	$128, %edx
	movl	$1, %ecx
	xorl	%r8d, %r8d
	callq	_type_basic_new
	movq	%rax, 24(%rsp)          ## 8-byte Spill
	movq	__func111_str18(%rip), %rdi
	movl	$32, %esi
	movl	$256, %edx              ## imm = 0x100
	movl	$1, %ecx
	xorl	%r8d, %r8d
	callq	_type_basic_new
	movq	%rax, 16(%rsp)          ## 8-byte Spill
	movq	__func111_str19(%rip), %rdi
	movl	$64, %esi
	movl	$512, %edx              ## imm = 0x200
	movl	$1, %ecx
	xorl	%r8d, %r8d
	callq	_type_basic_new
	movq	%rax, 8(%rsp)           ## 8-byte Spill
	movq	__func111_str20(%rip), %rdi
	movl	$128, %esi
	movl	$1024, %edx             ## imm = 0x400
	movl	$1, %ecx
	xorl	%r8d, %r8d
	callq	_type_basic_new
	movq	%rax, (%rsp)            ## 8-byte Spill
	movq	__func111_str21(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rbp, %rdx
	callq	_map_append
	movq	__func111_str22(%rip), %rsi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	callq	_map_append
	movq	__func111_str23(%rip), %rsi
	movq	%rbx, %rdi
	movq	32(%rsp), %r14          ## 8-byte Reload
	movq	%r14, %rdx
	callq	_map_append
	movq	__func111_str24(%rip), %rsi
	movq	%rbx, %rdi
	movq	%r12, %rdx
	callq	_map_append
	movq	__func111_str25(%rip), %rsi
	movq	%rbx, %rdi
	movq	64(%rsp), %rdx          ## 8-byte Reload
	callq	_map_append
	movq	__func111_str26(%rip), %rsi
	movq	%rbx, %rdi
	movq	%r15, %rdx
	callq	_map_append
	movq	__func111_str27(%rip), %rsi
	movq	%rbx, %rdi
	movq	80(%rsp), %rbp          ## 8-byte Reload
	movq	%rbp, %rdx
	callq	_map_append
	movq	__func111_str28(%rip), %rsi
	movq	%rbx, %rdi
	movq	%r13, %rdx
	callq	_map_append
	movq	%r15, _typeChar(%rip)
	xorl	%esi, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	callq	_type_array_new
	movq	%rax, _typeStr(%rip)
	movq	__func111_str29(%rip), %rcx
	movq	%rcx, 8(%rax)
	movq	__func111_str30(%rip), %rsi
	movq	_typeStr(%rip), %rdx
	movq	%rbx, %rdi
	callq	_map_append
	movq	__func111_str31(%rip), %rsi
	movq	%rbx, %rdi
	movq	72(%rsp), %rdx          ## 8-byte Reload
	callq	_map_append
	movq	__func111_str32(%rip), %rsi
	movq	%rbx, %rdi
	movq	56(%rsp), %rdx          ## 8-byte Reload
	callq	_map_append
	movq	__func111_str33(%rip), %rsi
	movq	%rbx, %rdi
	movq	48(%rsp), %rdx          ## 8-byte Reload
	callq	_map_append
	movq	__func111_str34(%rip), %rsi
	movq	%rbx, %rdi
	movq	40(%rsp), %rdx          ## 8-byte Reload
	callq	_map_append
	movq	__func111_str35(%rip), %rsi
	movq	%rbx, %rdi
	movq	24(%rsp), %rdx          ## 8-byte Reload
	callq	_map_append
	movq	__func111_str36(%rip), %rsi
	movq	%rbx, %rdi
	movq	16(%rsp), %rdx          ## 8-byte Reload
	callq	_map_append
	movq	__func111_str37(%rip), %rsi
	movq	%rbx, %rdi
	movq	8(%rsp), %rdx           ## 8-byte Reload
	callq	_map_append
	movq	__func111_str38(%rip), %rsi
	movq	%rbx, %rdi
	movq	(%rsp), %rdx            ## 8-byte Reload
	callq	_map_append
	xorl	%edi, %edi
	callq	_type_new
	movq	%rax, _typeUnknown(%rip)
	movq	_typeUnit(%rip), %rdi
	callq	_type_pointer_new
	movq	%rax, _typeFreePtr(%rip)
	movl	$1, %edi
	callq	_type_new
	movq	%rax, _typeNumeric(%rip)
	movq	%r14, _typeBaseInt(%rip)
	movq	%rbp, _typeEnum(%rip)
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_new               ## -- Begin function type_new
	.p2align	4, 0x90
_type_new:                              ## @type_new
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%edi, %ebp
	movl	$184, %edi
	callq	_malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	testq	%rax, %rax
	setne	%dil
	movq	__func112_str1(%rip), %rsi
	callq	_assert
	xorl	%esi, %esi
	movl	$184, %edx
	movq	%rbx, %rdi
	callq	_memset
	movw	%bp, (%rbx)
	movb	_cfg+4(%rip), %al
	movb	%al, 24(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_typeIsReference        ## -- Begin function typeIsReference
	.p2align	4, 0x90
_typeIsReference:                       ## @typeIsReference
	.cfi_startproc
## %bb.0:
	movzwl	(%rdi), %eax
	cmpl	$6, %eax
	jne	LBB112_1
## %bb.3:                               ## %then_0
	movb	$1, %al
	retq
LBB112_1:                               ## %else_0
	movzwl	%ax, %eax
	cmpl	$7, %eax
	jne	LBB112_2
## %bb.4:                               ## %then_1
	movb	92(%rdi), %al
	retq
LBB112_2:                               ## %else_1
	xorl	%eax, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_typeIsDefinedArray     ## -- Begin function typeIsDefinedArray
	.p2align	4, 0x90
_typeIsDefinedArray:                    ## @typeIsDefinedArray
	.cfi_startproc
## %bb.0:
	movzwl	(%rdi), %eax
	cmpl	$7, %eax
	je	LBB113_2
## %bb.1:                               ## %then_0
	xorl	%eax, %eax
	retq
LBB113_2:                               ## %else_0
	movb	92(%rdi), %al
	xorb	$1, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_type_is_basic_integer  ## -- Begin function type_is_basic_integer
	.p2align	4, 0x90
_type_is_basic_integer:                 ## @type_is_basic_integer
	.cfi_startproc
## %bb.0:
	movzwl	(%rdi), %eax
	cmpl	$2, %eax
	jne	LBB114_2
## %bb.1:                               ## %then_0
	movb	44(%rdi), %al
	retq
LBB114_2:                               ## %else_0
	xorl	%eax, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_uid                ## -- Begin function get_uid
	.p2align	4, 0x90
_get_uid:                               ## @get_uid
	.cfi_startproc
## %bb.0:
	movl	_uid(%rip), %eax
	leal	1(%rax), %ecx
	movl	%ecx, _uid(%rip)
                                        ## kill: def $eax killed $eax killed $rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_alignment              ## -- Begin function alignment
	.p2align	4, 0x90
_alignment:                             ## @alignment
	.cfi_startproc
## %bb.0:
	movl	%edi, -4(%rsp)
	movzbl	%sil, %ecx
	jmp	LBB116_1
	.p2align	4, 0x90
LBB116_2:                               ## %body_0
                                        ##   in Loop: Header=BB116_1 Depth=1
	incl	-4(%rsp)
LBB116_1:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	movl	-4(%rsp), %eax
	xorl	%edx, %edx
	divl	%ecx
	testl	%edx, %edx
	jne	LBB116_2
## %bb.3:                               ## %break_0
	movl	-4(%rsp), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_typeCheck              ## -- Begin function typeCheck
	.p2align	4, 0x90
_typeCheck:                             ## @typeCheck
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movzwl	(%rdi), %eax
	cmpl	$6, %eax
	jne	LBB117_2
## %bb.1:                               ## %then_0
	addq	$72, %rdi
	callq	_typePointerCheck
	popq	%rax
	retq
LBB117_2:                               ## %else_0
	movzwl	%ax, %ecx
	cmpl	$7, %ecx
	jne	LBB117_4
## %bb.3:                               ## %then_1
	addq	$80, %rdi
	callq	_typeArrayCheck
	popq	%rax
	retq
LBB117_4:                               ## %else_1
	cmpl	$3, %ecx
	jne	LBB117_6
## %bb.5:                               ## %then_2
	addq	$48, %rdi
	callq	_typeFuncCheck
	popq	%rax
	retq
LBB117_6:                               ## %else_2
	cmpl	$5, %ecx
	jne	LBB117_8
## %bb.7:                               ## %then_3
	addq	$96, %rdi
	callq	_typeRecordCheck
	popq	%rax
	retq
LBB117_8:                               ## %else_3
	testw	%ax, %ax
	jne	LBB117_10
## %bb.9:                               ## %then_4
	movq	__func118_str1(%rip), %rax
	movq	144(%rdi), %rsi
	movq	%rax, %rdi
	callq	_error
LBB117_10:                              ## %endif_0
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_add_type               ## -- Begin function add_type
	.p2align	4, 0x90
_add_type:                              ## @add_type
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movq	%rdi, %r15
	movq	%rsi, %rdi
	callq	_get_type
	testq	%rax, %rax
	je	LBB118_5
## %bb.1:                               ## %then_0
	cmpw	$0, (%rax)
	je	LBB118_3
## %bb.2:                               ## %then_1
	movq	__func119_str1(%rip), %rdi
	movq	144(%r14), %rsi
	callq	_error
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB118_5:                               ## %else_0
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	_map_append
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB118_3:                               ## %else_1
	movl	$184, %edx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	_memcpy
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_type               ## -- Begin function get_type
	.p2align	4, 0x90
_get_type:                              ## @get_type
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %r14
	leaq	_globalTypeIndex(%rip), %rdi
	movq	%r14, %rsi
	callq	_map_get
	testq	%rax, %rax
	jne	LBB119_6
## %bb.1:                               ## %else_0
	movq	%rsp, %rax
	leaq	-16(%rax), %rbx
	movq	%rbx, %rsp
	movq	_fctx+8(%rip), %rcx
	movq	%rcx, -16(%rax)
	cmpq	$0, (%rbx)
	jne	LBB119_3
	jmp	LBB119_5
	.p2align	4, 0x90
LBB119_4:                               ## %else_1
                                        ##   in Loop: Header=BB119_3 Depth=1
	movq	(%rbx), %rax
	movq	(%rax), %rax
	movq	%rax, (%rbx)
	cmpq	$0, (%rbx)
	je	LBB119_5
LBB119_3:                               ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	addq	$16, %rdi
	movq	%r14, %rsi
	callq	_map_get
	testq	%rax, %rax
	je	LBB119_4
	jmp	LBB119_6
LBB119_5:                               ## %break_0
	leaq	_mctx+8(%rip), %rdi
	movq	%r14, %rsi
	callq	_map_get
LBB119_6:                               ## %then_0
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bind_value             ## -- Begin function bind_value
	.p2align	4, 0x90
_bind_value:                            ## @bind_value
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rax
	movq	%rdi, %rcx
	cmpq	$0, _fctx+8(%rip)
	je	LBB120_2
## %bb.1:                               ## %then_0
	movq	_fctx+8(%rip), %rdi
	movq	%rcx, %rsi
	movq	%rax, %rdx
	callq	_bind_value_in_block
	popq	%rax
	retq
LBB120_2:                               ## %else_0
	movq	%rcx, %rdi
	movq	%rax, %rsi
	callq	_bind_value_global
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bind_value_in_block    ## -- Begin function bind_value_in_block
	.p2align	4, 0x90
_bind_value_in_block:                   ## @bind_value_in_block
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	addq	$40, %rdi
	callq	_add_value
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bind_value_local       ## -- Begin function bind_value_local
	.p2align	4, 0x90
_bind_value_local:                      ## @bind_value_local
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rax
	movq	%rdi, %rcx
	movq	_fctx+8(%rip), %rdi
	addq	$40, %rdi
	movq	%rcx, %rsi
	movq	%rax, %rdx
	callq	_add_value
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bind_value_global      ## -- Begin function bind_value_global
	.p2align	4, 0x90
_bind_value_global:                     ## @bind_value_global
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rax
	movq	%rdi, %rcx
	leaq	_mctx+32(%rip), %rdi
	movq	%rcx, %rsi
	movq	%rax, %rdx
	callq	_add_value
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_add_value              ## -- Begin function add_value
	.p2align	4, 0x90
_add_value:                             ## @add_value
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
	callq	_map_get
	testq	%rax, %rax
	je	LBB124_5
## %bb.1:                               ## %then_0
	movzwl	(%rax), %ecx
	cmpl	$1, %ecx
	je	LBB124_3
## %bb.2:                               ## %then_1
	movq	__func125_str1(%rip), %rdi
	movq	184(%r14), %rsi
	callq	_error
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB124_5:                               ## %else_0
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r14, %rdx
	callq	_map_append
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB124_3:                               ## %else_1
	movl	$192, %edx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	_memcpy
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_value              ## -- Begin function get_value
	.p2align	4, 0x90
_get_value:                             ## @get_value
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	_get_value_local
	testq	%rax, %rax
	jne	LBB125_3
## %bb.1:                               ## %else_0
	movq	%rbx, %rdi
	callq	_get_value_global
	testq	%rax, %rax
	je	LBB125_2
LBB125_3:                               ## %then_1
	popq	%rbx
	retq
LBB125_2:                               ## %else_1
	movq	%rbx, %rdi
	callq	_get_value_builtin
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_value_local        ## -- Begin function get_value_local
	.p2align	4, 0x90
_get_value_local:                       ## @get_value_local
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	_fctx+8(%rip), %rax
	movq	%rax, 8(%rsp)
	.p2align	4, 0x90
LBB126_1:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	cmpq	$0, 8(%rsp)
	je	LBB126_5
## %bb.2:                               ## %body_0
                                        ##   in Loop: Header=BB126_1 Depth=1
	movq	8(%rsp), %rdi
	addq	$40, %rdi
	movq	%rbx, %rsi
	callq	_map_get
	testq	%rax, %rax
	jne	LBB126_6
## %bb.3:                               ## %else_0
                                        ##   in Loop: Header=BB126_1 Depth=1
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	jne	LBB126_1
## %bb.4:                               ## %then_1
	movq	_fctx(%rip), %rax
	movq	8(%rax), %rax
	movq	48(%rax), %rdi
	movq	%rbx, %rsi
	callq	_get_value_from_params
LBB126_6:                               ## %then_0
	addq	$16, %rsp
	popq	%rbx
	retq
LBB126_5:                               ## %break_0
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_value_global       ## -- Begin function get_value_global
	.p2align	4, 0x90
_get_value_global:                      ## @get_value_global
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	leaq	_mctx+32(%rip), %rdi
	movq	%rax, %rsi
	callq	_map_get
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_value_builtin      ## -- Begin function get_value_builtin
	.p2align	4, 0x90
_get_value_builtin:                     ## @get_value_builtin
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	leaq	_globalValueIndex(%rip), %rdi
	movq	%r14, %rsi
	callq	_map_get
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	LBB128_3
## %bb.1:                               ## %then_0
	movq	__func129_str1(%rip), %rsi
	movq	%r14, %rdi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB128_2
LBB128_3:                               ## %endif_0
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB128_2:                               ## %then_1
	movq	_fctx(%rip), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_psearch                ## -- Begin function psearch
	.p2align	4, 0x90
_psearch:                               ## @psearch
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	callq	_strcmp
	testl	%eax, %eax
	sete	%al
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_value_from_params  ## -- Begin function get_value_from_params
	.p2align	4, 0x90
_get_value_from_params:                 ## @get_value_from_params
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsi, %rax
	leaq	_psearch(%rip), %rsi
	movq	%rax, %rdx
	callq	_list_search
	testq	%rax, %rax
	je	LBB130_1
## %bb.2:                               ## %else_0
	movq	%rax, %rbx
	movq	24(%rax), %rsi
	movl	$5, %edi
	callq	_valueNew
	movq	8(%rbx), %rcx
	movq	%rcx, 8(%rax)
	movq	(%rbx), %rcx
	movq	%rcx, 64(%rax)
	movzwl	16(%rbx), %ecx
	movl	%ecx, 24(%rax)
	popq	%rbx
	retq
LBB130_1:                               ## %then_0
	xorl	%eax, %eax
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_declare                ## -- Begin function declare
	.p2align	4, 0x90
_declare:                               ## @declare
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	testq	%rdi, %rdi
	je	LBB131_7
## %bb.1:
	movq	%rsi, %r14
	testq	%rsi, %rsi
	je	LBB131_7
## %bb.2:                               ## %else_0
	movq	%rdx, %r15
	movq	%rdi, %rbx
	callq	_get_value_global
	testq	%rax, %rax
	je	LBB131_4
## %bb.3:                               ## %then_1
	movq	%rax, %r12
	movq	__func132_str1(%rip), %rdi
	movq	%r15, %rsi
	callq	_error
	movq	__func132_str2(%rip), %rdi
	movq	168(%r12), %rsi
	callq	_rem
	jmp	LBB131_7
LBB131_4:                               ## %else_1
	movl	$1, %edi
	movq	%r15, %rsi
	callq	_valueNew
	movq	%rax, %r12
	movq	%r14, 8(%rax)
	movq	%rbx, 64(%rax)
	movq	%r15, 168(%rax)
	movzwl	(%r14), %eax
	cmpl	$3, %eax
	jne	LBB131_6
## %bb.5:                               ## %then_2
	movw	$3, (%r12)
	leaq	_asm0(%rip), %rdi
	xorl	%ecx, %ecx
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	_asmFuncAdd
	movq	%rax, 32(%r12)
LBB131_6:                               ## %endif_2
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	_bind_value_global
LBB131_7:                               ## %then_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_def_global             ## -- Begin function def_global
	.p2align	4, 0x90
_def_global:                            ## @def_global
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movq	%rdi, %r15
	xorl	%edi, %edi
	testq	%r15, %r15
	setne	%dil
	movq	__func133_str1(%rip), %rsi
	callq	_assert
	xorl	%edi, %edi
	testq	%rbx, %rbx
	setne	%dil
	movq	__func133_str2(%rip), %rsi
	callq	_assert
	movq	%r14, 176(%rbx)
	movq	%r15, %rdi
	callq	_get_value_global
	testq	%rax, %rax
	je	LBB132_1
## %bb.3:                               ## %else_0
	movzwl	(%rax), %ecx
	cmpl	$1, %ecx
	je	LBB132_5
## %bb.4:                               ## %then_1
	movq	__func133_str3(%rip), %rdi
	movq	%r14, %rsi
	callq	_error
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB132_1:                               ## %then_0
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	_bind_value_global
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB132_5:                               ## %else_1
	movzwl	(%rbx), %ecx
	movw	%cx, (%rax)
	movq	8(%rbx), %rcx
	movq	%rcx, 8(%rax)
	movq	64(%rbx), %rcx
	movq	%rcx, 64(%rax)
	movq	32(%rbx), %rcx
	movq	%rcx, 32(%rax)
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_rename                 ## -- Begin function rename
	.p2align	4, 0x90
_rename:                                ## @rename
	.cfi_startproc
## %bb.0:
	cmpq	$0, 64(%rdi)
	je	LBB133_4
## %bb.1:                               ## %then_0
	movq	32(%rdi), %rax
	testq	%rax, %rax
	je	LBB133_4
## %bb.2:                               ## %then_1
	cmpb	$0, 16(%rax)
	jne	LBB133_4
## %bb.3:                               ## %then_2
	movq	%rsi, 8(%rax)
	movb	$1, 16(%rax)
LBB133_4:                               ## %endif_0
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_suid               ## -- Begin function get_suid
	.p2align	4, 0x90
_get_suid:                              ## @get_suid
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r14d
	movq	%rdi, %rbx
	callq	_strlen
                                        ## kill: def $eax killed $eax def $rax
	leal	9(%rax), %edi
	callq	_str_new
	movq	%rax, %rbp
	movq	__func135_str1(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbp, %rdi
	movq	%rbx, %rdx
	movl	%r14d, %ecx
	callq	_sprintf
	movq	%rbp, %rax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_prefix             ## -- Begin function get_prefix
	.p2align	4, 0x90
_get_prefix:                            ## @get_prefix
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	cmpq	$0, _fctx(%rip)
	je	LBB135_2
## %bb.1:                               ## %then_0
	movq	_fctx(%rip), %rax
	movq	64(%rax), %rdi
	callq	_dup
	popq	%rcx
	retq
LBB135_2:                               ## %else_0
	movq	__func136_str1(%rip), %rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_name               ## -- Begin function get_name
	.p2align	4, 0x90
_get_name:                              ## @get_name
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	callq	_get_prefix
	movq	%rax, %r15
	movl	(%rbx), %esi
	incl	%esi
	movl	%esi, (%rbx)
	movq	%r14, %rdi
	callq	_get_suid
	movq	%rax, 8(%rsp)
	movq	__func137_str1(%rip), %rsi
	movq	%r15, %rdi
	movq	%rax, %rdx
	callq	_cat3
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_name_func          ## -- Begin function get_name_func
	.p2align	4, 0x90
_get_name_func:                         ## @get_name_func
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__func138_str1(%rip), %rdi
	leaq	_func_uid(%rip), %rsi
	callq	_get_name
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_name_str           ## -- Begin function get_name_str
	.p2align	4, 0x90
_get_name_str:                          ## @get_name_str
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	_str_uid(%rip), %rax
	movq	%rax, (%rsp)
	cmpq	$0, _fctx(%rip)
	je	LBB138_2
## %bb.1:                               ## %then_0
	leaq	_fctx+24(%rip), %rax
	movq	%rax, (%rsp)
LBB138_2:                               ## %endif_0
	movq	__func139_str1(%rip), %rdi
	movq	(%rsp), %rsi
	callq	_get_name
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_name_arr           ## -- Begin function get_name_arr
	.p2align	4, 0x90
_get_name_arr:                          ## @get_name_arr
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__func140_str1(%rip), %rdi
	leaq	_arr_uid(%rip), %rsi
	callq	_get_name
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_name_var           ## -- Begin function get_name_var
	.p2align	4, 0x90
_get_name_var:                          ## @get_name_var
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__func141_str1(%rip), %rdi
	leaq	_var_uid(%rip), %rsi
	callq	_get_name
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_name_type          ## -- Begin function get_name_type
	.p2align	4, 0x90
_get_name_type:                         ## @get_name_type
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__func142_str1(%rip), %rdi
	leaq	_type_uid(%rip), %rsi
	callq	_get_name
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_cexpr                  ## -- Begin function cexpr
	.p2align	4, 0x90
_cexpr:                                 ## @cexpr
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_hier1
	testq	%rax, %rax
	je	LBB142_3
## %bb.1:                               ## %else_0
	movzwl	(%rax), %ecx
	cmpl	$2, %ecx
	je	LBB142_4
## %bb.2:                               ## %then_1
	movq	__func143_str1(%rip), %rdi
	movq	184(%rax), %rsi
	callq	_error
LBB142_3:                               ## %fail
	xorl	%eax, %eax
LBB142_4:                               ## %else_1
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier1                  ## -- Begin function hier1
	.p2align	4, 0x90
_hier1:                                 ## @hier1
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	callq	_hier2
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	LBB143_1
## %bb.3:                               ## %else_0
	callq	_ctok
	movq	%rax, %rbx
	movq	__func144_str1(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB143_5
## %bb.4:                               ## %then_1
	addq	$8, %rbx
	callq	_skip_nl
	movq	(%rsp), %r14
	callq	_hier1
	movl	$17, %edi
	movq	%r14, %rsi
	movq	%rax, %rdx
	movq	%rbx, %rcx
	callq	_bin
	movq	%rax, (%rsp)
LBB143_5:                               ## %endif_1
	movq	(%rsp), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB143_1:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier2                  ## -- Begin function hier2
	.p2align	4, 0x90
_hier2:                                 ## @hier2
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	callq	_hier3
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	LBB144_1
## %bb.3:                               ## %else_0
	callq	_ctok
	movq	%rax, %rbx
	movq	__func145_str1(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB144_5
## %bb.4:                               ## %then_1
	addq	$8, %rbx
	callq	_skip_nl
	movq	(%rsp), %r14
	callq	_hier2
	movl	$18, %edi
	movq	%r14, %rsi
	movq	%rax, %rdx
	movq	%rbx, %rcx
	callq	_bin
	movq	%rax, (%rsp)
LBB144_5:                               ## %endif_1
	movq	(%rsp), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB144_1:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier3                  ## -- Begin function hier3
	.p2align	4, 0x90
_hier3:                                 ## @hier3
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	callq	_hier4
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	LBB145_1
## %bb.3:                               ## %else_0
	callq	_ctok
	movq	%rax, %rbx
	movq	__func146_str1(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB145_5
## %bb.4:                               ## %then_1
	addq	$8, %rbx
	callq	_skip_nl
	movq	(%rsp), %r14
	callq	_hier3
	movl	$19, %edi
	movq	%r14, %rsi
	movq	%rax, %rdx
	movq	%rbx, %rcx
	callq	_bin
	movq	%rax, (%rsp)
LBB145_5:                               ## %endif_1
	movq	(%rsp), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB145_1:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier4                  ## -- Begin function hier4
	.p2align	4, 0x90
_hier4:                                 ## @hier4
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_hier5
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	LBB146_5
## %bb.1:
	movq	__func147_str1(%rip), %r15
	movq	__func147_str2(%rip), %r14
	jmp	LBB146_2
	.p2align	4, 0x90
LBB146_4:                               ## %continue_0
                                        ##   in Loop: Header=BB146_2 Depth=1
	movq	%r12, %rsi
	movq	%rax, %rdx
	movq	%rbx, %rcx
	callq	_bin
	movq	%rax, (%rsp)
LBB146_2:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_ctok
	movq	%rax, %rbx
	addq	$8, %rbx
	movq	%r15, %rdi
	callq	_match
	testb	$1, %al
	je	LBB146_7
## %bb.3:                               ## %then_1
                                        ##   in Loop: Header=BB146_2 Depth=1
	callq	_skip_nl
	movq	(%rsp), %r12
	callq	_hier4
	movl	$20, %edi
	jmp	LBB146_4
	.p2align	4, 0x90
LBB146_7:                               ## %else_1
                                        ##   in Loop: Header=BB146_2 Depth=1
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	je	LBB146_9
## %bb.8:                               ## %then_2
                                        ##   in Loop: Header=BB146_2 Depth=1
	callq	_skip_nl
	movq	(%rsp), %r12
	callq	_hier4
	movl	$21, %edi
	jmp	LBB146_4
LBB146_9:                               ## %break_0
	movq	(%rsp), %rax
	jmp	LBB146_6
LBB146_5:                               ## %then_0
	xorl	%eax, %eax
LBB146_6:                               ## %then_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier5                  ## -- Begin function hier5
	.p2align	4, 0x90
_hier5:                                 ## @hier5
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	callq	_hier6
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	LBB147_5
## %bb.1:
	movq	__func148_str1(%rip), %r13
	movq	__func148_str2(%rip), %r14
	movq	__func148_str3(%rip), %r15
	movq	__func148_str4(%rip), %r12
	jmp	LBB147_2
	.p2align	4, 0x90
LBB147_4:                               ## %continue_0
                                        ##   in Loop: Header=BB147_2 Depth=1
	movq	%rbp, %rsi
	movq	%rax, %rdx
	movq	%rbx, %rcx
	callq	_bin
	movq	%rax, (%rsp)
LBB147_2:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_ctok
	movq	%rax, %rbx
	addq	$8, %rbx
	movq	%r13, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB147_3
## %bb.7:                               ## %else_1
                                        ##   in Loop: Header=BB147_2 Depth=1
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB147_8
## %bb.9:                               ## %else_2
                                        ##   in Loop: Header=BB147_2 Depth=1
	movq	%r15, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB147_10
## %bb.11:                              ## %else_3
                                        ##   in Loop: Header=BB147_2 Depth=1
	movq	%r12, %rdi
	callq	_match
	testb	$1, %al
	je	LBB147_13
## %bb.12:                              ## %then_4
                                        ##   in Loop: Header=BB147_2 Depth=1
	callq	_skip_nl
	movq	(%rsp), %rbp
	callq	_hier6
	movl	$25, %edi
	jmp	LBB147_4
	.p2align	4, 0x90
LBB147_3:                               ## %then_1
                                        ##   in Loop: Header=BB147_2 Depth=1
	callq	_skip_nl
	movq	(%rsp), %rbp
	callq	_hier6
	movl	$22, %edi
	jmp	LBB147_4
	.p2align	4, 0x90
LBB147_8:                               ## %then_2
                                        ##   in Loop: Header=BB147_2 Depth=1
	callq	_skip_nl
	movq	(%rsp), %rbp
	callq	_hier6
	movl	$23, %edi
	jmp	LBB147_4
LBB147_10:                              ## %then_3
                                        ##   in Loop: Header=BB147_2 Depth=1
	callq	_skip_nl
	movq	(%rsp), %rbp
	callq	_hier6
	movl	$24, %edi
	jmp	LBB147_4
LBB147_13:                              ## %break_0
	movq	(%rsp), %rax
	jmp	LBB147_6
LBB147_5:                               ## %then_0
	xorl	%eax, %eax
LBB147_6:                               ## %then_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier6                  ## -- Begin function hier6
	.p2align	4, 0x90
_hier6:                                 ## @hier6
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_hier7
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	LBB148_5
## %bb.1:
	movq	__func149_str1(%rip), %r15
	movq	__func149_str2(%rip), %r14
	jmp	LBB148_2
	.p2align	4, 0x90
LBB148_4:                               ## %continue_0
                                        ##   in Loop: Header=BB148_2 Depth=1
	movq	%r12, %rsi
	movq	%rax, %rdx
	movq	%rbx, %rcx
	callq	_shift
	movq	%rax, (%rsp)
LBB148_2:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_ctok
	movq	%rax, %rbx
	addq	$8, %rbx
	movq	%r15, %rdi
	callq	_match
	testb	$1, %al
	je	LBB148_7
## %bb.3:                               ## %then_1
                                        ##   in Loop: Header=BB148_2 Depth=1
	callq	_skip_nl
	movq	(%rsp), %r12
	callq	_hier7
	movl	$26, %edi
	jmp	LBB148_4
	.p2align	4, 0x90
LBB148_7:                               ## %else_1
                                        ##   in Loop: Header=BB148_2 Depth=1
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	je	LBB148_9
## %bb.8:                               ## %then_2
                                        ##   in Loop: Header=BB148_2 Depth=1
	callq	_skip_nl
	movq	(%rsp), %r12
	callq	_hier7
	movl	$27, %edi
	jmp	LBB148_4
LBB148_9:                               ## %break_0
	movq	(%rsp), %rax
	jmp	LBB148_6
LBB148_5:                               ## %then_0
	xorl	%eax, %eax
LBB148_6:                               ## %then_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier7                  ## -- Begin function hier7
	.p2align	4, 0x90
_hier7:                                 ## @hier7
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_hier8
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	LBB149_5
## %bb.1:
	movq	__func150_str1(%rip), %r15
	movq	__func150_str2(%rip), %r14
	jmp	LBB149_2
	.p2align	4, 0x90
LBB149_4:                               ## %continue_0
                                        ##   in Loop: Header=BB149_2 Depth=1
	movq	%r12, %rsi
	movq	%rax, %rdx
	movq	%rbx, %rcx
	callq	_bin
	movq	%rax, (%rsp)
LBB149_2:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_ctok
	movq	%rax, %rbx
	addq	$8, %rbx
	movq	%r15, %rdi
	callq	_match
	testb	$1, %al
	je	LBB149_7
## %bb.3:                               ## %then_1
                                        ##   in Loop: Header=BB149_2 Depth=1
	callq	_skip_nl
	movq	(%rsp), %r12
	callq	_hier8
	movl	$12, %edi
	jmp	LBB149_4
	.p2align	4, 0x90
LBB149_7:                               ## %else_1
                                        ##   in Loop: Header=BB149_2 Depth=1
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	je	LBB149_9
## %bb.8:                               ## %then_2
                                        ##   in Loop: Header=BB149_2 Depth=1
	callq	_skip_nl
	movq	(%rsp), %r12
	callq	_hier8
	movl	$13, %edi
	jmp	LBB149_4
LBB149_9:                               ## %break_0
	movq	(%rsp), %rax
	jmp	LBB149_6
LBB149_5:                               ## %then_0
	xorl	%eax, %eax
LBB149_6:                               ## %then_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier8                  ## -- Begin function hier8
	.p2align	4, 0x90
_hier8:                                 ## @hier8
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_hier9
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	LBB150_5
## %bb.1:
	movq	__func151_str1(%rip), %r12
	movq	__func151_str2(%rip), %r14
	movq	__func151_str3(%rip), %r15
	jmp	LBB150_2
	.p2align	4, 0x90
LBB150_4:                               ## %continue_0
                                        ##   in Loop: Header=BB150_2 Depth=1
	movq	%r13, %rsi
	movq	%rax, %rdx
	movq	%rbx, %rcx
	callq	_bin
	movq	%rax, 8(%rsp)
LBB150_2:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_ctok
	movq	%rax, %rbx
	addq	$8, %rbx
	movq	%r12, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB150_3
## %bb.7:                               ## %else_1
                                        ##   in Loop: Header=BB150_2 Depth=1
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB150_8
## %bb.9:                               ## %else_2
                                        ##   in Loop: Header=BB150_2 Depth=1
	movq	%r15, %rdi
	callq	_match
	testb	$1, %al
	je	LBB150_11
## %bb.10:                              ## %then_3
                                        ##   in Loop: Header=BB150_2 Depth=1
	callq	_skip_nl
	movq	8(%rsp), %r13
	callq	_hier9
	movl	$16, %edi
	jmp	LBB150_4
	.p2align	4, 0x90
LBB150_3:                               ## %then_1
                                        ##   in Loop: Header=BB150_2 Depth=1
	callq	_skip_nl
	movq	8(%rsp), %r13
	callq	_hier9
	movl	$14, %edi
	jmp	LBB150_4
	.p2align	4, 0x90
LBB150_8:                               ## %then_2
                                        ##   in Loop: Header=BB150_2 Depth=1
	callq	_skip_nl
	movq	8(%rsp), %r13
	callq	_hier9
	movl	$15, %edi
	jmp	LBB150_4
LBB150_11:                              ## %break_0
	movq	8(%rsp), %rax
	jmp	LBB150_6
LBB150_5:                               ## %then_0
	xorl	%eax, %eax
LBB150_6:                               ## %then_0
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier9                  ## -- Begin function hier9
	.p2align	4, 0x90
_hier9:                                 ## @hier9
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	callq	_hier10
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	LBB151_1
## %bb.3:                               ## %else_0
	callq	_ctok
	movq	%rax, %rbx
	movq	__func152_str1(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB151_5
## %bb.4:                               ## %then_1
	addq	$8, %rbx
	callq	_parse_type
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	callq	_cast
	movq	%rax, 8(%rsp)
LBB151_5:                               ## %endif_1
	movq	8(%rsp), %rax
	addq	$16, %rsp
	popq	%rbx
	retq
LBB151_1:                               ## %then_0
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier10                 ## -- Begin function hier10
	.p2align	4, 0x90
_hier10:                                ## @hier10
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	callq	_ctok
	movq	%rax, %rbx
	addq	$8, %rbx
	movq	__func153_str1(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB152_3
## %bb.1:                               ## %then_0
	callq	_hier10
	movl	$9, %edi
	jmp	LBB152_2
LBB152_3:                               ## %else_0
	movq	__func153_str2(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB152_5
## %bb.4:                               ## %then_1
	callq	_hier11
	movl	$8, %edi
	jmp	LBB152_2
LBB152_5:                               ## %else_1
	movq	__func153_str3(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB152_7
## %bb.6:                               ## %then_2
	callq	_hier10
	movl	$10, %edi
	jmp	LBB152_2
LBB152_7:                               ## %else_2
	movq	__func153_str4(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB152_9
## %bb.8:                               ## %then_3
	callq	_hier10
	movl	$11, %edi
LBB152_2:                               ## %endif_0
	movq	%rax, %rsi
	movq	%rbx, %rdx
	callq	_un
LBB152_19:                              ## %endif_0
	movq	%rax, (%rsp)
	movq	(%rsp), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB152_9:                               ## %else_3
	movq	__func153_str5(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB152_14
## %bb.10:                              ## %then_4
	callq	_ctok
	movq	%rax, %r14
	callq	_parse_type
	testq	%rax, %rax
	je	LBB152_11
## %bb.13:                              ## %else_5
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	_size_of
	jmp	LBB152_19
LBB152_14:                              ## %else_4
	movq	__func153_str7(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB152_18
## %bb.15:                              ## %then_6
	callq	_ctok
	movq	%rax, %r14
	callq	_parse_type
	testq	%rax, %rax
	je	LBB152_16
## %bb.17:                              ## %else_7
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	_align_of
	jmp	LBB152_19
LBB152_18:                              ## %else_6
	callq	_hier11
	jmp	LBB152_19
LBB152_11:                              ## %then_5
	addq	$8, %r14
	movq	__func153_str6(%rip), %rdi
	jmp	LBB152_12
LBB152_16:                              ## %then_7
	addq	$8, %r14
	movq	__func153_str8(%rip), %rdi
LBB152_12:                              ## %then_5
	movq	%r14, %rsi
	callq	_error
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier11                 ## -- Begin function hier11
	.p2align	4, 0x90
_hier11:                                ## @hier11
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_hier12
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	LBB153_8
## %bb.1:
	movq	__func154_str1(%rip), %r14
	jmp	LBB153_2
	.p2align	4, 0x90
LBB153_12:                              ## %break_1
                                        ##   in Loop: Header=BB153_2 Depth=1
	movq	8(%rsp), %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_call
	movq	%rax, 8(%rsp)
LBB153_2:                               ## %continue_0
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB153_4 Depth 2
	callq	_ctok
	movq	%rax, %r15
	addq	$8, %r15
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	je	LBB153_13
## %bb.3:                               ## %then_1
                                        ##   in Loop: Header=BB153_2 Depth=1
	callq	_list_new
	movq	%rax, %rbx
	jmp	LBB153_4
	.p2align	4, 0x90
LBB153_11:                              ## %then_5
                                        ##   in Loop: Header=BB153_4 Depth=2
	movq	__func154_str7(%rip), %rdi
	callq	_need
LBB153_4:                               ## %continue_1
                                        ##   Parent Loop BB153_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	__func154_str2(%rip), %rdi
	callq	_match
	testb	$1, %al
	jne	LBB153_12
## %bb.5:                               ## %body_1
                                        ##   in Loop: Header=BB153_4 Depth=2
	callq	_hier1
	testq	%rax, %rax
	je	LBB153_6
## %bb.10:                              ## %else_2
                                        ##   in Loop: Header=BB153_4 Depth=2
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_list_append
	movq	__func154_str6(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB153_11
	jmp	LBB153_12
	.p2align	4, 0x90
LBB153_6:                               ## %then_2
                                        ##   in Loop: Header=BB153_4 Depth=2
	movq	__func154_str3(%rip), %rdi
	callq	_skipto
	movq	__func154_str4(%rip), %rdi
	callq	_match
	testb	$1, %al
	jne	LBB153_4
## %bb.7:                               ## %else_3
                                        ##   in Loop: Header=BB153_2 Depth=1
	movq	__func154_str5(%rip), %rdi
	callq	_match
	testb	$1, %al
	jne	LBB153_12
	jmp	LBB153_8
	.p2align	4, 0x90
LBB153_13:                              ## %else_1
                                        ##   in Loop: Header=BB153_2 Depth=1
	movq	__func154_str8(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB153_15
## %bb.14:                              ## %then_6
                                        ##   in Loop: Header=BB153_2 Depth=1
	callq	_hier1
	movq	%rax, %rbx
	movq	__func154_str9(%rip), %rdi
	callq	_match
	movq	8(%rsp), %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_indx
	movq	%rax, 8(%rsp)
	jmp	LBB153_2
	.p2align	4, 0x90
LBB153_15:                              ## %else_6
                                        ##   in Loop: Header=BB153_2 Depth=1
	movq	__func154_str10(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB153_17
## %bb.16:                              ## %then_7
                                        ##   in Loop: Header=BB153_2 Depth=1
	callq	_parseId
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	movq	%r15, %rdx
	callq	_access
	movq	%rax, 8(%rsp)
	jmp	LBB153_2
LBB153_8:                               ## %then_0
	xorl	%eax, %eax
	jmp	LBB153_9
LBB153_17:                              ## %break_0
	movq	8(%rsp), %rax
LBB153_9:                               ## %then_0
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_hier12                 ## -- Begin function hier12
	.p2align	4, 0x90
_hier12:                                ## @hier12
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_ctok
	movq	__func155_str1(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB154_2
## %bb.1:                               ## %then_0
	callq	_hier1
	movq	%rax, (%rsp)
	movq	__func155_str2(%rip), %rdi
	callq	_need
	movq	(%rsp), %rax
	popq	%rcx
	retq
LBB154_2:                               ## %else_0
	callq	_term
	movq	%rax, (%rsp)
	movq	(%rsp), %rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_term                   ## -- Begin function term
	.p2align	4, 0x90
_term:                                  ## @term
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	callq	_ctok
	movq	%rax, %rbx
	movzwl	(%rax), %eax
	movq	$0, 8(%rsp)
	cmpl	$1, %eax
	jne	LBB155_6
## %bb.1:                               ## %then_0
	movq	__func156_str1(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB155_3
## %bb.2:                               ## %then_1
	callq	_term_func
	movq	%rax, 8(%rsp)
	cmpq	$0, 8(%rsp)
	jne	LBB155_14
	jmp	LBB155_15
LBB155_6:                               ## %else_0
	movzwl	%ax, %eax
	cmpl	$2, %eax
	jne	LBB155_8
## %bb.7:                               ## %then_3
	callq	_term_num
	movq	%rax, 8(%rsp)
	cmpq	$0, 8(%rsp)
	je	LBB155_15
LBB155_14:                              ## %then_6
	movq	8(%rsp), %rax
	addq	$8, %rbx
	movq	%rbx, 184(%rax)
LBB155_15:                              ## %endif_6
	movq	8(%rsp), %rax
	addq	$16, %rsp
	popq	%rbx
	retq
LBB155_3:                               ## %else_1
	movq	__func156_str2(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB155_5
## %bb.4:                               ## %then_2
	callq	_term_arr
	movq	%rax, 8(%rsp)
	cmpq	$0, 8(%rsp)
	jne	LBB155_14
	jmp	LBB155_15
LBB155_8:                               ## %else_3
	cmpl	$4, %eax
	jne	LBB155_10
## %bb.9:                               ## %then_4
	callq	_term_str
	movq	%rax, 8(%rsp)
	cmpq	$0, 8(%rsp)
	jne	LBB155_14
	jmp	LBB155_15
LBB155_5:                               ## %else_2
	callq	_term_id
	movq	%rax, 8(%rsp)
	cmpq	$0, 8(%rsp)
	jne	LBB155_14
	jmp	LBB155_15
LBB155_10:                              ## %else_4
	cmpl	$5, %eax
	jne	LBB155_12
## %bb.11:                              ## %then_5
	callq	_term_hash
	movq	%rax, 8(%rsp)
	cmpq	$0, 8(%rsp)
	jne	LBB155_14
	jmp	LBB155_15
LBB155_12:                              ## %else_5
	movq	__func156_str3(%rip), %rdi
	leaq	8(%rbx), %rsi
	callq	_error
	movq	__func156_str4(%rip), %rdi
	movzwl	(%rbx), %esi
	xorl	%eax, %eax
	callq	_printf
	movq	__func156_str5(%rip), %rdi
	leaq	24(%rbx), %rsi
	xorl	%eax, %eax
	callq	_printf
	cmpq	$0, 8(%rsp)
	jne	LBB155_14
	jmp	LBB155_15
	.cfi_endproc
                                        ## -- End function
	.globl	_term_str               ## -- Begin function term_str
	.p2align	4, 0x90
_term_str:                              ## @term_str
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	callq	_ctok
	leaq	8(%rax), %r14
	callq	_ctok
	movq	%rax, %rbx
	addq	$24, %rbx
	movq	%rbx, %rdi
	callq	_strlen
                                        ## kill: def $eax killed $eax def $rax
	leal	1(%rax), %r15d
	movq	%rbx, %rdi
	callq	_dup
	movq	%rax, %r12
	callq	_skip
	callq	_get_name_str
	movq	%rax, %rbp
	movl	$4, %edi
	movq	%r14, %rsi
	callq	_valueNew
	movq	%rax, %rbx
	leaq	_asm0(%rip), %rdi
	movq	%rbp, %rsi
	movq	%r12, %rdx
	movl	%r15d, %ecx
	callq	_asmStringAdd
	movq	%rax, 32(%rbx)
	movq	_typeStr(%rip), %rax
	movq	%rax, 8(%rbx)
	movq	%rbp, 64(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_term_arr               ## -- Begin function term_arr
	.p2align	4, 0x90
_term_arr:                              ## @term_arr
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_ctok
	movq	%rax, %r14
	addq	$8, %r14
	callq	_parse_type
	movq	%rax, %r15
	movq	__func158_str1(%rip), %rdi
	callq	_need
	callq	_list_new
	movq	%rax, %r12
	movl	$0, 12(%rsp)
	movq	__func158_str2(%rip), %rbx
	movq	%rbx, %rdi
	callq	_match
	testb	$1, %al
	je	LBB157_2
	jmp	LBB157_5
	.p2align	4, 0x90
LBB157_4:                               ## %else_0
                                        ##   in Loop: Header=BB157_2 Depth=1
	movq	_typeBaseInt(%rip), %rsi
	movq	%rax, %rdi
	callq	_castIfNumericTo
	incl	12(%rsp)
	movq	%r12, %rdi
	movq	%rax, %rsi
	callq	_list_append
	movq	__func158_str4(%rip), %rdi
	callq	_match
	movq	%rbx, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB157_5
LBB157_2:                               ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_cexpr
	testq	%rax, %rax
	jne	LBB157_4
## %bb.3:                               ## %then_0
                                        ##   in Loop: Header=BB157_2 Depth=1
	movq	__func158_str3(%rip), %rdi
	callq	_match
	movq	%rbx, %rdi
	callq	_match
	testb	$1, %al
	je	LBB157_2
LBB157_5:                               ## %break_0
	callq	_get_name_arr
	movq	%rax, %r13
	movl	12(%rsp), %esi
	xorl	%edx, %edx
	movq	%r15, %rdi
	callq	_type_array_new
	movq	%rax, %r15
	movl	$3, %edi
	movq	%r14, %rsi
	callq	_valueNew
	movq	%rax, %rbx
	leaq	_asm0(%rip), %rdi
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	%r12, %rcx
	callq	_asmArrayAdd
	movq	%rax, 32(%rbx)
	movq	%r15, 8(%rbx)
	movq	%r13, 64(%rbx)
	movq	%r14, 176(%rbx)
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_term_func              ## -- Begin function term_func
	.p2align	4, 0x90
_term_func:                             ## @term_func
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	_fctx+32(%rip), %eax
	movl	%eax, 16(%rsp)          ## 4-byte Spill
	movl	_fctx+28(%rip), %eax
	movl	%eax, 12(%rsp)          ## 4-byte Spill
	movl	_fctx+24(%rip), %r14d
	movl	_fctx+20(%rip), %r12d
	movl	_fctx+16(%rip), %ebx
	movq	_fctx+8(%rip), %rbp
	movq	_fctx(%rip), %rax
	movq	%rax, 24(%rsp)          ## 8-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, _fctx(%rip)
	movaps	%xmm0, _fctx+16(%rip)
	movl	$0, _fctx+32(%rip)
	callq	_ctok
	movq	%rax, %r15
	callq	_get_name_func
	testq	%rax, %rax
	je	LBB158_1
## %bb.2:                               ## %else_0
	movq	%rax, %r13
	movl	%ebx, 4(%rsp)           ## 4-byte Spill
	movl	%r12d, 8(%rsp)          ## 4-byte Spill
	callq	_parse_type
	testq	%rax, %rax
	je	LBB158_3
## %bb.5:                               ## %else_1
	movq	%rax, %r12
	movl	%r14d, 20(%rsp)         ## 4-byte Spill
	movq	%r15, %rbx
	addq	$8, %rbx
	movl	$3, %edi
	movq	%rbx, %rsi
	callq	_valueNew
	movq	%rax, %r15
	movq	%rbp, %r14
	testq	%rbp, %rbp
	je	LBB158_7
## %bb.6:                               ## %then_2
	movq	64(%r14), %rdi
	movq	%r15, %rsi
	callq	_list_append
LBB158_7:                               ## %endif_2
	movq	%r15, _fctx(%rip)
	movq	%r12, 8(%r15)
	movq	%r13, 64(%r15)
	movq	%rbx, 176(%r15)
	movq	%r15, _fctx(%rip)
	movq	__func159_str3(%rip), %rdi
	callq	_need
	callq	_doblock
	movq	%rbx, 32(%rsp)          ## 8-byte Spill
	movq	%rax, %rbx
	leaq	_asm0(%rip), %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	%rax, %rcx
	callq	_asmFuncAdd
	movq	%rax, 32(%r15)
	movq	56(%r12), %rdi
	movq	_typeUnit(%rip), %rsi
	callq	_type_eq
	testb	$1, %al
	movl	8(%rsp), %r12d          ## 4-byte Reload
	movl	4(%rsp), %ebp           ## 4-byte Reload
	jne	LBB158_13
## %bb.8:                               ## %then_3
	movq	32(%rsp), %rsi          ## 8-byte Reload
	movq	8(%rbx), %rax
	cmpq	$0, 16(%rax)
	je	LBB158_9
## %bb.10:                              ## %else_4
	movq	8(%rbx), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movzwl	(%rax), %ecx
	cmpl	$6, %ecx
	je	LBB158_13
## %bb.11:                              ## %then_5
	movq	_E_EXPECTED_RETURN(%rip), %rdi
	movq	72(%rax), %rsi
	jmp	LBB158_12
LBB158_1:                               ## %then_0
	movq	__func159_str1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	jmp	LBB158_4
LBB158_3:                               ## %then_1
	movq	__func159_str2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movl	8(%rsp), %r12d          ## 4-byte Reload
	movl	4(%rsp), %ebx           ## 4-byte Reload
LBB158_4:                               ## %fail
	movq	24(%rsp), %rax          ## 8-byte Reload
	movq	%rax, _fctx(%rip)
	movq	%rbp, _fctx+8(%rip)
	movl	%ebx, _fctx+16(%rip)
	movl	%r12d, _fctx+20(%rip)
	movl	%r14d, _fctx+24(%rip)
	movl	12(%rsp), %eax          ## 4-byte Reload
	movl	%eax, _fctx+28(%rip)
	movl	16(%rsp), %eax          ## 4-byte Reload
	movl	%eax, _fctx+32(%rip)
	xorl	%eax, %eax
	jmp	LBB158_14
LBB158_9:                               ## %then_4
	movq	_E_EXPECTED_RETURN(%rip), %rdi
LBB158_12:                              ## %endif_3
	callq	_error
LBB158_13:                              ## %endif_3
	movq	24(%rsp), %rax          ## 8-byte Reload
	movq	%rax, _fctx(%rip)
	movq	%r14, _fctx+8(%rip)
	movl	%ebp, _fctx+16(%rip)
	movl	%r12d, _fctx+20(%rip)
	movl	20(%rsp), %eax          ## 4-byte Reload
	movl	%eax, _fctx+24(%rip)
	movl	12(%rsp), %eax          ## 4-byte Reload
	movl	%eax, _fctx+28(%rip)
	movl	16(%rsp), %eax          ## 4-byte Reload
	movl	%eax, _fctx+32(%rip)
	movq	%r15, %rax
LBB158_14:                              ## %fail
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_term_id                ## -- Begin function term_id
	.p2align	4, 0x90
_term_id:                               ## @term_id
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_ctok
	movq	%rax, %r14
	callq	_parseId
	testq	%rax, %rax
	je	LBB159_1
## %bb.3:                               ## %else_0
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	_get_value
	testq	%rax, %rax
	je	LBB159_4
## %bb.5:                               ## %else_1
	movq	%rbx, 64(%rax)
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB159_1:                               ## %then_0
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB159_4:                               ## %then_1
	addq	$8, %r14
	movl	$1, %edi
	movq	%r14, %rsi
	callq	_valueNew
	movq	%rax, %r15
	movq	%rbx, 64(%rax)
	movq	%r14, 168(%rax)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_bind_value_global
	movq	%r15, %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_term_num               ## -- Begin function term_num
	.p2align	4, 0x90
_term_num:                              ## @term_num
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	callq	_ctok
	movq	%rax, %rbx
	addq	$8, %rbx
	callq	_ctok
	movq	%rax, %rcx
	movq	__func161_str1(%rip), %rax
	movb	24(%rcx), %dl
	cmpb	(%rax), %dl
	jne	LBB160_3
## %bb.1:
	movq	__func161_str2(%rip), %rax
	movb	(%rax), %al
	cmpb	%al, 25(%rcx)
	jne	LBB160_3
## %bb.2:                               ## %then_0
	addq	$26, %rcx
	movq	__func161_str3(%rip), %rsi
	jmp	LBB160_4
LBB160_3:                               ## %else_0
	addq	$24, %rcx
	movq	__func161_str4(%rip), %rsi
LBB160_4:                               ## %endif_0
	leaq	8(%rsp), %rdx
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	_sscanf
	callq	_skip
	movq	_typeNumeric(%rip), %rdi
	movq	8(%rsp), %rsi
	movq	%rbx, %rdx
	callq	_valueNewImm
	movq	%rbx, 176(%rax)
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_term_hash              ## -- Begin function term_hash
	.p2align	4, 0x90
_term_hash:                             ## @term_hash
	.cfi_startproc
## %bb.0:
	xorl	%eax, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtLetCheck           ## -- Begin function stmtLetCheck
	.p2align	4, 0x90
_stmtLetCheck:                          ## @stmtLetCheck
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	32(%rdi), %rax
	movq	(%rax), %rdi
	callq	_checkValue
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtBlock              ## -- Begin function stmtBlock
	.p2align	4, 0x90
_stmtBlock:                             ## @stmtBlock
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	callq	_doblock
	testq	%rax, %rax
	je	LBB163_1
## %bb.3:                               ## %else_0
	movq	%rax, %rbx
	movq	%r14, 72(%rax)
	movl	$1, %edi
	movq	%r14, %rsi
	callq	_stmtNew
	movq	%rbx, 24(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB163_1:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_doblock                ## -- Begin function doblock
	.p2align	4, 0x90
_doblock:                               ## @doblock
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_list_new
	movl	$80, %edi
	callq	_malloc
	movq	%rax, %r15
	callq	_list_new
	movq	%rax, 8(%r15)
	callq	_list_new
	movq	%rax, 64(%r15)
	leaq	16(%r15), %rdi
	callq	_list_init
	leaq	40(%r15), %rdi
	callq	_list_init
	movq	_fctx+8(%rip), %rax
	movq	%rax, (%r15)
	movq	%r15, _fctx+8(%rip)
	movq	__func165_str1(%rip), %r14
	jmp	LBB164_1
	.p2align	4, 0x90
LBB164_7:                               ## %then_2
                                        ##   in Loop: Header=BB164_1 Depth=1
	movq	%rax, %rbx
	callq	_sep
	movq	%rbx, %rdi
	callq	_stmtAdd
LBB164_1:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB164_4
## %bb.2:                               ## %body_0
                                        ##   in Loop: Header=BB164_1 Depth=1
	callq	_skip_nl
	callq	_eof
	testb	$1, %al
	jne	LBB164_3
## %bb.5:                               ## %else_0
                                        ##   in Loop: Header=BB164_1 Depth=1
	movq	__func165_str3(%rip), %rdi
	callq	_match
	testb	$1, %al
	jne	LBB164_4
## %bb.6:                               ## %else_1
                                        ##   in Loop: Header=BB164_1 Depth=1
	callq	_stmtParse
	testq	%rax, %rax
	je	LBB164_1
	jmp	LBB164_7
LBB164_3:                               ## %then_0
	movq	__func165_str2(%rip), %rdi
	callq	_fatal
LBB164_4:                               ## %break_0
	movq	(%r15), %rax
	movq	%rax, _fctx+8(%rip)
	movq	%r15, %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_chkf                   ## -- Begin function chkf
	.p2align	4, 0x90
_chkf:                                  ## @chkf
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_checkFunc
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_chkb                   ## -- Begin function chkb
	.p2align	4, 0x90
_chkb:                                  ## @chkb
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_stmtCheck
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtBlockCheck         ## -- Begin function stmtBlockCheck
	.p2align	4, 0x90
_stmtBlockCheck:                        ## @stmtBlockCheck
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movq	_fctx+8(%rip), %r14
	movq	%rdi, _fctx+8(%rip)
	movq	64(%rdi), %rdi
	leaq	_chkf(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	movq	8(%rbx), %rdi
	leaq	_chkb(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	movq	%r14, _fctx+8(%rip)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_expr_new               ## -- Begin function expr_new
	.p2align	4, 0x90
_expr_new:                              ## @expr_new
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	testq	%rax, %rax
	setne	%dil
	movq	__func169_str1(%rip), %rsi
	callq	_assert
	xorl	%esi, %esi
	movl	$16, %edx
	movq	%rbx, %rdi
	callq	_memset
	movq	%r14, (%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmt_expr_new          ## -- Begin function stmt_expr_new
	.p2align	4, 0x90
_stmt_expr_new:                         ## @stmt_expr_new
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	xorl	%edi, %edi
	callq	_stmtNew
	movq	%rax, %rbx
	movq	%r14, %rdi
	callq	_expr_new
	movq	%rax, 32(%rbx)
	movq	184(%r14), %rax
	movq	%rax, 72(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtExpr               ## -- Begin function stmtExpr
	.p2align	4, 0x90
_stmtExpr:                              ## @stmtExpr
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_ctok
	movq	%rax, %r14
	callq	_hier1
	testq	%rax, %rax
	je	LBB170_1
## %bb.2:                               ## %else_0
	movq	%rax, %rbx
	callq	_ctok
	movq	%rax, %r15
	movq	__func171_str1(%rip), %rdi
	callq	_match
	testb	$1, %al
	jne	LBB170_5
## %bb.3:                               ## %then_1
	addq	$8, %r14
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_stmt_expr_new
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB170_1:                               ## %then_0
	movq	__func171_str2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	__func171_str3(%rip), %rbx
	callq	_ctok
	leaq	24(%rax), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	_printf
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB170_5:                               ## %else_1
	addq	$8, %r15
	callq	_hier1
	movq	%rbx, %rdi
	movq	%rax, %rsi
	movq	%r15, %rdx
	callq	_assign
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtExprCheck          ## -- Begin function stmtExprCheck
	.p2align	4, 0x90
_stmtExprCheck:                         ## @stmtExprCheck
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	callq	_checkValue
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_assign                 ## -- Begin function assign
	.p2align	4, 0x90
_assign:                                ## @assign
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	testq	%rdi, %rdi
	je	LBB172_2
## %bb.1:
	testq	%rsi, %rsi
	je	LBB172_2
## %bb.3:                               ## %else_0
	callq	_stmt_new_assign
	popq	%rcx
	retq
LBB172_2:                               ## %then_0
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtAssignCheck        ## -- Begin function stmtAssignCheck
	.p2align	4, 0x90
_stmtAssignCheck:                       ## @stmtAssignCheck
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r12
	movq	8(%rdi), %rbx
	movq	16(%rdi), %r14
	movq	%rbx, %rdi
	callq	_checkValue
	movq	%rax, %r15
	movq	%r14, %rdi
	callq	_checkValue
	movq	%rbx, %rdi
	callq	_valueIsReadonly
	testb	$1, %al
	je	LBB173_2
## %bb.1:                               ## %then_0
	movq	__func174_str1(%rip), %rdi
	movq	184(%rbx), %rsi
	callq	_error
	jmp	LBB173_5
LBB173_2:                               ## %else_0
	movq	8(%rbx), %rsi
	movq	%r14, %rdi
	callq	_nat
	movq	%rax, %r14
	movq	8(%rax), %rsi
	movq	%r15, %rdi
	callq	_type_eq
	testb	$1, %al
	jne	LBB173_4
## %bb.3:                               ## %then_1
	movq	__func174_str2(%rip), %rdi
	movq	72(%r12), %rsi
	callq	_error
	movq	__func174_str3(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	%r15, %rdi
	callq	_prttype
	movq	__func174_str4(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	__func174_str5(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	8(%r14), %rdi
	callq	_prttype
	movq	__func174_str6(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
LBB173_4:                               ## %endif_1
	movq	%r14, 16(%r12)
LBB173_5:                               ## %endif_1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtIf                 ## -- Begin function stmtIf
	.p2align	4, 0x90
_stmtIf:                                ## @stmtIf
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movl	$24, %edi
	callq	_malloc
	movq	%rax, %r12
	callq	_hier1
	movq	%rax, (%r12)
	movq	__func175_str1(%rip), %rdi
	callq	_match
	callq	_ctok
	leaq	8(%rax), %rbx
	movq	__func175_str2(%rip), %rdi
	callq	_need
	movq	%rbx, %rdi
	callq	_stmtBlock
	movq	%rax, 8(%r12)
	movq	__func175_str3(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB174_4
## %bb.1:                               ## %then_0
	movq	__func175_str4(%rip), %rdi
	callq	_match
	callq	_ctok
	movq	%rax, %r15
	addq	$8, %r15
	movq	__func175_str5(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB174_3
## %bb.2:                               ## %then_1
	movq	%r15, %rdi
	callq	_stmtIf
	movq	%rax, 16(%r12)
	cmpq	$0, (%r12)
	jne	LBB174_6
	jmp	LBB174_7
LBB174_4:                               ## %else_0
	movq	$0, 16(%r12)
	cmpq	$0, (%r12)
	je	LBB174_7
LBB174_6:                               ## %endif_0
	movq	8(%r12), %rax
	testq	%rax, %rax
	je	LBB174_7
## %bb.9:                               ## %else_2
	movl	$4, %edi
	movq	%r14, %rsi
	callq	_stmtNew
	movq	%r12, 56(%rax)
	movq	%r14, 72(%rax)
	jmp	LBB174_8
LBB174_3:                               ## %else_1
	movq	__func175_str6(%rip), %rdi
	callq	_need
	movq	%r15, %rdi
	callq	_stmtBlock
	movq	%rax, 16(%r12)
	cmpq	$0, (%r12)
	jne	LBB174_6
LBB174_7:                               ## %then_2
	xorl	%eax, %eax
LBB174_8:                               ## %then_2
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtIfCheck            ## -- Begin function stmtIfCheck
	.p2align	4, 0x90
_stmtIfCheck:                           ## @stmtIfCheck
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	56(%rdi), %r14
	movq	(%r14), %rdi
	callq	_checkValue
	testq	%rax, %rax
	je	LBB175_3
## %bb.1:                               ## %then_0
	movq	%rax, %rbx
	movq	_typeBool(%rip), %rsi
	movq	%rax, %rdi
	callq	_type_eq
	testb	$1, %al
	jne	LBB175_3
## %bb.2:                               ## %then_1
	movq	__func176_str1(%rip), %rdi
	movq	144(%rbx), %rsi
	callq	_error
LBB175_3:                               ## %endif_0
	movq	8(%r14), %rdi
	callq	_stmtCheck
	movq	16(%r14), %rdi
	callq	_stmtCheck
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtWhile              ## -- Begin function stmtWhile
	.p2align	4, 0x90
_stmtWhile:                             ## @stmtWhile
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	incl	_fctx+16(%rip)
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	callq	_hier1
	movq	%rax, (%rbx)
	movq	__func177_str1(%rip), %rdi
	callq	_match
	callq	_ctok
	leaq	8(%rax), %r15
	movq	__func177_str2(%rip), %rdi
	callq	_need
	movq	%r15, %rdi
	callq	_stmtBlock
	movq	%rax, 8(%rbx)
	decl	_fctx+16(%rip)
	cmpq	$0, (%rbx)
	je	LBB176_2
## %bb.1:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	LBB176_2
## %bb.4:                               ## %else_0
	movl	$5, %edi
	movq	%r14, %rsi
	callq	_stmtNew
	movq	%rbx, 48(%rax)
	movq	%r14, 72(%rax)
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB176_2:                               ## %then_0
	decl	_fctx+16(%rip)
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtWhileCheck         ## -- Begin function stmtWhileCheck
	.p2align	4, 0x90
_stmtWhileCheck:                        ## @stmtWhileCheck
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	48(%rdi), %r14
	movq	(%r14), %rdi
	callq	_checkValue
	testq	%rax, %rax
	je	LBB177_3
## %bb.1:                               ## %then_0
	movq	%rax, %rbx
	movq	_typeBool(%rip), %rsi
	movq	%rax, %rdi
	callq	_type_eq
	testb	$1, %al
	jne	LBB177_3
## %bb.2:                               ## %then_1
	movq	__func178_str1(%rip), %rdi
	movq	144(%rbx), %rsi
	callq	_error
LBB177_3:                               ## %endif_0
	movq	8(%r14), %rdi
	callq	_stmtCheck
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtReturn             ## -- Begin function stmtReturn
	.p2align	4, 0x90
_stmtReturn:                            ## @stmtReturn
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	movl	$6, %edi
	movq	%rbx, %rsi
	callq	_stmtNew
	movq	%rax, %r12
	movq	%rbx, 72(%rax)
	callq	_separator
	testb	$1, %al
	jne	LBB178_4
## %bb.1:                               ## %else_0
	callq	_ctok
	movq	%rax, %r14
	callq	_hier1
	movq	%rax, %r15
	testq	%rax, %rax
	jne	LBB178_3
## %bb.2:                               ## %then_1
	addq	$8, %r14
	movq	__func179_str1(%rip), %rdi
	movq	%r14, %rsi
	callq	_error
LBB178_3:                               ## %endif_1
	movq	%r15, 8(%r12)
LBB178_4:                               ## %then_0
	movq	%r12, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtReturnCheck        ## -- Begin function stmtReturnCheck
	.p2align	4, 0x90
_stmtReturnCheck:                       ## @stmtReturnCheck
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	8(%rdi), %rbx
	testq	%rbx, %rbx
	je	LBB179_2
## %bb.1:                               ## %then_0
	movq	%rdi, %r14
	movq	%rbx, %rdi
	callq	_checkValue
	movq	_fctx(%rip), %rax
	movq	8(%rax), %rax
	movq	56(%rax), %rsi
	movq	%rbx, %rdi
	callq	_nat
	movq	%rax, 8(%r14)
LBB179_2:                               ## %endif_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtBreak              ## -- Begin function stmtBreak
	.p2align	4, 0x90
_stmtBreak:                             ## @stmtBreak
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	_sep
	cmpl	$0, _fctx+16(%rip)
	jne	LBB180_2
## %bb.1:                               ## %then_0
	movq	__func181_str1(%rip), %rdi
	xorl	%esi, %esi
	callq	_error
LBB180_2:                               ## %endif_0
	movl	$7, %edi
	movq	%rbx, %rsi
	callq	_stmtNew
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtContinue           ## -- Begin function stmtContinue
	.p2align	4, 0x90
_stmtContinue:                          ## @stmtContinue
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	_sep
	cmpl	$0, _fctx+16(%rip)
	jne	LBB181_2
## %bb.1:                               ## %then_0
	movq	__func182_str1(%rip), %rdi
	xorl	%esi, %esi
	callq	_error
LBB181_2:                               ## %endif_0
	movl	$8, %edi
	movq	%rbx, %rsi
	callq	_stmtNew
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtGoto               ## -- Begin function stmtGoto
	.p2align	4, 0x90
_stmtGoto:                              ## @stmtGoto
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	callq	_parseId
	testq	%rax, %rax
	je	LBB182_1
## %bb.3:                               ## %else_0
	movq	%rax, %rbx
	movl	$9, %edi
	movq	%r14, %rsi
	callq	_stmtNew
	movq	%rbx, 64(%rax)
	movq	%r14, 72(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB182_1:                               ## %then_0
	movq	__func183_str1(%rip), %rdi
	xorl	%esi, %esi
	callq	_error
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtAdd                ## -- Begin function stmtAdd
	.p2align	4, 0x90
_stmtAdd:                               ## @stmtAdd
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	testq	%rdi, %rdi
	je	LBB183_2
## %bb.1:                               ## %then_0
	movq	%rdi, %rax
	movq	_fctx+8(%rip), %rcx
	movq	8(%rcx), %rdi
	movq	%rax, %rsi
	callq	_list_append
LBB183_2:                               ## %endif_0
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtNew                ## -- Begin function stmtNew
	.p2align	4, 0x90
_stmtNew:                               ## @stmtNew
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movl	%edi, %ebp
	movl	$80, %edi
	callq	_malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	testq	%rax, %rax
	setne	%dil
	movq	__func185_str1(%rip), %rsi
	callq	_assert
	xorl	%esi, %esi
	movl	$80, %edx
	movq	%rbx, %rdi
	callq	_memset
	movw	%bp, (%rbx)
	movq	%r14, 72(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtLabelNew           ## -- Begin function stmtLabelNew
	.p2align	4, 0x90
_stmtLabelNew:                          ## @stmtLabelNew
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$10, %edi
	callq	_stmtNew
	movq	%rbx, 64(%rax)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtParse              ## -- Begin function stmtParse
	.p2align	4, 0x90
_stmtParse:                             ## @stmtParse
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_ctok
	movq	%rax, %rbx
	movq	__func187_str1(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB186_2
## %bb.1:                               ## %then_0
	callq	_parseLet
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB186_2:                               ## %else_0
	addq	$8, %rbx
	movq	__func187_str2(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB186_4
## %bb.3:                               ## %then_1
	movq	%rbx, %rdi
	callq	_stmtBlock
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB186_4:                               ## %else_1
	movq	__func187_str3(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB186_6
## %bb.5:                               ## %then_2
	movq	%rbx, %rdi
	callq	_stmtIf
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB186_6:                               ## %else_2
	movq	__func187_str4(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB186_8
## %bb.7:                               ## %then_3
	movq	%rbx, %rdi
	callq	_stmtWhile
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB186_8:                               ## %else_3
	movq	__func187_str5(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB186_10
## %bb.9:                               ## %then_4
	movq	%rbx, %rdi
	callq	_stmtReturn
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB186_10:                              ## %else_4
	movq	__func187_str6(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB186_12
## %bb.11:                              ## %then_5
	movq	%rbx, %rdi
	callq	_stmtBreak
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB186_12:                              ## %else_5
	movq	__func187_str7(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB186_14
## %bb.13:                              ## %then_6
	movq	%rbx, %rdi
	callq	_stmtContinue
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB186_14:                              ## %else_6
	movq	__func187_str8(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB186_17
## %bb.15:                              ## %then_7
	callq	_parseVardef
	jmp	LBB186_16
LBB186_17:                              ## %else_7
	movq	__func187_str9(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB186_19
## %bb.18:                              ## %then_8
	callq	_parseTypedef
LBB186_16:                              ## %then_7
	callq	_sep
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB186_19:                              ## %else_8
	movq	__func187_str10(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB186_21
## %bb.20:                              ## %then_9
	movq	%rbx, %rdi
	callq	_stmtGoto
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB186_21:                              ## %else_9
	callq	_gett
	movq	%rax, %r15
	callq	_ctok
	movzwl	(%rax), %eax
	cmpl	$1, %eax
	jne	LBB186_25
## %bb.22:                              ## %then_10
	callq	_parseId
	movq	%rax, %r14
	callq	_ctok
	movq	%rax, %rbx
	movq	__func187_str11(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB186_24
## %bb.23:                              ## %then_11
	addq	$8, %rbx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_stmtLabelNew
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB186_24:                              ## %else_11
	movq	%r15, %rdi
	callq	_sett
LBB186_25:                              ## %endif_10
	callq	_stmtExpr
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	LBB186_27
## %bb.26:                              ## %then_12
	callq	_stmt_restore
LBB186_27:                              ## %endif_12
	movq	%rbx, %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmt_restore           ## -- Begin function stmt_restore
	.p2align	4, 0x90
_stmt_restore:                          ## @stmt_restore
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_skip
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmt_new_vardef        ## -- Begin function stmt_new_vardef
	.p2align	4, 0x90
_stmt_new_vardef:                       ## @stmt_new_vardef
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rcx, %r13
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	movl	$40, %edi
	callq	_malloc
	movq	%rax, %rbx
	movq	%r12, (%rax)
	movq	%r14, 24(%rax)
	movq	%r15, 16(%rax)
	movl	$2, %edi
	movq	%r13, %rsi
	callq	_stmtNew
	movq	%rbx, 40(%rax)
	movq	%r13, 72(%rax)
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmt_new_assign        ## -- Begin function stmt_new_assign
	.p2align	4, 0x90
_stmt_new_assign:                       ## @stmt_new_assign
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movq	%rdi, %r15
	movl	$3, %edi
	movq	%rdx, %rsi
	callq	_stmtNew
	movq	%r15, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%rbx, 72(%rax)
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stmtCheck              ## -- Begin function stmtCheck
	.p2align	4, 0x90
_stmtCheck:                             ## @stmtCheck
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	testq	%rdi, %rdi
	je	LBB190_13
## %bb.1:                               ## %else_0
	movzwl	(%rdi), %eax
	testw	%ax, %ax
	je	LBB190_2
## %bb.3:                               ## %else_1
	movzwl	%ax, %eax
	cmpl	$3, %eax
	jne	LBB190_5
## %bb.4:                               ## %then_2
	callq	_stmtAssignCheck
	popq	%rax
	retq
LBB190_2:                               ## %then_1
	movq	32(%rdi), %rdi
	callq	_stmtExprCheck
	popq	%rax
	retq
LBB190_5:                               ## %else_2
	cmpl	$1, %eax
	jne	LBB190_7
## %bb.6:                               ## %then_3
	movq	24(%rdi), %rdi
	callq	_stmtBlockCheck
	popq	%rax
	retq
LBB190_7:                               ## %else_3
	cmpl	$4, %eax
	jne	LBB190_9
## %bb.8:                               ## %then_4
	callq	_stmtIfCheck
	popq	%rax
	retq
LBB190_9:                               ## %else_4
	cmpl	$5, %eax
	jne	LBB190_11
## %bb.10:                              ## %then_5
	callq	_stmtWhileCheck
	popq	%rax
	retq
LBB190_11:                              ## %else_5
	cmpl	$6, %eax
	jne	LBB190_13
## %bb.12:                              ## %then_6
	callq	_stmtReturnCheck
LBB190_13:                              ## %then_0
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_asmInit                ## -- Begin function asmInit
	.p2align	4, 0x90
_asmInit:                               ## @asmInit
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	%rsi, (%rdi)
	callq	_list_new
	movq	%rax, 8(%rbx)
	callq	_list_new
	movq	%rax, 16(%rbx)
	callq	_list_new
	movq	%rax, 24(%rbx)
	callq	_list_new
	movq	%rax, 40(%rbx)
	callq	_list_new
	movq	%rax, 32(%rbx)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_asmTypedefAdd          ## -- Begin function asmTypedefAdd
	.p2align	4, 0x90
_asmTypedefAdd:                         ## @asmTypedefAdd
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %r12
	movq	%rdi, %r15
	movl	$168, %edi
	callq	_malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	testq	%rax, %rax
	setne	%dil
	movq	__func193_str1(%rip), %rsi
	callq	_assert
	xorl	%esi, %esi
	movl	$168, %edx
	movq	%rbx, %rdi
	callq	_memset
	movw	$0, (%rbx)
	movq	%r12, 8(%rbx)
	movq	%r14, 48(%rbx)
	movq	8(%r15), %rdi
	movq	%rbx, %rsi
	callq	_list_append
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_asmStringAdd           ## -- Begin function asmStringAdd
	.p2align	4, 0x90
_asmStringAdd:                          ## @asmStringAdd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%ecx, %r14d
	movq	%rdx, %r12
	movq	%rsi, %rbp
	movq	%rdi, %r15
	movl	$168, %edi
	callq	_malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	testq	%rax, %rax
	setne	%dil
	movq	__func194_str1(%rip), %rsi
	callq	_assert
	xorl	%esi, %esi
	movl	$168, %edx
	movq	%rbx, %rdi
	callq	_memset
	movw	$2, (%rbx)
	movq	%rbp, 8(%rbx)
	movq	%r12, 24(%rbx)
	movl	%r14d, 32(%rbx)
	movq	24(%r15), %rdi
	movq	%rbx, %rsi
	callq	_list_append
	movq	%rbx, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_asmArrayAdd            ## -- Begin function asmArrayAdd
	.p2align	4, 0x90
_asmArrayAdd:                           ## @asmArrayAdd
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r13
	movq	%rdi, %r12
	movl	$168, %edi
	callq	_malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	testq	%rax, %rax
	setne	%dil
	movq	__func195_str1(%rip), %rsi
	callq	_assert
	xorl	%esi, %esi
	movl	$168, %edx
	movq	%rbx, %rdi
	callq	_memset
	movw	$3, (%rbx)
	movq	%r13, 8(%rbx)
	movq	%r15, 80(%rbx)
	movq	%r14, 96(%rbx)
	movq	16(%r12), %rdi
	movq	%rbx, %rsi
	callq	_list_append
	movq	%rbx, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_asmFuncAdd             ## -- Begin function asmFuncAdd
	.p2align	4, 0x90
_asmFuncAdd:                            ## @asmFuncAdd
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r13
	movq	%rdi, %r12
	movl	$168, %edi
	callq	_malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	testq	%rax, %rax
	setne	%dil
	movq	__func196_str1(%rip), %rsi
	callq	_assert
	xorl	%esi, %esi
	movl	$168, %edx
	movq	%rbx, %rdi
	callq	_memset
	movw	$4, (%rbx)
	movq	%r13, 8(%rbx)
	movq	%r15, 112(%rbx)
	movq	%r14, 120(%rbx)
	movq	40(%r12), %rdi
	movq	%rbx, %rsi
	callq	_list_append
	movq	%rbx, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_asmVarAdd              ## -- Begin function asmVarAdd
	.p2align	4, 0x90
_asmVarAdd:                             ## @asmVarAdd
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rcx, %r15
	movq	%rdx, %r14
	movq	%rsi, %r13
	movq	%rdi, %r12
	movl	$168, %edi
	callq	_malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	testq	%rax, %rax
	setne	%dil
	movq	__func197_str1(%rip), %rsi
	callq	_assert
	movw	$5, (%rbx)
	movq	%r13, 8(%rbx)
	movq	%r15, 144(%rbx)
	movq	%r14, 136(%rbx)
	movq	32(%r12), %rdi
	movq	%rbx, %rsi
	callq	_list_append
	movq	%rbx, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_type             ## -- Begin function parse_type
	.p2align	4, 0x90
_parse_type:                            ## @parse_type
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	$0, (%rsp)
	callq	_ctok
	movq	%rax, %r14
	callq	_ctok
	movzwl	(%rax), %eax
	cmpl	$1, %eax
	jne	LBB197_6
## %bb.1:                               ## %then_0
	movq	__func198_str1(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB197_3
## %bb.2:                               ## %then_1
	callq	_parse_type_record
	jmp	LBB197_15
LBB197_6:                               ## %else_0
	movq	__func198_str3(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB197_11
## %bb.7:                               ## %then_3
	callq	_parse_type
	testq	%rax, %rax
	je	LBB197_8
## %bb.10:                              ## %else_4
	movq	%rax, %rdi
	callq	_type_pointer_new
	jmp	LBB197_15
LBB197_3:                               ## %else_1
	movq	__func198_str2(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB197_5
## %bb.4:                               ## %then_2
	callq	_parse_type_enum
	jmp	LBB197_15
LBB197_11:                              ## %else_3
	movq	__func198_str4(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB197_13
## %bb.12:                              ## %then_5
	callq	_parse_type_array
	jmp	LBB197_15
LBB197_5:                               ## %else_2
	callq	_parse_type_named
	jmp	LBB197_15
LBB197_13:                              ## %else_5
	movq	__func198_str5(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB197_16
## %bb.14:                              ## %then_6
	callq	_parse_type_func
LBB197_15:                              ## %endif_0
	movq	%rax, (%rsp)
LBB197_16:                              ## %endif_0
	addq	$8, %r14
	cmpq	$0, (%rsp)
	je	LBB197_17
## %bb.18:                              ## %else_7
	movq	(%rsp), %rax
	movzwl	(%rax), %eax
	cmpl	$5, %eax
	je	LBB197_20
## %bb.19:                              ## %else_7
	movzwl	%ax, %eax
	cmpl	$7, %eax
	jne	LBB197_21
LBB197_20:                              ## %then_8
	movq	(%rsp), %rax
	movl	20(%rax), %ecx
	movl	%ecx, 16(%rax)
LBB197_21:                              ## %endif_8
	movq	(%rsp), %rbx
	movl	20(%rbx), %edi
	movl	_cfg+4(%rip), %esi
	callq	_alignment
	movl	%eax, 20(%rbx)
	movq	(%rsp), %rax
	movq	%r14, 136(%rax)
	movq	(%rsp), %rax
	movq	%r14, 144(%rax)
	movq	(%rsp), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB197_17:                              ## %then_7
	movq	__func198_str6(%rip), %rdi
	movq	%r14, %rsi
	callq	_error
	movq	__func198_str7(%rip), %rbx
	callq	_ctok
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	_printf
	movq	(%rsp), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB197_8:                               ## %then_4
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_type_named       ## -- Begin function parse_type_named
	.p2align	4, 0x90
_parse_type_named:                      ## @parse_type_named
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_ctok
	movq	%rax, %rbx
	addq	$8, %rbx
	callq	_parseId
	testq	%rax, %rax
	je	LBB198_1
## %bb.2:                               ## %else_0
	movq	%rax, %r14
	movq	%rax, %rdi
	callq	_get_type
	testq	%rax, %rax
	je	LBB198_3
## %bb.4:                               ## %then_1
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB198_1:                               ## %then_0
	movq	__func199_str1(%rip), %rdi
	movq	%rbx, %rsi
	callq	_error
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB198_3:                               ## %else_1
	xorl	%edi, %edi
	callq	_type_new
	movq	%rax, %r15
	movq	%rbx, 128(%rax)
	leaq	_mctx+8(%rip), %rdi
	movq	%r14, %rsi
	movq	%rax, %rdx
	callq	_add_type
	movq	%r15, %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_fields           ## -- Begin function parse_fields
	.p2align	4, 0x90
_parse_fields:                          ## @parse_fields
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	callq	_list_new
	movq	%rax, %r15
	callq	_skip_nl
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	je	LBB199_2
	jmp	LBB199_5
	.p2align	4, 0x90
LBB199_4:                               ## %else_0
                                        ##   in Loop: Header=BB199_2 Depth=1
	movq	%rax, %rbx
	movq	__func200_str2(%rip), %rdi
	callq	_match
	callq	_skip_nl
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	_list_extend
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB199_5
LBB199_2:                               ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_skip_nl
	callq	_ctok
	movq	%rax, %r12
	callq	_parseField
	testq	%rax, %rax
	jne	LBB199_4
## %bb.3:                               ## %then_0
	addq	$8, %r12
	movq	__func200_str1(%rip), %rdi
	movq	%r12, %rsi
	callq	_error
	xorl	%eax, %eax
	jmp	LBB199_6
LBB199_5:                               ## %break_0
	movq	%r15, %rax
LBB199_6:                               ## %break_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_type_record      ## -- Begin function parse_type_record
	.p2align	4, 0x90
_parse_type_record:                     ## @parse_type_record
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__func201_str1(%rip), %rdi
	callq	_need
	movq	__func201_str2(%rip), %rdi
	callq	_parse_fields
	movq	%rax, %rdi
	callq	_type_record_new
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_type_enum        ## -- Begin function parse_type_enum
	.p2align	4, 0x90
_parse_type_enum:                       ## @parse_type_enum
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_list_new
	movq	%rax, %r15
	movq	$0, (%rsp)
	movq	__func202_str1(%rip), %rdi
	callq	_need
	callq	_skip_nl
	movq	__func202_str2(%rip), %r14
	.p2align	4, 0x90
LBB201_1:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB201_4
## %bb.2:                               ## %body_0
                                        ##   in Loop: Header=BB201_1 Depth=1
	callq	_skip_nl
	movl	$24, %edi
	callq	_malloc
	movq	%rax, %rbx
	callq	_ctok
	movq	%rax, %r12
	addq	$8, %r12
	callq	_parseId
	movq	%rax, (%rbx)
	movq	(%rsp), %rax
	movq	%rax, 8(%rbx)
	movq	%r12, 16(%rbx)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	_list_append
	incq	(%rsp)
	movq	__func202_str3(%rip), %rdi
	callq	_match
	testb	$1, %al
	jne	LBB201_1
## %bb.3:                               ## %then_0
	callq	_skip_nl
	movq	__func202_str4(%rip), %rdi
	callq	_need
LBB201_4:                               ## %break_0
	callq	_skip_nl
	movq	%r15, %rdi
	callq	_type_enum_new
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_type_array       ## -- Begin function parse_type_array
	.p2align	4, 0x90
_parse_type_array:                      ## @parse_type_array
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	__func203_str1(%rip), %rdi
	callq	_match
	testb	$1, %al
	je	LBB202_4
## %bb.1:                               ## %then_0
	callq	_parse_type
	testq	%rax, %rax
	je	LBB202_7
## %bb.2:                               ## %else_1
	xorl	%esi, %esi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	_type_array_new
	popq	%rbx
	retq
LBB202_4:                               ## %else_0
	callq	_cexpr
	testq	%rax, %rax
	je	LBB202_7
## %bb.5:                               ## %else_2
	movq	%rax, %rbx
	movq	__func203_str2(%rip), %rdi
	callq	_need
	callq	_parse_type
	testq	%rax, %rax
	je	LBB202_7
## %bb.6:                               ## %else_3
	movl	16(%rbx), %esi
	xorl	%edx, %edx
	movq	%rax, %rdi
	callq	_type_array_new
	popq	%rbx
	retq
LBB202_7:                               ## %fail
	xorl	%eax, %eax
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_set_param_offset       ## -- Begin function set_param_offset
	.p2align	4, 0x90
_set_param_offset:                      ## @set_param_offset
	.cfi_startproc
## %bb.0:
	movzwl	(%rsi), %eax
	movw	%ax, 16(%rdi)
	incw	(%rsi)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_type_func        ## -- Begin function parse_type_func
	.p2align	4, 0x90
_parse_type_func:                       ## @parse_type_func
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	__func204_str1(%rip), %rdi
	callq	_parse_fields
	movq	%rax, %rbx
	movw	$0, 6(%rsp)
	leaq	_set_param_offset(%rip), %rsi
	leaq	6(%rsp), %rdx
	movq	%rax, %rdi
	callq	_list_foreach
	movq	__func204_str2(%rip), %rdi
	callq	_need
	callq	_parse_type
	testq	%rbx, %rbx
	je	LBB204_2
## %bb.1:
	movq	%rax, %r14
	testq	%rax, %rax
	je	LBB204_2
## %bb.4:                               ## %else_0
	movq	__func204_str3(%rip), %rdi
	callq	_get
	xorl	%edx, %edx
	cmpq	$1, %rax
	sete	%dl
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_type_func_new
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB204_2:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_value_kind       ## -- Begin function print_value_kind
	.p2align	4, 0x90
_print_value_kind:                      ## @print_value_kind
	.cfi_startproc
## %bb.0:
	movzwl	%di, %eax
	cmpl	$1, %eax
	jne	LBB205_1
## %bb.27:                              ## %then_0
	movq	__func206_str1(%rip), %rax
	retq
LBB205_1:                               ## %else_0
	cmpl	$8, %eax
	jne	LBB205_2
## %bb.28:                              ## %then_1
	movq	__func206_str2(%rip), %rax
	retq
LBB205_2:                               ## %else_1
	cmpl	$9, %eax
	jne	LBB205_3
## %bb.29:                              ## %then_2
	movq	__func206_str3(%rip), %rax
	retq
LBB205_3:                               ## %else_2
	cmpl	$10, %eax
	jne	LBB205_4
## %bb.30:                              ## %then_3
	movq	__func206_str4(%rip), %rax
	retq
LBB205_4:                               ## %else_3
	cmpl	$11, %eax
	jne	LBB205_5
## %bb.31:                              ## %then_4
	movq	__func206_str5(%rip), %rax
	retq
LBB205_5:                               ## %else_4
	cmpl	$26, %eax
	jne	LBB205_6
## %bb.32:                              ## %then_5
	movq	__func206_str6(%rip), %rax
	retq
LBB205_6:                               ## %else_5
	cmpl	$27, %eax
	jne	LBB205_7
## %bb.33:                              ## %then_6
	movq	__func206_str7(%rip), %rax
	retq
LBB205_7:                               ## %else_6
	cmpl	$12, %eax
	jne	LBB205_8
## %bb.34:                              ## %then_7
	movq	__func206_str8(%rip), %rax
	retq
LBB205_8:                               ## %else_7
	cmpl	$13, %eax
	jne	LBB205_9
## %bb.35:                              ## %then_8
	movq	__func206_str9(%rip), %rax
	retq
LBB205_9:                               ## %else_8
	cmpl	$14, %eax
	jne	LBB205_10
## %bb.36:                              ## %then_9
	movq	__func206_str10(%rip), %rax
	retq
LBB205_10:                              ## %else_9
	cmpl	$15, %eax
	jne	LBB205_11
## %bb.37:                              ## %then_10
	movq	__func206_str11(%rip), %rax
	retq
LBB205_11:                              ## %else_10
	cmpl	$16, %eax
	jne	LBB205_12
## %bb.38:                              ## %then_11
	movq	__func206_str12(%rip), %rax
	retq
LBB205_12:                              ## %else_11
	cmpl	$17, %eax
	jne	LBB205_13
## %bb.39:                              ## %then_12
	movq	__func206_str13(%rip), %rax
	retq
LBB205_13:                              ## %else_12
	cmpl	$18, %eax
	jne	LBB205_14
## %bb.40:                              ## %then_13
	movq	__func206_str14(%rip), %rax
	retq
LBB205_14:                              ## %else_13
	cmpl	$19, %eax
	jne	LBB205_15
## %bb.41:                              ## %then_14
	movq	__func206_str15(%rip), %rax
	retq
LBB205_15:                              ## %else_14
	cmpl	$20, %eax
	jne	LBB205_16
## %bb.42:                              ## %then_15
	movq	__func206_str16(%rip), %rax
	retq
LBB205_16:                              ## %else_15
	cmpl	$21, %eax
	jne	LBB205_17
## %bb.43:                              ## %then_16
	movq	__func206_str17(%rip), %rax
	retq
LBB205_17:                              ## %else_16
	cmpl	$22, %eax
	jne	LBB205_18
## %bb.44:                              ## %then_17
	movq	__func206_str18(%rip), %rax
	retq
LBB205_18:                              ## %else_17
	cmpl	$23, %eax
	jne	LBB205_19
## %bb.45:                              ## %then_18
	movq	__func206_str19(%rip), %rax
	retq
LBB205_19:                              ## %else_18
	cmpl	$24, %eax
	jne	LBB205_20
## %bb.46:                              ## %then_19
	movq	__func206_str20(%rip), %rax
	retq
LBB205_20:                              ## %else_19
	cmpl	$25, %eax
	jne	LBB205_21
## %bb.47:                              ## %then_20
	movq	__func206_str21(%rip), %rax
	retq
LBB205_21:                              ## %else_20
	cmpl	$28, %eax
	jne	LBB205_22
## %bb.48:                              ## %then_21
	movq	__func206_str22(%rip), %rax
	retq
LBB205_22:                              ## %else_21
	cmpl	$29, %eax
	jne	LBB205_23
## %bb.49:                              ## %then_22
	movq	__func206_str23(%rip), %rax
	retq
LBB205_23:                              ## %else_22
	cmpl	$30, %eax
	jne	LBB205_24
## %bb.50:                              ## %then_23
	movq	__func206_str24(%rip), %rax
	retq
LBB205_24:                              ## %else_23
	cmpl	$31, %eax
	jne	LBB205_25
## %bb.51:                              ## %then_24
	movq	__func206_str25(%rip), %rax
	retq
LBB205_25:                              ## %else_24
	testw	%di, %di
	je	LBB205_52
## %bb.26:                              ## %else_25
	movq	__func206_str27(%rip), %rax
	retq
LBB205_52:                              ## %then_25
	movq	__func206_str26(%rip), %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_value_show             ## -- Begin function value_show
	.p2align	4, 0x90
_value_show:                            ## @value_show
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movq	__func207_str1(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	_printf
	movq	__func207_str2(%rip), %r14
	movzwl	(%rbx), %edi
	callq	_print_value_kind
	movq	%rax, %rcx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%rcx, %rsi
	callq	_printf
	movq	__func207_str3(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	8(%rbx), %rdi
	callq	_prttype
	movq	__func207_str4(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	__func207_str5(%rip), %rdi
	movq	64(%rbx), %rsi
	xorl	%eax, %eax
	callq	_printf
	movq	__func207_str6(%rip), %rdi
	movq	16(%rbx), %rsi
	xorl	%eax, %eax
	callq	_printf
	movq	__func207_str7(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_castIfNumericTo        ## -- Begin function castIfNumericTo
	.p2align	4, 0x90
_castIfNumericTo:                       ## @castIfNumericTo
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	8(%rdi), %rax
	movzwl	(%rax), %eax
	cmpl	$1, %eax
	jne	LBB207_2
## %bb.1:                               ## %then_0
	movq	16(%rdi), %rax
	movq	184(%rdi), %rdx
	movq	%rsi, %rdi
	movq	%rax, %rsi
	callq	_valueNewImm
	popq	%rcx
	retq
LBB207_2:                               ## %else_0
	movq	%rdi, %rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_nat                    ## -- Begin function nat
	.p2align	4, 0x90
_nat:                                   ## @nat
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %r15
	movq	8(%rdi), %rbx
	xorl	%edi, %edi
	testq	%rbx, %rbx
	setne	%dil
	movq	__func209_str1(%rip), %rsi
	callq	_assert
	xorl	%edi, %edi
	testq	%r14, %r14
	setne	%dil
	movq	__func209_str2(%rip), %rsi
	callq	_assert
	movzwl	(%rbx), %eax
	cmpl	$1, %eax
	jne	LBB208_3
## %bb.1:                               ## %then_0
	movq	%r14, %rdi
	callq	_type_is_basic_integer
	testb	$1, %al
	je	LBB208_3
## %bb.2:                               ## %then_1
	movq	16(%r15), %rsi
	movq	184(%r15), %rdx
	movq	%r14, %rdi
	callq	_valueNewImm
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB208_3:                               ## %endif_0
	movq	8(%r15), %rdi
	movq	%r14, %rsi
	callq	_naturalConversionIsPossible
	testb	$1, %al
	je	LBB208_5
## %bb.4:                               ## %then_2
	movq	184(%r15), %rdx
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	_cast
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	_checkValue
	movq	%rbx, %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB208_5:                               ## %else_2
	movq	%r15, %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_naturalConversionIsPossible ## -- Begin function naturalConversionIsPossible
	.p2align	4, 0x90
_naturalConversionIsPossible:           ## @naturalConversionIsPossible
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movzwl	(%rsi), %eax
	movzwl	(%rdi), %ebp
	cmpl	$7, %eax
	jne	LBB209_6
## %bb.1:
	movzwl	%bp, %ecx
	cmpl	$7, %ecx
	jne	LBB209_6
## %bb.2:                               ## %then_0
	cmpb	$1, 92(%r14)
	jne	LBB209_6
## %bb.3:                               ## %then_0
	testb	$1, 92(%rbx)
	je	LBB209_4
LBB209_6:                               ## %endif_0
	movzwl	%ax, %r15d
	cmpl	$6, %r15d
	jne	LBB209_10
## %bb.7:                               ## %endif_0
	movzwl	%bp, %eax
	cmpl	$6, %eax
	jne	LBB209_10
## %bb.8:                               ## %then_2
	movq	_typeFreePtr(%rip), %rsi
	movq	%rbx, %rdi
	callq	_type_eq
	testb	$1, %al
	jne	LBB209_4
## %bb.9:                               ## %else_3
	movq	_typeFreePtr(%rip), %rsi
	movq	%r14, %rdi
	callq	_type_eq
	testb	$1, %al
	jne	LBB209_4
LBB209_10:                              ## %endif_2
	cmpl	$7, %r15d
	jne	LBB209_14
## %bb.11:                              ## %endif_2
	movzwl	%bp, %eax
	cmpl	$6, %eax
	jne	LBB209_14
## %bb.12:                              ## %then_5
	movb	92(%r14), %r12b
	movq	_typeFreePtr(%rip), %rsi
	movq	%rbx, %rdi
	callq	_type_eq
	cmpb	$1, %r12b
	jne	LBB209_14
## %bb.13:                              ## %then_5
	testb	$1, %al
	jne	LBB209_4
LBB209_14:                              ## %endif_5
	movzwl	%bp, %eax
	cmpl	$7, %eax
	jne	LBB209_18
## %bb.15:                              ## %endif_5
	cmpl	$6, %r15d
	jne	LBB209_18
## %bb.16:                              ## %then_7
	movb	92(%rbx), %bl
	movq	_typeFreePtr(%rip), %rsi
	movq	%r14, %rdi
	callq	_type_eq
	cmpb	$1, %bl
	jne	LBB209_18
## %bb.17:                              ## %then_7
	testb	$1, %al
	je	LBB209_18
LBB209_4:                               ## %then_1
	movb	$1, %al
	jmp	LBB209_5
LBB209_18:                              ## %endif_7
	xorl	%eax, %eax
LBB209_5:                               ## %then_1
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_un                     ## -- Begin function un
	.p2align	4, 0x90
_un:                                    ## @un
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	testq	%rsi, %rsi
	je	LBB210_6
## %bb.1:                               ## %else_0
	movzwl	%di, %eax
	cmpl	$8, %eax
	jne	LBB210_2
## %bb.7:                               ## %then_1
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	_un_ref
	popq	%rcx
	retq
LBB210_2:                               ## %else_1
	cmpl	$9, %eax
	jne	LBB210_3
## %bb.8:                               ## %then_2
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	_un_deref
	popq	%rcx
	retq
LBB210_3:                               ## %else_2
	cmpl	$11, %eax
	jne	LBB210_4
## %bb.9:                               ## %then_3
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	_un_minus
	popq	%rcx
	retq
LBB210_4:                               ## %else_3
	cmpl	$10, %eax
	jne	LBB210_5
## %bb.10:                              ## %then_4
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	_un_not
	popq	%rcx
	retq
LBB210_5:                               ## %else_4
	movq	__func211_str1(%rip), %rsi
	xorl	%edi, %edi
	callq	_assert
LBB210_6:                               ## %then_0
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_un_minus               ## -- Begin function un_minus
	.p2align	4, 0x90
_un_minus:                              ## @un_minus
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsi, %rax
	movq	%rdi, %rbx
	movzwl	(%rdi), %ecx
	cmpl	$2, %ecx
	jne	LBB211_2
## %bb.1:                               ## %then_0
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	subq	16(%rbx), %rsi
	movq	%rax, %rdx
	callq	_valueNewImm
	popq	%rbx
	retq
LBB211_2:                               ## %else_0
	movl	$11, %edi
	movq	%rax, %rsi
	callq	_valueNew
	movq	%rbx, 72(%rax)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_un_not                 ## -- Begin function un_not
	.p2align	4, 0x90
_un_not:                                ## @un_not
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsi, %rax
	movq	%rdi, %rbx
	movzwl	(%rdi), %ecx
	cmpl	$2, %ecx
	jne	LBB212_2
## %bb.1:                               ## %then_0
	movq	8(%rbx), %rdi
	movq	16(%rbx), %rsi
	notq	%rsi
	movq	%rax, %rdx
	callq	_valueNewImm
	popq	%rbx
	retq
LBB212_2:                               ## %else_0
	movl	$10, %edi
	movq	%rax, %rsi
	callq	_valueNew
	movq	%rbx, 72(%rax)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_un_ref                 ## -- Begin function un_ref
	.p2align	4, 0x90
_un_ref:                                ## @un_ref
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$8, %edi
	callq	_valueNew
	movq	%rbx, 72(%rax)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_un_deref               ## -- Begin function un_deref
	.p2align	4, 0x90
_un_deref:                              ## @un_deref
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$9, %edi
	callq	_valueNew
	movq	%rbx, 72(%rax)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkValueUnary        ## -- Begin function checkValueUnary
	.p2align	4, 0x90
_checkValueUnary:                       ## @checkValueUnary
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movq	72(%rdi), %rdi
	callq	_checkValue
	movq	%rax, %r14
	movzwl	(%rbx), %eax
	cmpl	$8, %eax
	jne	LBB215_4
## %bb.1:                               ## %then_0
	movq	%rbx, %rdi
	callq	_valueIsReadonly
	testb	$1, %al
	je	LBB215_3
## %bb.2:                               ## %then_1
	movq	__func216_str1(%rip), %rdi
	movq	184(%rbx), %rsi
	callq	_error
LBB215_3:                               ## %endif_1
	movq	%r14, %rdi
	callq	_type_pointer_new
	jmp	LBB215_11
LBB215_4:                               ## %else_0
	movzwl	%ax, %eax
	cmpl	$9, %eax
	jne	LBB215_7
## %bb.5:                               ## %then_2
	movzwl	(%r14), %eax
	cmpl	$6, %eax
	je	LBB215_10
## %bb.6:                               ## %then_3
	movq	__func216_str2(%rip), %rdi
	movq	184(%rbx), %rsi
	callq	_error
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB215_7:                               ## %else_2
	cmpl	$11, %eax
	je	LBB215_9
## %bb.8:                               ## %else_4
	cmpl	$10, %eax
	jne	LBB215_12
LBB215_9:                               ## %then_5
	movq	%r14, (%rsp)
	jmp	LBB215_12
LBB215_10:                              ## %else_3
	movq	72(%r14), %rax
LBB215_11:                              ## %endif_0
	movq	%rax, (%rsp)
LBB215_12:                              ## %endif_0
	movq	(%rsp), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_binTypeValid           ## -- Begin function binTypeValid
	.p2align	4, 0x90
_binTypeValid:                          ## @binTypeValid
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movzwl	%di, %ebp
	cmpl	$20, %ebp
	je	LBB216_2
## %bb.1:
	cmpl	$21, %ebp
	je	LBB216_2
## %bb.4:                               ## %else_0
	movq	%rsi, %rbx
	movq	%rsi, %rdi
	callq	_type_is_basic_integer
	testb	$1, %al
	jne	LBB216_2
## %bb.5:                               ## %else_0
	movzwl	(%rbx), %eax
	cmpl	$1, %eax
	je	LBB216_2
## %bb.6:                               ## %else_1
	movq	_typeBool(%rip), %rsi
	movq	%rbx, %rdi
	callq	_type_eq
	testb	$1, %al
	je	LBB216_8
## %bb.7:                               ## %then_2
	cmpl	$19, %ebp
	sete	%cl
	cmpl	$17, %ebp
	sete	%dl
	cmpl	$18, %ebp
	sete	%al
	orb	%cl, %al
	orb	%dl, %al
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB216_2:                               ## %then_0
	movb	$1, %al
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB216_8:                               ## %else_2
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bin                    ## -- Begin function bin
	.p2align	4, 0x90
_bin:                                   ## @bin
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	testq	%rsi, %rsi
	je	LBB217_2
## %bb.1:
	movq	%rdx, %r14
	testq	%rdx, %rdx
	je	LBB217_2
## %bb.4:                               ## %else_0
	movq	%rsi, %rbx
	movq	%rcx, %rsi
	callq	_valueNew
	movq	%rbx, 80(%rax)
	movq	%r14, 88(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB217_2:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkValueBinary       ## -- Begin function checkValueBinary
	.p2align	4, 0x90
_checkValueBinary:                      ## @checkValueBinary
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movq	80(%rdi), %r14
	movq	88(%rdi), %rbp
	movq	%r14, %rdi
	callq	_checkValue
	movq	%rax, %rbx
	movq	%rbp, %rdi
	callq	_checkValue
	testq	%rbx, %rbx
	je	LBB218_4
## %bb.1:
	testq	%rax, %rax
	je	LBB218_4
## %bb.2:                               ## %else_0
	movq	8(%rbp), %rsi
	movq	%r14, %rdi
	callq	_nat
	movq	%rax, %r14
	movq	8(%rax), %rsi
	movq	%rbp, %rdi
	callq	_nat
	movq	%rax, %r12
	movq	8(%r14), %r13
	movq	8(%rax), %rbx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	_type_eq
	testb	$1, %al
	jne	LBB218_6
## %bb.3:                               ## %then_1
	movq	_E_TYPE_ERROR(%rip), %rdi
	movq	184(%r15), %rsi
	callq	_error
	movq	__func219_str1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	%r13, %rdi
	callq	_prttype
	movq	__func219_str2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	__func219_str3(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	callq	_prttype
	movq	__func219_str4(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	jmp	LBB218_4
LBB218_6:                               ## %else_1
	movzwl	(%r15), %ebp
	movl	%ebp, %edi
	movq	%r13, %rsi
	callq	_binTypeValid
	testb	$1, %al
	jne	LBB218_8
## %bb.7:                               ## %then_2
	movq	__func219_str5(%rip), %rdi
	movq	184(%r15), %rsi
	callq	_error
LBB218_4:                               ## %fail
	xorl	%eax, %eax
LBB218_5:                               ## %fail
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB218_8:                               ## %else_2
	movq	%r14, 80(%r15)
	movq	%r12, 88(%r15)
	movzwl	(%r14), %eax
	cmpl	$2, %eax
	jne	LBB218_11
## %bb.9:                               ## %else_2
	movzwl	(%r12), %eax
	cmpl	$2, %eax
	jne	LBB218_11
## %bb.10:                              ## %then_3
	movq	%r15, %rdi
	callq	_binFold
LBB218_11:                              ## %endif_3
	movl	%ebp, %edi
	callq	_isReletionOpKind
	testb	$1, %al
	je	LBB218_13
## %bb.12:                              ## %then_4
	movq	_typeBool(%rip), %rax
	jmp	LBB218_5
LBB218_13:                              ## %else_4
	movq	8(%r14), %rax
	jmp	LBB218_5
	.cfi_endproc
                                        ## -- End function
	.globl	_binFold                ## -- Begin function binFold
	.p2align	4, 0x90
_binFold:                               ## @binFold
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	80(%rdi), %rax
	movq	88(%rdi), %rcx
	movq	8(%rax), %rsi
	movq	16(%rax), %rax
	movq	16(%rcx), %rcx
	movzwl	(%rdi), %edx
	movq	%rsi, 8(%rsp)
	cmpl	$12, %edx
	jne	LBB219_2
## %bb.1:                               ## %then_0
	addq	%rcx, %rax
	movq	%rax, (%rsp)
	jmp	LBB219_30
LBB219_2:                               ## %else_0
	movzwl	%dx, %edx
	cmpl	$13, %edx
	jne	LBB219_4
## %bb.3:                               ## %then_1
	subq	%rcx, %rax
	movq	%rax, (%rsp)
	jmp	LBB219_30
LBB219_4:                               ## %else_1
	cmpl	$14, %edx
	jne	LBB219_6
## %bb.5:                               ## %then_2
	imulq	%rcx, %rax
	movq	%rax, (%rsp)
	jmp	LBB219_30
LBB219_6:                               ## %else_2
	cmpl	$15, %edx
	jne	LBB219_8
## %bb.7:                               ## %then_3
	cqto
	idivq	%rcx
	movq	%rax, (%rsp)
	jmp	LBB219_30
LBB219_8:                               ## %else_3
	cmpl	$16, %edx
	jne	LBB219_10
## %bb.9:                               ## %then_4
	cqto
	idivq	%rcx
LBB219_29:                              ## %endif_0
	movq	%rdx, (%rsp)
	jmp	LBB219_30
LBB219_10:                              ## %else_4
	cmpl	$17, %edx
	jne	LBB219_12
## %bb.11:                              ## %then_5
	orq	%rcx, %rax
	movq	%rax, (%rsp)
	jmp	LBB219_30
LBB219_12:                              ## %else_5
	cmpl	$18, %edx
	jne	LBB219_14
## %bb.13:                              ## %then_6
	xorq	%rcx, %rax
	movq	%rax, (%rsp)
	jmp	LBB219_30
LBB219_14:                              ## %else_6
	cmpl	$19, %edx
	jne	LBB219_16
## %bb.15:                              ## %then_7
	andq	%rcx, %rax
	movq	%rax, (%rsp)
LBB219_30:                              ## %endif_0
	movw	$2, (%rbx)
	movq	(%rsp), %rax
	movq	%rax, 16(%rbx)
	addq	$16, %rsp
	popq	%rbx
	retq
LBB219_16:                              ## %else_7
	movq	_typeBool(%rip), %rsi
	movq	%rsi, 8(%rsp)
	cmpl	$20, %edx
	jne	LBB219_18
## %bb.17:                              ## %then_8
	xorl	%edx, %edx
	cmpq	%rcx, %rax
	sete	%dl
	jmp	LBB219_28
LBB219_18:                              ## %else_8
	cmpl	$21, %edx
	jne	LBB219_20
## %bb.19:                              ## %then_9
	xorl	%edx, %edx
	cmpq	%rcx, %rax
	setne	%dl
	jmp	LBB219_28
LBB219_20:                              ## %else_9
	cmpl	$22, %edx
	jne	LBB219_22
## %bb.21:                              ## %then_10
	xorl	%edx, %edx
	cmpq	%rcx, %rax
	setl	%dl
	jmp	LBB219_28
LBB219_22:                              ## %else_10
	cmpl	$23, %edx
	jne	LBB219_24
## %bb.23:                              ## %then_11
	xorl	%edx, %edx
	cmpq	%rcx, %rax
	setg	%dl
	jmp	LBB219_28
LBB219_24:                              ## %else_11
	cmpl	$24, %edx
	jne	LBB219_26
## %bb.25:                              ## %then_12
	xorl	%edx, %edx
	cmpq	%rcx, %rax
	setle	%dl
	jmp	LBB219_28
LBB219_26:                              ## %else_12
	cmpl	$25, %edx
	jne	LBB219_31
## %bb.27:                              ## %then_13
	xorl	%edx, %edx
	cmpq	%rcx, %rax
	setge	%dl
LBB219_28:                              ## %endif_0
	negq	%rdx
	jmp	LBB219_29
LBB219_31:                              ## %else_13
	movq	__func220_str1(%rip), %rsi
	xorl	%edi, %edi
	callq	_assert
	jmp	LBB219_30
	.cfi_endproc
                                        ## -- End function
	.globl	_shift                  ## -- Begin function shift
	.p2align	4, 0x90
_shift:                                 ## @shift
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	testq	%rsi, %rsi
	je	LBB220_2
## %bb.1:
	movq	%rdx, %r14
	testq	%rdx, %rdx
	je	LBB220_2
## %bb.4:                               ## %else_0
	movq	%rsi, %rbx
	movq	%rcx, %rsi
	callq	_valueNew
	movq	%rbx, 80(%rax)
	movq	%r14, 88(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB220_2:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkValueShift        ## -- Begin function checkValueShift
	.p2align	4, 0x90
_checkValueShift:                       ## @checkValueShift
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	movq	80(%rdi), %r14
	movq	88(%rdi), %r15
	movq	%r14, %rdi
	callq	_checkValue
	movq	%r15, %rdi
	callq	_checkValue
	movzwl	(%r14), %eax
	cmpl	$2, %eax
	jne	LBB221_9
## %bb.1:
	movzwl	(%r15), %eax
	cmpl	$2, %eax
	jne	LBB221_9
## %bb.2:                               ## %then_0
	movzwl	(%rbx), %eax
	movw	$2, (%rbx)
	cmpl	$26, %eax
	jne	LBB221_4
## %bb.3:                               ## %then_1
	movq	16(%r14), %rax
	movb	16(%r15), %cl
	shlq	%cl, %rax
	jmp	LBB221_6
LBB221_9:                               ## %else_0
	movq	_typeBaseInt(%rip), %rsi
	movq	%r14, %rdi
	callq	_castIfNumericTo
	movq	%rax, 80(%rbx)
	movq	88(%rbx), %rdi
	movq	8(%rax), %rsi
	movq	184(%r15), %rdx
	callq	_cast
	movq	%rax, 88(%rbx)
	movq	%rax, %rdi
	callq	_checkValue
	movq	8(%r14), %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB221_4:                               ## %else_1
	movzwl	%ax, %eax
	cmpl	$27, %eax
	jne	LBB221_7
## %bb.5:                               ## %then_2
	movq	16(%r14), %rax
	movb	16(%r15), %cl
	sarq	%cl, %rax
LBB221_6:                               ## %endif_1
	movq	%rax, 16(%rbx)
LBB221_7:                               ## %endif_1
	movq	_typeNumeric(%rip), %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_indx                   ## -- Begin function indx
	.p2align	4, 0x90
_indx:                                  ## @indx
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	testq	%rdi, %rdi
	je	LBB222_2
## %bb.1:
	movq	%rsi, %r14
	testq	%rsi, %rsi
	je	LBB222_2
## %bb.4:                               ## %else_0
	movq	%rdi, %rbx
	movl	$29, %edi
	movq	%rdx, %rsi
	callq	_valueNew
	movq	%rbx, 96(%rax)
	movq	%r14, 104(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB222_2:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkValueIndex        ## -- Begin function checkValueIndex
	.p2align	4, 0x90
_checkValueIndex:                       ## @checkValueIndex
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	movq	96(%rdi), %r14
	movq	104(%rdi), %r15
	movq	%r14, %rdi
	callq	_checkValue
	movq	%r15, %rdi
	callq	_checkValue
	movq	_typeBaseInt(%rip), %rsi
	movq	%r14, %rdi
	callq	_castIfNumericTo
	movq	%rax, 96(%rbx)
	movq	_typeBaseInt(%rip), %rsi
	movq	%r15, %rdi
	callq	_castIfNumericTo
	movq	%rax, 104(%rbx)
	movq	96(%rbx), %rdi
	callq	_checkValue
	movq	104(%rbx), %rdi
	callq	_checkValue
	movq	96(%rbx), %rax
	movq	8(%rax), %rax
	movq	80(%rax), %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_access                 ## -- Begin function access
	.p2align	4, 0x90
_access:                                ## @access
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	testq	%rdi, %rdi
	je	LBB224_2
## %bb.1:
	movq	%rsi, %r14
	testq	%rsi, %rsi
	je	LBB224_2
## %bb.4:                               ## %else_0
	movq	%rdi, %rbx
	movl	$30, %edi
	movq	%rdx, %rsi
	callq	_valueNew
	movq	%rbx, 112(%rax)
	movq	%r14, 120(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB224_2:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkValueAccess       ## -- Begin function checkValueAccess
	.p2align	4, 0x90
_checkValueAccess:                      ## @checkValueAccess
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	112(%rdi), %rdi
	callq	_checkValue
	movzwl	(%rax), %ecx
	cmpl	$6, %ecx
	jne	LBB225_2
## %bb.1:                               ## %then_0
	movq	72(%rax), %rax
LBB225_2:                               ## %else_0
	movq	%rax, 8(%rsp)
	movq	8(%rsp), %rax
	movzwl	(%rax), %eax
	cmpl	$5, %eax
	je	LBB225_5
## %bb.3:                               ## %then_1
	movq	__func226_str1(%rip), %rdi
	jmp	LBB225_4
LBB225_5:                               ## %else_1
	movq	8(%rsp), %rdi
	movq	120(%rbx), %rsi
	callq	_type_record_get_field
	testq	%rax, %rax
	je	LBB225_6
## %bb.7:                               ## %else_2
	movq	8(%rax), %rax
	addq	$16, %rsp
	popq	%rbx
	retq
LBB225_6:                               ## %then_2
	movq	__func226_str2(%rip), %rdi
LBB225_4:                               ## %then_1
	movq	184(%rbx), %rsi
	callq	_error
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_call                   ## -- Begin function call
	.p2align	4, 0x90
_call:                                  ## @call
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	testq	%rdi, %rdi
	je	LBB226_2
## %bb.1:
	movq	%rsi, %r14
	testq	%rsi, %rsi
	je	LBB226_2
## %bb.4:                               ## %else_0
	movq	%rdi, %rbx
	movl	$28, %edi
	movq	%rdx, %rsi
	callq	_valueNew
	movq	%rbx, 144(%rax)
	movq	%r14, 152(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB226_2:                               ## %then_0
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkValueCall         ## -- Begin function checkValueCall
	.p2align	4, 0x90
_checkValueCall:                        ## @checkValueCall
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r15
	movq	144(%rdi), %r14
	movq	%r14, %rdi
	callq	_checkValue
	testq	%rax, %rax
	je	LBB227_1
## %bb.4:                               ## %else_0
	movq	%rax, %rbx
	movzwl	(%rax), %eax
	cmpl	$3, %eax
	je	LBB227_6
## %bb.5:                               ## %then_1
	movq	__func228_str2(%rip), %rdi
	movq	184(%r15), %rsi
	jmp	LBB227_2
LBB227_1:                               ## %then_0
	movq	__func228_str1(%rip), %rdi
	movq	184(%r14), %rsi
LBB227_2:                               ## %then_0
	callq	_error
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB227_6:                               ## %else_1
	movq	152(%r15), %rsi
	movq	184(%r15), %rdx
	movq	%r14, %rdi
	callq	_checkParams
	movq	56(%rbx), %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkParams            ## -- Begin function checkParams
	.p2align	4, 0x90
_checkParams:                           ## @checkParams
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	8(%rdi), %rax
	movq	48(%rax), %rbx
	movq	16(%rsi), %rax
	cmpq	16(%rbx), %rax
	jae	LBB228_2
## %bb.1:                               ## %then_0
	movq	__func229_str1(%rip), %rdi
	movq	%r14, %rsi
	callq	_error
	xorl	%eax, %eax
	jmp	LBB228_15
LBB228_2:                               ## %else_0
	movq	16(%rbx), %rax
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	cmpq	16(%rsi), %rax
	jae	LBB228_5
## %bb.3:                               ## %then_1
	movq	8(%rdi), %rax
	cmpb	$0, 64(%rax)
	jne	LBB228_5
## %bb.4:                               ## %then_2
	movq	__func229_str2(%rip), %rdi
	movq	%r14, %rsi
	callq	_error
LBB228_5:                               ## %endif_1
	movq	%r14, -56(%rbp)         ## 8-byte Spill
	movq	%rsp, %rax
	leaq	-16(%rax), %r14
	movq	%r14, %rsp
	movq	%rsp, %rcx
	leaq	-16(%rcx), %r13
	movq	%r13, %rsp
	movq	(%rbx), %rdx
	movq	%rdx, -16(%rax)
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rax
	movq	%rax, -16(%rcx)
	cmpq	$0, (%r14)
	jne	LBB228_7
	jmp	LBB228_11
	.p2align	4, 0x90
LBB228_10:                              ## %nextarg
                                        ##   in Loop: Header=BB228_7 Depth=1
	movq	(%r13), %rax
	movq	8(%rax), %rax
	movq	%rax, (%r13)
	movq	(%r14), %rax
	movq	8(%rax), %rax
	movq	%rax, (%r14)
	cmpq	$0, (%r14)
	je	LBB228_11
LBB228_7:                               ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%r14), %rax
	movq	24(%rax), %r15
	movq	(%r13), %rax
	movq	24(%rax), %rbx
	movq	%rbx, %rdi
	callq	_checkValue
	movq	8(%r15), %rsi
	movq	%rbx, %rdi
	callq	_nat
	movq	%rax, %r12
	movq	8(%r15), %rdi
	movq	8(%rax), %rsi
	callq	_type_eq
	testb	$1, %al
	jne	LBB228_9
## %bb.8:                               ## %then_3
                                        ##   in Loop: Header=BB228_7 Depth=1
	movq	__func229_str3(%rip), %rdi
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	callq	_error
	movq	__func229_str4(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	8(%r12), %rdi
	callq	_prttype
	movq	__func229_str5(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	__func229_str6(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	8(%r15), %rdi
	callq	_prttype
	movq	__func229_str7(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	jmp	LBB228_10
	.p2align	4, 0x90
LBB228_9:                               ## %else_3
                                        ##   in Loop: Header=BB228_7 Depth=1
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	_list_subst
	jmp	LBB228_10
LBB228_11:                              ## %break_0
	movq	-48(%rbp), %r14         ## 8-byte Reload
	cmpq	$0, (%r13)
	je	LBB228_14
	.p2align	4, 0x90
LBB228_13:                              ## %body_1
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%r13), %rax
	movq	24(%rax), %rbx
	movq	%rbx, %rdi
	callq	_checkValue
	movq	_typeBaseInt(%rip), %rsi
	movq	%rbx, %rdi
	callq	_castIfNumericTo
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	_list_subst
	movq	(%r13), %rax
	movq	8(%rax), %rax
	movq	%rax, (%r13)
	cmpq	$0, (%r13)
	jne	LBB228_13
LBB228_14:                              ## %break_1
	movb	$1, %al
LBB228_15:                              ## %break_1
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_immCastIsPossible      ## -- Begin function immCastIsPossible
	.p2align	4, 0x90
_immCastIsPossible:                     ## @immCastIsPossible
	.cfi_startproc
## %bb.0:
	movzwl	(%rdi), %eax
	cmpl	$2, %eax
	jne	LBB229_2
## %bb.1:                               ## %then_0
	movb	$1, %al
	retq
LBB229_2:                               ## %else_0
	xorl	%eax, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_cast                   ## -- Begin function cast
	.p2align	4, 0x90
_cast:                                  ## @cast
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	testq	%rdi, %rdi
	je	LBB230_2
## %bb.1:
	movq	%rsi, %r15
	testq	%rsi, %rsi
	je	LBB230_2
## %bb.4:                               ## %else_0
	movq	%rdx, %r14
	movq	%rdi, %rbx
	movq	%r15, %rsi
	callq	_immCastIsPossible
	testb	$1, %al
	je	LBB230_6
## %bb.5:                               ## %then_1
	movq	16(%rbx), %rsi
	movq	%r15, %rdi
	movq	%r14, %rdx
	callq	_valueNewImm
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB230_2:                               ## %then_0
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB230_6:                               ## %else_1
	movl	$31, %edi
	movq	%r14, %rsi
	callq	_valueNew
	movq	%rbx, 128(%rax)
	movq	%r15, 136(%rax)
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkValueCast         ## -- Begin function checkValueCast
	.p2align	4, 0x90
_checkValueCast:                        ## @checkValueCast
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	128(%rdi), %rdi
	callq	_checkValue
	movq	136(%rbx), %rax
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_size_of                ## -- Begin function size_of
	.p2align	4, 0x90
_size_of:                               ## @size_of
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$32, %edi
	callq	_valueNew
	movq	%rbx, 160(%rax)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkValueSizeof       ## -- Begin function checkValueSizeof
	.p2align	4, 0x90
_checkValueSizeof:                      ## @checkValueSizeof
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movq	160(%rdi), %r14
	cmpw	$0, (%r14)
	jne	LBB233_2
## %bb.1:                               ## %then_0
	movq	__func234_str1(%rip), %rdi
	movq	184(%rbx), %rsi
	callq	_error
LBB233_2:                               ## %endif_0
	movw	$2, (%rbx)
	movslq	16(%r14), %rax
	movq	%rax, 16(%rbx)
	movq	_typeNumeric(%rip), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_align_of               ## -- Begin function align_of
	.p2align	4, 0x90
_align_of:                              ## @align_of
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$33, %edi
	callq	_valueNew
	movq	%rbx, 160(%rax)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkValueAlignof      ## -- Begin function checkValueAlignof
	.p2align	4, 0x90
_checkValueAlignof:                     ## @checkValueAlignof
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movq	160(%rdi), %r14
	cmpw	$0, (%r14)
	jne	LBB235_2
## %bb.1:                               ## %then_0
	movq	__func236_str1(%rip), %rdi
	movq	184(%rbx), %rsi
	callq	_error
LBB235_2:                               ## %endif_0
	movw	$2, (%rbx)
	movsbq	24(%r14), %rax
	movq	%rax, 16(%rbx)
	movq	_typeNumeric(%rip), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_value_init             ## -- Begin function value_init
	.p2align	4, 0x90
_value_init:                            ## @value_init
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	_typeBool(%rip), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	_valueNewImm
	leaq	_globalValueIndex(%rip), %rbx
	movq	__func237_str1(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	callq	_map_append
	movq	_typeBool(%rip), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	_valueNewImm
	movq	__func237_str2(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	callq	_map_append
	movq	_typeUnit(%rip), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	_valueNewImm
	movq	__func237_str3(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	callq	_map_append
	movq	_typeFreePtr(%rip), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	_valueNewImm
	movq	__func237_str4(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	callq	_map_append
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_valueNew               ## -- Begin function valueNew
	.p2align	4, 0x90
_valueNew:                              ## @valueNew
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movl	%edi, %ebp
	movl	$192, %edi
	callq	_malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	testq	%rax, %rax
	setne	%dil
	movq	__func238_str1(%rip), %rsi
	callq	_assert
	xorl	%esi, %esi
	movl	$192, %edx
	movq	%rbx, %rdi
	callq	_memset
	movw	%bp, (%rbx)
	movq	%r14, 184(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkValue             ## -- Begin function checkValue
	.p2align	4, 0x90
_checkValue:                            ## @checkValue
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testq	%rdi, %rdi
	je	LBB238_1
## %bb.2:                               ## %else_0
	movq	%rdi, %rbx
	cmpq	$0, 8(%rdi)
	je	LBB238_5
## %bb.3:                               ## %then_1
	movq	8(%rbx), %rax
	jmp	LBB238_4
LBB238_1:                               ## %then_0
	movq	__func239_str1(%rip), %rsi
	xorl	%edi, %edi
	callq	_assert
	xorl	%eax, %eax
	jmp	LBB238_4
LBB238_5:                               ## %else_1
	movq	%rsp, %rax
	leaq	-16(%rax), %r15
	movq	%r15, %rsp
	movq	$0, -16(%rax)
	movzwl	(%rbx), %r14d
	cmpl	$6, %r14d
	jne	LBB238_7
## %bb.6:                               ## %then_2
	movq	56(%rbx), %rax
	movq	(%rax), %rdi
	callq	_checkValue
	jmp	LBB238_26
LBB238_7:                               ## %else_2
	movl	%r14d, %edi
	callq	_isBinaryOpKind
	testb	$1, %al
	je	LBB238_9
## %bb.8:                               ## %then_3
	movq	%rbx, %rdi
	callq	_checkValueBinary
	jmp	LBB238_26
LBB238_9:                               ## %else_3
	movl	%r14d, %edi
	callq	_isUnaryOpKind
	testb	$1, %al
	je	LBB238_11
## %bb.10:                              ## %then_4
	movq	%rbx, %rdi
	callq	_checkValueUnary
	jmp	LBB238_26
LBB238_11:                              ## %else_4
	movzwl	%r14w, %eax
	cmpl	$28, %eax
	jne	LBB238_13
## %bb.12:                              ## %then_5
	movq	%rbx, %rdi
	callq	_checkValueCall
	jmp	LBB238_26
LBB238_13:                              ## %else_5
	cmpl	$29, %eax
	jne	LBB238_15
## %bb.14:                              ## %then_6
	movq	%rbx, %rdi
	callq	_checkValueIndex
	jmp	LBB238_26
LBB238_15:                              ## %else_6
	cmpl	$30, %eax
	jne	LBB238_17
## %bb.16:                              ## %then_7
	movq	%rbx, %rdi
	callq	_checkValueAccess
	jmp	LBB238_26
LBB238_17:                              ## %else_7
	cmpl	$31, %eax
	jne	LBB238_19
## %bb.18:                              ## %then_8
	movq	%rbx, %rdi
	callq	_checkValueCast
	jmp	LBB238_26
LBB238_19:                              ## %else_8
	cmpl	$26, %eax
	je	LBB238_21
## %bb.20:                              ## %else_8
	cmpl	$27, %eax
	je	LBB238_21
## %bb.22:                              ## %else_9
	cmpl	$32, %eax
	jne	LBB238_24
## %bb.23:                              ## %then_10
	movq	%rbx, %rdi
	callq	_checkValueSizeof
	jmp	LBB238_26
LBB238_21:                              ## %then_9
	movq	%rbx, %rdi
	callq	_checkValueShift
	jmp	LBB238_26
LBB238_24:                              ## %else_10
	cmpl	$33, %eax
	jne	LBB238_27
## %bb.25:                              ## %then_11
	movq	%rbx, %rdi
	callq	_checkValueAlignof
LBB238_26:                              ## %endif_2
	movq	%rax, (%r15)
LBB238_27:                              ## %endif_2
	movq	(%r15), %rax
	movq	%rax, 8(%rbx)
	movq	(%r15), %rax
LBB238_4:                               ## %then_1
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_valueNewImm            ## -- Begin function valueNewImm
	.p2align	4, 0x90
_valueNewImm:                           ## @valueNewImm
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movl	$2, %edi
	movq	%rdx, %rsi
	callq	_valueNew
	movq	%rbx, 8(%rax)
	movq	%r14, 16(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_isUnaryOpKind          ## -- Begin function isUnaryOpKind
	.p2align	4, 0x90
_isUnaryOpKind:                         ## @isUnaryOpKind
	.cfi_startproc
## %bb.0:
	movzwl	%di, %eax
	cmpl	$8, %eax
	sete	%sil
	cmpl	$9, %eax
	sete	%dl
	cmpl	$11, %eax
	sete	%cl
	cmpl	$10, %eax
	sete	%al
	orb	%dl, %al
	orb	%sil, %al
	orb	%cl, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_isBinaryOpKind         ## -- Begin function isBinaryOpKind
	.p2align	4, 0x90
_isBinaryOpKind:                        ## @isBinaryOpKind
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movzwl	%di, %eax
	cmpl	$12, %eax
	sete	7(%rsp)                 ## 1-byte Folded Spill
	cmpl	$13, %eax
	sete	6(%rsp)                 ## 1-byte Folded Spill
	cmpl	$14, %eax
	sete	%r15b
	cmpl	$15, %eax
	sete	%r12b
	cmpl	$16, %eax
	sete	%r13b
	cmpl	$19, %eax
	sete	%bl
	cmpl	$17, %eax
	sete	%bpl
	cmpl	$18, %eax
	sete	%r14b
	callq	_isReletionOpKind
	orb	%bpl, %al
	orb	%bl, %al
	orb	%r13b, %al
	orb	%r12b, %al
	orb	%r15b, %al
	orb	6(%rsp), %al            ## 1-byte Folded Reload
	orb	7(%rsp), %al            ## 1-byte Folded Reload
	orb	%r14b, %al
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_isReletionOpKind       ## -- Begin function isReletionOpKind
	.p2align	4, 0x90
_isReletionOpKind:                      ## @isReletionOpKind
	.cfi_startproc
## %bb.0:
	movzwl	%di, %eax
	cmpl	$20, %eax
	sete	%sil
	cmpl	$21, %eax
	sete	%dil
	cmpl	$22, %eax
	sete	%cl
	cmpl	$23, %eax
	sete	%dl
	cmpl	$24, %eax
	sete	%r8b
	cmpl	$25, %eax
	sete	%al
	orb	%dl, %al
	orb	%cl, %al
	orb	%dil, %al
	orb	%sil, %al
	orb	%r8b, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_isSpecialOpKind        ## -- Begin function isSpecialOpKind
	.p2align	4, 0x90
_isSpecialOpKind:                       ## @isSpecialOpKind
	.cfi_startproc
## %bb.0:
	movzwl	%di, %eax
	cmpl	$26, %eax
	sete	%sil
	cmpl	$27, %eax
	sete	%dil
	cmpl	$28, %eax
	sete	%cl
	cmpl	$29, %eax
	sete	%r8b
	cmpl	$30, %eax
	sete	%r9b
	cmpl	$31, %eax
	sete	%dl
	cmpl	$32, %eax
	sete	%r10b
	cmpl	$33, %eax
	sete	%al
	orb	%dl, %al
	orb	%cl, %al
	orb	%r9b, %al
	orb	%r8b, %al
	orb	%cl, %al
	orb	%dil, %al
	orb	%sil, %al
	orb	%r10b, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_valueIsTerm            ## -- Begin function valueIsTerm
	.p2align	4, 0x90
_valueIsTerm:                           ## @valueIsTerm
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movzwl	(%rdi), %ebx
	movl	%ebx, %edi
	callq	_isUnaryOpKind
	movl	%eax, %ebp
	movl	%ebx, %edi
	callq	_isBinaryOpKind
	movl	%eax, %r14d
	movl	%ebx, %edi
	callq	_isSpecialOpKind
	orb	%bpl, %al
	orb	%r14b, %al
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_valueIsReadonly        ## -- Begin function valueIsReadonly
	.p2align	4, 0x90
_valueIsReadonly:                       ## @valueIsReadonly
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	movzwl	(%rdi), %eax
	cmpl	$29, %eax
	jne	LBB245_2
## %bb.1:                               ## %then_0
	movq	96(%rbx), %rax
	movq	8(%rax), %rdi
	callq	_typeIsDefinedArray
	movl	%eax, %ebp
	movq	96(%rbx), %rdi
	callq	_valueIsReadonly
	andb	%bpl, %al
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB245_2:                               ## %else_0
	movzwl	%ax, %eax
	cmpl	$30, %eax
	jne	LBB245_4
## %bb.3:                               ## %then_1
	movq	112(%rbx), %rdi
	callq	_valueIsReadonly
	movq	112(%rbx), %rcx
	movq	8(%rcx), %rcx
	movzwl	(%rcx), %ecx
	cmpl	$6, %ecx
	setne	%cl
	andb	%cl, %al
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB245_4:                               ## %else_1
	cmpl	$3, %eax
	sete	%cl
	cmpl	$2, %eax
	sete	%dl
	cmpl	$6, %eax
	sete	%bl
	cmpl	$5, %eax
	sete	%al
	orb	%dl, %al
	orb	%cl, %al
	orb	%bl, %al
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_valueIsMutable         ## -- Begin function valueIsMutable
	.p2align	4, 0x90
_valueIsMutable:                        ## @valueIsMutable
	.cfi_startproc
## %bb.0:
	movzwl	(%rdi), %eax
	cmpl	$7, %eax
	sete	%cl
	cmpl	$4, %eax
	sete	%al
	orb	%cl, %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_importAdd              ## -- Begin function importAdd
	.p2align	4, 0x90
_importAdd:                             ## @importAdd
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rax
	movq	%rdi, %rcx
	leaq	_imports(%rip), %rdi
	movq	%rcx, %rsi
	movq	%rax, %rdx
	callq	_map_append
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_importGet              ## -- Begin function importGet
	.p2align	4, 0x90
_importGet:                             ## @importGet
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	leaq	_imports(%rip), %rdi
	movq	%rax, %rsi
	callq	_map_get
	testq	%rax, %rax
	je	LBB248_2
## %bb.1:                               ## %then_0
	popq	%rcx
	retq
LBB248_2:                               ## %else_0
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_import                 ## -- Begin function import
	.p2align	4, 0x90
_import:                                ## @import
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movl	$512, %edi              ## imm = 0x200
	callq	_str_new
	movq	%rax, %r14
	movl	$512, %esi              ## imm = 0x200
	movq	%rax, %rdi
	callq	_getcwd
	movq	%r15, %rdi
	callq	_getSourceInfo
	movl	%eax, %ebp
	movq	%rdx, %r12
	movq	%rcx, %rbx
	movq	%rcx, %rdi
	callq	_importGet
	testq	%rax, %rax
	jne	LBB249_6
## %bb.1:                               ## %else_0
	testw	%bp, %bp
	jne	LBB249_3
## %bb.2:                               ## %then_1
	movq	__func250_str1(%rip), %rdi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	_printf
	movq	__func250_str2(%rip), %rdi
	callq	_fatal
LBB249_3:                               ## %endif_1
	movl	%ebp, %edi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	_openSource
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	LBB249_5
## %bb.4:                               ## %then_2
	movq	__func250_str3(%rip), %rdi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	_printf
	movq	__func250_str4(%rip), %rdi
	callq	_fatal
LBB249_5:                               ## %endif_2
	leaq	_mctx(%rip), %r15
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_importAdd
	movq	%rbp, %rdi
	callq	_parse
	movq	%r14, %rdi
	callq	_chdir
	movq	%r15, %rax
LBB249_6:                               ## %then_0
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_comment                ## -- Begin function comment
	.p2align	4, 0x90
_comment:                               ## @comment
	.cfi_startproc
## %bb.0:
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse                  ## -- Begin function parse
	.p2align	4, 0x90
_parse:                                 ## @parse
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	_mctx(%rip), %rax
	movq	%rax, (%rsp)            ## 8-byte Spill
	movq	%rdi, _mctx(%rip)
	movb	$1, _comments(%rip)
	movq	__func252_str1(%rip), %rbx
	jmp	LBB251_1
	.p2align	4, 0x90
LBB251_2:                               ## %then_0
                                        ##   in Loop: Header=BB251_1 Depth=1
	addq	$24, %rax
	movq	%rax, %rdi
	callq	_comment
	callq	_skip
LBB251_1:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_skip_nl
	callq	_ctok
	movzwl	(%rax), %ecx
	cmpl	$6, %ecx
	je	LBB251_2
## %bb.3:                               ## %else_0
                                        ##   in Loop: Header=BB251_1 Depth=1
	movq	%rbx, %rdi
	callq	_match
	testb	$1, %al
	je	LBB251_5
## %bb.4:                               ## %then_1
                                        ##   in Loop: Header=BB251_1 Depth=1
	callq	_parseImport
	jmp	LBB251_1
LBB251_5:                               ## %break_0
	movb	$0, _comments(%rip)
	movq	__func252_str2(%rip), %rdi
	xorl	%esi, %esi
	callq	_set
	movq	__func252_str3(%rip), %rbx
	movq	__func252_str4(%rip), %r14
	movq	__func252_str5(%rip), %r15
	jmp	LBB251_6
	.p2align	4, 0x90
LBB251_22:                              ## %endif_2
                                        ##   in Loop: Header=BB251_6 Depth=1
	movq	__func252_str13(%rip), %rdi
	xorl	%esi, %esi
	callq	_set
LBB251_6:                               ## %continue_1
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB251_18 Depth 2
	callq	_skip_nl
	callq	_ctok
	movq	%rbx, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB251_7
## %bb.8:                               ## %else_2
                                        ##   in Loop: Header=BB251_6 Depth=1
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB251_9
## %bb.10:                              ## %else_3
                                        ##   in Loop: Header=BB251_6 Depth=1
	movq	%r15, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB251_11
## %bb.12:                              ## %else_4
                                        ##   in Loop: Header=BB251_6 Depth=1
	movq	__func252_str6(%rip), %rdi
	callq	_match
	testb	$1, %al
	jne	LBB251_13
## %bb.14:                              ## %else_5
                                        ##   in Loop: Header=BB251_6 Depth=1
	movq	__func252_str7(%rip), %rdi
	callq	_match
	testb	$1, %al
	jne	LBB251_15
## %bb.16:                              ## %else_6
                                        ##   in Loop: Header=BB251_6 Depth=1
	movq	__func252_str9(%rip), %rdi
	callq	_match
	testb	$1, %al
	jne	LBB251_6
## %bb.17:                              ## %else_7
                                        ##   in Loop: Header=BB251_6 Depth=1
	callq	_eof
	testb	$1, %al
	je	LBB251_18
	jmp	LBB251_25
	.p2align	4, 0x90
LBB251_7:                               ## %then_2
                                        ##   in Loop: Header=BB251_6 Depth=1
	callq	_parseLet
	jmp	LBB251_22
	.p2align	4, 0x90
LBB251_24:                              ## %endif_9
                                        ##   in Loop: Header=BB251_18 Depth=2
	callq	_skip
LBB251_18:                              ## %continue_2
                                        ##   Parent Loop BB251_6 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	callq	_ctok
	movq	%rax, %rbp
	movzwl	(%rax), %eax
	cmpl	$1, %eax
	jne	LBB251_23
## %bb.19:                              ## %then_9
                                        ##   in Loop: Header=BB251_18 Depth=2
	movq	__func252_str10(%rip), %rdi
	addq	$24, %rbp
	movq	%rbp, %rsi
	callq	_strcmp
	movl	%eax, %r12d
	movq	__func252_str11(%rip), %rdi
	movq	%rbp, %rsi
	callq	_strcmp
	movl	%eax, %r13d
	movq	__func252_str12(%rip), %rdi
	movq	%rbp, %rsi
	callq	_strcmp
	testl	%r12d, %r12d
	je	LBB251_22
## %bb.20:                              ## %then_9
                                        ##   in Loop: Header=BB251_18 Depth=2
	testl	%r13d, %r13d
	je	LBB251_22
## %bb.21:                              ## %then_9
                                        ##   in Loop: Header=BB251_18 Depth=2
	testl	%eax, %eax
	jne	LBB251_24
	jmp	LBB251_22
	.p2align	4, 0x90
LBB251_23:                              ## %else_9
                                        ##   in Loop: Header=BB251_18 Depth=2
	cmpw	$0, (%rbp)
	jne	LBB251_24
	jmp	LBB251_22
	.p2align	4, 0x90
LBB251_9:                               ## %then_3
                                        ##   in Loop: Header=BB251_6 Depth=1
	callq	_parseTypedef
	jmp	LBB251_22
LBB251_11:                              ## %then_4
                                        ##   in Loop: Header=BB251_6 Depth=1
	callq	_parseExtern
	jmp	LBB251_22
LBB251_13:                              ## %then_5
                                        ##   in Loop: Header=BB251_6 Depth=1
	callq	_parseVardef
	jmp	LBB251_22
LBB251_15:                              ## %then_6
                                        ##   in Loop: Header=BB251_6 Depth=1
	movq	__func252_str8(%rip), %rdi
	movl	$1, %esi
	callq	_set
	jmp	LBB251_6
LBB251_25:                              ## %break_1
	movq	(%rsp), %rax            ## 8-byte Reload
	movq	%rax, _mctx(%rip)
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parseImport            ## -- Begin function parseImport
	.p2align	4, 0x90
_parseImport:                           ## @parseImport
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	callq	_ctok
	movzwl	(%rax), %eax
	cmpl	$4, %eax
	je	LBB252_2
## %bb.1:                               ## %then_0
	movq	__func253_str1(%rip), %rbx
	callq	_ctok
	leaq	8(%rax), %rsi
	movq	%rbx, %rdi
	callq	_error
	callq	_skip
	popq	%rbx
	retq
LBB252_2:                               ## %else_0
	callq	_ctok
	leaq	24(%rax), %rdi
	callq	_dup
	movq	%rax, %rbx
	callq	_skip
	movq	%rbx, %rdi
	callq	_import
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parseTypedef           ## -- Begin function parseTypedef
	.p2align	4, 0x90
_parseTypedef:                          ## @parseTypedef
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	callq	_parseId
	testq	%rax, %rax
	je	LBB253_6
## %bb.1:                               ## %else_0
	movq	%rax, %r14
	movq	__func254_str1(%rip), %rdi
	callq	_need
	callq	_parse_type
	testq	%rax, %rax
	je	LBB253_6
## %bb.2:                               ## %else_1
	movq	%rax, %rbx
	movzwl	(%rax), %eax
	cmpl	$2, %eax
	je	LBB253_5
## %bb.3:                               ## %then_2
	cmpq	$0, 8(%rbx)
	jne	LBB253_5
## %bb.4:                               ## %then_3
	movq	%r14, 8(%rbx)
LBB253_5:                               ## %endif_2
	leaq	_mctx+8(%rip), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	_add_type
	leaq	_asm0(%rip), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	_asmTypedefAdd
LBB253_6:                               ## %then_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parseLet               ## -- Begin function parseLet
	.p2align	4, 0x90
_parseLet:                              ## @parseLet
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_ctok
	movq	%rax, %r14
	callq	_parseId
	movq	%rax, %r15
	movq	__func255_str1(%rip), %rdi
	callq	_need
	callq	_hier1
	testq	%r15, %r15
	je	LBB254_2
## %bb.1:
	movq	%rax, %rbx
	testq	%rax, %rax
	je	LBB254_2
## %bb.4:                               ## %else_0
	addq	$8, %r14
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_rename
	movq	%r14, 176(%rbx)
	cmpq	$0, _fctx(%rip)
	je	LBB254_5
## %bb.6:                               ## %else_1
	movzwl	(%rbx), %eax
	cmpl	$3, %eax
	setne	%cl
	cmpl	$2, %eax
	setne	%dl
	testb	%dl, %cl
	jne	LBB254_8
## %bb.7:                               ## %else_1
	movzwl	%ax, %eax
	cmpl	$1, %eax
	je	LBB254_8
## %bb.9:                               ## %else_2
	movq	_fctx+8(%rip), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	_bind_value_in_block
	jmp	LBB254_2
LBB254_5:                               ## %then_1
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	_def_global
LBB254_2:                               ## %then_0
	xorl	%eax, %eax
LBB254_3:                               ## %then_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
LBB254_8:                               ## %then_2
	movl	$6, %edi
	movq	%r14, %rsi
	callq	_valueNew
	movq	%rax, %r12
	movq	%r15, 64(%rax)
	movq	%r15, %rdi
	movq	%rax, %rsi
	callq	_bind_value_local
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_stmt_expr_new
	movq	32(%rax), %rcx
	movq	%rcx, 56(%r12)
	jmp	LBB254_3
	.cfi_endproc
                                        ## -- End function
	.globl	_handle_fields          ## -- Begin function handle_fields
	.p2align	4, 0x90
_handle_fields:                         ## @handle_fields
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movq	(%rdi), %rdi
	movq	8(%rax), %rsi
	cmpq	$0, _fctx(%rip)
	je	LBB255_2
## %bb.1:                               ## %then_0
	movq	24(%rax), %rcx
	xorl	%edx, %edx
	callq	_create_local_var
	popq	%rax
	retq
LBB255_2:                               ## %else_0
	movq	24(%rax), %rcx
	xorl	%edx, %edx
	callq	_create_global_var
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parseVardef            ## -- Begin function parseVardef
	.p2align	4, 0x90
_parseVardef:                           ## @parseVardef
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_parseField
	leaq	_handle_fields(%rip), %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	callq	_list_foreach
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_extern_decl            ## -- Begin function extern_decl
	.p2align	4, 0x90
_extern_decl:                           ## @extern_decl
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rax
	movq	8(%rdi), %rsi
	movq	24(%rdi), %rdx
	movq	%rax, %rdi
	callq	_declare
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parseExtern            ## -- Begin function parseExtern
	.p2align	4, 0x90
_parseExtern:                           ## @parseExtern
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_parseField
	leaq	_extern_decl(%rip), %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	callq	_list_foreach
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parseId                ## -- Begin function parseId
	.p2align	4, 0x90
_parseId:                               ## @parseId
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	callq	_ctok
	movq	%rax, %rbx
	movzwl	(%rax), %eax
	cmpl	$1, %eax
	je	LBB259_2
## %bb.1:                               ## %then_0
	movq	__func260_str1(%rip), %rdi
	leaq	8(%rbx), %rsi
	callq	_error
	movq	__func260_str2(%rip), %rdi
	movzwl	(%rbx), %esi
	xorl	%eax, %eax
	callq	_printf
	movq	__func260_str3(%rip), %rdi
	movq	%rbx, %r14
	addq	$24, %r14
	movzbl	24(%rbx), %esi
	xorl	%eax, %eax
	callq	_printf
	movq	__func260_str4(%rip), %rdi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	_printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
LBB259_2:                               ## %else_0
	movzwl	22(%rbx), %edi
	incl	%edi
	callq	_str_new
	movq	%rax, %r14
	addq	$24, %rbx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	_strcpy
	callq	_skip
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_set_type               ## -- Begin function set_type
	.p2align	4, 0x90
_set_type:                              ## @set_type
	.cfi_startproc
## %bb.0:
	movq	%rsi, 8(%rdi)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parseField             ## -- Begin function parseField
	.p2align	4, 0x90
_parseField:                            ## @parseField
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	_list_new
	movq	%rax, %r15
	movq	__func261_str1(%rip), %r14
	jmp	LBB261_1
	.p2align	4, 0x90
LBB261_2:                               ## %else_0
                                        ##   in Loop: Header=BB261_1 Depth=1
	callq	_skip_nl
LBB261_1:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	callq	_ctok
	leaq	8(%rax), %rbx
	callq	_parseId
	xorl	%esi, %esi
	movq	%rax, %rdi
	movq	%rbx, %rdx
	callq	_field_new
	movq	%r15, %rdi
	movq	%rax, %rsi
	callq	_list_append
	movq	%r14, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB261_2
## %bb.3:                               ## %break_0
	movq	__func261_str2(%rip), %rdi
	callq	_need
	callq	_parse_type
	testq	%rax, %rax
	je	LBB261_4
## %bb.6:                               ## %else_1
	leaq	_set_type(%rip), %rsi
	movq	%r15, %rdi
	movq	%rax, %rdx
	callq	_list_foreach
	movq	%r15, %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
LBB261_4:                               ## %then_1
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_create_local_var       ## -- Begin function create_local_var
	.p2align	4, 0x90
_create_local_var:                      ## @create_local_var
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	movl	$7, %edi
	movq	%rcx, %rsi
	callq	_valueNew
	movq	%rax, %r13
	movq	%r15, 8(%rax)
	movq	%r12, 64(%rax)
	movq	%r12, %rdi
	movq	%rax, %rsi
	callq	_bind_value_local
	xorl	%ecx, %ecx
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%r14, %rdx
	callq	_stmt_new_vardef
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	_stmtAdd
	movq	40(%rbx), %rax
	movq	%rax, 40(%r13)
	testq	%r14, %r14
	je	LBB262_2
## %bb.1:                               ## %then_0
	xorl	%edx, %edx
	movq	%r13, %rdi
	movq	%r14, %rsi
	callq	_stmt_new_assign
	movq	%rax, %rdi
	callq	_stmtAdd
LBB262_2:                               ## %endif_0
	movq	%r13, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_create_global_var      ## -- Begin function create_global_var
	.p2align	4, 0x90
_create_global_var:                     ## @create_global_var
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	movl	$4, %edi
	movq	%rcx, %rsi
	callq	_valueNew
	movq	%rax, %rbx
	leaq	_asm0(%rip), %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	movq	%r14, %rcx
	callq	_asmVarAdd
	movq	%rax, 32(%rbx)
	movq	%r15, 8(%rbx)
	movq	%r12, 64(%rbx)
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	_bind_value_global
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_gett                   ## -- Begin function gett
	.p2align	4, 0x90
_gett:                                  ## @gett
	.cfi_startproc
## %bb.0:
	movq	_mctx(%rip), %rax
	movq	32(%rax), %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_sett                   ## -- Begin function sett
	.p2align	4, 0x90
_sett:                                  ## @sett
	.cfi_startproc
## %bb.0:
	movq	_mctx(%rip), %rax
	movq	%rdi, 32(%rax)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_skip                   ## -- Begin function skip
	.p2align	4, 0x90
_skip:                                  ## @skip
	.cfi_startproc
## %bb.0:
	movq	_mctx(%rip), %rax
	movq	32(%rax), %rcx
	movq	8(%rcx), %rcx
	movq	%rcx, 32(%rax)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_skip_nl                ## -- Begin function skip_nl
	.p2align	4, 0x90
_skip_nl:                               ## @skip_nl
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	__func268_str1(%rip), %rbx
	.p2align	4, 0x90
LBB267_1:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	_match
	testb	$1, %al
	jne	LBB267_1
## %bb.2:                               ## %break_0
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_ctok                   ## -- Begin function ctok
	.p2align	4, 0x90
_ctok:                                  ## @ctok
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_gett
	movq	24(%rax), %rax
	cmpb	$0, _comments(%rip)
	jne	LBB268_3
## %bb.1:                               ## %then_0
	movzwl	(%rax), %ecx
	cmpl	$6, %ecx
	jne	LBB268_3
## %bb.2:                               ## %then_1
	callq	_skip
	callq	_ctok
LBB268_3:                               ## %endif_0
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eof                    ## -- Begin function eof
	.p2align	4, 0x90
_eof:                                   ## @eof
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_ctok
	cmpw	$0, (%rax)
	sete	%al
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_nextok                 ## -- Begin function nextok
	.p2align	4, 0x90
_nextok:                                ## @nextok
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_gett
	cmpq	$0, 8(%rax)
	je	LBB270_2
## %bb.1:                               ## %then_0
	callq	_gett
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	popq	%rcx
	retq
LBB270_2:                               ## %else_0
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_sep                    ## -- Begin function sep
	.p2align	4, 0x90
_sep:                                   ## @sep
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	callq	_ctok
	movq	%rax, %r14
	callq	_separator
	movl	%eax, %ebx
	testb	$1, %al
	jne	LBB271_2
## %bb.1:                               ## %then_0
	movq	__func272_str1(%rip), %rdi
	addq	$8, %r14
	movq	%r14, %rsi
	callq	_error
LBB271_2:                               ## %endif_0
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_separator              ## -- Begin function separator
	.p2align	4, 0x90
_separator:                             ## @separator
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_ctok
	movb	24(%rax), %al
	movq	__func273_str1(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB272_2
## %bb.1:
	movq	__func273_str2(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB272_2
## %bb.3:                               ## %else_0
	movq	__func273_str3(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB272_5
## %bb.4:                               ## %else_0
	movq	__func273_str4(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB272_5
## %bb.6:                               ## %else_1
	xorl	%eax, %eax
	popq	%rcx
	retq
LBB272_2:                               ## %then_0
	callq	_skip
LBB272_5:                               ## %then_1
	movb	$1, %al
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_skipto                 ## -- Begin function skipto
	.p2align	4, 0x90
_skipto:                                ## @skipto
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movq	__func274_str1(%rip), %rdi
	xorl	%esi, %esi
	callq	_error
	movq	__func274_str2(%rip), %r14
	callq	_ctok
	leaq	24(%rax), %rsi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movq	__func274_str3(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	_printf
	movl	$1, %edi
	callq	_exit
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_match                  ## -- Begin function match
	.p2align	4, 0x90
_match:                                 ## @match
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	_ctok
	movzwl	(%rax), %ecx
	cmpl	$4, %ecx
	je	LBB274_5
## %bb.1:
	testw	%cx, %cx
	je	LBB274_5
## %bb.2:                               ## %else_0
	addq	$24, %rax
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_strcmp
	movl	%eax, %ebx
	testl	%eax, %eax
	je	LBB274_3
## %bb.4:                               ## %endif_1
	testl	%ebx, %ebx
	sete	%al
	popq	%rbx
	retq
LBB274_5:                               ## %then_0
	xorl	%eax, %eax
	popq	%rbx
	retq
LBB274_3:                               ## %then_1
	callq	_skip
	testl	%ebx, %ebx
	sete	%al
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_need                   ## -- Begin function need
	.p2align	4, 0x90
_need:                                  ## @need
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	callq	_match
	movl	%eax, %ebx
	testb	$1, %al
	jne	LBB275_2
## %bb.1:                               ## %then_0
	callq	_ctok
	movq	%rax, %r15
	movq	__func276_str1(%rip), %rdi
	leaq	8(%rax), %rsi
	callq	_error
	movq	__func276_str2(%rip), %rdi
	leaq	24(%r15), %rdx
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	_printf
	movq	__func276_str3(%rip), %rdi
	movzwl	(%r15), %esi
	xorl	%eax, %eax
	callq	_printf
	xorl	%edi, %edi
	callq	_exit
LBB275_2:                               ## %endif_0
	movl	%ebx, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_lab_reset              ## -- Begin function lab_reset
	.p2align	4, 0x90
_lab_reset:                             ## @lab_reset
	.cfi_startproc
## %bb.0:
	movl	%edi, _lab(%rip)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_lab_get                ## -- Begin function lab_get
	.p2align	4, 0x90
_lab_get:                               ## @lab_get
	.cfi_startproc
## %bb.0:
	movl	_lab(%rip), %eax
	leal	1(%rax), %ecx
	movl	%ecx, _lab(%rip)
                                        ## kill: def $eax killed $eax killed $rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_o                      ## -- Begin function o
	.p2align	4, 0x90
_o:                                     ## @o
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %rcx
	movq	_fout(%rip), %rdi
	movq	__func279_str1(%rip), %rsi
	xorl	%eax, %eax
	movq	%rcx, %rdx
	callq	_fprintf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_nl                     ## -- Begin function nl
	.p2align	4, 0x90
_nl:                                    ## @nl
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__func280_str1(%rip), %rdi
	callq	_o
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_space                  ## -- Begin function space
	.p2align	4, 0x90
_space:                                 ## @space
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__func281_str1(%rip), %rdi
	callq	_o
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_comma                  ## -- Begin function comma
	.p2align	4, 0x90
_comma:                                 ## @comma
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__func282_str1(%rip), %rdi
	callq	_o
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_metadata           ## -- Begin function get_metadata
	.p2align	4, 0x90
_get_metadata:                          ## @get_metadata
	.cfi_startproc
## %bb.0:
	movl	_md(%rip), %eax
	leal	1(%rax), %ecx
	movl	%ecx, _md(%rip)
                                        ## kill: def $eax killed $eax killed $rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_dbg                    ## -- Begin function dbg
	.p2align	4, 0x90
_dbg:                                   ## @dbg
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, %ecx
	movq	_fout(%rip), %rdi
	movq	__func284_str1(%rip), %rsi
	xorl	%eax, %eax
	movl	%ecx, %edx
	callq	_fprintf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_md               ## -- Begin function print_md
	.p2align	4, 0x90
_print_md:                              ## @print_md
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_print_metadata
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_metadata_list    ## -- Begin function print_metadata_list
	.p2align	4, 0x90
_print_metadata_list:                   ## @print_metadata_list
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	_print_md(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_metadata         ## -- Begin function print_metadata
	.p2align	4, 0x90
_print_metadata:                        ## @print_metadata
	.cfi_startproc
## %bb.0:
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printType              ## -- Begin function printType
	.p2align	4, 0x90
_printType:                             ## @printType
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%edx, %r14d
	movl	%esi, %ebp
	movq	%rdi, %rbx
	xorl	%edi, %edi
	testq	%rbx, %rbx
	setne	%dil
	movq	__func288_str1(%rip), %rsi
	callq	_assert
	testb	$1, %bpl
	je	LBB287_4
## %bb.1:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	LBB287_4
## %bb.2:                               ## %then_0
	movq	_fout(%rip), %rdi
	movq	__func288_str2(%rip), %rsi
	movq	8(%rbx), %rdx
	jmp	LBB287_3
LBB287_4:                               ## %else_0
	movzwl	(%rbx), %eax
	cmpl	$2, %eax
	jne	LBB287_6
## %bb.5:                               ## %then_1
	movq	_fout(%rip), %rdi
	movq	__func288_str3(%rip), %rsi
	movq	32(%rbx), %rdx
LBB287_3:                               ## %endif_1
	xorl	%eax, %eax
	callq	_fprintf
LBB287_16:                              ## %endif_1
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB287_6:                               ## %else_1
	movzwl	%ax, %eax
	cmpl	$4, %eax
	jne	LBB287_8
## %bb.7:                               ## %then_2
	movq	_typeEnum(%rip), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB287_8:                               ## %else_2
	cmpl	$5, %eax
	jne	LBB287_10
## %bb.9:                               ## %then_3
	addq	$96, %rbx
	movq	%rbx, %rdi
	callq	_printTypeRecord
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB287_10:                              ## %else_3
	cmpl	$7, %eax
	jne	LBB287_12
## %bb.11:                              ## %then_4
	addq	$80, %rbx
	movq	%rbx, %rdi
	callq	_printTypeArray
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB287_12:                              ## %else_4
	cmpl	$6, %eax
	jne	LBB287_14
## %bb.13:                              ## %then_5
	addq	$72, %rbx
	movq	%rbx, %rdi
	callq	_printTypePointer
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB287_14:                              ## %else_5
	cmpl	$3, %eax
	jne	LBB287_16
## %bb.15:                              ## %then_6
	addq	$48, %rbx
	movzbl	%r14b, %esi
	movq	%rbx, %rdi
	callq	_printTypeFunc
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_struct_field     ## -- Begin function print_struct_field
	.p2align	4, 0x90
_print_struct_field:                    ## @print_struct_field
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	cmpb	$1, (%rsi)
	jne	LBB288_2
## %bb.1:                               ## %then_0
	movq	_fout(%rip), %rdi
	movq	__func290_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
LBB288_2:                               ## %endif_0
	movq	8(%r14), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	movb	$1, (%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printTypeRecord        ## -- Begin function printTypeRecord
	.p2align	4, 0x90
_printTypeRecord:                       ## @printTypeRecord
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	_fout(%rip), %rdi
	movq	__func289_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movb	$0, 15(%rsp)
	movq	(%rbx), %rdi
	leaq	_print_struct_field(%rip), %rsi
	leaq	15(%rsp), %rdx
	callq	_list_foreach
	movq	_fout(%rip), %rdi
	movq	__func289_str2(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printTypeArray         ## -- Begin function printTypeArray
	.p2align	4, 0x90
_printTypeArray:                        ## @printTypeArray
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	(%rdi), %rbx
	cmpb	$1, 12(%rdi)
	jne	LBB290_2
## %bb.1:                               ## %then_0
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	_printType
	movq	__func291_str1(%rip), %rdi
	callq	_o
	popq	%rbx
	retq
LBB290_2:                               ## %else_0
	movq	_fout(%rip), %rcx
	movq	__func291_str2(%rip), %rsi
	movl	8(%rdi), %edx
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	_fprintf
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	_printType
	movq	_fout(%rip), %rdi
	movq	__func291_str3(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printTypePointer       ## -- Begin function printTypePointer
	.p2align	4, 0x90
_printTypePointer:                      ## @printTypePointer
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	movq	_fout(%rip), %rdi
	movq	__func292_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_pt_print_param         ## -- Begin function pt_print_param
	.p2align	4, 0x90
_pt_print_param:                        ## @pt_print_param
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	cmpb	$1, (%rsi)
	jne	LBB292_2
## %bb.1:                               ## %then_0
	movq	_fout(%rip), %rdi
	movq	__func294_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
LBB292_2:                               ## %endif_0
	movq	8(%r14), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	movb	$1, (%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printTypeFunc          ## -- Begin function printTypeFunc
	.p2align	4, 0x90
_printTypeFunc:                         ## @printTypeFunc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	%esi, %r14d
	movq	%rdi, %rbx
	movq	8(%rdi), %rdi
	movq	_typeUnit(%rip), %rsi
	callq	_type_eq
	testb	$1, %al
	je	LBB293_2
## %bb.1:                               ## %then_0
	movq	_fout(%rip), %rdi
	movq	__func293_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	jmp	LBB293_3
LBB293_2:                               ## %else_0
	movq	8(%rbx), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
LBB293_3:                               ## %endif_0
	movq	_fout(%rip), %rdi
	movq	__func293_str2(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%rsp, %rax
	leaq	-16(%rax), %rdx
	movq	%rdx, %rsp
	movb	$0, -16(%rax)
	movq	(%rbx), %rdi
	leaq	_pt_print_param(%rip), %rsi
	callq	_list_foreach
	cmpb	$1, 16(%rbx)
	jne	LBB293_5
## %bb.4:                               ## %then_1
	movq	__func293_str3(%rip), %rdi
	callq	_o
LBB293_5:                               ## %endif_1
	movq	_fout(%rip), %rdi
	movq	__func293_str4(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	testb	$1, %r14b
	je	LBB293_7
## %bb.6:                               ## %then_2
	movq	_fout(%rip), %rdi
	movq	__func293_str5(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
LBB293_7:                               ## %endif_2
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_reset_local_labels     ## -- Begin function reset_local_labels
	.p2align	4, 0x90
_reset_local_labels:                    ## @reset_local_labels
	.cfi_startproc
## %bb.0:
	movl	$0, _if_id(%rip)
	movl	$0, _global_while_id(%rip)
	movl	$0, _old_while_id(%rip)
	movl	$0, _stmtno(%rip)
	movl	$0, _blockno(%rip)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_stmt             ## -- Begin function print_stmt
	.p2align	4, 0x90
_print_stmt:                            ## @print_stmt
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	_fout(%rip), %rdi
	movq	__func296_str1(%rip), %rsi
	movl	_stmtno(%rip), %edx
	xorl	%eax, %eax
	callq	_fprintf
	incl	_stmtno(%rip)
	movzwl	(%rbx), %eax
	cmpl	$1, %eax
	jne	LBB295_2
## %bb.1:                               ## %then_0
	movq	24(%rbx), %rdi
	callq	_print_block
	popq	%rbx
	retq
LBB295_2:                               ## %else_0
	testw	%ax, %ax
	je	LBB295_3
## %bb.4:                               ## %else_1
	movzwl	%ax, %eax
	cmpl	$2, %eax
	jne	LBB295_6
## %bb.5:                               ## %then_2
	movq	40(%rbx), %rdi
	callq	_print_stmt_var
	popq	%rbx
	retq
LBB295_3:                               ## %then_1
	movq	32(%rbx), %rdi
	callq	_print_stmt_expr
	popq	%rbx
	retq
LBB295_6:                               ## %else_2
	cmpl	$3, %eax
	jne	LBB295_8
## %bb.7:                               ## %then_3
	movq	8(%rbx), %rdi
	movq	16(%rbx), %rsi
	callq	_print_st
	popq	%rbx
	retq
LBB295_8:                               ## %else_3
	cmpl	$4, %eax
	jne	LBB295_10
## %bb.9:                               ## %then_4
	movq	56(%rbx), %rdi
	callq	_print_stmt_if
	popq	%rbx
	retq
LBB295_10:                              ## %else_4
	cmpl	$5, %eax
	jne	LBB295_12
## %bb.11:                              ## %then_5
	movq	48(%rbx), %rdi
	callq	_print_stmt_while
	popq	%rbx
	retq
LBB295_12:                              ## %else_5
	cmpl	$6, %eax
	jne	LBB295_14
## %bb.13:                              ## %then_6
	movq	8(%rbx), %rdi
	callq	_print_stmt_return
	popq	%rbx
	retq
LBB295_14:                              ## %else_6
	cmpl	$7, %eax
	jne	LBB295_16
## %bb.15:                              ## %then_7
	callq	_print_stmt_break
	popq	%rbx
	retq
LBB295_16:                              ## %else_7
	cmpl	$8, %eax
	jne	LBB295_18
## %bb.17:                              ## %then_8
	callq	_print_stmt_continue
	popq	%rbx
	retq
LBB295_18:                              ## %else_8
	cmpl	$9, %eax
	jne	LBB295_20
## %bb.19:                              ## %then_9
	movq	64(%rbx), %rdi
	callq	_print_stmt_goto
	popq	%rbx
	retq
LBB295_20:                              ## %else_9
	cmpl	$10, %eax
	jne	LBB295_22
## %bb.21:                              ## %then_10
	movq	64(%rbx), %rdi
	callq	_print_stmt_label
	popq	%rbx
	retq
LBB295_22:                              ## %else_10
	movq	_fout(%rip), %rdi
	movq	__func296_str2(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %edi
	callq	_exit
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_stmt_var         ## -- Begin function print_stmt_var
	.p2align	4, 0x90
_print_stmt_var:                        ## @print_stmt_var
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	_lab_get
	movl	%eax, %ecx
	movl	%eax, 8(%rbx)
	movq	_fout(%rip), %rdi
	movq	__func297_str1(%rip), %rsi
	xorl	%eax, %eax
	movl	%ecx, %edx
	callq	_fprintf
	movq	16(%rbx), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_stmt_expr        ## -- Begin function print_stmt_expr
	.p2align	4, 0x90
_print_stmt_expr:                       ## @print_stmt_expr
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$80, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	(%rdi), %rsi
	movq	%rsp, %rdi
	callq	_eval
	movl	32(%rsp), %r9d
	movq	24(%rsp), %r8
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdx
	movl	(%rsp), %esi
	leaq	40(%rsp), %rdi
	callq	_load
	movl	72(%rsp), %eax
	movl	%eax, 8(%rbx)
	addq	$80, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_stmt_if          ## -- Begin function print_stmt_if
	.p2align	4, 0x90
_print_stmt_if:                         ## @print_stmt_if
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, (%rsp)            ## 8-byte Spill
	movl	_if_id(%rip), %ebx
	leal	1(%rbx), %eax
	movl	%eax, _if_id(%rip)
	movq	(%rdi), %rsi
	leaq	48(%rsp), %rdi
	callq	_eval
	movl	80(%rsp), %r9d
	movq	72(%rsp), %r8
	movq	64(%rsp), %rcx
	movq	56(%rsp), %rdx
	movl	48(%rsp), %esi
	leaq	8(%rsp), %rdi
	callq	_load
	movl	40(%rsp), %r15d
	movq	32(%rsp), %r12
	movq	24(%rsp), %r13
	movq	16(%rsp), %rbp
	movq	_fout(%rip), %rdi
	movq	__func299_str1(%rip), %rsi
	movl	8(%rsp), %r14d
	xorl	%eax, %eax
	callq	_fprintf
	movl	%r14d, %edi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movl	%r15d, %r8d
	callq	_print_operand
	movq	_fout(%rip), %rdi
	movq	__func299_str2(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebx, %edx
	movl	%ebx, %ecx
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func299_str3(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebx, %edx
	callq	_fprintf
	movq	(%rsp), %rbp            ## 8-byte Reload
	movq	8(%rbp), %rdi
	callq	_print_stmt
	movq	_fout(%rip), %rdi
	movq	__func299_str4(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebx, %edx
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func299_str5(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebx, %edx
	callq	_fprintf
	cmpq	$0, 16(%rbp)
	je	LBB298_2
## %bb.1:                               ## %then_0
	movq	16(%rbp), %rdi
	callq	_print_stmt
LBB298_2:                               ## %endif_0
	movq	_fout(%rip), %rdi
	movq	__func299_str6(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebx, %edx
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func299_str7(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebx, %edx
	callq	_fprintf
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_stmt_while       ## -- Begin function print_stmt_while
	.p2align	4, 0x90
_print_stmt_while:                      ## @print_stmt_while
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movl	_old_while_id(%rip), %eax
	movl	%eax, 4(%rsp)           ## 4-byte Spill
	movl	_global_while_id(%rip), %edx
	movl	%edx, _old_while_id(%rip)
	leal	1(%rdx), %eax
	movl	%eax, _global_while_id(%rip)
	movq	_fout(%rip), %rdi
	movq	__func300_str1(%rip), %rsi
	xorl	%eax, %eax
                                        ## kill: def $edx killed $edx killed $rdx
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func300_str2(%rip), %rsi
	movl	_old_while_id(%rip), %edx
	xorl	%eax, %eax
	callq	_fprintf
	movq	(%r14), %rsi
	leaq	48(%rsp), %rdi
	callq	_eval
	movl	80(%rsp), %r9d
	movq	72(%rsp), %r8
	movq	64(%rsp), %rcx
	movq	56(%rsp), %rdx
	movl	48(%rsp), %esi
	leaq	8(%rsp), %rdi
	callq	_load
	movl	40(%rsp), %r15d
	movq	32(%rsp), %r12
	movq	24(%rsp), %r13
	movq	16(%rsp), %rbx
	movq	_fout(%rip), %rdi
	movq	__func300_str3(%rip), %rsi
	movl	8(%rsp), %ebp
	xorl	%eax, %eax
	callq	_fprintf
	movl	%ebp, %edi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movl	%r15d, %r8d
	callq	_print_operand
	movq	_fout(%rip), %rdi
	movq	__func300_str4(%rip), %rsi
	movl	_old_while_id(%rip), %edx
	xorl	%eax, %eax
	movl	%edx, %ecx
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func300_str5(%rip), %rsi
	movl	_old_while_id(%rip), %edx
	xorl	%eax, %eax
	callq	_fprintf
	movq	8(%r14), %rdi
	callq	_print_stmt
	movq	_fout(%rip), %rdi
	movq	__func300_str6(%rip), %rsi
	movl	_old_while_id(%rip), %edx
	xorl	%eax, %eax
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func300_str7(%rip), %rsi
	movl	_old_while_id(%rip), %edx
	xorl	%eax, %eax
	callq	_fprintf
	movl	4(%rsp), %eax           ## 4-byte Reload
	movl	%eax, _old_while_id(%rip)
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_stmt_return      ## -- Begin function print_stmt_return
	.p2align	4, 0x90
_print_stmt_return:                     ## @print_stmt_return
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$80, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	testq	%rdi, %rdi
	je	LBB300_1
## %bb.3:                               ## %else_0
	movq	%rdi, %rax
	leaq	40(%rsp), %rdi
	movq	%rax, %rsi
	callq	_eval
	movl	72(%rsp), %r9d
	movq	64(%rsp), %r8
	movq	56(%rsp), %rcx
	movq	48(%rsp), %rdx
	movl	40(%rsp), %esi
	movq	%rsp, %rdi
	callq	_load
	movl	32(%rsp), %r14d
	movq	24(%rsp), %r15
	movq	16(%rsp), %r12
	movq	8(%rsp), %rbx
	movq	_fout(%rip), %rdi
	movq	__func301_str2(%rip), %rsi
	movl	(%rsp), %ebp
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	_printType
	callq	_space
	movl	%ebp, %edi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movl	%r14d, %r8d
	callq	_print_operand
	callq	_lab_get
	jmp	LBB300_2
LBB300_1:                               ## %then_0
	callq	_lab_get
	movq	__func301_str1(%rip), %rdi
	callq	_o
LBB300_2:                               ## %then_0
	addq	$80, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_stmt_break       ## -- Begin function print_stmt_break
	.p2align	4, 0x90
_print_stmt_break:                      ## @print_stmt_break
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_lab_get
	movq	_fout(%rip), %rdi
	movq	__func302_str1(%rip), %rsi
	movl	_old_while_id(%rip), %edx
	xorl	%eax, %eax
	callq	_fprintf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_stmt_continue    ## -- Begin function print_stmt_continue
	.p2align	4, 0x90
_print_stmt_continue:                   ## @print_stmt_continue
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_lab_get
	movq	_fout(%rip), %rdi
	movq	__func303_str1(%rip), %rsi
	movl	_old_while_id(%rip), %edx
	xorl	%eax, %eax
	callq	_fprintf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_stmt_goto        ## -- Begin function print_stmt_goto
	.p2align	4, 0x90
_print_stmt_goto:                       ## @print_stmt_goto
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	_lab_get
	movq	_fout(%rip), %rdi
	movq	__func304_str1(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	callq	_fprintf
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_stmt_label       ## -- Begin function print_stmt_label
	.p2align	4, 0x90
_print_stmt_label:                      ## @print_stmt_label
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	_fout(%rip), %rdi
	movq	__func305_str1(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func305_str2(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	callq	_fprintf
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_for_stmt               ## -- Begin function for_stmt
	.p2align	4, 0x90
_for_stmt:                              ## @for_stmt
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	incl	_blockno(%rip)
	callq	_print_stmt
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_block            ## -- Begin function print_block
	.p2align	4, 0x90
_print_block:                           ## @print_block
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	8(%rdi), %rdi
	leaq	_for_stmt(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_operand                ## -- Begin function operand
	.p2align	4, 0x90
_operand:                               ## @operand
	.cfi_startproc
## %bb.0:
	movq	%rsi, -32(%rsp)
	movw	%dx, -40(%rsp)
	movl	%ecx, -8(%rsp)
	movq	$0, -16(%rsp)
	movq	$0, -24(%rsp)
	movl	%ecx, 32(%rdi)
	movq	%rsi, 8(%rdi)
	movw	%dx, (%rdi)
	movq	$0, 24(%rdi)
	movq	$0, 16(%rdi)
	movq	%rdi, %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eval                   ## -- Begin function eval
	.p2align	4, 0x90
_eval:                                  ## @eval
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$400, %rsp              ## imm = 0x190
	.cfi_def_cfa_offset 416
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movzwl	(%rsi), %eax
	movq	8(%rsi), %rcx
	movq	%rcx, 8(%rsp)
	cmpl	$2, %eax
	jne	LBB308_2
## %bb.1:                               ## %then_0
	movw	$1, (%rsp)
	movq	16(%rsi), %rax
	movq	%rax, 16(%rsp)
	movq	8(%rsp), %rcx
	movq	24(%rsp), %rdx
	movl	32(%rsp), %esi
	movl	%esi, 32(%rbx)
	movq	%rdx, 24(%rbx)
	movq	%rax, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	$1, (%rbx)
	movq	%rbx, %rax
	addq	$400, %rsp              ## imm = 0x190
	popq	%rbx
	retq
LBB308_2:                               ## %else_0
	movzwl	%ax, %eax
	cmpl	$3, %eax
	jne	LBB308_4
## %bb.3:                               ## %then_1
	movw	$2, (%rsp)
	movq	32(%rsi), %rax
	movq	8(%rax), %rax
	movq	%rax, 24(%rsp)
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movl	32(%rsp), %esi
	movl	%esi, 32(%rbx)
	movq	%rax, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	$2, (%rbx)
	movq	%rbx, %rax
	addq	$400, %rsp              ## imm = 0x190
	popq	%rbx
	retq
LBB308_4:                               ## %else_1
	cmpl	$7, %eax
	jne	LBB308_6
## %bb.5:                               ## %then_2
	movw	$3, (%rsp)
	movq	40(%rsi), %rax
	movl	8(%rax), %eax
	movl	%eax, 32(%rsp)
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	movl	%eax, 32(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	$3, (%rbx)
	movq	%rbx, %rax
	addq	$400, %rsp              ## imm = 0x190
	popq	%rbx
	retq
LBB308_6:                               ## %else_2
	cmpl	$4, %eax
	jne	LBB308_8
## %bb.7:                               ## %then_3
	movw	$4, (%rsp)
	movq	32(%rsi), %rax
	movq	8(%rax), %rax
	movq	%rax, 24(%rsp)
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movl	32(%rsp), %esi
	movl	%esi, 32(%rbx)
	movq	%rax, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	$4, (%rbx)
	movq	%rbx, %rax
	addq	$400, %rsp              ## imm = 0x190
	popq	%rbx
	retq
LBB308_8:                               ## %else_3
	cmpl	$6, %eax
	jne	LBB308_10
## %bb.9:                               ## %then_4
	movw	$6, (%rsp)
	movq	56(%rsi), %rax
	movl	8(%rax), %eax
	jmp	LBB308_12
LBB308_10:                              ## %else_4
	cmpl	$5, %eax
	jne	LBB308_13
## %bb.11:                              ## %then_5
	movw	$6, (%rsp)
	movl	24(%rsi), %eax
LBB308_12:                              ## %then_5
	movl	%eax, 32(%rsp)
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	movl	%eax, 32(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	$6, (%rbx)
	movq	%rbx, %rax
	addq	$400, %rsp              ## imm = 0x190
	popq	%rbx
	retq
LBB308_13:                              ## %else_5
	cmpl	$28, %eax
	jne	LBB308_17
## %bb.14:                              ## %then_6
	leaq	40(%rsp), %rdi
	callq	_eval_call
	movzwl	40(%rsp), %eax
	movq	48(%rsp), %rcx
	movq	56(%rsp), %rdx
	movq	64(%rsp), %rsi
	movl	72(%rsp), %edi
	jmp	LBB308_15
LBB308_17:                              ## %else_6
	cmpl	$29, %eax
	jne	LBB308_19
## %bb.18:                              ## %then_7
	leaq	80(%rsp), %rdi
	callq	_eval_index
	movzwl	80(%rsp), %eax
	movq	88(%rsp), %rcx
	movq	96(%rsp), %rdx
	movq	104(%rsp), %rsi
	movl	112(%rsp), %edi
	jmp	LBB308_15
LBB308_19:                              ## %else_7
	cmpl	$30, %eax
	jne	LBB308_21
## %bb.20:                              ## %then_8
	leaq	120(%rsp), %rdi
	callq	_eval_access
	movzwl	120(%rsp), %eax
	movq	128(%rsp), %rcx
	movq	136(%rsp), %rdx
	movq	144(%rsp), %rsi
	movl	152(%rsp), %edi
	jmp	LBB308_15
LBB308_21:                              ## %else_8
	cmpl	$8, %eax
	jne	LBB308_23
## %bb.22:                              ## %then_9
	leaq	160(%rsp), %rdi
	callq	_eval_ref
	movzwl	160(%rsp), %eax
	movq	168(%rsp), %rcx
	movq	176(%rsp), %rdx
	movq	184(%rsp), %rsi
	movl	192(%rsp), %edi
	jmp	LBB308_15
LBB308_23:                              ## %else_9
	cmpl	$9, %eax
	jne	LBB308_25
## %bb.24:                              ## %then_10
	leaq	200(%rsp), %rdi
	callq	_eval_deref
	movzwl	200(%rsp), %eax
	movq	208(%rsp), %rcx
	movq	216(%rsp), %rdx
	movq	224(%rsp), %rsi
	movl	232(%rsp), %edi
	jmp	LBB308_15
LBB308_25:                              ## %else_10
	cmpl	$11, %eax
	jne	LBB308_27
## %bb.26:                              ## %then_11
	leaq	240(%rsp), %rdi
	callq	_eval_minus
	movzwl	240(%rsp), %eax
	movq	248(%rsp), %rcx
	movq	256(%rsp), %rdx
	movq	264(%rsp), %rsi
	movl	272(%rsp), %edi
	jmp	LBB308_15
LBB308_27:                              ## %else_11
	cmpl	$10, %eax
	jne	LBB308_29
## %bb.28:                              ## %then_12
	leaq	280(%rsp), %rdi
	callq	_eval_not
	movzwl	280(%rsp), %eax
	movq	288(%rsp), %rcx
	movq	296(%rsp), %rdx
	movq	304(%rsp), %rsi
	movl	312(%rsp), %edi
	jmp	LBB308_15
LBB308_29:                              ## %else_12
	cmpl	$31, %eax
	jne	LBB308_31
## %bb.30:                              ## %then_13
	leaq	320(%rsp), %rdi
	callq	_eval_cast
	movzwl	320(%rsp), %eax
	movq	328(%rsp), %rcx
	movq	336(%rsp), %rdx
	movq	344(%rsp), %rsi
	movl	352(%rsp), %edi
	jmp	LBB308_15
LBB308_31:                              ## %else_13
	leaq	360(%rsp), %rdi
	callq	_eval_bin
	movzwl	360(%rsp), %eax
	movq	368(%rsp), %rcx
	movq	376(%rsp), %rdx
	movq	384(%rsp), %rsi
	movl	392(%rsp), %edi
LBB308_15:                              ## %then_6
	movl	%edi, 32(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	%ax, (%rbx)
	movq	%rbx, %rax
	addq	$400, %rsp              ## imm = 0x190
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eval_args              ## -- Begin function eval_args
	.p2align	4, 0x90
_eval_args:                             ## @eval_args
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$80, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movq	%rdi, %rax
	leaq	40(%rsp), %rdi
	movq	%rax, %rsi
	callq	_eval
	movl	72(%rsp), %r9d
	movq	64(%rsp), %r8
	movq	56(%rsp), %rcx
	movq	48(%rsp), %rdx
	movl	40(%rsp), %esi
	movq	%rsp, %rdi
	callq	_load
	movzwl	(%rsp), %r8d
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	movl	32(%rsp), %edi
	movswq	2560(%rbx), %rax
	leaq	(%rax,%rax,4), %rax
	movl	%edi, 32(%rbx,%rax,8)
	movq	%rsi, 24(%rbx,%rax,8)
	movq	%rdx, 16(%rbx,%rax,8)
	movq	%rcx, 8(%rbx,%rax,8)
	movw	%r8w, (%rbx,%rax,8)
	incw	2560(%rbx)
	addq	$80, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eval_call              ## -- Begin function eval_call
	.p2align	4, 0x90
_eval_call:                             ## @eval_call
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$2712, %rsp             ## imm = 0xA98
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %rbx
	movq	%rdi, %r12
	movq	144(%rsi), %rsi
	leaq	-184(%rbp), %rdi
	callq	_eval
	movl	-152(%rbp), %r9d
	movq	-160(%rbp), %r8
	movq	-168(%rbp), %rcx
	movq	-176(%rbp), %rdx
	movl	-184(%rbp), %esi
	leaq	-144(%rbp), %rdi
	callq	_load
	movl	-112(%rbp), %eax
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	movq	-120(%rbp), %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	-128(%rbp), %r13
	movq	-136(%rbp), %r15
	movzwl	-144(%rbp), %r14d
	movw	$0, -192(%rbp)
	movq	%rbx, -64(%rbp)         ## 8-byte Spill
	movq	152(%rbx), %rdi
	leaq	_eval_args(%rip), %rsi
	leaq	-2752(%rbp), %rdx
	callq	_list_foreach
	movq	56(%r15), %rdi
	movq	_typeUnit(%rip), %rsi
	callq	_type_eq
	testb	$1, %al
	je	LBB310_2
## %bb.1:                               ## %then_0
	movq	_fout(%rip), %rdi
	movq	__func310_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	jmp	LBB310_3
LBB310_2:                               ## %else_0
	callq	_lab_get
	movl	%eax, %ecx
	movl	%eax, -48(%rbp)
	movq	_fout(%rip), %rdi
	movq	__func310_str2(%rip), %rsi
	xorl	%eax, %eax
	movl	%ecx, %edx
	callq	_fprintf
LBB310_3:                               ## %endif_0
	xorl	%esi, %esi
	xorl	%edx, %edx
	movq	%r15, %rdi
	callq	_printType
	callq	_space
	movl	%r14d, %edi
	movq	%r15, %rsi
	movq	%r13, %rdx
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movl	-44(%rbp), %r8d         ## 4-byte Reload
	callq	_print_operand
	movq	__func310_str3(%rip), %rdi
	callq	_o
	movq	%rsp, %rax
	leaq	-16(%rax), %r14
	movq	%r14, %rsp
	movb	$0, -16(%rax)
	movq	%rsp, %rax
	leaq	-16(%rax), %rbx
	movq	%rbx, %rsp
	movw	$0, -16(%rax)
	movzwl	(%rbx), %eax
	cmpw	-192(%rbp), %ax
	jb	LBB310_5
	jmp	LBB310_8
	.p2align	4, 0x90
LBB310_7:                               ## %endif_1
                                        ##   in Loop: Header=BB310_5 Depth=1
	movswq	(%rbx), %rax
	leaq	(%rax,%rax,4), %rax
	movq	-2744(%rbp,%rax,8), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	callq	_space
	movswq	(%rbx), %rax
	leaq	(%rax,%rax,4), %rax
	movl	-2720(%rbp,%rax,8), %r8d
	movq	-2728(%rbp,%rax,8), %rcx
	movq	-2744(%rbp,%rax,8), %rsi
	movq	-2736(%rbp,%rax,8), %rdx
	movzwl	-2752(%rbp,%rax,8), %edi
	callq	_print_operand
	movb	$1, (%r14)
	incw	(%rbx)
	movzwl	(%rbx), %eax
	cmpw	-192(%rbp), %ax
	jae	LBB310_8
LBB310_5:                               ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	cmpb	$1, (%r14)
	jne	LBB310_7
## %bb.6:                               ## %then_1
                                        ##   in Loop: Header=BB310_5 Depth=1
	callq	_comma
	jmp	LBB310_7
LBB310_8:                               ## %break_0
	movq	__func310_str4(%rip), %rdi
	callq	_o
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	8(%rax), %rsi
	movl	-48(%rbp), %ecx
	leaq	-104(%rbp), %rdi
	movl	$6, %edx
	callq	_operand
	movzwl	-104(%rbp), %eax
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rsi
	movl	-72(%rbp), %edi
	movl	%edi, 32(%r12)
	movq	%rsi, 24(%r12)
	movq	%rdx, 16(%r12)
	movq	%rcx, 8(%r12)
	movw	%ax, (%r12)
	movq	%r12, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eval_index             ## -- Begin function eval_index
	.p2align	4, 0x90
_eval_index:                            ## @eval_index
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$296, %rsp              ## imm = 0x128
	.cfi_def_cfa_offset 352
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	96(%rsi), %rsi
	leaq	256(%rsp), %rdi
	callq	_eval
	movzwl	256(%rsp), %eax
	movq	264(%rsp), %rcx
	movq	272(%rsp), %rdx
	movq	280(%rsp), %rsi
	movl	288(%rsp), %edi
	movl	%edi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rcx, 8(%rsp)
	movw	%ax, (%rsp)
	movq	104(%r14), %rsi
	leaq	216(%rsp), %rdi
	callq	_eval
	movl	248(%rsp), %r9d
	movq	240(%rsp), %r8
	movq	232(%rsp), %rcx
	movq	224(%rsp), %rdx
	movl	216(%rsp), %esi
	leaq	176(%rsp), %rdi
	callq	_load
	movl	208(%rsp), %r13d
	movq	200(%rsp), %rax
	movq	%rax, 48(%rsp)          ## 8-byte Spill
	movq	192(%rsp), %r15
	movq	184(%rsp), %r12
	movzwl	176(%rsp), %eax
	movl	%eax, 44(%rsp)          ## 4-byte Spill
	movq	8(%rsp), %rax
	cmpb	$1, 92(%rax)
	jne	LBB311_2
## %bb.1:                               ## %then_0
	movl	32(%rsp), %r9d
	movq	24(%rsp), %r8
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdx
	movl	(%rsp), %esi
	leaq	136(%rsp), %rdi
	callq	_load
	movzwl	136(%rsp), %eax
	movq	144(%rsp), %rcx
	movq	152(%rsp), %rdx
	movq	160(%rsp), %rsi
	movl	168(%rsp), %edi
	movl	%edi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rcx, 8(%rsp)
	movw	%ax, (%rsp)
LBB311_2:                               ## %endif_0
	movzwl	(%rsp), %ebp
	movq	8(%rsp), %rdi
	callq	_typeIsDefinedArray
	cmpl	$6, %ebp
	jne	LBB311_6
## %bb.3:                               ## %endif_0
	testb	$1, %al
	je	LBB311_6
## %bb.4:                               ## %endif_0
	xorl	%eax, %eax
	testb	%al, %al
	jne	LBB311_6
## %bb.5:                               ## %then_1
	callq	_lab_get
	movl	%eax, %ebp
	movq	_fout(%rip), %rdi
	movq	__func312_str1(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebp, %edx
	callq	_fprintf
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	callq	_space
	movl	32(%rsp), %r8d
	movq	24(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	8(%rsp), %rsi
	movl	(%rsp), %edi
	callq	_print_operand
	movq	_fout(%rip), %rdi
	movq	__func312_str2(%rip), %rsi
	xorl	%eax, %eax
	movq	%r15, %rdx
	callq	_fprintf
	movq	8(%r14), %rsi
	leaq	56(%rsp), %rdi
	movl	$6, %edx
	movl	%ebp, %ecx
	callq	_operand
	movzwl	56(%rsp), %eax
	movq	64(%rsp), %rcx
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rsi
	movl	88(%rsp), %edi
	jmp	LBB311_14
LBB311_6:                               ## %else_1
	movl	%r13d, %ebp
	callq	_lab_get
	movl	%eax, %r13d
	movq	_fout(%rip), %rdi
	movq	__func312_str3(%rip), %rsi
	xorl	%eax, %eax
	movl	%r13d, %edx
	callq	_fprintf
	movq	8(%rsp), %rdi
	cmpb	$1, 92(%rdi)
	jne	LBB311_8
## %bb.7:                               ## %then_2
	movq	8(%r14), %rdi
LBB311_8:                               ## %else_2
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	callq	_comma
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	movq	8(%rsp), %rax
	cmpb	$1, 92(%rax)
	jne	LBB311_10
## %bb.9:                               ## %then_3
	callq	_space
	jmp	LBB311_11
LBB311_10:                              ## %else_3
	movq	__func312_str4(%rip), %rdi
	callq	_o
LBB311_11:                              ## %endif_3
	movl	32(%rsp), %r8d
	movq	24(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	8(%rsp), %rsi
	movl	(%rsp), %edi
	callq	_print_operand
	movq	8(%rsp), %rax
	cmpb	$0, 92(%rax)
	jne	LBB311_13
## %bb.12:                              ## %then_4
	movq	__func312_str5(%rip), %rdi
	callq	_o
LBB311_13:                              ## %endif_4
	callq	_comma
	movl	$1, %esi
	movl	$1, %edx
	movq	%r12, %rdi
	callq	_printType
	callq	_space
	movl	44(%rsp), %edi          ## 4-byte Reload
	movq	%r12, %rsi
	movq	%r15, %rdx
	movq	48(%rsp), %rcx          ## 8-byte Reload
	movl	%ebp, %r8d
	callq	_print_operand
	movq	8(%r14), %rsi
	leaq	96(%rsp), %rdi
	movl	$5, %edx
	movl	%r13d, %ecx
	callq	_operand
	movzwl	96(%rsp), %eax
	movq	104(%rsp), %rcx
	movq	112(%rsp), %rdx
	movq	120(%rsp), %rsi
	movl	128(%rsp), %edi
LBB311_14:                              ## %endif_4
	movl	%edi, 32(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	%ax, (%rbx)
	movq	%rbx, %rax
	addq	$296, %rsp              ## imm = 0x128
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eval_access            ## -- Begin function eval_access
	.p2align	4, 0x90
_eval_access:                           ## @eval_access
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$216, %rsp
	.cfi_def_cfa_offset 256
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	112(%rsi), %rsi
	leaq	176(%rsp), %rdi
	callq	_eval
	movzwl	176(%rsp), %eax
	movq	184(%rsp), %rcx
	movq	192(%rsp), %rdx
	movq	200(%rsp), %rsi
	movl	208(%rsp), %edi
	movl	%edi, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rcx, 24(%rsp)
	movw	%ax, 16(%rsp)
	movzwl	(%rcx), %eax
	cmpl	$6, %eax
	jne	LBB312_2
## %bb.1:                               ## %then_0
	movq	24(%rsp), %rdx
	movq	72(%rdx), %rax
	movq	%rax, 8(%rsp)
	movq	32(%rsp), %rcx
	movq	40(%rsp), %r8
	movl	48(%rsp), %r9d
	movl	16(%rsp), %esi
	leaq	136(%rsp), %rdi
	callq	_load
	movzwl	136(%rsp), %eax
	movq	144(%rsp), %rcx
	movq	152(%rsp), %rdx
	movq	160(%rsp), %rsi
	movl	168(%rsp), %edi
	movl	%edi, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rcx, 24(%rsp)
	movw	%ax, 16(%rsp)
	jmp	LBB312_3
LBB312_2:                               ## %else_0
	movq	24(%rsp), %rax
	movq	%rax, 8(%rsp)
LBB312_3:                               ## %endif_0
	xorl	%edi, %edi
	cmpq	$0, 120(%r14)
	setne	%dil
	movq	__func313_str1(%rip), %rsi
	callq	_assert
	movq	8(%rsp), %rdi
	movq	120(%r14), %rsi
	callq	_type_record_get_field
	movzwl	16(%rax), %r15d
	movzwl	16(%rsp), %eax
	cmpl	$6, %eax
	jne	LBB312_7
## %bb.4:                               ## %endif_0
	movq	24(%rsp), %rax
	movzwl	(%rax), %eax
	cmpl	$5, %eax
	jne	LBB312_7
## %bb.5:                               ## %then_1
	callq	_lab_get
	movl	%eax, %ebp
	movq	_fout(%rip), %rdi
	movq	__func313_str2(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebp, %edx
	callq	_fprintf
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	callq	_space
	movl	48(%rsp), %r8d
	movq	40(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	24(%rsp), %rsi
	movl	16(%rsp), %edi
	callq	_print_operand
	movq	_fout(%rip), %rdi
	movq	__func313_str3(%rip), %rsi
	xorl	%eax, %eax
	movl	%r15d, %edx
	callq	_fprintf
	movq	8(%r14), %rsi
	leaq	56(%rsp), %rdi
	movl	$6, %edx
	movl	%ebp, %ecx
	callq	_operand
	movzwl	56(%rsp), %eax
	movq	64(%rsp), %rcx
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rsi
	movl	88(%rsp), %edi
	jmp	LBB312_6
LBB312_7:                               ## %else_1
	callq	_lab_get
	movl	%eax, %ebp
	movq	_fout(%rip), %rdi
	movq	__func313_str4(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebp, %edx
	callq	_fprintf
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	callq	_comma
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	movq	__func313_str5(%rip), %rdi
	callq	_o
	movl	48(%rsp), %r8d
	movq	40(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	24(%rsp), %rsi
	movl	16(%rsp), %edi
	callq	_print_operand
	movq	_fout(%rip), %rdi
	movq	__func313_str6(%rip), %rsi
	xorl	%eax, %eax
	movl	%r15d, %edx
	callq	_fprintf
	movq	8(%r14), %rsi
	leaq	96(%rsp), %rdi
	movl	$5, %edx
	movl	%ebp, %ecx
	callq	_operand
	movzwl	96(%rsp), %eax
	movq	104(%rsp), %rcx
	movq	112(%rsp), %rdx
	movq	120(%rsp), %rsi
	movl	128(%rsp), %edi
LBB312_6:                               ## %then_1
	movl	%edi, 32(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	%ax, (%rbx)
	movq	%rbx, %rax
	addq	$216, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eval_ref               ## -- Begin function eval_ref
	.p2align	4, 0x90
_eval_ref:                              ## @eval_ref
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	72(%rsi), %rsi
	leaq	96(%rsp), %rdi
	callq	_eval
	movzwl	96(%rsp), %ebp
	movl	128(%rsp), %r12d
	cmpl	$5, %ebp
	jne	LBB313_3
## %bb.1:                               ## %then_0
	movq	8(%r14), %rsi
	leaq	16(%rsp), %rdi
	movl	$6, %edx
	movl	%r12d, %ecx
	callq	_operand
	movzwl	16(%rsp), %eax
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edi
	jmp	LBB313_2
LBB313_3:                               ## %else_0
	movq	120(%rsp), %rax
	movq	%rax, 8(%rsp)           ## 8-byte Spill
	movq	104(%rsp), %r13
	movq	112(%rsp), %rax
	movq	%rax, (%rsp)            ## 8-byte Spill
	callq	_lab_get
	movl	%eax, %r15d
	movq	_fout(%rip), %rdi
	movq	__func314_str1(%rip), %rsi
	xorl	%eax, %eax
	movl	%r15d, %edx
	callq	_fprintf
	movl	$1, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	callq	_printType
	callq	_comma
	movl	$1, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	callq	_printType
	movq	__func314_str2(%rip), %rdi
	callq	_o
	movl	%ebp, %edi
	movq	%r13, %rsi
	movq	(%rsp), %rdx            ## 8-byte Reload
	movq	8(%rsp), %rcx           ## 8-byte Reload
	movl	%r12d, %r8d
	callq	_print_operand
	callq	_comma
	movq	__func314_str3(%rip), %rdi
	callq	_o
	movq	8(%r14), %rsi
	leaq	56(%rsp), %rdi
	movl	$6, %edx
	movl	%r15d, %ecx
	callq	_operand
	movzwl	56(%rsp), %eax
	movq	64(%rsp), %rcx
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rsi
	movl	88(%rsp), %edi
LBB313_2:                               ## %then_0
	movl	%edi, 32(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	%ax, (%rbx)
	movq	%rbx, %rax
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eval_deref             ## -- Begin function eval_deref
	.p2align	4, 0x90
_eval_deref:                            ## @eval_deref
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$120, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	72(%rsi), %rsi
	leaq	40(%rsp), %rdi
	callq	_eval
	movl	72(%rsp), %r9d
	movq	64(%rsp), %r8
	movq	56(%rsp), %rcx
	movq	48(%rsp), %rdx
	movl	40(%rsp), %esi
	leaq	80(%rsp), %rdi
	callq	_load
	movl	112(%rsp), %ecx
	movq	8(%r14), %rsi
	movq	%rsp, %rdi
	movl	$5, %edx
	callq	_operand
	movzwl	(%rsp), %eax
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	movl	32(%rsp), %edi
	movl	%edi, 32(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	%ax, (%rbx)
	movq	%rbx, %rax
	addq	$120, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eval_not               ## -- Begin function eval_not
	.p2align	4, 0x90
_eval_not:                              ## @eval_not
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movq	72(%rsi), %rsi
	leaq	96(%rsp), %rdi
	callq	_eval
	movl	128(%rsp), %r9d
	movq	120(%rsp), %r8
	movq	112(%rsp), %rcx
	movq	104(%rsp), %rdx
	movl	96(%rsp), %esi
	leaq	56(%rsp), %rdi
	callq	_load
	movl	88(%rsp), %eax
	movl	%eax, 12(%rsp)          ## 4-byte Spill
	movq	80(%rsp), %r12
	movq	72(%rsp), %r13
	movq	64(%rsp), %rbx
	movzwl	56(%rsp), %r15d
	callq	_lab_get
	movl	%eax, %ebp
	movq	_fout(%rip), %rdi
	movq	__func316_str1(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebp, %edx
	callq	_fprintf
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	_printType
	callq	_space
	movl	%r15d, %edi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movl	12(%rsp), %r8d          ## 4-byte Reload
	callq	_print_operand
	movq	_typeBool(%rip), %rsi
	movq	%rbx, %rdi
	callq	_type_eq
	testb	$1, %al
	je	LBB315_2
## %bb.1:                               ## %then_0
	movq	__func316_str2(%rip), %rdi
	jmp	LBB315_3
LBB315_2:                               ## %else_0
	movq	__func316_str3(%rip), %rdi
LBB315_3:                               ## %endif_0
	callq	_o
	leaq	16(%rsp), %rdi
	movl	$6, %edx
	movq	%rbx, %rsi
	movl	%ebp, %ecx
	callq	_operand
	movzwl	16(%rsp), %eax
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edi
	movl	%edi, 32(%r14)
	movq	%rsi, 24(%r14)
	movq	%rdx, 16(%r14)
	movq	%rcx, 8(%r14)
	movw	%ax, (%r14)
	movq	%r14, %rax
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eval_minus             ## -- Begin function eval_minus
	.p2align	4, 0x90
_eval_minus:                            ## @eval_minus
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	movq	72(%rsi), %rsi
	leaq	96(%rsp), %rdi
	callq	_eval
	movl	128(%rsp), %r9d
	movq	120(%rsp), %r8
	movq	112(%rsp), %rcx
	movq	104(%rsp), %rdx
	movl	96(%rsp), %esi
	leaq	56(%rsp), %rdi
	callq	_load
	movl	88(%rsp), %eax
	movl	%eax, 12(%rsp)          ## 4-byte Spill
	movq	80(%rsp), %r12
	movq	72(%rsp), %r13
	movq	64(%rsp), %r14
	movl	56(%rsp), %r15d
	callq	_lab_get
	movl	%eax, %ebp
	movq	_fout(%rip), %rdi
	movq	__func317_str1(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebp, %edx
	callq	_fprintf
	movl	$1, %esi
	movl	$1, %edx
	movq	%r14, %rdi
	callq	_printType
	movq	_fout(%rip), %rdi
	movq	__func317_str2(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	callq	_comma
	movl	%r15d, %edi
	movq	%r14, %rsi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movl	12(%rsp), %r8d          ## 4-byte Reload
	callq	_print_operand
	leaq	16(%rsp), %rdi
	movl	$6, %edx
	movq	%r14, %rsi
	movl	%ebp, %ecx
	callq	_operand
	movzwl	16(%rsp), %eax
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edi
	movl	%edi, 32(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	%ax, (%rbx)
	movq	%rbx, %rax
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eval_cast              ## -- Begin function eval_cast
	.p2align	4, 0x90
_eval_cast:                             ## @eval_cast
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$168, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %rax
	movq	%rdi, %r13
	movq	128(%rsi), %rsi
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	movq	136(%rax), %r14
	leaq	-208(%rbp), %rdi
	callq	_eval
	movl	-176(%rbp), %r9d
	movq	-184(%rbp), %r8
	movq	-192(%rbp), %rcx
	movq	-200(%rbp), %rdx
	movl	-208(%rbp), %esi
	leaq	-168(%rbp), %rdi
	callq	_load
	movl	-136(%rbp), %eax
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	movq	-144(%rbp), %rax
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	movq	-152(%rbp), %r15
	movq	-160(%rbp), %r12
	movzwl	-168(%rbp), %ebx
	movq	%r12, %rdi
	movq	%r14, -80(%rbp)         ## 8-byte Spill
	movq	%r14, %rsi
	callq	_type_eq
	testb	$1, %al
	je	LBB317_3
## %bb.1:                               ## %then_0
	movw	%bx, (%r13)
	movq	%r12, 8(%r13)
	movq	%r15, 16(%r13)
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	%rax, 24(%r13)
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movl	%eax, 32(%r13)
	movq	%r13, %rax
	jmp	LBB317_2
LBB317_3:                               ## %else_0
	movl	%ebx, -48(%rbp)         ## 4-byte Spill
	movq	%r13, -64(%rbp)         ## 8-byte Spill
	callq	_lab_get
	movl	%eax, %ecx
	movq	_fout(%rip), %rdi
	movq	__func318_str1(%rip), %rsi
	xorl	%eax, %eax
	movl	%ecx, -52(%rbp)         ## 4-byte Spill
	movl	%ecx, %edx
	callq	_fprintf
	movq	%r12, %rdx
	movzwl	(%r12), %esi
	movq	%rsp, %rax
	leaq	-16(%rax), %r12
	movq	%r12, %rsp
	movq	__func318_str2(%rip), %rcx
	movq	%rcx, -16(%rax)
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	movzwl	(%rcx), %eax
	cmpl	$7, %eax
	movq	%rcx, %r13
	jne	LBB317_8
## %bb.4:                               ## %then_1
	movq	%r13, %r14
	movzwl	%si, %eax
	cmpl	$2, %eax
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	jne	LBB317_7
## %bb.5:                               ## %then_2
	movq	__func318_str3(%rip), %rax
	jmp	LBB317_6
LBB317_8:                               ## %else_1
	movzwl	(%r13), %eax
	cmpl	$6, %eax
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	je	LBB317_10
## %bb.9:                               ## %else_1
	movzwl	%ax, %eax
	cmpl	$3, %eax
	je	LBB317_10
## %bb.15:                              ## %else_3
	movq	%r13, %r14
	movzwl	(%r13), %eax
	cmpl	$2, %eax
	movq	%rdx, %r13
	jne	LBB317_34
## %bb.16:                              ## %then_5
	movzwl	%si, %eax
	cmpl	$2, %eax
	jne	LBB317_24
## %bb.17:                              ## %then_6
	movl	40(%r13), %eax
	cmpl	40(%r14), %eax
	jbe	LBB317_19
## %bb.18:                              ## %then_7
	movq	__func318_str7(%rip), %rax
	movq	%rax, (%r12)
	jmp	LBB317_34
LBB317_7:                               ## %else_2
	movq	__func318_str4(%rip), %rax
	jmp	LBB317_6
LBB317_10:                              ## %then_3
	movzwl	%si, %eax
	cmpl	$6, %eax
	je	LBB317_13
## %bb.11:                              ## %then_3
	cmpl	$7, %eax
	je	LBB317_13
## %bb.12:                              ## %then_3
	cmpl	$3, %eax
	je	LBB317_13
## %bb.14:                              ## %else_4
	movq	%r13, %r14
	movq	__func318_str6(%rip), %rax
	jmp	LBB317_6
LBB317_13:                              ## %then_4
	movq	%r13, %r14
	movq	__func318_str5(%rip), %rax
LBB317_6:                               ## %endif_1
	movq	%rax, (%r12)
	movq	%rdx, %r13
LBB317_34:                              ## %endif_1
	movq	_fout(%rip), %rdi
	movq	__func318_str17(%rip), %rsi
	movq	(%r12), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	callq	_printType
	callq	_space
	movl	-48(%rbp), %edi         ## 4-byte Reload
	movq	%r13, %rsi
	movq	%r15, %rdx
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movl	-44(%rbp), %r8d         ## 4-byte Reload
	callq	_print_operand
	movq	__func318_str18(%rip), %rdi
	callq	_o
	movl	$1, %esi
	movl	$1, %edx
	movq	%r14, %rdi
	callq	_printType
	movq	-88(%rbp), %rax         ## 8-byte Reload
	movq	8(%rax), %rsi
	leaq	-128(%rbp), %rdi
	movl	$6, %edx
	movl	-52(%rbp), %ecx         ## 4-byte Reload
	callq	_operand
	movzwl	-128(%rbp), %eax
	movq	-120(%rbp), %rcx
	movq	-112(%rbp), %rdx
	movq	-104(%rbp), %rsi
	movl	-96(%rbp), %edi
	movl	%edi, 32(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	%ax, (%rbx)
	movq	%rbx, %rax
LBB317_2:                               ## %then_0
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB317_24:                              ## %else_6
	cmpl	$6, %eax
	jne	LBB317_26
## %bb.25:                              ## %then_10
	movq	__func318_str11(%rip), %rax
	movq	%rax, (%r12)
	jmp	LBB317_34
LBB317_19:                              ## %else_7
	movq	%r14, %rcx
	movl	40(%r13), %eax
	cmpl	40(%r14), %eax
	jae	LBB317_23
## %bb.20:                              ## %then_8
	cmpb	$1, 45(%rcx)
	jne	LBB317_22
## %bb.21:                              ## %then_9
	movq	__func318_str8(%rip), %rax
	movq	%rax, (%r12)
	jmp	LBB317_34
LBB317_26:                              ## %else_10
	cmpl	$4, %eax
	jne	LBB317_32
## %bb.27:                              ## %then_11
	movl	_cfg+12(%rip), %eax
	shll	$3, %eax
	cmpl	40(%r14), %eax
	jbe	LBB317_29
## %bb.28:                              ## %then_12
	movq	__func318_str12(%rip), %rax
	movq	%rax, (%r12)
	jmp	LBB317_34
LBB317_23:                              ## %else_8
	movq	__func318_str10(%rip), %rax
	movq	%rax, (%r12)
	jmp	LBB317_34
LBB317_32:                              ## %else_11
	cmpl	$7, %eax
	je	LBB317_34
## %bb.33:                              ## %else_14
	movq	__func318_str15(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	__func318_str16(%rip), %rdi
	callq	_fatal
	jmp	LBB317_34
LBB317_22:                              ## %else_9
	movq	__func318_str9(%rip), %rax
	movq	%rax, (%r12)
	jmp	LBB317_34
LBB317_29:                              ## %else_12
	movq	%r14, %rcx
	cmpl	40(%r14), %eax
	jae	LBB317_31
## %bb.30:                              ## %then_13
	movq	__func318_str13(%rip), %rax
	movq	%rax, (%r12)
	jmp	LBB317_34
LBB317_31:                              ## %else_13
	movq	__func318_str14(%rip), %rax
	movq	%rax, (%r12)
	jmp	LBB317_34
	.cfi_endproc
                                        ## -- End function
	.globl	_eval_bin               ## -- Begin function eval_bin
	.p2align	4, 0x90
_eval_bin:                              ## @eval_bin
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$264, %rsp              ## imm = 0x108
	.cfi_def_cfa_offset 320
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 56(%rsp)          ## 8-byte Spill
	movq	__func319_str1(%rip), %rax
	movq	%rax, 8(%rsp)
	movzwl	(%rsi), %eax
	cmpl	$12, %eax
	jne	LBB318_2
## %bb.1:                               ## %then_0
	movq	__func319_str2(%rip), %rax
	jmp	LBB318_46
LBB318_2:                               ## %else_0
	movzwl	%ax, %eax
	cmpl	$13, %eax
	jne	LBB318_4
## %bb.3:                               ## %then_1
	movq	__func319_str3(%rip), %rax
	jmp	LBB318_46
LBB318_4:                               ## %else_1
	cmpl	$14, %eax
	jne	LBB318_6
## %bb.5:                               ## %then_2
	movq	__func319_str4(%rip), %rax
	jmp	LBB318_46
LBB318_6:                               ## %else_2
	movq	80(%rsi), %rcx
	movq	8(%rcx), %rcx
	movb	45(%rcx), %cl
	cmpl	$15, %eax
	jne	LBB318_10
## %bb.7:                               ## %then_3
	testb	$1, %cl
	je	LBB318_9
## %bb.8:                               ## %then_4
	movq	__func319_str5(%rip), %rax
	jmp	LBB318_46
LBB318_10:                              ## %else_3
	cmpl	$16, %eax
	jne	LBB318_14
## %bb.11:                              ## %then_5
	testb	$1, %cl
	je	LBB318_13
## %bb.12:                              ## %then_6
	movq	__func319_str7(%rip), %rax
	jmp	LBB318_46
LBB318_9:                               ## %else_4
	movq	__func319_str6(%rip), %rax
	jmp	LBB318_46
LBB318_14:                              ## %else_5
	cmpl	$17, %eax
	jne	LBB318_16
## %bb.15:                              ## %then_7
	movq	__func319_str9(%rip), %rax
	jmp	LBB318_46
LBB318_13:                              ## %else_6
	movq	__func319_str8(%rip), %rax
	jmp	LBB318_46
LBB318_16:                              ## %else_7
	cmpl	$18, %eax
	jne	LBB318_18
## %bb.17:                              ## %then_8
	movq	__func319_str10(%rip), %rax
	jmp	LBB318_46
LBB318_18:                              ## %else_8
	cmpl	$19, %eax
	jne	LBB318_20
## %bb.19:                              ## %then_9
	movq	__func319_str11(%rip), %rax
	jmp	LBB318_46
LBB318_20:                              ## %else_9
	cmpl	$20, %eax
	jne	LBB318_22
## %bb.21:                              ## %then_10
	movq	__func319_str12(%rip), %rax
	jmp	LBB318_46
LBB318_22:                              ## %else_10
	cmpl	$21, %eax
	jne	LBB318_24
## %bb.23:                              ## %then_11
	movq	__func319_str13(%rip), %rax
	jmp	LBB318_46
LBB318_24:                              ## %else_11
	cmpl	$22, %eax
	jne	LBB318_28
## %bb.25:                              ## %then_12
	testb	$1, %cl
	je	LBB318_27
## %bb.26:                              ## %then_13
	movq	__func319_str14(%rip), %rax
	jmp	LBB318_46
LBB318_28:                              ## %else_12
	cmpl	$23, %eax
	jne	LBB318_32
## %bb.29:                              ## %then_14
	testb	$1, %cl
	je	LBB318_31
## %bb.30:                              ## %then_15
	movq	__func319_str16(%rip), %rax
	jmp	LBB318_46
LBB318_27:                              ## %else_13
	movq	__func319_str15(%rip), %rax
	jmp	LBB318_46
LBB318_32:                              ## %else_14
	cmpl	$24, %eax
	jne	LBB318_36
## %bb.33:                              ## %then_16
	testb	$1, %cl
	je	LBB318_35
## %bb.34:                              ## %then_17
	movq	__func319_str18(%rip), %rax
	jmp	LBB318_46
LBB318_31:                              ## %else_15
	movq	__func319_str17(%rip), %rax
	jmp	LBB318_46
LBB318_36:                              ## %else_16
	cmpl	$25, %eax
	jne	LBB318_40
## %bb.37:                              ## %then_18
	testb	$1, %cl
	je	LBB318_39
## %bb.38:                              ## %then_19
	movq	__func319_str20(%rip), %rax
	jmp	LBB318_46
LBB318_35:                              ## %else_17
	movq	__func319_str19(%rip), %rax
	jmp	LBB318_46
LBB318_40:                              ## %else_18
	cmpl	$26, %eax
	jne	LBB318_42
## %bb.41:                              ## %then_20
	movq	__func319_str22(%rip), %rax
	jmp	LBB318_46
LBB318_39:                              ## %else_19
	movq	__func319_str21(%rip), %rax
	jmp	LBB318_46
LBB318_42:                              ## %else_20
	cmpl	$27, %eax
	jne	LBB318_47
## %bb.43:                              ## %then_21
	testb	$1, %cl
	je	LBB318_45
## %bb.44:                              ## %then_22
	movq	__func319_str23(%rip), %rax
	jmp	LBB318_46
LBB318_45:                              ## %else_22
	movq	__func319_str24(%rip), %rax
LBB318_46:                              ## %endif_0
	movq	%rax, 8(%rsp)
LBB318_47:                              ## %endif_0
	movq	%rsi, %r13
	movq	80(%rsi), %rsi
	leaq	224(%rsp), %rdi
	callq	_eval
	movl	256(%rsp), %r9d
	movq	248(%rsp), %r8
	movq	240(%rsp), %rcx
	movq	232(%rsp), %rdx
	movl	224(%rsp), %esi
	leaq	184(%rsp), %rdi
	callq	_load
	movl	216(%rsp), %eax
	movl	%eax, 28(%rsp)          ## 4-byte Spill
	movq	208(%rsp), %rax
	movq	%rax, 48(%rsp)          ## 8-byte Spill
	movq	200(%rsp), %rax
	movq	%rax, 40(%rsp)          ## 8-byte Spill
	movq	192(%rsp), %rbx
	movq	88(%r13), %rsi
	movl	184(%rsp), %eax
	movl	%eax, 24(%rsp)          ## 4-byte Spill
	leaq	144(%rsp), %rdi
	callq	_eval
	movl	176(%rsp), %r9d
	movq	168(%rsp), %r8
	movq	160(%rsp), %rcx
	movq	152(%rsp), %rdx
	movl	144(%rsp), %esi
	leaq	104(%rsp), %rdi
	callq	_load
	movl	136(%rsp), %eax
	movl	%eax, 20(%rsp)          ## 4-byte Spill
	movq	128(%rsp), %rax
	movq	%rax, 32(%rsp)          ## 8-byte Spill
	movq	120(%rsp), %rbp
	movq	112(%rsp), %r14
	movl	104(%rsp), %r12d
	callq	_lab_get
	movl	%eax, %r15d
	movq	_fout(%rip), %rdi
	movq	__func319_str25(%rip), %rsi
	movq	8(%rsp), %rcx
	xorl	%eax, %eax
	movl	%r15d, %edx
	callq	_fprintf
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	_printType
	callq	_space
	movl	24(%rsp), %edi          ## 4-byte Reload
	movq	%rbx, %rsi
	movq	40(%rsp), %rdx          ## 8-byte Reload
	movq	48(%rsp), %rcx          ## 8-byte Reload
	movl	28(%rsp), %r8d          ## 4-byte Reload
	callq	_print_operand
	callq	_comma
	movl	%r12d, %edi
	movq	%r14, %rsi
	movq	%rbp, %rdx
	movq	32(%rsp), %rcx          ## 8-byte Reload
	movl	20(%rsp), %r8d          ## 4-byte Reload
	callq	_print_operand
	movq	8(%r13), %rsi
	leaq	64(%rsp), %rdi
	movl	$6, %edx
	movl	%r15d, %ecx
	callq	_operand
	movzwl	64(%rsp), %ebp
	movq	72(%rsp), %rcx
	movq	80(%rsp), %rdx
	movq	88(%rsp), %rsi
	movl	96(%rsp), %edi
	movq	56(%rsp), %rax          ## 8-byte Reload
	movl	%edi, 32(%rax)
	movq	%rsi, 24(%rax)
	movq	%rdx, 16(%rax)
	movq	%rcx, 8(%rax)
	movw	%bp, (%rax)
	addq	$264, %rsp              ## imm = 0x108
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_st               ## -- Begin function print_st
	.p2align	4, 0x90
_print_st:                              ## @print_st
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rdi, %rax
	leaq	112(%rsp), %rdi
	movq	%rax, %rsi
	callq	_eval
	movl	144(%rsp), %eax
	movl	%eax, 4(%rsp)           ## 4-byte Spill
	movq	136(%rsp), %rax
	movq	%rax, 24(%rsp)          ## 8-byte Spill
	movq	128(%rsp), %rax
	movq	%rax, 16(%rsp)          ## 8-byte Spill
	movq	120(%rsp), %rax
	movq	%rax, 8(%rsp)           ## 8-byte Spill
	movl	112(%rsp), %ebp
	leaq	72(%rsp), %rdi
	movq	%rbx, %rsi
	callq	_eval
	movl	104(%rsp), %r9d
	movq	96(%rsp), %r8
	movq	88(%rsp), %rcx
	movq	80(%rsp), %rdx
	movl	72(%rsp), %esi
	leaq	32(%rsp), %rdi
	callq	_load
	movl	64(%rsp), %r14d
	movq	56(%rsp), %r15
	movq	48(%rsp), %r12
	movq	40(%rsp), %rbx
	movq	_fout(%rip), %rdi
	movq	__func320_str1(%rip), %rsi
	movl	32(%rsp), %r13d
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	_printType
	callq	_space
	movl	%r13d, %edi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movl	%r14d, %r8d
	callq	_print_operand
	callq	_comma
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	_printType
	movq	__func320_str2(%rip), %rdi
	callq	_o
	movl	%ebp, %edi
	movq	8(%rsp), %rsi           ## 8-byte Reload
	movq	16(%rsp), %rdx          ## 8-byte Reload
	movq	24(%rsp), %rcx          ## 8-byte Reload
	movl	4(%rsp), %r8d           ## 4-byte Reload
	callq	_print_operand
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_loadImmPtr             ## -- Begin function loadImmPtr
	.p2align	4, 0x90
_loadImmPtr:                            ## @loadImmPtr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r9d, 12(%rsp)          ## 4-byte Spill
	movq	%r8, %r12
	movq	%rcx, %r13
	movq	%rdx, %r14
	movl	%esi, %r15d
	movq	%rdi, %rbx
	callq	_lab_get
	movl	%eax, %ebp
	movq	_fout(%rip), %rdi
	movq	__func322_str1(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebp, %edx
	callq	_fprintf
	movl	%r15d, %edi
	movq	%r14, %rsi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movl	12(%rsp), %r8d          ## 4-byte Reload
	callq	_print_operand
	movq	__func322_str2(%rip), %rdi
	callq	_o
	movl	$1, %esi
	movl	$1, %edx
	movq	%r14, %rdi
	callq	_printType
	leaq	16(%rsp), %rdi
	movl	$6, %edx
	movq	%r14, %rsi
	movl	%ebp, %ecx
	callq	_operand
	movzwl	16(%rsp), %eax
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edi
	movl	%edi, 32(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	%ax, (%rbx)
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_load                   ## -- Begin function load
	.p2align	4, 0x90
_load:                                  ## @load
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r9d, %r14d
	movq	%r8, %r15
	movq	%rcx, %r12
	movq	%rdx, %r13
	movl	%esi, %ebp
	movq	%rdi, %rbx
	testw	%bp, %bp
	je	LBB321_1
## %bb.3:                               ## %else_0
	movzwl	%bp, %eax
	cmpl	$1, %eax
	jne	LBB321_7
## %bb.4:                               ## %then_1
	movq	%r13, %rdi
	callq	_typeIsReference
	testb	$1, %al
	je	LBB321_1
## %bb.5:                               ## %then_2
	leaq	8(%rsp), %rdi
	movl	%ebp, %esi
	movq	%r13, %rdx
	movq	%r12, %rcx
	movq	%r15, %r8
	movl	%r14d, %r9d
	callq	_loadImmPtr
	movzwl	8(%rsp), %eax
	movq	16(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	32(%rsp), %rsi
	movl	40(%rsp), %edi
	jmp	LBB321_6
LBB321_7:                               ## %else_1
	cmpl	$3, %eax
	je	LBB321_10
## %bb.8:                               ## %else_1
	cmpl	$4, %eax
	je	LBB321_10
## %bb.9:                               ## %else_1
	cmpl	$5, %eax
	je	LBB321_10
LBB321_1:                               ## %then_0
	movw	%bp, (%rbx)
	movq	%r13, 8(%rbx)
	movq	%r12, 16(%rbx)
	movq	%r15, 24(%rbx)
	movl	%r14d, 32(%rbx)
	jmp	LBB321_2
LBB321_10:                              ## %else_3
	callq	_lab_get
	movl	%eax, %ecx
	movl	%eax, 4(%rsp)           ## 4-byte Spill
	movq	_fout(%rip), %rdi
	movq	__func321_str1(%rip), %rsi
	xorl	%eax, %eax
	movl	%ecx, %edx
	callq	_fprintf
	movl	$1, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	callq	_printType
	callq	_comma
	movl	$1, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	callq	_printType
	movq	__func321_str2(%rip), %rdi
	callq	_o
	movl	%ebp, %edi
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movl	%r14d, %r8d
	callq	_print_operand
	leaq	48(%rsp), %rdi
	movl	$6, %edx
	movq	%r13, %rsi
	movl	4(%rsp), %ecx           ## 4-byte Reload
	callq	_operand
	movzwl	48(%rsp), %eax
	movq	56(%rsp), %rcx
	movq	64(%rsp), %rdx
	movq	72(%rsp), %rsi
	movl	80(%rsp), %edi
LBB321_6:                               ## %then_2
	movl	%edi, 32(%rbx)
	movq	%rsi, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rcx, 8(%rbx)
	movw	%ax, (%rbx)
LBB321_2:                               ## %then_0
	movq	%rbx, %rax
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_operand          ## -- Begin function print_operand
	.p2align	4, 0x90
_print_operand:                         ## @print_operand
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movzwl	%di, %eax
	cmpl	$1, %eax
	jne	LBB322_2
## %bb.1:                               ## %then_0
	movq	_fout(%rip), %rdi
	movq	__func323_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	popq	%rax
	retq
LBB322_2:                               ## %else_0
	cmpl	$6, %eax
	je	LBB322_4
## %bb.3:                               ## %else_0
	cmpl	$5, %eax
	je	LBB322_4
## %bb.6:                               ## %else_1
	cmpl	$4, %eax
	je	LBB322_8
## %bb.7:                               ## %else_1
	cmpl	$2, %eax
	je	LBB322_8
## %bb.9:                               ## %else_2
	cmpl	$3, %eax
	jne	LBB322_11
## %bb.10:                              ## %then_3
	movq	_fout(%rip), %rdi
	movq	__func323_str4(%rip), %rsi
	jmp	LBB322_5
LBB322_4:                               ## %then_1
	movq	_fout(%rip), %rdi
	movq	__func323_str2(%rip), %rsi
LBB322_5:                               ## %endif_0
	xorl	%eax, %eax
	movl	%r8d, %edx
	callq	_fprintf
	popq	%rax
	retq
LBB322_8:                               ## %then_2
	movq	_fout(%rip), %rdi
	movq	__func323_str3(%rip), %rsi
	xorl	%eax, %eax
	movq	%rcx, %rdx
	callq	_fprintf
	popq	%rax
	retq
LBB322_11:                              ## %else_3
	testw	%di, %di
	jne	LBB322_13
## %bb.12:                              ## %then_4
	movq	_fout(%rip), %rdi
	movq	__func323_str5(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
LBB322_13:                              ## %endif_0
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_typedef                ## -- Begin function typedef
	.p2align	4, 0x90
_typedef:                               ## @typedef
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movq	%rdi, %rcx
	movq	_fout(%rip), %rdi
	movq	__func324_str1(%rip), %rsi
	xorl	%eax, %eax
	movq	%rcx, %rdx
	callq	_fprintf
	xorl	%esi, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	_printType
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_array_item       ## -- Begin function print_array_item
	.p2align	4, 0x90
_print_array_item:                      ## @print_array_item
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	cmpb	$1, (%rsi)
	jne	LBB324_2
## %bb.1:                               ## %then_0
	callq	_comma
LBB324_2:                               ## %endif_0
	movq	8(%r14), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	callq	_space
	movb	$1, (%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_arraydef               ## -- Begin function arraydef
	.p2align	4, 0x90
_arraydef:                              ## @arraydef
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movq	%rdi, %rdx
	movq	_fout(%rip), %rdi
	movq	__func325_str1(%rip), %rsi
	movq	16(%rbx), %rcx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %esi
	movl	$1, %edx
	movq	%r14, %rdi
	callq	_printType
	movq	_fout(%rip), %rdi
	movq	__func325_str2(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movb	$0, 7(%rsp)
	leaq	_print_array_item(%rip), %rsi
	leaq	7(%rsp), %rdx
	movq	%rbx, %rdi
	callq	_list_foreach
	movq	_fout(%rip), %rdi
	movq	__func325_str3(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_stringdef              ## -- Begin function stringdef
	.p2align	4, 0x90
_stringdef:                             ## @stringdef
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %rbp
	movl	%esi, %r14d
	movq	%rdi, %rbx
	movq	_fout(%rip), %rdi
	movq	__func327_str1(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movl	%r14d, %ecx
	callq	_fprintf
	movl	$0, 12(%rsp)
	jmp	LBB326_1
	.p2align	4, 0x90
LBB326_11:                              ## %continue_0
                                        ##   in Loop: Header=BB326_1 Depth=1
	movzbl	%al, %edx
	xorl	%eax, %eax
	callq	_fprintf
LBB326_1:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	movslq	12(%rsp), %rcx
	movzbl	(%rbp,%rcx), %eax
	leal	1(%rcx), %ecx
	movl	%ecx, 12(%rsp)
	testb	%al, %al
	je	LBB326_13
## %bb.2:                               ## %else_0
                                        ##   in Loop: Header=BB326_1 Depth=1
	movq	__func327_str2(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB326_10
## %bb.3:                               ## %else_0
                                        ##   in Loop: Header=BB326_1 Depth=1
	movq	__func327_str3(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB326_10
## %bb.4:                               ## %else_0
                                        ##   in Loop: Header=BB326_1 Depth=1
	movq	__func327_str4(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB326_10
## %bb.5:                               ## %else_0
                                        ##   in Loop: Header=BB326_1 Depth=1
	movq	__func327_str5(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB326_10
## %bb.6:                               ## %else_0
                                        ##   in Loop: Header=BB326_1 Depth=1
	movq	__func327_str6(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB326_10
## %bb.7:                               ## %else_0
                                        ##   in Loop: Header=BB326_1 Depth=1
	movq	__func327_str7(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB326_10
## %bb.8:                               ## %else_0
                                        ##   in Loop: Header=BB326_1 Depth=1
	movq	__func327_str8(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB326_10
## %bb.9:                               ## %else_0
                                        ##   in Loop: Header=BB326_1 Depth=1
	movq	__func327_str9(%rip), %rcx
	cmpb	(%rcx), %al
	je	LBB326_10
## %bb.12:                              ## %else_1
                                        ##   in Loop: Header=BB326_1 Depth=1
	movq	_fout(%rip), %rdi
	movq	__func327_str11(%rip), %rsi
	jmp	LBB326_11
	.p2align	4, 0x90
LBB326_10:                              ## %then_1
                                        ##   in Loop: Header=BB326_1 Depth=1
	movq	_fout(%rip), %rdi
	movq	__func327_str10(%rip), %rsi
	jmp	LBB326_11
LBB326_13:                              ## %break_0
	movq	_fout(%rip), %rdi
	movq	__func327_str12(%rip), %rsi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func327_str13(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movl	%r14d, %ecx
	movl	%r14d, %r8d
	movq	%rbx, %r9
	callq	_fprintf
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_vardef                 ## -- Begin function vardef
	.p2align	4, 0x90
_vardef:                                ## @vardef
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movq	%rdi, %rcx
	movq	_fout(%rip), %rdi
	movq	__func328_str1(%rip), %rsi
	xorl	%eax, %eax
	movq	%rcx, %rdx
	callq	_fprintf
	movl	$1, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	callq	_printType
	callq	_space
	movq	__func328_str2(%rip), %rdi
	callq	_o
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_vf_print_param         ## -- Begin function vf_print_param
	.p2align	4, 0x90
_vf_print_param:                        ## @vf_print_param
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	cmpb	$1, (%rsi)
	jne	LBB328_2
## %bb.1:                               ## %then_0
	movq	_fout(%rip), %rdi
	movq	__func330_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
LBB328_2:                               ## %endif_0
	movq	8(%r14), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
	movb	$1, (%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_funcdef                ## -- Begin function funcdef
	.p2align	4, 0x90
_funcdef:                               ## @funcdef
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movq	%rdi, %r15
	movq	48(%rsi), %rax
	movl	16(%rax), %edi
	incl	%edi
	callq	_lab_reset
	xorl	%edi, %edi
	testq	%rbx, %rbx
	setne	%dil
	movq	__func329_str1(%rip), %rsi
	callq	_assert
	testq	%r14, %r14
	je	LBB329_1
## %bb.2:                               ## %else_0
	movq	__func329_str3(%rip), %rdi
	jmp	LBB329_3
LBB329_1:                               ## %then_0
	movq	__func329_str2(%rip), %rdi
LBB329_3:                               ## %endif_0
	callq	_o
	callq	_space
	movq	56(%rbx), %rdi
	movq	_typeUnit(%rip), %rsi
	callq	_type_eq
	movl	%eax, %r12d
	testb	$1, %al
	je	LBB329_5
## %bb.4:                               ## %then_1
	movq	__func329_str4(%rip), %rdi
	callq	_o
	jmp	LBB329_6
LBB329_5:                               ## %else_1
	movq	56(%rbx), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_printType
LBB329_6:                               ## %endif_1
	movq	_fout(%rip), %rdi
	movq	__func329_str5(%rip), %rsi
	xorl	%eax, %eax
	movq	%r15, %rdx
	callq	_fprintf
	movq	%rsp, %rax
	leaq	-16(%rax), %rdx
	movq	%rdx, %rsp
	movb	$0, -16(%rax)
	movq	48(%rbx), %rdi
	leaq	_vf_print_param(%rip), %rsi
	callq	_list_foreach
	cmpb	$1, 64(%rbx)
	jne	LBB329_8
## %bb.7:                               ## %then_2
	movq	__func329_str6(%rip), %rdi
	callq	_o
LBB329_8:                               ## %endif_2
	movq	__func329_str7(%rip), %rdi
	callq	_o
	testq	%r14, %r14
	je	LBB329_12
## %bb.9:                               ## %then_4
	movq	__func329_str8(%rip), %rdi
	callq	_o
	callq	_reset_local_labels
	movq	%r14, %rdi
	callq	_print_block
	testb	$1, %r12b
	je	LBB329_11
## %bb.10:                              ## %then_5
	movq	__func329_str9(%rip), %rdi
	callq	_o
LBB329_11:                              ## %endif_5
	movq	__func329_str10(%rip), %rdi
	callq	_o
LBB329_12:                              ## %endif_4
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_prt_itype              ## -- Begin function prt_itype
	.p2align	4, 0x90
_prt_itype:                             ## @prt_itype
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	cmpb	$1, 44(%rsi)
	jne	LBB330_2
## %bb.1:                               ## %then_0
	movq	%rdi, %rdx
	movq	_fout(%rip), %rdi
	movq	__func332_str1(%rip), %r8
	movl	40(%rsi), %ecx
	xorl	%eax, %eax
	movq	%r8, %rsi
	callq	_fprintf
LBB330_2:                               ## %endif_0
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printer_init           ## -- Begin function printer_init
	.p2align	4, 0x90
_printer_init:                          ## @printer_init
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movl	%edi, %ebx
	movq	__func331_str1(%rip), %rax
	movq	%rsi, %rdi
	movq	%rax, %rsi
	callq	_fopen
	movq	%rax, _fout(%rip)
	testq	%rax, %rax
	jne	LBB331_2
## %bb.1:                               ## %then_0
	movq	__func331_str2(%rip), %rdi
	callq	_fatal
LBB331_2:                               ## %endif_0
	movq	_fout(%rip), %rdi
	movq	__func331_str3(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func331_str4(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movl	%ebx, %edi
	callq	_print_head
	movq	_fout(%rip), %rdi
	movq	__func331_str5(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func331_str6(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func331_str7(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func331_str8(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	_globalTypeIndex(%rip), %rdi
	leaq	_prt_itype(%rip), %rsi
	xorl	%edx, %edx
	callq	_map_foreach
	movq	_fout(%rip), %rdi
	movq	__func331_str9(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_foreach_typedef        ## -- Begin function foreach_typedef
	.p2align	4, 0x90
_foreach_typedef:                       ## @foreach_typedef
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	8(%rdi), %rax
	movq	48(%rdi), %rsi
	movq	%rax, %rdi
	callq	_typedef
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_foreach_stringdef      ## -- Begin function foreach_stringdef
	.p2align	4, 0x90
_foreach_stringdef:                     ## @foreach_stringdef
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	cmpq	$0, 24(%rdi)
	jne	LBB333_2
## %bb.1:                               ## %then_0
	movq	__func335_str1(%rip), %rdi
	movq	8(%rbx), %rsi
	xorl	%eax, %eax
	callq	_printf
LBB333_2:                               ## %endif_0
	movl	32(%rbx), %esi
	movq	8(%rbx), %rdi
	movq	24(%rbx), %rdx
	callq	_stringdef
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_foreach_arraydef       ## -- Begin function foreach_arraydef
	.p2align	4, 0x90
_foreach_arraydef:                      ## @foreach_arraydef
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	8(%rdi), %rax
	movq	80(%rdi), %rsi
	movq	96(%rdi), %rdx
	movq	%rax, %rdi
	callq	_arraydef
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_foreach_vardef         ## -- Begin function foreach_vardef
	.p2align	4, 0x90
_foreach_vardef:                        ## @foreach_vardef
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	8(%rdi), %rax
	movq	136(%rdi), %rsi
	movq	144(%rdi), %rdx
	movq	%rax, %rdi
	callq	_vardef
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_foreach_funcdef        ## -- Begin function foreach_funcdef
	.p2align	4, 0x90
_foreach_funcdef:                       ## @foreach_funcdef
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	8(%rdi), %rax
	movq	112(%rdi), %rsi
	movq	120(%rdi), %rdx
	movq	%rax, %rdi
	callq	_funcdef
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_assembly         ## -- Begin function print_assembly
	.p2align	4, 0x90
_print_assembly:                        ## @print_assembly
	.cfi_startproc
## %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movq	__func333_str1(%rip), %rdi
	movq	(%rbx), %rsi
	xorl	%eax, %eax
	callq	_printf
	leaq	_md_list(%rip), %r14
	movq	%r14, %rdi
	callq	_list_init
	movq	_fout(%rip), %rdi
	movq	__func333_str2(%rip), %rsi
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movq	__func333_str3(%rip), %rdi
	callq	_o
	movq	8(%rbx), %rdi
	leaq	_foreach_typedef(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	movq	__func333_str4(%rip), %rdi
	callq	_o
	movq	24(%rbx), %rdi
	leaq	_foreach_stringdef(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	movq	__func333_str5(%rip), %rdi
	callq	_o
	movq	16(%rbx), %rdi
	leaq	_foreach_arraydef(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	movq	__func333_str6(%rip), %rdi
	callq	_o
	movq	32(%rbx), %rdi
	leaq	_foreach_vardef(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	movq	__func333_str7(%rip), %rdi
	callq	_o
	movq	40(%rbx), %rdi
	leaq	_foreach_funcdef(%rip), %rsi
	xorl	%edx, %edx
	callq	_list_foreach
	movq	__func333_str8(%rip), %rdi
	callq	_o
	movq	%r14, %rdi
	callq	_print_metadata_list
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_head             ## -- Begin function print_head
	.p2align	4, 0x90
_print_head:                            ## @print_head
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	testw	%di, %di
	je	LBB338_1
## %bb.2:                               ## %else_0
	movzwl	%di, %eax
	cmpl	$1, %eax
	jne	LBB338_5
## %bb.3:                               ## %then_1
	movq	_fout(%rip), %rdi
	movq	__func339_str3(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func339_str4(%rip), %rsi
	jmp	LBB338_4
LBB338_1:                               ## %then_0
	movq	_fout(%rip), %rdi
	movq	__func339_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func339_str2(%rip), %rsi
LBB338_4:                               ## %endif_0
	xorl	%eax, %eax
	callq	_fprintf
LBB338_5:                               ## %endif_0
	movq	_fout(%rip), %rdi
	movq	__func339_str5(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_tshow                  ## -- Begin function tshow
	.p2align	4, 0x90
_tshow:                                 ## @tshow
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	_fout(%rip), %rdi
	movq	__func341_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_type_index       ## -- Begin function print_type_index
	.p2align	4, 0x90
_print_type_index:                      ## @print_type_index
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	_fout(%rip), %rdi
	movq	__func340_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	_tshow(%rip), %rsi
	xorl	%edx, %edx
	movq	%rbx, %rdi
	callq	_map_foreach
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_vshow                  ## -- Begin function vshow
	.p2align	4, 0x90
_vshow:                                 ## @vshow
	.cfi_startproc
## %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %rcx
	movq	_fout(%rip), %rdi
	movq	__func343_str1(%rip), %rsi
	xorl	%eax, %eax
	movq	%rcx, %rdx
	movq	%rbx, %rcx
	callq	_fprintf
	movq	_fout(%rip), %r14
	movq	__func343_str2(%rip), %r15
	movzwl	(%rbx), %edi
	callq	_print_value_kind
	movq	%rax, %rcx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rcx, %rdx
	callq	_fprintf
	movq	_fout(%rip), %rdi
	movq	__func343_str3(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_value_index      ## -- Begin function print_value_index
	.p2align	4, 0x90
_print_value_index:                     ## @print_value_index
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	_fout(%rip), %rdi
	movq	__func342_str1(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	_vshow(%rip), %rsi
	xorl	%edx, %edx
	movq	%rbx, %rdi
	callq	_map_foreach
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function init
LCPI343_0:
	.long	64                      ## 0x40
	.long	8                       ## 0x8
	.long	1                       ## 0x1
	.long	2                       ## 0x2
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_init
	.p2align	4, 0x90
_init:                                  ## @init
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movl	$512, %edi              ## imm = 0x200
	callq	_malloc
	movq	%rax, _pdir(%rip)
	movl	$512, %esi              ## imm = 0x200
	movq	%rax, %rdi
	callq	_getcwd
	leaq	_liblist(%rip), %rdi
	callq	_list_init
	movq	_MINOR_LIB_ENV_VAR(%rip), %rdi
	callq	_getenv
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	LBB343_2
## %bb.1:                               ## %then_0
	movq	__func344_str1(%rip), %rdi
	callq	_fatal
LBB343_2:                               ## %endif_0
	movq	%rbx, %rdi
	callq	_liblist_add
	leaq	_asm0(%rip), %rdi
	movq	__func344_str2(%rip), %rsi
	callq	_asmInit
	leaq	_globalTypeIndex(%rip), %rdi
	callq	_list_init
	leaq	_globalValueIndex(%rip), %rdi
	callq	_list_init
	callq	_list_new
	movq	%rax, _settings(%rip)
	movaps	LCPI343_0(%rip), %xmm0  ## xmm0 = [64,8,1,2]
	movaps	%xmm0, _cfg(%rip)
	movabsq	$34359738376, %rax      ## imm = 0x800000008
	movq	%rax, _cfg+16(%rip)
	callq	_type_init
	callq	_value_init
	movw	$0, _arch(%rip)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_readConfig             ## -- Begin function readConfig
	.p2align	4, 0x90
_readConfig:                            ## @readConfig
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$520, %rsp              ## imm = 0x208
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %rcx
	movq	__func345_str1(%rip), %rdi
	xorl	%eax, %eax
	movq	%rcx, %rsi
	callq	_printf
	leaq	-536(%rbp), %rbx
	movl	$512, %esi              ## imm = 0x200
	movq	%rbx, %rdi
	callq	_getcwd
	movq	__func345_str2(%rip), %rsi
	movq	%rbx, %rdi
	callq	_getSourceInfoFrom
                                        ## kill: def $ax killed $ax def $eax
	movl	%eax, %edi
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	callq	_openSource
	movq	_mctx(%rip), %r15
	movq	%rax, _mctx(%rip)
	jmp	LBB344_1
	.p2align	4, 0x90
LBB344_4:                               ## %endif_1
                                        ##   in Loop: Header=BB344_1 Depth=1
	movq	__func345_str5(%rip), %rdi
	movq	(%rbx), %rdx
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	_printf
	movq	(%rbx), %rsi
	movq	%r14, %rdi
	callq	_set
LBB344_1:                               ## %continue_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rsp, %rbx
	addq	$-16, %rbx
	movq	%rbx, %rsp
	callq	_skip_nl
	callq	_eof
	testb	$1, %al
	jne	LBB344_5
## %bb.2:                               ## %else_0
                                        ##   in Loop: Header=BB344_1 Depth=1
	callq	_parseId
	movq	%rax, %r14
	movq	__func345_str3(%rip), %rdi
	callq	_need
	callq	_ctok
	movq	%rax, %rcx
	movzwl	(%rax), %eax
	cmpl	$2, %eax
	jne	LBB344_4
## %bb.3:                               ## %then_1
                                        ##   in Loop: Header=BB344_1 Depth=1
	addq	$24, %rcx
	movq	__func345_str4(%rip), %rsi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	movq	%rbx, %rdx
	callq	_sscanf
	callq	_skip
	jmp	LBB344_4
LBB344_5:                               ## %break_0
	movq	%r15, _mctx(%rip)
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_tchk                   ## -- Begin function tchk
	.p2align	4, 0x90
_tchk:                                  ## @tchk
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rdi
	callq	_typeCheck
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_vchk                   ## -- Begin function vchk
	.p2align	4, 0x90
_vchk:                                  ## @vchk
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movq	%rsi, %rdi
	callq	_checkValue
	cmpq	$0, 8(%rbx)
	je	LBB346_4
## %bb.1:                               ## %then_0
	movq	8(%rbx), %rax
	movzwl	(%rax), %eax
	cmpl	$3, %eax
	jne	LBB346_4
## %bb.2:                               ## %then_0
	movzwl	(%rbx), %eax
	cmpl	$3, %eax
	jne	LBB346_4
## %bb.3:                               ## %then_1
	movq	%rbx, %rdi
	callq	_checkFunc
LBB346_4:                               ## %endif_0
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkMain              ## -- Begin function checkMain
	.p2align	4, 0x90
_checkMain:                             ## @checkMain
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	_mctx+8(%rip), %rdi
	leaq	_tchk(%rip), %rsi
	xorl	%edx, %edx
	callq	_map_foreach
	leaq	_mctx+32(%rip), %rdi
	leaq	_vchk(%rip), %rsi
	xorl	%edx, %edx
	callq	_map_foreach
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_checkFunc              ## -- Begin function checkFunc
	.p2align	4, 0x90
_checkFunc:                             ## @checkFunc
	.cfi_startproc
## %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	_fctx(%rip), %rbx
	movq	%rdi, _fctx(%rip)
	movq	32(%rdi), %rax
	movq	120(%rax), %rdi
	testq	%rdi, %rdi
	je	LBB348_2
## %bb.1:                               ## %then_0
	callq	_stmtBlockCheck
LBB348_2:                               ## %endif_0
	movq	%rbx, _fctx(%rip)
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movl	%edi, %ebp
	movq	__func350_str1(%rip), %rdi
	xorl	%esi, %esi
	movl	$5, %edx
	xorl	%eax, %eax
	callq	_printf
	callq	_init
	movl	%ebp, %edi
	movq	%rbx, %rsi
	callq	_parseArgs
	movq	__func350_str2(%rip), %rdi
	callq	_getSourceInfo
                                        ## kill: def $ax killed $ax def $eax
	movl	%eax, %edi
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	callq	_openSource
	testq	%rax, %rax
	je	LBB349_1
## %bb.3:                               ## %else_0
	movq	%rax, %rdi
	callq	_parse
	movq	__func350_str3(%rip), %rdi
	movl	_lines(%rip), %esi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	callq	_printf
	callq	_checkMain
	cmpl	$0, _errcnt(%rip)
	je	LBB349_5
## %bb.4:                               ## %then_1
	movq	__func350_str4(%rip), %rdi
	movl	_errcnt(%rip), %esi
	xorl	%eax, %eax
	callq	_printf
	movl	_errcnt(%rip), %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB349_1:                               ## %then_0
	movl	$-1, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB349_5:                               ## %else_1
	movq	__func350_str5(%rip), %rsi
	movzwl	_arch(%rip), %edi
	callq	_printer_init
	leaq	_asm0(%rip), %rdi
	callq	_print_assembly
	cmpl	_errcnt(%rip), %ebx
	sbbl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parseArgs              ## -- Begin function parseArgs
	.p2align	4, 0x90
_parseArgs:                             ## @parseArgs
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movl	%edi, %r15d
	movl	$1, 4(%rsp)
	cmpl	%r15d, 4(%rsp)
	jl	LBB350_2
	jmp	LBB350_13
	.p2align	4, 0x90
LBB350_12:                              ## %endif_4
                                        ##   in Loop: Header=BB350_2 Depth=1
	incl	4(%rsp)
	cmpl	%r15d, 4(%rsp)
	jge	LBB350_13
LBB350_2:                               ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movslq	4(%rsp), %rax
	movq	(%r14,%rax,8), %rbx
	movq	__func351_str1(%rip), %rsi
	movl	$6, %edx
	movq	%rbx, %rdi
	callq	_strncmp
	testl	%eax, %eax
	je	LBB350_3
LBB350_8:                               ## %endif_0
                                        ##   in Loop: Header=BB350_2 Depth=1
	movq	__func351_str5(%rip), %rsi
	movl	$5, %edx
	movq	%rbx, %rdi
	callq	_strncmp
	testl	%eax, %eax
	jne	LBB350_10
## %bb.9:                               ## %then_3
                                        ##   in Loop: Header=BB350_2 Depth=1
	leaq	5(%rbx), %rdi
	callq	_liblist_add
LBB350_10:                              ## %endif_3
                                        ##   in Loop: Header=BB350_2 Depth=1
	movq	__func351_str6(%rip), %rsi
	movl	$6, %edx
	movq	%rbx, %rdi
	callq	_strncmp
	testl	%eax, %eax
	jne	LBB350_12
## %bb.11:                              ## %then_4
                                        ##   in Loop: Header=BB350_2 Depth=1
	addq	$6, %rbx
	movq	%rbx, %rdi
	callq	_readConfig
	jmp	LBB350_12
	.p2align	4, 0x90
LBB350_3:                               ## %then_0
                                        ##   in Loop: Header=BB350_2 Depth=1
	leaq	6(%rbx), %rbp
	movq	__func351_str2(%rip), %rsi
	movq	%rbp, %rdi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB350_4
## %bb.5:                               ## %else_1
                                        ##   in Loop: Header=BB350_2 Depth=1
	movq	__func351_str3(%rip), %rsi
	movq	%rbp, %rdi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB350_6
## %bb.7:                               ## %else_2
                                        ##   in Loop: Header=BB350_2 Depth=1
	movq	__func351_str4(%rip), %rdi
	callq	_fatal
	jmp	LBB350_8
LBB350_4:                               ## %then_1
                                        ##   in Loop: Header=BB350_2 Depth=1
	movw	$1, _arch(%rip)
	jmp	LBB350_8
LBB350_6:                               ## %then_2
                                        ##   in Loop: Header=BB350_2 Depth=1
	movw	$0, _arch(%rip)
	jmp	LBB350_8
LBB350_13:                              ## %break_0
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_usage                  ## -- Begin function usage
	.p2align	4, 0x90
_usage:                                 ## @usage
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__func352_str1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	__func352_str2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	__func352_str3(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	__func352_str4(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_shwt                   ## -- Begin function shwt
	.p2align	4, 0x90
_shwt:                                  ## @shwt
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	callq	_strlen
	movl	%eax, %ebp
	movq	__func354_str1(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	_printf
	movl	$0, 12(%rsp)
	movl	$40, %ebx
	subl	%ebp, %ebx
	cmpl	%ebx, 12(%rsp)
	jae	LBB352_3
	.p2align	4, 0x90
LBB352_2:                               ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	__func354_str2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	incl	12(%rsp)
	cmpl	%ebx, 12(%rsp)
	jb	LBB352_2
LBB352_3:                               ## %break_0
	movq	%r14, %rdi
	callq	_prttype
	movq	__func354_str3(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_showTypes              ## -- Begin function showTypes
	.p2align	4, 0x90
_showTypes:                             ## @showTypes
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	_mctx+8(%rip), %rdi
	leaq	_shwt(%rip), %rsi
	xorl	%edx, %edx
	callq	_map_foreach
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_shwv                   ## -- Begin function shwv
	.p2align	4, 0x90
_shwv:                                  ## @shwv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	callq	_strlen
	movl	%eax, %ebp
	movq	__func356_str1(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	_printf
	movl	$0, 12(%rsp)
	movl	$40, %ebx
	subl	%ebp, %ebx
	cmpl	%ebx, 12(%rsp)
	jae	LBB354_3
	.p2align	4, 0x90
LBB354_2:                               ## %body_0
                                        ## =>This Inner Loop Header: Depth=1
	movq	__func356_str2(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	incl	12(%rsp)
	cmpl	%ebx, 12(%rsp)
	jb	LBB354_2
LBB354_3:                               ## %break_0
	movq	8(%r14), %rdi
	callq	_prttype
	movq	__func356_str3(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_showValues             ## -- Begin function showValues
	.p2align	4, 0x90
_showValues:                            ## @showValues
	.cfi_startproc
## %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	_mctx+32(%rip), %rdi
	leaq	_shwv(%rip), %rsi
	xorl	%edx, %edx
	callq	_map_foreach
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str._func7_str1:                     ## @.str._func7_str1
	.asciz	"assert failed: %s\n"

	.section	__DATA,__const
	.globl	__func7_str1            ## @_func7_str1
	.p2align	3
__func7_str1:
	.quad	L_.str._func7_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func8_str1:                     ## @.str._func8_str1
	.asciz	"/"

	.section	__DATA,__const
	.globl	__func8_str1            ## @_func8_str1
	.p2align	3
__func8_str1:
	.quad	L_.str._func8_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func42_str1:                    ## @.str._func42_str1
	.asciz	"A"

	.section	__DATA,__const
	.globl	__func42_str1           ## @_func42_str1
	.p2align	3
__func42_str1:
	.quad	L_.str._func42_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func42_str2:                    ## @.str._func42_str2
	.asciz	"Z"

	.section	__DATA,__const
	.globl	__func42_str2           ## @_func42_str2
	.p2align	3
__func42_str2:
	.quad	L_.str._func42_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func42_str3:                    ## @.str._func42_str3
	.asciz	"a"

	.section	__DATA,__const
	.globl	__func42_str3           ## @_func42_str3
	.p2align	3
__func42_str3:
	.quad	L_.str._func42_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func42_str4:                    ## @.str._func42_str4
	.asciz	"z"

	.section	__DATA,__const
	.globl	__func42_str4           ## @_func42_str4
	.p2align	3
__func42_str4:
	.quad	L_.str._func42_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func43_str1:                    ## @.str._func43_str1
	.asciz	"0"

	.section	__DATA,__const
	.globl	__func43_str1           ## @_func43_str1
	.p2align	3
__func43_str1:
	.quad	L_.str._func43_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func43_str2:                    ## @.str._func43_str2
	.asciz	"9"

	.section	__DATA,__const
	.globl	__func43_str2           ## @_func43_str2
	.p2align	3
__func43_str2:
	.quad	L_.str._func43_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func45_str1:                    ## @.str._func45_str1
	.asciz	"module=%s\n"

	.section	__DATA,__const
	.globl	__func45_str1           ## @_func45_str1
	.p2align	3
__func45_str1:
	.quad	L_.str._func45_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func45_str2:                    ## @.str._func45_str2
	.asciz	"module not exist"

	.section	__DATA,__const
	.globl	__func45_str2           ## @_func45_str2
	.p2align	3
__func45_str2:
	.quad	L_.str._func45_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func47_str1:                    ## @.str._func47_str1
	.asciz	"unexpected end-of-file"

	.section	__DATA,__const
	.globl	__func47_str1           ## @_func47_str1
	.p2align	3
__func47_str1:
	.quad	L_.str._func47_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func47_str2:                    ## @.str._func47_str2
	.asciz	"too long token\n"

	.section	__DATA,__const
	.globl	__func47_str2           ## @_func47_str2
	.p2align	3
__func47_str2:
	.quad	L_.str._func47_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func48_str1:                    ## @.str._func48_str1
	.asciz	" "

	.section	__DATA,__const
	.globl	__func48_str1           ## @_func48_str1
	.p2align	3
__func48_str1:
	.quad	L_.str._func48_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func48_str2:                    ## @.str._func48_str2
	.asciz	"\t"

	.section	__DATA,__const
	.globl	__func48_str2           ## @_func48_str2
	.p2align	3
__func48_str2:
	.quad	L_.str._func48_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func49_str1:                    ## @.str._func49_str1
	.asciz	">"

	.section	__DATA,__const
	.globl	__func49_str1           ## @_func49_str1
	.p2align	3
__func49_str1:
	.quad	L_.str._func49_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func50_str1:                    ## @.str._func50_str1
	.asciz	"/"

	.section	__DATA,__const
	.globl	__func50_str1           ## @_func50_str1
	.p2align	3
__func50_str1:
	.quad	L_.str._func50_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func50_str2:                    ## @.str._func50_str2
	.asciz	"*"

	.section	__DATA,__const
	.globl	__func50_str2           ## @_func50_str2
	.p2align	3
__func50_str2:
	.quad	L_.str._func50_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func51_str1:                    ## @.str._func51_str1
	.asciz	">"

	.section	__DATA,__const
	.globl	__func51_str1           ## @_func51_str1
	.p2align	3
__func51_str1:
	.quad	L_.str._func51_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func51_str2:                    ## @.str._func51_str2
	.asciz	"="

	.section	__DATA,__const
	.globl	__func51_str2           ## @_func51_str2
	.p2align	3
__func51_str2:
	.quad	L_.str._func51_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func52_str1:                    ## @.str._func52_str1
	.asciz	"<"

	.section	__DATA,__const
	.globl	__func52_str1           ## @_func52_str1
	.p2align	3
__func52_str1:
	.quad	L_.str._func52_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func52_str2:                    ## @.str._func52_str2
	.asciz	"="

	.section	__DATA,__const
	.globl	__func52_str2           ## @_func52_str2
	.p2align	3
__func52_str2:
	.quad	L_.str._func52_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func53_str1:                    ## @.str._func53_str1
	.asciz	"="

	.section	__DATA,__const
	.globl	__func53_str1           ## @_func53_str1
	.p2align	3
__func53_str1:
	.quad	L_.str._func53_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func54_str1:                    ## @.str._func54_str1
	.asciz	"="

	.section	__DATA,__const
	.globl	__func54_str1           ## @_func54_str1
	.p2align	3
__func54_str1:
	.quad	L_.str._func54_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func55_str1:                    ## @.str._func55_str1
	.asciz	"_"

	.section	__DATA,__const
	.globl	__func55_str1           ## @_func55_str1
	.p2align	3
__func55_str1:
	.quad	L_.str._func55_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func57_str1:                    ## @.str._func57_str1
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func57_str1           ## @_func57_str1
	.p2align	3
__func57_str1:
	.quad	L_.str._func57_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func58_str1:                    ## @.str._func58_str1
	.asciz	"_"

	.section	__DATA,__const
	.globl	__func58_str1           ## @_func58_str1
	.p2align	3
__func58_str1:
	.quad	L_.str._func58_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func58_str2:                    ## @.str._func58_str2
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func58_str2           ## @_func58_str2
	.p2align	3
__func58_str2:
	.quad	L_.str._func58_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func58_str3:                    ## @.str._func58_str3
	.asciz	"="

	.section	__DATA,__const
	.globl	__func58_str3           ## @_func58_str3
	.p2align	3
__func58_str3:
	.quad	L_.str._func58_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func58_str4:                    ## @.str._func58_str4
	.asciz	"-"

	.section	__DATA,__const
	.globl	__func58_str4           ## @_func58_str4
	.p2align	3
__func58_str4:
	.quad	L_.str._func58_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func58_str5:                    ## @.str._func58_str5
	.asciz	"/"

	.section	__DATA,__const
	.globl	__func58_str5           ## @_func58_str5
	.p2align	3
__func58_str5:
	.quad	L_.str._func58_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func58_str6:                    ## @.str._func58_str6
	.asciz	">"

	.section	__DATA,__const
	.globl	__func58_str6           ## @_func58_str6
	.p2align	3
__func58_str6:
	.quad	L_.str._func58_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func58_str7:                    ## @.str._func58_str7
	.asciz	"<"

	.section	__DATA,__const
	.globl	__func58_str7           ## @_func58_str7
	.p2align	3
__func58_str7:
	.quad	L_.str._func58_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func58_str8:                    ## @.str._func58_str8
	.asciz	"!"

	.section	__DATA,__const
	.globl	__func58_str8           ## @_func58_str8
	.p2align	3
__func58_str8:
	.quad	L_.str._func58_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func58_str9:                    ## @.str._func58_str9
	.asciz	"#"

	.section	__DATA,__const
	.globl	__func58_str9           ## @_func58_str9
	.p2align	3
__func58_str9:
	.quad	L_.str._func58_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func58_str10:                   ## @.str._func58_str10
	.asciz	"\""

	.section	__DATA,__const
	.globl	__func58_str10          ## @_func58_str10
	.p2align	3
__func58_str10:
	.quad	L_.str._func58_str10

	.section	__TEXT,__cstring,cstring_literals
L_.str._func59_str1:                    ## @.str._func59_str1
	.asciz	"/"

	.section	__DATA,__const
	.globl	__func59_str1           ## @_func59_str1
	.p2align	3
__func59_str1:
	.quad	L_.str._func59_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func59_str2:                    ## @.str._func59_str2
	.asciz	"*"

	.section	__DATA,__const
	.globl	__func59_str2           ## @_func59_str2
	.p2align	3
__func59_str2:
	.quad	L_.str._func59_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func59_str3:                    ## @.str._func59_str3
	.asciz	"unexpected end-of-file"

	.section	__DATA,__const
	.globl	__func59_str3           ## @_func59_str3
	.p2align	3
__func59_str3:
	.quad	L_.str._func59_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func59_str4:                    ## @.str._func59_str4
	.asciz	"*"

	.section	__DATA,__const
	.globl	__func59_str4           ## @_func59_str4
	.p2align	3
__func59_str4:
	.quad	L_.str._func59_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func59_str5:                    ## @.str._func59_str5
	.asciz	"/"

	.section	__DATA,__const
	.globl	__func59_str5           ## @_func59_str5
	.p2align	3
__func59_str5:
	.quad	L_.str._func59_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func59_str6:                    ## @.str._func59_str6
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func59_str6           ## @_func59_str6
	.p2align	3
__func59_str6:
	.quad	L_.str._func59_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str1:                    ## @.str._func60_str1
	.asciz	"\""

	.section	__DATA,__const
	.globl	__func60_str1           ## @_func60_str1
	.p2align	3
__func60_str1:
	.quad	L_.str._func60_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str2:                    ## @.str._func60_str2
	.asciz	"unexpected end-of-file"

	.section	__DATA,__const
	.globl	__func60_str2           ## @_func60_str2
	.p2align	3
__func60_str2:
	.quad	L_.str._func60_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str3:                    ## @.str._func60_str3
	.asciz	"\\"

	.section	__DATA,__const
	.globl	__func60_str3           ## @_func60_str3
	.p2align	3
__func60_str3:
	.quad	L_.str._func60_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str4:                    ## @.str._func60_str4
	.asciz	"n"

	.section	__DATA,__const
	.globl	__func60_str4           ## @_func60_str4
	.p2align	3
__func60_str4:
	.quad	L_.str._func60_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str5:                    ## @.str._func60_str5
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func60_str5           ## @_func60_str5
	.p2align	3
__func60_str5:
	.quad	L_.str._func60_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str6:                    ## @.str._func60_str6
	.asciz	"r"

	.section	__DATA,__const
	.globl	__func60_str6           ## @_func60_str6
	.p2align	3
__func60_str6:
	.quad	L_.str._func60_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str7:                    ## @.str._func60_str7
	.asciz	"\r"

	.section	__DATA,__const
	.globl	__func60_str7           ## @_func60_str7
	.p2align	3
__func60_str7:
	.quad	L_.str._func60_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str8:                    ## @.str._func60_str8
	.asciz	"t"

	.section	__DATA,__const
	.globl	__func60_str8           ## @_func60_str8
	.p2align	3
__func60_str8:
	.quad	L_.str._func60_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str9:                    ## @.str._func60_str9
	.asciz	"\t"

	.section	__DATA,__const
	.globl	__func60_str9           ## @_func60_str9
	.p2align	3
__func60_str9:
	.quad	L_.str._func60_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str10:                   ## @.str._func60_str10
	.asciz	"\\"

	.section	__DATA,__const
	.globl	__func60_str10          ## @_func60_str10
	.p2align	3
__func60_str10:
	.quad	L_.str._func60_str10

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str11:                   ## @.str._func60_str11
	.asciz	"\\"

	.section	__DATA,__const
	.globl	__func60_str11          ## @_func60_str11
	.p2align	3
__func60_str11:
	.quad	L_.str._func60_str11

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str12:                   ## @.str._func60_str12
	.asciz	"\""

	.section	__DATA,__const
	.globl	__func60_str12          ## @_func60_str12
	.p2align	3
__func60_str12:
	.quad	L_.str._func60_str12

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str13:                   ## @.str._func60_str13
	.asciz	"\""

	.section	__DATA,__const
	.globl	__func60_str13          ## @_func60_str13
	.p2align	3
__func60_str13:
	.quad	L_.str._func60_str13

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str14:                   ## @.str._func60_str14
	.asciz	"a"

	.section	__DATA,__const
	.globl	__func60_str14          ## @_func60_str14
	.p2align	3
__func60_str14:
	.quad	L_.str._func60_str14

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str15:                   ## @.str._func60_str15
	.asciz	"\007"

	.section	__DATA,__const
	.globl	__func60_str15          ## @_func60_str15
	.p2align	3
__func60_str15:
	.quad	L_.str._func60_str15

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str16:                   ## @.str._func60_str16
	.asciz	"b"

	.section	__DATA,__const
	.globl	__func60_str16          ## @_func60_str16
	.p2align	3
__func60_str16:
	.quad	L_.str._func60_str16

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str17:                   ## @.str._func60_str17
	.asciz	"\b"

	.section	__DATA,__const
	.globl	__func60_str17          ## @_func60_str17
	.p2align	3
__func60_str17:
	.quad	L_.str._func60_str17

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str18:                   ## @.str._func60_str18
	.asciz	"v"

	.section	__DATA,__const
	.globl	__func60_str18          ## @_func60_str18
	.p2align	3
__func60_str18:
	.quad	L_.str._func60_str18

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str19:                   ## @.str._func60_str19
	.asciz	"\013"

	.section	__DATA,__const
	.globl	__func60_str19          ## @_func60_str19
	.p2align	3
__func60_str19:
	.quad	L_.str._func60_str19

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str20:                   ## @.str._func60_str20
	.asciz	"0"

	.section	__DATA,__const
	.globl	__func60_str20          ## @_func60_str20
	.p2align	3
__func60_str20:
	.quad	L_.str._func60_str20

	.section	__TEXT,__cstring,cstring_literals
L_.str._func60_str21:                   ## @.str._func60_str21
	.asciz	"too long string\n"

	.section	__DATA,__const
	.globl	__func60_str21          ## @_func60_str21
	.p2align	3
__func60_str21:
	.quad	L_.str._func60_str21

	.section	__TEXT,__cstring,cstring_literals
L_.str._func66_str1:                    ## @.str._func66_str1
	.asciz	"/"

	.section	__DATA,__const
	.globl	__func66_str1           ## @_func66_str1
	.p2align	3
__func66_str1:
	.quad	L_.str._func66_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func66_str2:                    ## @.str._func66_str2
	.asciz	".m"

	.section	__DATA,__const
	.globl	__func66_str2           ## @_func66_str2
	.p2align	3
__func66_str2:
	.quad	L_.str._func66_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func66_str3:                    ## @.str._func66_str3
	.asciz	"/main.m"

	.section	__DATA,__const
	.globl	__func66_str3           ## @_func66_str3
	.p2align	3
__func66_str3:
	.quad	L_.str._func66_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str.E_TYPE_ERROR:                    ## @.str.E_TYPE_ERROR
	.asciz	"type error"

	.section	__DATA,__const
	.globl	_E_TYPE_ERROR           ## @E_TYPE_ERROR
	.p2align	3
_E_TYPE_ERROR:
	.quad	L_.str.E_TYPE_ERROR

	.section	__TEXT,__cstring,cstring_literals
L_.str.E_EXPECTED_RETURN:               ## @.str.E_EXPECTED_RETURN
	.asciz	"expected return"

	.section	__DATA,__const
	.globl	_E_EXPECTED_RETURN      ## @E_EXPECTED_RETURN
	.p2align	3
_E_EXPECTED_RETURN:
	.quad	L_.str.E_EXPECTED_RETURN

	.section	__TEXT,__cstring,cstring_literals
L_.str._func70_str1:                    ## @.str._func70_str1
	.asciz	"\n%c[0;%dminfo:%c[0m %s"

	.section	__DATA,__const
	.globl	__func70_str1           ## @_func70_str1
	.p2align	3
__func70_str1:
	.quad	L_.str._func70_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func71_str1:                    ## @.str._func71_str1
	.asciz	"\n%c[0;%dmwarning%c[0m (%s:%d) : %s"

	.section	__DATA,__const
	.globl	__func71_str1           ## @_func71_str1
	.p2align	3
__func71_str1:
	.quad	L_.str._func71_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func71_str2:                    ## @.str._func71_str2
	.asciz	"\n%c[0;%dmwarning:%c[0m %s"

	.section	__DATA,__const
	.globl	__func71_str2           ## @_func71_str2
	.p2align	3
__func71_str2:
	.quad	L_.str._func71_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func71_str3:                    ## @.str._func71_str3
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func71_str3           ## @_func71_str3
	.p2align	3
__func71_str3:
	.quad	L_.str._func71_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func72_str1:                    ## @.str._func72_str1
	.asciz	"\n%c[0;%dmerror:%c[0m %s"

	.section	__DATA,__const
	.globl	__func72_str1           ## @_func72_str1
	.p2align	3
__func72_str1:
	.quad	L_.str._func72_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func72_str2:                    ## @.str._func72_str2
	.asciz	"\n%c[0;%dmerror%c[0m (%s:%d) : %s"

	.section	__DATA,__const
	.globl	__func72_str2           ## @_func72_str2
	.p2align	3
__func72_str2:
	.quad	L_.str._func72_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func72_str3:                    ## @.str._func72_str3
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func72_str3           ## @_func72_str3
	.p2align	3
__func72_str3:
	.quad	L_.str._func72_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func72_str4:                    ## @.str._func72_str4
	.asciz	"*** STOP ***\n"

	.section	__DATA,__const
	.globl	__func72_str4           ## @_func72_str4
	.p2align	3
__func72_str4:
	.quad	L_.str._func72_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func73_str1:                    ## @.str._func73_str1
	.asciz	"\n%c[0;%dm%s%c[0m"

	.section	__DATA,__const
	.globl	__func73_str1           ## @_func73_str1
	.p2align	3
__func73_str1:
	.quad	L_.str._func73_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func73_str2:                    ## @.str._func73_str2
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func73_str2           ## @_func73_str2
	.p2align	3
__func73_str2:
	.quad	L_.str._func73_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func74_str1:                    ## @.str._func74_str1
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func74_str1           ## @_func74_str1
	.p2align	3
__func74_str1:
	.quad	L_.str._func74_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func74_str2:                    ## @.str._func74_str2
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func74_str2           ## @_func74_str2
	.p2align	3
__func74_str2:
	.quad	L_.str._func74_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func75_str1:                    ## @.str._func75_str1
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func75_str1           ## @_func75_str1
	.p2align	3
__func75_str1:
	.quad	L_.str._func75_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func75_str2:                    ## @.str._func75_str2
	.asciz	"%s"

	.section	__DATA,__const
	.globl	__func75_str2           ## @_func75_str2
	.p2align	3
__func75_str2:
	.quad	L_.str._func75_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func75_str3:                    ## @.str._func75_str3
	.asciz	" "

	.section	__DATA,__const
	.globl	__func75_str3           ## @_func75_str3
	.p2align	3
__func75_str3:
	.quad	L_.str._func75_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func75_str4:                    ## @.str._func75_str4
	.asciz	"%c[0;%dm^%c[0m"

	.section	__DATA,__const
	.globl	__func75_str4           ## @_func75_str4
	.p2align	3
__func75_str4:
	.quad	L_.str._func75_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func76_str1:                    ## @.str._func76_str1
	.asciz	"%c[0;%dmfatal:%c[0m %s\n"

	.section	__DATA,__const
	.globl	__func76_str1           ## @_func76_str1
	.p2align	3
__func76_str1:
	.quad	L_.str._func76_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func77_str1:                    ## @.str._func77_str1
	.asciz	"%s"

	.section	__DATA,__const
	.globl	__func77_str1           ## @_func77_str1
	.p2align	3
__func77_str1:
	.quad	L_.str._func77_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func77_str2:                    ## @.str._func77_str2
	.asciz	"%s"

	.section	__DATA,__const
	.globl	__func77_str2           ## @_func77_str2
	.p2align	3
__func77_str2:
	.quad	L_.str._func77_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func77_str3:                    ## @.str._func77_str3
	.asciz	"*"

	.section	__DATA,__const
	.globl	__func77_str3           ## @_func77_str3
	.p2align	3
__func77_str3:
	.quad	L_.str._func77_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func77_str4:                    ## @.str._func77_str4
	.asciz	"<TypeUnknown>"

	.section	__DATA,__const
	.globl	__func77_str4           ## @_func77_str4
	.p2align	3
__func77_str4:
	.quad	L_.str._func77_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func77_str5:                    ## @.str._func77_str5
	.asciz	"<TypeNumeric>"

	.section	__DATA,__const
	.globl	__func77_str5           ## @_func77_str5
	.p2align	3
__func77_str5:
	.quad	L_.str._func77_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func77_str6:                    ## @.str._func77_str6
	.asciz	"unkn type kind %d, maybe func?"

	.section	__DATA,__const
	.globl	__func77_str6           ## @_func77_str6
	.p2align	3
__func77_str6:
	.quad	L_.str._func77_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func78_str1:                    ## @.str._func78_str1
	.asciz	"("

	.section	__DATA,__const
	.globl	__func78_str1           ## @_func78_str1
	.p2align	3
__func78_str1:
	.quad	L_.str._func78_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func79_str1:                    ## @.str._func79_str1
	.asciz	"%s : "

	.section	__DATA,__const
	.globl	__func79_str1           ## @_func79_str1
	.p2align	3
__func79_str1:
	.quad	L_.str._func79_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func79_str2:                    ## @.str._func79_str2
	.asciz	", "

	.section	__DATA,__const
	.globl	__func79_str2           ## @_func79_str2
	.p2align	3
__func79_str2:
	.quad	L_.str._func79_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func78_str2:                    ## @.str._func78_str2
	.asciz	")"

	.section	__DATA,__const
	.globl	__func78_str2           ## @_func78_str2
	.p2align	3
__func78_str2:
	.quad	L_.str._func78_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func78_str3:                    ## @.str._func78_str3
	.asciz	"<record:0x%02x>"

	.section	__DATA,__const
	.globl	__func78_str3           ## @_func78_str3
	.p2align	3
__func78_str3:
	.quad	L_.str._func78_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func80_str1:                    ## @.str._func80_str1
	.asciz	"{"

	.section	__DATA,__const
	.globl	__func80_str1           ## @_func80_str1
	.p2align	3
__func80_str1:
	.quad	L_.str._func80_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func81_str1:                    ## @.str._func81_str1
	.asciz	"%s, "

	.section	__DATA,__const
	.globl	__func81_str1           ## @_func81_str1
	.p2align	3
__func81_str1:
	.quad	L_.str._func81_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func80_str2:                    ## @.str._func80_str2
	.asciz	"}"

	.section	__DATA,__const
	.globl	__func80_str2           ## @_func80_str2
	.p2align	3
__func80_str2:
	.quad	L_.str._func80_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func82_str1:                    ## @.str._func82_str1
	.asciz	"[]"

	.section	__DATA,__const
	.globl	__func82_str1           ## @_func82_str1
	.p2align	3
__func82_str1:
	.quad	L_.str._func82_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func82_str2:                    ## @.str._func82_str2
	.asciz	"[%d]"

	.section	__DATA,__const
	.globl	__func82_str2           ## @_func82_str2
	.p2align	3
__func82_str2:
	.quad	L_.str._func82_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func83_str1:                    ## @.str._func83_str1
	.asciz	"("

	.section	__DATA,__const
	.globl	__func83_str1           ## @_func83_str1
	.p2align	3
__func83_str1:
	.quad	L_.str._func83_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func84_str1:                    ## @.str._func84_str1
	.asciz	", "

	.section	__DATA,__const
	.globl	__func84_str1           ## @_func84_str1
	.p2align	3
__func84_str1:
	.quad	L_.str._func84_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func84_str2:                    ## @.str._func84_str2
	.asciz	"%s : "

	.section	__DATA,__const
	.globl	__func84_str2           ## @_func84_str2
	.p2align	3
__func84_str2:
	.quad	L_.str._func84_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func83_str2:                    ## @.str._func83_str2
	.asciz	") -> "

	.section	__DATA,__const
	.globl	__func83_str2           ## @_func83_str2
	.p2align	3
__func83_str2:
	.quad	L_.str._func83_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func87_str1:                    ## @.str._func87_str1
	.asciz	"field_new"

	.section	__DATA,__const
	.globl	__func87_str1           ## @_func87_str1
	.p2align	3
__func87_str1:
	.quad	L_.str._func87_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func104_str1:                   ## @.str._func104_str1
	.asciz	"unknown type"

	.section	__DATA,__const
	.globl	__func104_str1          ## @_func104_str1
	.p2align	3
__func104_str1:
	.quad	L_.str._func104_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func107_str1:                   ## @.str._func107_str1
	.asciz	"m2/type/func f1.id == Nil!"

	.section	__DATA,__const
	.globl	__func107_str1          ## @_func107_str1
	.p2align	3
__func107_str1:
	.quad	L_.str._func107_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func107_str2:                   ## @.str._func107_str2
	.asciz	"m2/type/func f2.id == Nil!"

	.section	__DATA,__const
	.globl	__func107_str2          ## @_func107_str2
	.p2align	3
__func107_str2:
	.quad	L_.str._func107_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func110_str1:                   ## @.str._func110_str1
	.asciz	"type_eq unknown type kind"

	.section	__DATA,__const
	.globl	__func110_str1          ## @_func110_str1
	.p2align	3
__func110_str1:
	.quad	L_.str._func110_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str1:                   ## @.str._func111_str1
	.asciz	"Unit"

	.section	__DATA,__const
	.globl	__func111_str1          ## @_func111_str1
	.p2align	3
__func111_str1:
	.quad	L_.str._func111_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str2:                   ## @.str._func111_str2
	.asciz	"Bool"

	.section	__DATA,__const
	.globl	__func111_str2          ## @_func111_str2
	.p2align	3
__func111_str2:
	.quad	L_.str._func111_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str3:                   ## @.str._func111_str3
	.asciz	"Unit"

	.section	__DATA,__const
	.globl	__func111_str3          ## @_func111_str3
	.p2align	3
__func111_str3:
	.quad	L_.str._func111_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str4:                   ## @.str._func111_str4
	.asciz	"Bool"

	.section	__DATA,__const
	.globl	__func111_str4          ## @_func111_str4
	.p2align	3
__func111_str4:
	.quad	L_.str._func111_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str5:                   ## @.str._func111_str5
	.asciz	"Int8"

	.section	__DATA,__const
	.globl	__func111_str5          ## @_func111_str5
	.p2align	3
__func111_str5:
	.quad	L_.str._func111_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str6:                   ## @.str._func111_str6
	.asciz	"Int16"

	.section	__DATA,__const
	.globl	__func111_str6          ## @_func111_str6
	.p2align	3
__func111_str6:
	.quad	L_.str._func111_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str7:                   ## @.str._func111_str7
	.asciz	"Int32"

	.section	__DATA,__const
	.globl	__func111_str7          ## @_func111_str7
	.p2align	3
__func111_str7:
	.quad	L_.str._func111_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str8:                   ## @.str._func111_str8
	.asciz	"Int64"

	.section	__DATA,__const
	.globl	__func111_str8          ## @_func111_str8
	.p2align	3
__func111_str8:
	.quad	L_.str._func111_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str9:                   ## @.str._func111_str9
	.asciz	"Int128"

	.section	__DATA,__const
	.globl	__func111_str9          ## @_func111_str9
	.p2align	3
__func111_str9:
	.quad	L_.str._func111_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str10:                  ## @.str._func111_str10
	.asciz	"Int256"

	.section	__DATA,__const
	.globl	__func111_str10         ## @_func111_str10
	.p2align	3
__func111_str10:
	.quad	L_.str._func111_str10

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str11:                  ## @.str._func111_str11
	.asciz	"Int512"

	.section	__DATA,__const
	.globl	__func111_str11         ## @_func111_str11
	.p2align	3
__func111_str11:
	.quad	L_.str._func111_str11

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str12:                  ## @.str._func111_str12
	.asciz	"Int1024"

	.section	__DATA,__const
	.globl	__func111_str12         ## @_func111_str12
	.p2align	3
__func111_str12:
	.quad	L_.str._func111_str12

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str13:                  ## @.str._func111_str13
	.asciz	"Nat8"

	.section	__DATA,__const
	.globl	__func111_str13         ## @_func111_str13
	.p2align	3
__func111_str13:
	.quad	L_.str._func111_str13

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str14:                  ## @.str._func111_str14
	.asciz	"Nat16"

	.section	__DATA,__const
	.globl	__func111_str14         ## @_func111_str14
	.p2align	3
__func111_str14:
	.quad	L_.str._func111_str14

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str15:                  ## @.str._func111_str15
	.asciz	"Nat32"

	.section	__DATA,__const
	.globl	__func111_str15         ## @_func111_str15
	.p2align	3
__func111_str15:
	.quad	L_.str._func111_str15

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str16:                  ## @.str._func111_str16
	.asciz	"Nat64"

	.section	__DATA,__const
	.globl	__func111_str16         ## @_func111_str16
	.p2align	3
__func111_str16:
	.quad	L_.str._func111_str16

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str17:                  ## @.str._func111_str17
	.asciz	"Nat128"

	.section	__DATA,__const
	.globl	__func111_str17         ## @_func111_str17
	.p2align	3
__func111_str17:
	.quad	L_.str._func111_str17

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str18:                  ## @.str._func111_str18
	.asciz	"Nat256"

	.section	__DATA,__const
	.globl	__func111_str18         ## @_func111_str18
	.p2align	3
__func111_str18:
	.quad	L_.str._func111_str18

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str19:                  ## @.str._func111_str19
	.asciz	"Nat512"

	.section	__DATA,__const
	.globl	__func111_str19         ## @_func111_str19
	.p2align	3
__func111_str19:
	.quad	L_.str._func111_str19

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str20:                  ## @.str._func111_str20
	.asciz	"Nat1024"

	.section	__DATA,__const
	.globl	__func111_str20         ## @_func111_str20
	.p2align	3
__func111_str20:
	.quad	L_.str._func111_str20

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str21:                  ## @.str._func111_str21
	.asciz	"Int64"

	.section	__DATA,__const
	.globl	__func111_str21         ## @_func111_str21
	.p2align	3
__func111_str21:
	.quad	L_.str._func111_str21

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str22:                  ## @.str._func111_str22
	.asciz	"Nat64"

	.section	__DATA,__const
	.globl	__func111_str22         ## @_func111_str22
	.p2align	3
__func111_str22:
	.quad	L_.str._func111_str22

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str23:                  ## @.str._func111_str23
	.asciz	"Int32"

	.section	__DATA,__const
	.globl	__func111_str23         ## @_func111_str23
	.p2align	3
__func111_str23:
	.quad	L_.str._func111_str23

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str24:                  ## @.str._func111_str24
	.asciz	"Nat32"

	.section	__DATA,__const
	.globl	__func111_str24         ## @_func111_str24
	.p2align	3
__func111_str24:
	.quad	L_.str._func111_str24

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str25:                  ## @.str._func111_str25
	.asciz	"Int8"

	.section	__DATA,__const
	.globl	__func111_str25         ## @_func111_str25
	.p2align	3
__func111_str25:
	.quad	L_.str._func111_str25

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str26:                  ## @.str._func111_str26
	.asciz	"Nat8"

	.section	__DATA,__const
	.globl	__func111_str26         ## @_func111_str26
	.p2align	3
__func111_str26:
	.quad	L_.str._func111_str26

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str27:                  ## @.str._func111_str27
	.asciz	"Int16"

	.section	__DATA,__const
	.globl	__func111_str27         ## @_func111_str27
	.p2align	3
__func111_str27:
	.quad	L_.str._func111_str27

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str28:                  ## @.str._func111_str28
	.asciz	"Nat16"

	.section	__DATA,__const
	.globl	__func111_str28         ## @_func111_str28
	.p2align	3
__func111_str28:
	.quad	L_.str._func111_str28

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str29:                  ## @.str._func111_str29
	.asciz	"Str"

	.section	__DATA,__const
	.globl	__func111_str29         ## @_func111_str29
	.p2align	3
__func111_str29:
	.quad	L_.str._func111_str29

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str30:                  ## @.str._func111_str30
	.asciz	"Str"

	.section	__DATA,__const
	.globl	__func111_str30         ## @_func111_str30
	.p2align	3
__func111_str30:
	.quad	L_.str._func111_str30

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str31:                  ## @.str._func111_str31
	.asciz	"Int128"

	.section	__DATA,__const
	.globl	__func111_str31         ## @_func111_str31
	.p2align	3
__func111_str31:
	.quad	L_.str._func111_str31

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str32:                  ## @.str._func111_str32
	.asciz	"Int256"

	.section	__DATA,__const
	.globl	__func111_str32         ## @_func111_str32
	.p2align	3
__func111_str32:
	.quad	L_.str._func111_str32

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str33:                  ## @.str._func111_str33
	.asciz	"Int512"

	.section	__DATA,__const
	.globl	__func111_str33         ## @_func111_str33
	.p2align	3
__func111_str33:
	.quad	L_.str._func111_str33

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str34:                  ## @.str._func111_str34
	.asciz	"Int1024"

	.section	__DATA,__const
	.globl	__func111_str34         ## @_func111_str34
	.p2align	3
__func111_str34:
	.quad	L_.str._func111_str34

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str35:                  ## @.str._func111_str35
	.asciz	"Nat128"

	.section	__DATA,__const
	.globl	__func111_str35         ## @_func111_str35
	.p2align	3
__func111_str35:
	.quad	L_.str._func111_str35

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str36:                  ## @.str._func111_str36
	.asciz	"Nat256"

	.section	__DATA,__const
	.globl	__func111_str36         ## @_func111_str36
	.p2align	3
__func111_str36:
	.quad	L_.str._func111_str36

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str37:                  ## @.str._func111_str37
	.asciz	"Nat512"

	.section	__DATA,__const
	.globl	__func111_str37         ## @_func111_str37
	.p2align	3
__func111_str37:
	.quad	L_.str._func111_str37

	.section	__TEXT,__cstring,cstring_literals
L_.str._func111_str38:                  ## @.str._func111_str38
	.asciz	"Nat1024"

	.section	__DATA,__const
	.globl	__func111_str38         ## @_func111_str38
	.p2align	3
__func111_str38:
	.quad	L_.str._func111_str38

	.section	__TEXT,__cstring,cstring_literals
L_.str._func112_str1:                   ## @.str._func112_str1
	.asciz	"type_new"

	.section	__DATA,__const
	.globl	__func112_str1          ## @_func112_str1
	.p2align	3
__func112_str1:
	.quad	L_.str._func112_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func118_str1:                   ## @.str._func118_str1
	.asciz	"unknown type"

	.section	__DATA,__const
	.globl	__func118_str1          ## @_func118_str1
	.p2align	3
__func118_str1:
	.quad	L_.str._func118_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func119_str1:                   ## @.str._func119_str1
	.asciz	"type bind error: attempt to id redefinition"

	.section	__DATA,__const
	.globl	__func119_str1          ## @_func119_str1
	.p2align	3
__func119_str1:
	.quad	L_.str._func119_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func125_str1:                   ## @.str._func125_str1
	.asciz	"value bind error: attempt to id redefinition"

	.section	__DATA,__const
	.globl	__func125_str1          ## @_func125_str1
	.p2align	3
__func125_str1:
	.quad	L_.str._func125_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func129_str1:                   ## @.str._func129_str1
	.asciz	"self"

	.section	__DATA,__const
	.globl	__func129_str1          ## @_func129_str1
	.p2align	3
__func129_str1:
	.quad	L_.str._func129_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func132_str1:                   ## @.str._func132_str1
	.asciz	"attempt to redeclaration"

	.section	__DATA,__const
	.globl	__func132_str1          ## @_func132_str1
	.p2align	3
__func132_str1:
	.quad	L_.str._func132_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func132_str2:                   ## @.str._func132_str2
	.asciz	"declared at: "

	.section	__DATA,__const
	.globl	__func132_str2          ## @_func132_str2
	.p2align	3
__func132_str2:
	.quad	L_.str._func132_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func133_str1:                   ## @.str._func133_str1
	.asciz	"define: id == Nil"

	.section	__DATA,__const
	.globl	__func133_str1          ## @_func133_str1
	.p2align	3
__func133_str1:
	.quad	L_.str._func133_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func133_str2:                   ## @.str._func133_str2
	.asciz	"define: v == Nil"

	.section	__DATA,__const
	.globl	__func133_str2          ## @_func133_str2
	.p2align	3
__func133_str2:
	.quad	L_.str._func133_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func133_str3:                   ## @.str._func133_str3
	.asciz	"attempt to redefinition"

	.section	__DATA,__const
	.globl	__func133_str3          ## @_func133_str3
	.p2align	3
__func133_str3:
	.quad	L_.str._func133_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func135_str1:                   ## @.str._func135_str1
	.asciz	"%s%u"

	.section	__DATA,__const
	.globl	__func135_str1          ## @_func135_str1
	.p2align	3
__func135_str1:
	.quad	L_.str._func135_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func136_str1:                   ## @.str._func136_str1
	.space	1

	.section	__DATA,__const
	.globl	__func136_str1          ## @_func136_str1
	.p2align	3
__func136_str1:
	.quad	L_.str._func136_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func137_str1:                   ## @.str._func137_str1
	.asciz	"_"

	.section	__DATA,__const
	.globl	__func137_str1          ## @_func137_str1
	.p2align	3
__func137_str1:
	.quad	L_.str._func137_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func138_str1:                   ## @.str._func138_str1
	.asciz	"func"

	.section	__DATA,__const
	.globl	__func138_str1          ## @_func138_str1
	.p2align	3
__func138_str1:
	.quad	L_.str._func138_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func139_str1:                   ## @.str._func139_str1
	.asciz	"str"

	.section	__DATA,__const
	.globl	__func139_str1          ## @_func139_str1
	.p2align	3
__func139_str1:
	.quad	L_.str._func139_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func140_str1:                   ## @.str._func140_str1
	.asciz	"arr"

	.section	__DATA,__const
	.globl	__func140_str1          ## @_func140_str1
	.p2align	3
__func140_str1:
	.quad	L_.str._func140_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func141_str1:                   ## @.str._func141_str1
	.asciz	"var"

	.section	__DATA,__const
	.globl	__func141_str1          ## @_func141_str1
	.p2align	3
__func141_str1:
	.quad	L_.str._func141_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func142_str1:                   ## @.str._func142_str1
	.asciz	"Type"

	.section	__DATA,__const
	.globl	__func142_str1          ## @_func142_str1
	.p2align	3
__func142_str1:
	.quad	L_.str._func142_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func143_str1:                   ## @.str._func143_str1
	.asciz	"expected constant value"

	.section	__DATA,__const
	.globl	__func143_str1          ## @_func143_str1
	.p2align	3
__func143_str1:
	.quad	L_.str._func143_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func144_str1:                   ## @.str._func144_str1
	.asciz	"or"

	.section	__DATA,__const
	.globl	__func144_str1          ## @_func144_str1
	.p2align	3
__func144_str1:
	.quad	L_.str._func144_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func145_str1:                   ## @.str._func145_str1
	.asciz	"xor"

	.section	__DATA,__const
	.globl	__func145_str1          ## @_func145_str1
	.p2align	3
__func145_str1:
	.quad	L_.str._func145_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func146_str1:                   ## @.str._func146_str1
	.asciz	"and"

	.section	__DATA,__const
	.globl	__func146_str1          ## @_func146_str1
	.p2align	3
__func146_str1:
	.quad	L_.str._func146_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func147_str1:                   ## @.str._func147_str1
	.asciz	"=="

	.section	__DATA,__const
	.globl	__func147_str1          ## @_func147_str1
	.p2align	3
__func147_str1:
	.quad	L_.str._func147_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func147_str2:                   ## @.str._func147_str2
	.asciz	"!="

	.section	__DATA,__const
	.globl	__func147_str2          ## @_func147_str2
	.p2align	3
__func147_str2:
	.quad	L_.str._func147_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func148_str1:                   ## @.str._func148_str1
	.asciz	"<"

	.section	__DATA,__const
	.globl	__func148_str1          ## @_func148_str1
	.p2align	3
__func148_str1:
	.quad	L_.str._func148_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func148_str2:                   ## @.str._func148_str2
	.asciz	">"

	.section	__DATA,__const
	.globl	__func148_str2          ## @_func148_str2
	.p2align	3
__func148_str2:
	.quad	L_.str._func148_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func148_str3:                   ## @.str._func148_str3
	.asciz	"<="

	.section	__DATA,__const
	.globl	__func148_str3          ## @_func148_str3
	.p2align	3
__func148_str3:
	.quad	L_.str._func148_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func148_str4:                   ## @.str._func148_str4
	.asciz	">="

	.section	__DATA,__const
	.globl	__func148_str4          ## @_func148_str4
	.p2align	3
__func148_str4:
	.quad	L_.str._func148_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func149_str1:                   ## @.str._func149_str1
	.asciz	"<<"

	.section	__DATA,__const
	.globl	__func149_str1          ## @_func149_str1
	.p2align	3
__func149_str1:
	.quad	L_.str._func149_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func149_str2:                   ## @.str._func149_str2
	.asciz	">>"

	.section	__DATA,__const
	.globl	__func149_str2          ## @_func149_str2
	.p2align	3
__func149_str2:
	.quad	L_.str._func149_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func150_str1:                   ## @.str._func150_str1
	.asciz	"+"

	.section	__DATA,__const
	.globl	__func150_str1          ## @_func150_str1
	.p2align	3
__func150_str1:
	.quad	L_.str._func150_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func150_str2:                   ## @.str._func150_str2
	.asciz	"-"

	.section	__DATA,__const
	.globl	__func150_str2          ## @_func150_str2
	.p2align	3
__func150_str2:
	.quad	L_.str._func150_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func151_str1:                   ## @.str._func151_str1
	.asciz	"*"

	.section	__DATA,__const
	.globl	__func151_str1          ## @_func151_str1
	.p2align	3
__func151_str1:
	.quad	L_.str._func151_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func151_str2:                   ## @.str._func151_str2
	.asciz	"/"

	.section	__DATA,__const
	.globl	__func151_str2          ## @_func151_str2
	.p2align	3
__func151_str2:
	.quad	L_.str._func151_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func151_str3:                   ## @.str._func151_str3
	.asciz	"%"

	.section	__DATA,__const
	.globl	__func151_str3          ## @_func151_str3
	.p2align	3
__func151_str3:
	.quad	L_.str._func151_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func152_str1:                   ## @.str._func152_str1
	.asciz	"to"

	.section	__DATA,__const
	.globl	__func152_str1          ## @_func152_str1
	.p2align	3
__func152_str1:
	.quad	L_.str._func152_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func153_str1:                   ## @.str._func153_str1
	.asciz	"*"

	.section	__DATA,__const
	.globl	__func153_str1          ## @_func153_str1
	.p2align	3
__func153_str1:
	.quad	L_.str._func153_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func153_str2:                   ## @.str._func153_str2
	.asciz	"&"

	.section	__DATA,__const
	.globl	__func153_str2          ## @_func153_str2
	.p2align	3
__func153_str2:
	.quad	L_.str._func153_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func153_str3:                   ## @.str._func153_str3
	.asciz	"not"

	.section	__DATA,__const
	.globl	__func153_str3          ## @_func153_str3
	.p2align	3
__func153_str3:
	.quad	L_.str._func153_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func153_str4:                   ## @.str._func153_str4
	.asciz	"-"

	.section	__DATA,__const
	.globl	__func153_str4          ## @_func153_str4
	.p2align	3
__func153_str4:
	.quad	L_.str._func153_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func153_str5:                   ## @.str._func153_str5
	.asciz	"sizeof"

	.section	__DATA,__const
	.globl	__func153_str5          ## @_func153_str5
	.p2align	3
__func153_str5:
	.quad	L_.str._func153_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func153_str6:                   ## @.str._func153_str6
	.asciz	"sizeof expected <type>"

	.section	__DATA,__const
	.globl	__func153_str6          ## @_func153_str6
	.p2align	3
__func153_str6:
	.quad	L_.str._func153_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func153_str7:                   ## @.str._func153_str7
	.asciz	"alignof"

	.section	__DATA,__const
	.globl	__func153_str7          ## @_func153_str7
	.p2align	3
__func153_str7:
	.quad	L_.str._func153_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func153_str8:                   ## @.str._func153_str8
	.asciz	"alignof expected <type>"

	.section	__DATA,__const
	.globl	__func153_str8          ## @_func153_str8
	.p2align	3
__func153_str8:
	.quad	L_.str._func153_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func154_str1:                   ## @.str._func154_str1
	.asciz	"("

	.section	__DATA,__const
	.globl	__func154_str1          ## @_func154_str1
	.p2align	3
__func154_str1:
	.quad	L_.str._func154_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func154_str2:                   ## @.str._func154_str2
	.asciz	")"

	.section	__DATA,__const
	.globl	__func154_str2          ## @_func154_str2
	.p2align	3
__func154_str2:
	.quad	L_.str._func154_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func154_str3:                   ## @.str._func154_str3
	.asciz	",)"

	.section	__DATA,__const
	.globl	__func154_str3          ## @_func154_str3
	.p2align	3
__func154_str3:
	.quad	L_.str._func154_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func154_str4:                   ## @.str._func154_str4
	.asciz	","

	.section	__DATA,__const
	.globl	__func154_str4          ## @_func154_str4
	.p2align	3
__func154_str4:
	.quad	L_.str._func154_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func154_str5:                   ## @.str._func154_str5
	.asciz	")"

	.section	__DATA,__const
	.globl	__func154_str5          ## @_func154_str5
	.p2align	3
__func154_str5:
	.quad	L_.str._func154_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func154_str6:                   ## @.str._func154_str6
	.asciz	")"

	.section	__DATA,__const
	.globl	__func154_str6          ## @_func154_str6
	.p2align	3
__func154_str6:
	.quad	L_.str._func154_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func154_str7:                   ## @.str._func154_str7
	.asciz	","

	.section	__DATA,__const
	.globl	__func154_str7          ## @_func154_str7
	.p2align	3
__func154_str7:
	.quad	L_.str._func154_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func154_str8:                   ## @.str._func154_str8
	.asciz	"["

	.section	__DATA,__const
	.globl	__func154_str8          ## @_func154_str8
	.p2align	3
__func154_str8:
	.quad	L_.str._func154_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func154_str9:                   ## @.str._func154_str9
	.asciz	"]"

	.section	__DATA,__const
	.globl	__func154_str9          ## @_func154_str9
	.p2align	3
__func154_str9:
	.quad	L_.str._func154_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func154_str10:                  ## @.str._func154_str10
	.asciz	"."

	.section	__DATA,__const
	.globl	__func154_str10         ## @_func154_str10
	.p2align	3
__func154_str10:
	.quad	L_.str._func154_str10

	.section	__TEXT,__cstring,cstring_literals
L_.str._func155_str1:                   ## @.str._func155_str1
	.asciz	"("

	.section	__DATA,__const
	.globl	__func155_str1          ## @_func155_str1
	.p2align	3
__func155_str1:
	.quad	L_.str._func155_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func155_str2:                   ## @.str._func155_str2
	.asciz	")"

	.section	__DATA,__const
	.globl	__func155_str2          ## @_func155_str2
	.p2align	3
__func155_str2:
	.quad	L_.str._func155_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func156_str1:                   ## @.str._func156_str1
	.asciz	"func"

	.section	__DATA,__const
	.globl	__func156_str1          ## @_func156_str1
	.p2align	3
__func156_str1:
	.quad	L_.str._func156_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func156_str2:                   ## @.str._func156_str2
	.asciz	"array"

	.section	__DATA,__const
	.globl	__func156_str2          ## @_func156_str2
	.p2align	3
__func156_str2:
	.quad	L_.str._func156_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func156_str3:                   ## @.str._func156_str3
	.asciz	"term: unexpected token\n"

	.section	__DATA,__const
	.globl	__func156_str3          ## @_func156_str3
	.p2align	3
__func156_str3:
	.quad	L_.str._func156_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func156_str4:                   ## @.str._func156_str4
	.asciz	"tt=%d\n"

	.section	__DATA,__const
	.globl	__func156_str4          ## @_func156_str4
	.p2align	3
__func156_str4:
	.quad	L_.str._func156_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func156_str5:                   ## @.str._func156_str5
	.asciz	"token = %s\n"

	.section	__DATA,__const
	.globl	__func156_str5          ## @_func156_str5
	.p2align	3
__func156_str5:
	.quad	L_.str._func156_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func158_str1:                   ## @.str._func158_str1
	.asciz	"{"

	.section	__DATA,__const
	.globl	__func158_str1          ## @_func158_str1
	.p2align	3
__func158_str1:
	.quad	L_.str._func158_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func158_str2:                   ## @.str._func158_str2
	.asciz	"}"

	.section	__DATA,__const
	.globl	__func158_str2          ## @_func158_str2
	.p2align	3
__func158_str2:
	.quad	L_.str._func158_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func158_str3:                   ## @.str._func158_str3
	.asciz	","

	.section	__DATA,__const
	.globl	__func158_str3          ## @_func158_str3
	.p2align	3
__func158_str3:
	.quad	L_.str._func158_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func158_str4:                   ## @.str._func158_str4
	.asciz	","

	.section	__DATA,__const
	.globl	__func158_str4          ## @_func158_str4
	.p2align	3
__func158_str4:
	.quad	L_.str._func158_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func159_str1:                   ## @.str._func159_str1
	.asciz	"funcdef id fail"

	.section	__DATA,__const
	.globl	__func159_str1          ## @_func159_str1
	.p2align	3
__func159_str1:
	.quad	L_.str._func159_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func159_str2:                   ## @.str._func159_str2
	.asciz	"funcdef type fail"

	.section	__DATA,__const
	.globl	__func159_str2          ## @_func159_str2
	.p2align	3
__func159_str2:
	.quad	L_.str._func159_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func159_str3:                   ## @.str._func159_str3
	.asciz	"{"

	.section	__DATA,__const
	.globl	__func159_str3          ## @_func159_str3
	.p2align	3
__func159_str3:
	.quad	L_.str._func159_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func161_str1:                   ## @.str._func161_str1
	.asciz	"0"

	.section	__DATA,__const
	.globl	__func161_str1          ## @_func161_str1
	.p2align	3
__func161_str1:
	.quad	L_.str._func161_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func161_str2:                   ## @.str._func161_str2
	.asciz	"x"

	.section	__DATA,__const
	.globl	__func161_str2          ## @_func161_str2
	.p2align	3
__func161_str2:
	.quad	L_.str._func161_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func161_str3:                   ## @.str._func161_str3
	.asciz	"%llx"

	.section	__DATA,__const
	.globl	__func161_str3          ## @_func161_str3
	.p2align	3
__func161_str3:
	.quad	L_.str._func161_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func161_str4:                   ## @.str._func161_str4
	.asciz	"%lld"

	.section	__DATA,__const
	.globl	__func161_str4          ## @_func161_str4
	.p2align	3
__func161_str4:
	.quad	L_.str._func161_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func165_str1:                   ## @.str._func165_str1
	.asciz	"}"

	.section	__DATA,__const
	.globl	__func165_str1          ## @_func165_str1
	.p2align	3
__func165_str1:
	.quad	L_.str._func165_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func165_str2:                   ## @.str._func165_str2
	.asciz	"unexpected end-of-file"

	.section	__DATA,__const
	.globl	__func165_str2          ## @_func165_str2
	.p2align	3
__func165_str2:
	.quad	L_.str._func165_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func165_str3:                   ## @.str._func165_str3
	.asciz	"}"

	.section	__DATA,__const
	.globl	__func165_str3          ## @_func165_str3
	.p2align	3
__func165_str3:
	.quad	L_.str._func165_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func169_str1:                   ## @.str._func169_str1
	.asciz	"expr_new::malloc"

	.section	__DATA,__const
	.globl	__func169_str1          ## @_func169_str1
	.p2align	3
__func169_str1:
	.quad	L_.str._func169_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func171_str1:                   ## @.str._func171_str1
	.asciz	"="

	.section	__DATA,__const
	.globl	__func171_str1          ## @_func171_str1
	.p2align	3
__func171_str1:
	.quad	L_.str._func171_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func171_str2:                   ## @.str._func171_str2
	.asciz	"stmt::fail_with_restore\n"

	.section	__DATA,__const
	.globl	__func171_str2          ## @_func171_str2
	.p2align	3
__func171_str2:
	.quad	L_.str._func171_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func171_str3:                   ## @.str._func171_str3
	.asciz	"YYY = %s\n"

	.section	__DATA,__const
	.globl	__func171_str3          ## @_func171_str3
	.p2align	3
__func171_str3:
	.quad	L_.str._func171_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func174_str1:                   ## @.str._func174_str1
	.asciz	"invalid lval"

	.section	__DATA,__const
	.globl	__func174_str1          ## @_func174_str1
	.p2align	3
__func174_str1:
	.quad	L_.str._func174_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func174_str2:                   ## @.str._func174_str2
	.asciz	"type error"

	.section	__DATA,__const
	.globl	__func174_str2          ## @_func174_str2
	.p2align	3
__func174_str2:
	.quad	L_.str._func174_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func174_str3:                   ## @.str._func174_str3
	.asciz	"LTYPE = "

	.section	__DATA,__const
	.globl	__func174_str3          ## @_func174_str3
	.p2align	3
__func174_str3:
	.quad	L_.str._func174_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func174_str4:                   ## @.str._func174_str4
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func174_str4          ## @_func174_str4
	.p2align	3
__func174_str4:
	.quad	L_.str._func174_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func174_str5:                   ## @.str._func174_str5
	.asciz	"RTYPE = "

	.section	__DATA,__const
	.globl	__func174_str5          ## @_func174_str5
	.p2align	3
__func174_str5:
	.quad	L_.str._func174_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func174_str6:                   ## @.str._func174_str6
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func174_str6          ## @_func174_str6
	.p2align	3
__func174_str6:
	.quad	L_.str._func174_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func175_str1:                   ## @.str._func175_str1
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func175_str1          ## @_func175_str1
	.p2align	3
__func175_str1:
	.quad	L_.str._func175_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func175_str2:                   ## @.str._func175_str2
	.asciz	"{"

	.section	__DATA,__const
	.globl	__func175_str2          ## @_func175_str2
	.p2align	3
__func175_str2:
	.quad	L_.str._func175_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func175_str3:                   ## @.str._func175_str3
	.asciz	"else"

	.section	__DATA,__const
	.globl	__func175_str3          ## @_func175_str3
	.p2align	3
__func175_str3:
	.quad	L_.str._func175_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func175_str4:                   ## @.str._func175_str4
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func175_str4          ## @_func175_str4
	.p2align	3
__func175_str4:
	.quad	L_.str._func175_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func175_str5:                   ## @.str._func175_str5
	.asciz	"if"

	.section	__DATA,__const
	.globl	__func175_str5          ## @_func175_str5
	.p2align	3
__func175_str5:
	.quad	L_.str._func175_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func175_str6:                   ## @.str._func175_str6
	.asciz	"{"

	.section	__DATA,__const
	.globl	__func175_str6          ## @_func175_str6
	.p2align	3
__func175_str6:
	.quad	L_.str._func175_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func176_str1:                   ## @.str._func176_str1
	.asciz	"expected Bool expression"

	.section	__DATA,__const
	.globl	__func176_str1          ## @_func176_str1
	.p2align	3
__func176_str1:
	.quad	L_.str._func176_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func177_str1:                   ## @.str._func177_str1
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func177_str1          ## @_func177_str1
	.p2align	3
__func177_str1:
	.quad	L_.str._func177_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func177_str2:                   ## @.str._func177_str2
	.asciz	"{"

	.section	__DATA,__const
	.globl	__func177_str2          ## @_func177_str2
	.p2align	3
__func177_str2:
	.quad	L_.str._func177_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func178_str1:                   ## @.str._func178_str1
	.asciz	"expected Bool expression"

	.section	__DATA,__const
	.globl	__func178_str1          ## @_func178_str1
	.p2align	3
__func178_str1:
	.quad	L_.str._func178_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func179_str1:                   ## @.str._func179_str1
	.asciz	"expected return expression"

	.section	__DATA,__const
	.globl	__func179_str1          ## @_func179_str1
	.p2align	3
__func179_str1:
	.quad	L_.str._func179_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func181_str1:                   ## @.str._func181_str1
	.asciz	"`break` outside any loop operator"

	.section	__DATA,__const
	.globl	__func181_str1          ## @_func181_str1
	.p2align	3
__func181_str1:
	.quad	L_.str._func181_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func182_str1:                   ## @.str._func182_str1
	.asciz	"`continue` outside any loop operator"

	.section	__DATA,__const
	.globl	__func182_str1          ## @_func182_str1
	.p2align	3
__func182_str1:
	.quad	L_.str._func182_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func183_str1:                   ## @.str._func183_str1
	.asciz	"expected label"

	.section	__DATA,__const
	.globl	__func183_str1          ## @_func183_str1
	.p2align	3
__func183_str1:
	.quad	L_.str._func183_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func185_str1:                   ## @.str._func185_str1
	.asciz	"stmt_new"

	.section	__DATA,__const
	.globl	__func185_str1          ## @_func185_str1
	.p2align	3
__func185_str1:
	.quad	L_.str._func185_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func187_str1:                   ## @.str._func187_str1
	.asciz	"let"

	.section	__DATA,__const
	.globl	__func187_str1          ## @_func187_str1
	.p2align	3
__func187_str1:
	.quad	L_.str._func187_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func187_str2:                   ## @.str._func187_str2
	.asciz	"{"

	.section	__DATA,__const
	.globl	__func187_str2          ## @_func187_str2
	.p2align	3
__func187_str2:
	.quad	L_.str._func187_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func187_str3:                   ## @.str._func187_str3
	.asciz	"if"

	.section	__DATA,__const
	.globl	__func187_str3          ## @_func187_str3
	.p2align	3
__func187_str3:
	.quad	L_.str._func187_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func187_str4:                   ## @.str._func187_str4
	.asciz	"while"

	.section	__DATA,__const
	.globl	__func187_str4          ## @_func187_str4
	.p2align	3
__func187_str4:
	.quad	L_.str._func187_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func187_str5:                   ## @.str._func187_str5
	.asciz	"return"

	.section	__DATA,__const
	.globl	__func187_str5          ## @_func187_str5
	.p2align	3
__func187_str5:
	.quad	L_.str._func187_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func187_str6:                   ## @.str._func187_str6
	.asciz	"break"

	.section	__DATA,__const
	.globl	__func187_str6          ## @_func187_str6
	.p2align	3
__func187_str6:
	.quad	L_.str._func187_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func187_str7:                   ## @.str._func187_str7
	.asciz	"continue"

	.section	__DATA,__const
	.globl	__func187_str7          ## @_func187_str7
	.p2align	3
__func187_str7:
	.quad	L_.str._func187_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func187_str8:                   ## @.str._func187_str8
	.asciz	"var"

	.section	__DATA,__const
	.globl	__func187_str8          ## @_func187_str8
	.p2align	3
__func187_str8:
	.quad	L_.str._func187_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func187_str9:                   ## @.str._func187_str9
	.asciz	"type"

	.section	__DATA,__const
	.globl	__func187_str9          ## @_func187_str9
	.p2align	3
__func187_str9:
	.quad	L_.str._func187_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func187_str10:                  ## @.str._func187_str10
	.asciz	"goto"

	.section	__DATA,__const
	.globl	__func187_str10         ## @_func187_str10
	.p2align	3
__func187_str10:
	.quad	L_.str._func187_str10

	.section	__TEXT,__cstring,cstring_literals
L_.str._func187_str11:                  ## @.str._func187_str11
	.asciz	":"

	.section	__DATA,__const
	.globl	__func187_str11         ## @_func187_str11
	.p2align	3
__func187_str11:
	.quad	L_.str._func187_str11

	.section	__TEXT,__cstring,cstring_literals
L_.str._func193_str1:                   ## @.str._func193_str1
	.asciz	"asmTypedefAdd"

	.section	__DATA,__const
	.globl	__func193_str1          ## @_func193_str1
	.p2align	3
__func193_str1:
	.quad	L_.str._func193_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func194_str1:                   ## @.str._func194_str1
	.asciz	"asmStringAdd"

	.section	__DATA,__const
	.globl	__func194_str1          ## @_func194_str1
	.p2align	3
__func194_str1:
	.quad	L_.str._func194_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func195_str1:                   ## @.str._func195_str1
	.asciz	"asmArrayAdd"

	.section	__DATA,__const
	.globl	__func195_str1          ## @_func195_str1
	.p2align	3
__func195_str1:
	.quad	L_.str._func195_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func196_str1:                   ## @.str._func196_str1
	.asciz	"asmFuncAdd"

	.section	__DATA,__const
	.globl	__func196_str1          ## @_func196_str1
	.p2align	3
__func196_str1:
	.quad	L_.str._func196_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func197_str1:                   ## @.str._func197_str1
	.asciz	"asmVarAdd"

	.section	__DATA,__const
	.globl	__func197_str1          ## @_func197_str1
	.p2align	3
__func197_str1:
	.quad	L_.str._func197_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func198_str1:                   ## @.str._func198_str1
	.asciz	"record"

	.section	__DATA,__const
	.globl	__func198_str1          ## @_func198_str1
	.p2align	3
__func198_str1:
	.quad	L_.str._func198_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func198_str2:                   ## @.str._func198_str2
	.asciz	"enum"

	.section	__DATA,__const
	.globl	__func198_str2          ## @_func198_str2
	.p2align	3
__func198_str2:
	.quad	L_.str._func198_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func198_str3:                   ## @.str._func198_str3
	.asciz	"*"

	.section	__DATA,__const
	.globl	__func198_str3          ## @_func198_str3
	.p2align	3
__func198_str3:
	.quad	L_.str._func198_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func198_str4:                   ## @.str._func198_str4
	.asciz	"["

	.section	__DATA,__const
	.globl	__func198_str4          ## @_func198_str4
	.p2align	3
__func198_str4:
	.quad	L_.str._func198_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func198_str5:                   ## @.str._func198_str5
	.asciz	"("

	.section	__DATA,__const
	.globl	__func198_str5          ## @_func198_str5
	.p2align	3
__func198_str5:
	.quad	L_.str._func198_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func198_str6:                   ## @.str._func198_str6
	.asciz	"expected type"

	.section	__DATA,__const
	.globl	__func198_str6          ## @_func198_str6
	.p2align	3
__func198_str6:
	.quad	L_.str._func198_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func198_str7:                   ## @.str._func198_str7
	.asciz	"tok=%s\n"

	.section	__DATA,__const
	.globl	__func198_str7          ## @_func198_str7
	.p2align	3
__func198_str7:
	.quad	L_.str._func198_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func199_str1:                   ## @.str._func199_str1
	.asciz	"expected id"

	.section	__DATA,__const
	.globl	__func199_str1          ## @_func199_str1
	.p2align	3
__func199_str1:
	.quad	L_.str._func199_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func200_str1:                   ## @.str._func200_str1
	.asciz	"dofield error"

	.section	__DATA,__const
	.globl	__func200_str1          ## @_func200_str1
	.p2align	3
__func200_str1:
	.quad	L_.str._func200_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func200_str2:                   ## @.str._func200_str2
	.asciz	","

	.section	__DATA,__const
	.globl	__func200_str2          ## @_func200_str2
	.p2align	3
__func200_str2:
	.quad	L_.str._func200_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func201_str1:                   ## @.str._func201_str1
	.asciz	"{"

	.section	__DATA,__const
	.globl	__func201_str1          ## @_func201_str1
	.p2align	3
__func201_str1:
	.quad	L_.str._func201_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func201_str2:                   ## @.str._func201_str2
	.asciz	"}"

	.section	__DATA,__const
	.globl	__func201_str2          ## @_func201_str2
	.p2align	3
__func201_str2:
	.quad	L_.str._func201_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func202_str1:                   ## @.str._func202_str1
	.asciz	"{"

	.section	__DATA,__const
	.globl	__func202_str1          ## @_func202_str1
	.p2align	3
__func202_str1:
	.quad	L_.str._func202_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func202_str2:                   ## @.str._func202_str2
	.asciz	"}"

	.section	__DATA,__const
	.globl	__func202_str2          ## @_func202_str2
	.p2align	3
__func202_str2:
	.quad	L_.str._func202_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func202_str3:                   ## @.str._func202_str3
	.asciz	","

	.section	__DATA,__const
	.globl	__func202_str3          ## @_func202_str3
	.p2align	3
__func202_str3:
	.quad	L_.str._func202_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func202_str4:                   ## @.str._func202_str4
	.asciz	"}"

	.section	__DATA,__const
	.globl	__func202_str4          ## @_func202_str4
	.p2align	3
__func202_str4:
	.quad	L_.str._func202_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func203_str1:                   ## @.str._func203_str1
	.asciz	"]"

	.section	__DATA,__const
	.globl	__func203_str1          ## @_func203_str1
	.p2align	3
__func203_str1:
	.quad	L_.str._func203_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func203_str2:                   ## @.str._func203_str2
	.asciz	"]"

	.section	__DATA,__const
	.globl	__func203_str2          ## @_func203_str2
	.p2align	3
__func203_str2:
	.quad	L_.str._func203_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func204_str1:                   ## @.str._func204_str1
	.asciz	")"

	.section	__DATA,__const
	.globl	__func204_str1          ## @_func204_str1
	.p2align	3
__func204_str1:
	.quad	L_.str._func204_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func204_str2:                   ## @.str._func204_str2
	.asciz	"->"

	.section	__DATA,__const
	.globl	__func204_str2          ## @_func204_str2
	.p2align	3
__func204_str2:
	.quad	L_.str._func204_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func204_str3:                   ## @.str._func204_str3
	.asciz	"flagArghack"

	.section	__DATA,__const
	.globl	__func204_str3          ## @_func204_str3
	.p2align	3
__func204_str3:
	.quad	L_.str._func204_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str1:                   ## @.str._func206_str1
	.asciz	"ValueUndefined"

	.section	__DATA,__const
	.globl	__func206_str1          ## @_func206_str1
	.p2align	3
__func206_str1:
	.quad	L_.str._func206_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str2:                   ## @.str._func206_str2
	.asciz	"ValueRef"

	.section	__DATA,__const
	.globl	__func206_str2          ## @_func206_str2
	.p2align	3
__func206_str2:
	.quad	L_.str._func206_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str3:                   ## @.str._func206_str3
	.asciz	"ValueDeref"

	.section	__DATA,__const
	.globl	__func206_str3          ## @_func206_str3
	.p2align	3
__func206_str3:
	.quad	L_.str._func206_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str4:                   ## @.str._func206_str4
	.asciz	"ValueNot"

	.section	__DATA,__const
	.globl	__func206_str4          ## @_func206_str4
	.p2align	3
__func206_str4:
	.quad	L_.str._func206_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str5:                   ## @.str._func206_str5
	.asciz	"ValueMinus"

	.section	__DATA,__const
	.globl	__func206_str5          ## @_func206_str5
	.p2align	3
__func206_str5:
	.quad	L_.str._func206_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str6:                   ## @.str._func206_str6
	.asciz	"ValueShl"

	.section	__DATA,__const
	.globl	__func206_str6          ## @_func206_str6
	.p2align	3
__func206_str6:
	.quad	L_.str._func206_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str7:                   ## @.str._func206_str7
	.asciz	"ValueShr"

	.section	__DATA,__const
	.globl	__func206_str7          ## @_func206_str7
	.p2align	3
__func206_str7:
	.quad	L_.str._func206_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str8:                   ## @.str._func206_str8
	.asciz	"ValueAdd"

	.section	__DATA,__const
	.globl	__func206_str8          ## @_func206_str8
	.p2align	3
__func206_str8:
	.quad	L_.str._func206_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str9:                   ## @.str._func206_str9
	.asciz	"ValueSub"

	.section	__DATA,__const
	.globl	__func206_str9          ## @_func206_str9
	.p2align	3
__func206_str9:
	.quad	L_.str._func206_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str10:                  ## @.str._func206_str10
	.asciz	"ValueMul"

	.section	__DATA,__const
	.globl	__func206_str10         ## @_func206_str10
	.p2align	3
__func206_str10:
	.quad	L_.str._func206_str10

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str11:                  ## @.str._func206_str11
	.asciz	"ValueDiv"

	.section	__DATA,__const
	.globl	__func206_str11         ## @_func206_str11
	.p2align	3
__func206_str11:
	.quad	L_.str._func206_str11

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str12:                  ## @.str._func206_str12
	.asciz	"ValueMod"

	.section	__DATA,__const
	.globl	__func206_str12         ## @_func206_str12
	.p2align	3
__func206_str12:
	.quad	L_.str._func206_str12

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str13:                  ## @.str._func206_str13
	.asciz	"ValueOr"

	.section	__DATA,__const
	.globl	__func206_str13         ## @_func206_str13
	.p2align	3
__func206_str13:
	.quad	L_.str._func206_str13

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str14:                  ## @.str._func206_str14
	.asciz	"ValueXor"

	.section	__DATA,__const
	.globl	__func206_str14         ## @_func206_str14
	.p2align	3
__func206_str14:
	.quad	L_.str._func206_str14

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str15:                  ## @.str._func206_str15
	.asciz	"ValueAnd"

	.section	__DATA,__const
	.globl	__func206_str15         ## @_func206_str15
	.p2align	3
__func206_str15:
	.quad	L_.str._func206_str15

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str16:                  ## @.str._func206_str16
	.asciz	"ValueEq"

	.section	__DATA,__const
	.globl	__func206_str16         ## @_func206_str16
	.p2align	3
__func206_str16:
	.quad	L_.str._func206_str16

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str17:                  ## @.str._func206_str17
	.asciz	"ValueNe"

	.section	__DATA,__const
	.globl	__func206_str17         ## @_func206_str17
	.p2align	3
__func206_str17:
	.quad	L_.str._func206_str17

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str18:                  ## @.str._func206_str18
	.asciz	"ValueLt"

	.section	__DATA,__const
	.globl	__func206_str18         ## @_func206_str18
	.p2align	3
__func206_str18:
	.quad	L_.str._func206_str18

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str19:                  ## @.str._func206_str19
	.asciz	"ValueGt"

	.section	__DATA,__const
	.globl	__func206_str19         ## @_func206_str19
	.p2align	3
__func206_str19:
	.quad	L_.str._func206_str19

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str20:                  ## @.str._func206_str20
	.asciz	"ValueLe"

	.section	__DATA,__const
	.globl	__func206_str20         ## @_func206_str20
	.p2align	3
__func206_str20:
	.quad	L_.str._func206_str20

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str21:                  ## @.str._func206_str21
	.asciz	"ValueGe"

	.section	__DATA,__const
	.globl	__func206_str21         ## @_func206_str21
	.p2align	3
__func206_str21:
	.quad	L_.str._func206_str21

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str22:                  ## @.str._func206_str22
	.asciz	"ValueCall"

	.section	__DATA,__const
	.globl	__func206_str22         ## @_func206_str22
	.p2align	3
__func206_str22:
	.quad	L_.str._func206_str22

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str23:                  ## @.str._func206_str23
	.asciz	"ValueIndex"

	.section	__DATA,__const
	.globl	__func206_str23         ## @_func206_str23
	.p2align	3
__func206_str23:
	.quad	L_.str._func206_str23

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str24:                  ## @.str._func206_str24
	.asciz	"ValueAccess"

	.section	__DATA,__const
	.globl	__func206_str24         ## @_func206_str24
	.p2align	3
__func206_str24:
	.quad	L_.str._func206_str24

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str25:                  ## @.str._func206_str25
	.asciz	"ValueCast"

	.section	__DATA,__const
	.globl	__func206_str25         ## @_func206_str25
	.p2align	3
__func206_str25:
	.quad	L_.str._func206_str25

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str26:                  ## @.str._func206_str26
	.asciz	"ValueInvalid"

	.section	__DATA,__const
	.globl	__func206_str26         ## @_func206_str26
	.p2align	3
__func206_str26:
	.quad	L_.str._func206_str26

	.section	__TEXT,__cstring,cstring_literals
L_.str._func206_str27:                  ## @.str._func206_str27
	.asciz	"ValueUnknown"

	.section	__DATA,__const
	.globl	__func206_str27         ## @_func206_str27
	.p2align	3
__func206_str27:
	.quad	L_.str._func206_str27

	.section	__TEXT,__cstring,cstring_literals
L_.str._func207_str1:                   ## @.str._func207_str1
	.asciz	"value: %p {\n"

	.section	__DATA,__const
	.globl	__func207_str1          ## @_func207_str1
	.p2align	3
__func207_str1:
	.quad	L_.str._func207_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func207_str2:                   ## @.str._func207_str2
	.asciz	"  kind: %s\n"

	.section	__DATA,__const
	.globl	__func207_str2          ## @_func207_str2
	.p2align	3
__func207_str2:
	.quad	L_.str._func207_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func207_str3:                   ## @.str._func207_str3
	.asciz	"  type: "

	.section	__DATA,__const
	.globl	__func207_str3          ## @_func207_str3
	.p2align	3
__func207_str3:
	.quad	L_.str._func207_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func207_str4:                   ## @.str._func207_str4
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func207_str4          ## @_func207_str4
	.p2align	3
__func207_str4:
	.quad	L_.str._func207_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func207_str5:                   ## @.str._func207_str5
	.asciz	"  id: %s\n"

	.section	__DATA,__const
	.globl	__func207_str5          ## @_func207_str5
	.p2align	3
__func207_str5:
	.quad	L_.str._func207_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func207_str6:                   ## @.str._func207_str6
	.asciz	"  imm: %d\n"

	.section	__DATA,__const
	.globl	__func207_str6          ## @_func207_str6
	.p2align	3
__func207_str6:
	.quad	L_.str._func207_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func207_str7:                   ## @.str._func207_str7
	.asciz	"}\n"

	.section	__DATA,__const
	.globl	__func207_str7          ## @_func207_str7
	.p2align	3
__func207_str7:
	.quad	L_.str._func207_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func209_str1:                   ## @.str._func209_str1
	.asciz	"nat:: v.type == Nil"

	.section	__DATA,__const
	.globl	__func209_str1          ## @_func209_str1
	.p2align	3
__func209_str1:
	.quad	L_.str._func209_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func209_str2:                   ## @.str._func209_str2
	.asciz	"nat:: t == Nil"

	.section	__DATA,__const
	.globl	__func209_str2          ## @_func209_str2
	.p2align	3
__func209_str2:
	.quad	L_.str._func209_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func211_str1:                   ## @.str._func211_str1
	.asciz	"value/un :: unknown value kind received"

	.section	__DATA,__const
	.globl	__func211_str1          ## @_func211_str1
	.p2align	3
__func211_str1:
	.quad	L_.str._func211_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func216_str1:                   ## @.str._func216_str1
	.asciz	"cannot ref constant value"

	.section	__DATA,__const
	.globl	__func216_str1          ## @_func216_str1
	.p2align	3
__func216_str1:
	.quad	L_.str._func216_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func216_str2:                   ## @.str._func216_str2
	.asciz	"expected pointer\n"

	.section	__DATA,__const
	.globl	__func216_str2          ## @_func216_str2
	.p2align	3
__func216_str2:
	.quad	L_.str._func216_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func219_str1:                   ## @.str._func219_str1
	.asciz	"LTYPE = "

	.section	__DATA,__const
	.globl	__func219_str1          ## @_func219_str1
	.p2align	3
__func219_str1:
	.quad	L_.str._func219_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func219_str2:                   ## @.str._func219_str2
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func219_str2          ## @_func219_str2
	.p2align	3
__func219_str2:
	.quad	L_.str._func219_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func219_str3:                   ## @.str._func219_str3
	.asciz	"RTYPE = "

	.section	__DATA,__const
	.globl	__func219_str3          ## @_func219_str3
	.p2align	3
__func219_str3:
	.quad	L_.str._func219_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func219_str4:                   ## @.str._func219_str4
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func219_str4          ## @_func219_str4
	.p2align	3
__func219_str4:
	.quad	L_.str._func219_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func219_str5:                   ## @.str._func219_str5
	.asciz	"binary type error"

	.section	__DATA,__const
	.globl	__func219_str5          ## @_func219_str5
	.p2align	3
__func219_str5:
	.quad	L_.str._func219_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func220_str1:                   ## @.str._func220_str1
	.asciz	"binImm :: unknown bin operation"

	.section	__DATA,__const
	.globl	__func220_str1          ## @_func220_str1
	.p2align	3
__func220_str1:
	.quad	L_.str._func220_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func226_str1:                   ## @.str._func226_str1
	.asciz	"expected record / pointer to record type"

	.section	__DATA,__const
	.globl	__func226_str1          ## @_func226_str1
	.p2align	3
__func226_str1:
	.quad	L_.str._func226_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func226_str2:                   ## @.str._func226_str2
	.asciz	"undefined field"

	.section	__DATA,__const
	.globl	__func226_str2          ## @_func226_str2
	.p2align	3
__func226_str2:
	.quad	L_.str._func226_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func228_str1:                   ## @.str._func228_str1
	.asciz	"undefined function"

	.section	__DATA,__const
	.globl	__func228_str1          ## @_func228_str1
	.p2align	3
__func228_str1:
	.quad	L_.str._func228_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func228_str2:                   ## @.str._func228_str2
	.asciz	"expected function"

	.section	__DATA,__const
	.globl	__func228_str2          ## @_func228_str2
	.p2align	3
__func228_str2:
	.quad	L_.str._func228_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func229_str1:                   ## @.str._func229_str1
	.asciz	"not enough arguments"

	.section	__DATA,__const
	.globl	__func229_str1          ## @_func229_str1
	.p2align	3
__func229_str1:
	.quad	L_.str._func229_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func229_str2:                   ## @.str._func229_str2
	.asciz	"too many arguments"

	.section	__DATA,__const
	.globl	__func229_str2          ## @_func229_str2
	.p2align	3
__func229_str2:
	.quad	L_.str._func229_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func229_str3:                   ## @.str._func229_str3
	.asciz	"argument type not match param type: "

	.section	__DATA,__const
	.globl	__func229_str3          ## @_func229_str3
	.p2align	3
__func229_str3:
	.quad	L_.str._func229_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func229_str4:                   ## @.str._func229_str4
	.asciz	"arg = "

	.section	__DATA,__const
	.globl	__func229_str4          ## @_func229_str4
	.p2align	3
__func229_str4:
	.quad	L_.str._func229_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func229_str5:                   ## @.str._func229_str5
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func229_str5          ## @_func229_str5
	.p2align	3
__func229_str5:
	.quad	L_.str._func229_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func229_str6:                   ## @.str._func229_str6
	.asciz	"par = "

	.section	__DATA,__const
	.globl	__func229_str6          ## @_func229_str6
	.p2align	3
__func229_str6:
	.quad	L_.str._func229_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func229_str7:                   ## @.str._func229_str7
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func229_str7          ## @_func229_str7
	.p2align	3
__func229_str7:
	.quad	L_.str._func229_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func234_str1:                   ## @.str._func234_str1
	.asciz	"sizeof unknown type"

	.section	__DATA,__const
	.globl	__func234_str1          ## @_func234_str1
	.p2align	3
__func234_str1:
	.quad	L_.str._func234_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func236_str1:                   ## @.str._func236_str1
	.asciz	"alignof unknown type"

	.section	__DATA,__const
	.globl	__func236_str1          ## @_func236_str1
	.p2align	3
__func236_str1:
	.quad	L_.str._func236_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func237_str1:                   ## @.str._func237_str1
	.asciz	"False"

	.section	__DATA,__const
	.globl	__func237_str1          ## @_func237_str1
	.p2align	3
__func237_str1:
	.quad	L_.str._func237_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func237_str2:                   ## @.str._func237_str2
	.asciz	"True"

	.section	__DATA,__const
	.globl	__func237_str2          ## @_func237_str2
	.p2align	3
__func237_str2:
	.quad	L_.str._func237_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func237_str3:                   ## @.str._func237_str3
	.asciz	"Unit"

	.section	__DATA,__const
	.globl	__func237_str3          ## @_func237_str3
	.p2align	3
__func237_str3:
	.quad	L_.str._func237_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func237_str4:                   ## @.str._func237_str4
	.asciz	"Nil"

	.section	__DATA,__const
	.globl	__func237_str4          ## @_func237_str4
	.p2align	3
__func237_str4:
	.quad	L_.str._func237_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func238_str1:                   ## @.str._func238_str1
	.asciz	"value_new"

	.section	__DATA,__const
	.globl	__func238_str1          ## @_func238_str1
	.p2align	3
__func238_str1:
	.quad	L_.str._func238_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func239_str1:                   ## @.str._func239_str1
	.asciz	"checkValue:: unknown v.kind"

	.section	__DATA,__const
	.globl	__func239_str1          ## @_func239_str1
	.p2align	3
__func239_str1:
	.quad	L_.str._func239_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func250_str1:                   ## @.str._func250_str1
	.asciz	"when import = %s\n"

	.section	__DATA,__const
	.globl	__func250_str1          ## @_func250_str1
	.p2align	3
__func250_str1:
	.quad	L_.str._func250_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func250_str2:                   ## @.str._func250_str2
	.asciz	"cannot import"

	.section	__DATA,__const
	.globl	__func250_str2          ## @_func250_str2
	.p2align	3
__func250_str2:
	.quad	L_.str._func250_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func250_str3:                   ## @.str._func250_str3
	.asciz	"when import = %s\n"

	.section	__DATA,__const
	.globl	__func250_str3          ## @_func250_str3
	.p2align	3
__func250_str3:
	.quad	L_.str._func250_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func250_str4:                   ## @.str._func250_str4
	.asciz	"cannot import"

	.section	__DATA,__const
	.globl	__func250_str4          ## @_func250_str4
	.p2align	3
__func250_str4:
	.quad	L_.str._func250_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str1:                   ## @.str._func252_str1
	.asciz	"import"

	.section	__DATA,__const
	.globl	__func252_str1          ## @_func252_str1
	.p2align	3
__func252_str1:
	.quad	L_.str._func252_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str2:                   ## @.str._func252_str2
	.asciz	"flagArghack"

	.section	__DATA,__const
	.globl	__func252_str2          ## @_func252_str2
	.p2align	3
__func252_str2:
	.quad	L_.str._func252_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str3:                   ## @.str._func252_str3
	.asciz	"let"

	.section	__DATA,__const
	.globl	__func252_str3          ## @_func252_str3
	.p2align	3
__func252_str3:
	.quad	L_.str._func252_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str4:                   ## @.str._func252_str4
	.asciz	"type"

	.section	__DATA,__const
	.globl	__func252_str4          ## @_func252_str4
	.p2align	3
__func252_str4:
	.quad	L_.str._func252_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str5:                   ## @.str._func252_str5
	.asciz	"extern"

	.section	__DATA,__const
	.globl	__func252_str5          ## @_func252_str5
	.p2align	3
__func252_str5:
	.quad	L_.str._func252_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str6:                   ## @.str._func252_str6
	.asciz	"var"

	.section	__DATA,__const
	.globl	__func252_str6          ## @_func252_str6
	.p2align	3
__func252_str6:
	.quad	L_.str._func252_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str7:                   ## @.str._func252_str7
	.asciz	"arghack"

	.section	__DATA,__const
	.globl	__func252_str7          ## @_func252_str7
	.p2align	3
__func252_str7:
	.quad	L_.str._func252_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str8:                   ## @.str._func252_str8
	.asciz	"flagArghack"

	.section	__DATA,__const
	.globl	__func252_str8          ## @_func252_str8
	.p2align	3
__func252_str8:
	.quad	L_.str._func252_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str9:                   ## @.str._func252_str9
	.asciz	"nodecorate"

	.section	__DATA,__const
	.globl	__func252_str9          ## @_func252_str9
	.p2align	3
__func252_str9:
	.quad	L_.str._func252_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str10:                  ## @.str._func252_str10
	.asciz	"let"

	.section	__DATA,__const
	.globl	__func252_str10         ## @_func252_str10
	.p2align	3
__func252_str10:
	.quad	L_.str._func252_str10

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str11:                  ## @.str._func252_str11
	.asciz	"var"

	.section	__DATA,__const
	.globl	__func252_str11         ## @_func252_str11
	.p2align	3
__func252_str11:
	.quad	L_.str._func252_str11

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str12:                  ## @.str._func252_str12
	.asciz	"type"

	.section	__DATA,__const
	.globl	__func252_str12         ## @_func252_str12
	.p2align	3
__func252_str12:
	.quad	L_.str._func252_str12

	.section	__TEXT,__cstring,cstring_literals
L_.str._func252_str13:                  ## @.str._func252_str13
	.asciz	"flagArghack"

	.section	__DATA,__const
	.globl	__func252_str13         ## @_func252_str13
	.p2align	3
__func252_str13:
	.quad	L_.str._func252_str13

	.section	__TEXT,__cstring,cstring_literals
L_.str._func253_str1:                   ## @.str._func253_str1
	.asciz	"expected import string"

	.section	__DATA,__const
	.globl	__func253_str1          ## @_func253_str1
	.p2align	3
__func253_str1:
	.quad	L_.str._func253_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func254_str1:                   ## @.str._func254_str1
	.asciz	"="

	.section	__DATA,__const
	.globl	__func254_str1          ## @_func254_str1
	.p2align	3
__func254_str1:
	.quad	L_.str._func254_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func255_str1:                   ## @.str._func255_str1
	.asciz	"="

	.section	__DATA,__const
	.globl	__func255_str1          ## @_func255_str1
	.p2align	3
__func255_str1:
	.quad	L_.str._func255_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func260_str1:                   ## @.str._func260_str1
	.asciz	"expected id"

	.section	__DATA,__const
	.globl	__func260_str1          ## @_func260_str1
	.p2align	3
__func260_str1:
	.quad	L_.str._func260_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func260_str2:                   ## @.str._func260_str2
	.asciz	"tt = %d\n"

	.section	__DATA,__const
	.globl	__func260_str2          ## @_func260_str2
	.p2align	3
__func260_str2:
	.quad	L_.str._func260_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func260_str3:                   ## @.str._func260_str3
	.asciz	"tx = %d\n"

	.section	__DATA,__const
	.globl	__func260_str3          ## @_func260_str3
	.p2align	3
__func260_str3:
	.quad	L_.str._func260_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func260_str4:                   ## @.str._func260_str4
	.asciz	"instead '%s'\n"

	.section	__DATA,__const
	.globl	__func260_str4          ## @_func260_str4
	.p2align	3
__func260_str4:
	.quad	L_.str._func260_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func261_str1:                   ## @.str._func261_str1
	.asciz	","

	.section	__DATA,__const
	.globl	__func261_str1          ## @_func261_str1
	.p2align	3
__func261_str1:
	.quad	L_.str._func261_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func261_str2:                   ## @.str._func261_str2
	.asciz	":"

	.section	__DATA,__const
	.globl	__func261_str2          ## @_func261_str2
	.p2align	3
__func261_str2:
	.quad	L_.str._func261_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func268_str1:                   ## @.str._func268_str1
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func268_str1          ## @_func268_str1
	.p2align	3
__func268_str1:
	.quad	L_.str._func268_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func272_str1:                   ## @.str._func272_str1
	.asciz	"expected separator"

	.section	__DATA,__const
	.globl	__func272_str1          ## @_func272_str1
	.p2align	3
__func272_str1:
	.quad	L_.str._func272_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func273_str1:                   ## @.str._func273_str1
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func273_str1          ## @_func273_str1
	.p2align	3
__func273_str1:
	.quad	L_.str._func273_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func273_str2:                   ## @.str._func273_str2
	.asciz	";"

	.section	__DATA,__const
	.globl	__func273_str2          ## @_func273_str2
	.p2align	3
__func273_str2:
	.quad	L_.str._func273_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func273_str3:                   ## @.str._func273_str3
	.asciz	"}"

	.section	__DATA,__const
	.globl	__func273_str3          ## @_func273_str3
	.p2align	3
__func273_str3:
	.quad	L_.str._func273_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func273_str4:                   ## @.str._func273_str4
	.asciz	")"

	.section	__DATA,__const
	.globl	__func273_str4          ## @_func273_str4
	.p2align	3
__func273_str4:
	.quad	L_.str._func273_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func274_str1:                   ## @.str._func274_str1
	.asciz	"lex::skipto not implemented\n"

	.section	__DATA,__const
	.globl	__func274_str1          ## @_func274_str1
	.p2align	3
__func274_str1:
	.quad	L_.str._func274_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func274_str2:                   ## @.str._func274_str2
	.asciz	"tok = '%s'\n"

	.section	__DATA,__const
	.globl	__func274_str2          ## @_func274_str2
	.p2align	3
__func274_str2:
	.quad	L_.str._func274_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func274_str3:                   ## @.str._func274_str3
	.asciz	"skip_target = %s\n"

	.section	__DATA,__const
	.globl	__func274_str3          ## @_func274_str3
	.p2align	3
__func274_str3:
	.quad	L_.str._func274_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func276_str1:                   ## @.str._func276_str1
	.asciz	"unexpected symbol"

	.section	__DATA,__const
	.globl	__func276_str1          ## @_func276_str1
	.p2align	3
__func276_str1:
	.quad	L_.str._func276_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func276_str2:                   ## @.str._func276_str2
	.asciz	"expected %s instead %s\n"

	.section	__DATA,__const
	.globl	__func276_str2          ## @_func276_str2
	.p2align	3
__func276_str2:
	.quad	L_.str._func276_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func276_str3:                   ## @.str._func276_str3
	.asciz	"ctok.type = %d\n"

	.section	__DATA,__const
	.globl	__func276_str3          ## @_func276_str3
	.p2align	3
__func276_str3:
	.quad	L_.str._func276_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func279_str1:                   ## @.str._func279_str1
	.asciz	"%s"

	.section	__DATA,__const
	.globl	__func279_str1          ## @_func279_str1
	.p2align	3
__func279_str1:
	.quad	L_.str._func279_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func280_str1:                   ## @.str._func280_str1
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func280_str1          ## @_func280_str1
	.p2align	3
__func280_str1:
	.quad	L_.str._func280_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func281_str1:                   ## @.str._func281_str1
	.asciz	" "

	.section	__DATA,__const
	.globl	__func281_str1          ## @_func281_str1
	.p2align	3
__func281_str1:
	.quad	L_.str._func281_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func282_str1:                   ## @.str._func282_str1
	.asciz	", "

	.section	__DATA,__const
	.globl	__func282_str1          ## @_func282_str1
	.p2align	3
__func282_str1:
	.quad	L_.str._func282_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func284_str1:                   ## @.str._func284_str1
	.asciz	" !dbg !%u"

	.section	__DATA,__const
	.globl	__func284_str1          ## @_func284_str1
	.p2align	3
__func284_str1:
	.quad	L_.str._func284_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func288_str1:                   ## @.str._func288_str1
	.asciz	"prn/printType :: t = Nil\n"

	.section	__DATA,__const
	.globl	__func288_str1          ## @_func288_str1
	.p2align	3
__func288_str1:
	.quad	L_.str._func288_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func288_str2:                   ## @.str._func288_str2
	.asciz	"%%%s"

	.section	__DATA,__const
	.globl	__func288_str2          ## @_func288_str2
	.p2align	3
__func288_str2:
	.quad	L_.str._func288_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func288_str3:                   ## @.str._func288_str3
	.asciz	"%%%s"

	.section	__DATA,__const
	.globl	__func288_str3          ## @_func288_str3
	.p2align	3
__func288_str3:
	.quad	L_.str._func288_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func289_str1:                   ## @.str._func289_str1
	.asciz	"{"

	.section	__DATA,__const
	.globl	__func289_str1          ## @_func289_str1
	.p2align	3
__func289_str1:
	.quad	L_.str._func289_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func290_str1:                   ## @.str._func290_str1
	.asciz	", "

	.section	__DATA,__const
	.globl	__func290_str1          ## @_func290_str1
	.p2align	3
__func290_str1:
	.quad	L_.str._func290_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func289_str2:                   ## @.str._func289_str2
	.asciz	"}"

	.section	__DATA,__const
	.globl	__func289_str2          ## @_func289_str2
	.p2align	3
__func289_str2:
	.quad	L_.str._func289_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func291_str1:                   ## @.str._func291_str1
	.asciz	"*"

	.section	__DATA,__const
	.globl	__func291_str1          ## @_func291_str1
	.p2align	3
__func291_str1:
	.quad	L_.str._func291_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func291_str2:                   ## @.str._func291_str2
	.asciz	"[%d x "

	.section	__DATA,__const
	.globl	__func291_str2          ## @_func291_str2
	.p2align	3
__func291_str2:
	.quad	L_.str._func291_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func291_str3:                   ## @.str._func291_str3
	.asciz	"]"

	.section	__DATA,__const
	.globl	__func291_str3          ## @_func291_str3
	.p2align	3
__func291_str3:
	.quad	L_.str._func291_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func292_str1:                   ## @.str._func292_str1
	.asciz	"*"

	.section	__DATA,__const
	.globl	__func292_str1          ## @_func292_str1
	.p2align	3
__func292_str1:
	.quad	L_.str._func292_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func293_str1:                   ## @.str._func293_str1
	.asciz	"void"

	.section	__DATA,__const
	.globl	__func293_str1          ## @_func293_str1
	.p2align	3
__func293_str1:
	.quad	L_.str._func293_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func293_str2:                   ## @.str._func293_str2
	.asciz	" ("

	.section	__DATA,__const
	.globl	__func293_str2          ## @_func293_str2
	.p2align	3
__func293_str2:
	.quad	L_.str._func293_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func294_str1:                   ## @.str._func294_str1
	.asciz	", "

	.section	__DATA,__const
	.globl	__func294_str1          ## @_func294_str1
	.p2align	3
__func294_str1:
	.quad	L_.str._func294_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func293_str3:                   ## @.str._func293_str3
	.asciz	", ..."

	.section	__DATA,__const
	.globl	__func293_str3          ## @_func293_str3
	.p2align	3
__func293_str3:
	.quad	L_.str._func293_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func293_str4:                   ## @.str._func293_str4
	.asciz	")"

	.section	__DATA,__const
	.globl	__func293_str4          ## @_func293_str4
	.p2align	3
__func293_str4:
	.quad	L_.str._func293_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func293_str5:                   ## @.str._func293_str5
	.asciz	"*"

	.section	__DATA,__const
	.globl	__func293_str5          ## @_func293_str5
	.p2align	3
__func293_str5:
	.quad	L_.str._func293_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func296_str1:                   ## @.str._func296_str1
	.asciz	"\n\n;stmt%d:"

	.section	__DATA,__const
	.globl	__func296_str1          ## @_func296_str1
	.p2align	3
__func296_str1:
	.quad	L_.str._func296_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func296_str2:                   ## @.str._func296_str2
	.asciz	"print::StmtUnknown"

	.section	__DATA,__const
	.globl	__func296_str2          ## @_func296_str2
	.p2align	3
__func296_str2:
	.quad	L_.str._func296_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func297_str1:                   ## @.str._func297_str1
	.asciz	"\n  %%%d = alloca "

	.section	__DATA,__const
	.globl	__func297_str1          ## @_func297_str1
	.p2align	3
__func297_str1:
	.quad	L_.str._func297_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func299_str1:                   ## @.str._func299_str1
	.asciz	"\n  br i1 "

	.section	__DATA,__const
	.globl	__func299_str1          ## @_func299_str1
	.p2align	3
__func299_str1:
	.quad	L_.str._func299_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func299_str2:                   ## @.str._func299_str2
	.asciz	", label %%then_%d, label %%else_%d"

	.section	__DATA,__const
	.globl	__func299_str2          ## @_func299_str2
	.p2align	3
__func299_str2:
	.quad	L_.str._func299_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func299_str3:                   ## @.str._func299_str3
	.asciz	"\nthen_%d:"

	.section	__DATA,__const
	.globl	__func299_str3          ## @_func299_str3
	.p2align	3
__func299_str3:
	.quad	L_.str._func299_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func299_str4:                   ## @.str._func299_str4
	.asciz	"\n  br label %%endif_%d"

	.section	__DATA,__const
	.globl	__func299_str4          ## @_func299_str4
	.p2align	3
__func299_str4:
	.quad	L_.str._func299_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func299_str5:                   ## @.str._func299_str5
	.asciz	"\nelse_%d:"

	.section	__DATA,__const
	.globl	__func299_str5          ## @_func299_str5
	.p2align	3
__func299_str5:
	.quad	L_.str._func299_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func299_str6:                   ## @.str._func299_str6
	.asciz	"\n  br label %%endif_%d"

	.section	__DATA,__const
	.globl	__func299_str6          ## @_func299_str6
	.p2align	3
__func299_str6:
	.quad	L_.str._func299_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func299_str7:                   ## @.str._func299_str7
	.asciz	"\nendif_%d:"

	.section	__DATA,__const
	.globl	__func299_str7          ## @_func299_str7
	.p2align	3
__func299_str7:
	.quad	L_.str._func299_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func300_str1:                   ## @.str._func300_str1
	.asciz	"\n  br label %%continue_%d"

	.section	__DATA,__const
	.globl	__func300_str1          ## @_func300_str1
	.p2align	3
__func300_str1:
	.quad	L_.str._func300_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func300_str2:                   ## @.str._func300_str2
	.asciz	"\ncontinue_%d:"

	.section	__DATA,__const
	.globl	__func300_str2          ## @_func300_str2
	.p2align	3
__func300_str2:
	.quad	L_.str._func300_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func300_str3:                   ## @.str._func300_str3
	.asciz	"\n  br i1 "

	.section	__DATA,__const
	.globl	__func300_str3          ## @_func300_str3
	.p2align	3
__func300_str3:
	.quad	L_.str._func300_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func300_str4:                   ## @.str._func300_str4
	.asciz	", label %%body_%d, label %%break_%d"

	.section	__DATA,__const
	.globl	__func300_str4          ## @_func300_str4
	.p2align	3
__func300_str4:
	.quad	L_.str._func300_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func300_str5:                   ## @.str._func300_str5
	.asciz	"\nbody_%d:"

	.section	__DATA,__const
	.globl	__func300_str5          ## @_func300_str5
	.p2align	3
__func300_str5:
	.quad	L_.str._func300_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func300_str6:                   ## @.str._func300_str6
	.asciz	"\n  br label %%continue_%d"

	.section	__DATA,__const
	.globl	__func300_str6          ## @_func300_str6
	.p2align	3
__func300_str6:
	.quad	L_.str._func300_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func300_str7:                   ## @.str._func300_str7
	.asciz	"\nbreak_%d:"

	.section	__DATA,__const
	.globl	__func300_str7          ## @_func300_str7
	.p2align	3
__func300_str7:
	.quad	L_.str._func300_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func301_str1:                   ## @.str._func301_str1
	.asciz	"\nret void"

	.section	__DATA,__const
	.globl	__func301_str1          ## @_func301_str1
	.p2align	3
__func301_str1:
	.quad	L_.str._func301_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func301_str2:                   ## @.str._func301_str2
	.asciz	"\n  ret "

	.section	__DATA,__const
	.globl	__func301_str2          ## @_func301_str2
	.p2align	3
__func301_str2:
	.quad	L_.str._func301_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func302_str1:                   ## @.str._func302_str1
	.asciz	"\n  br label %%break_%d"

	.section	__DATA,__const
	.globl	__func302_str1          ## @_func302_str1
	.p2align	3
__func302_str1:
	.quad	L_.str._func302_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func303_str1:                   ## @.str._func303_str1
	.asciz	"\n  br label %%continue_%d"

	.section	__DATA,__const
	.globl	__func303_str1          ## @_func303_str1
	.p2align	3
__func303_str1:
	.quad	L_.str._func303_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func304_str1:                   ## @.str._func304_str1
	.asciz	"\n  br label %%%s"

	.section	__DATA,__const
	.globl	__func304_str1          ## @_func304_str1
	.p2align	3
__func304_str1:
	.quad	L_.str._func304_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func305_str1:                   ## @.str._func305_str1
	.asciz	"\n  br label %%%s"

	.section	__DATA,__const
	.globl	__func305_str1          ## @_func305_str1
	.p2align	3
__func305_str1:
	.quad	L_.str._func305_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func305_str2:                   ## @.str._func305_str2
	.asciz	"\n%s:"

	.section	__DATA,__const
	.globl	__func305_str2          ## @_func305_str2
	.p2align	3
__func305_str2:
	.quad	L_.str._func305_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func310_str1:                   ## @.str._func310_str1
	.asciz	"\n  call "

	.section	__DATA,__const
	.globl	__func310_str1          ## @_func310_str1
	.p2align	3
__func310_str1:
	.quad	L_.str._func310_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func310_str2:                   ## @.str._func310_str2
	.asciz	"\n  %%%d = call "

	.section	__DATA,__const
	.globl	__func310_str2          ## @_func310_str2
	.p2align	3
__func310_str2:
	.quad	L_.str._func310_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func310_str3:                   ## @.str._func310_str3
	.asciz	" ("

	.section	__DATA,__const
	.globl	__func310_str3          ## @_func310_str3
	.p2align	3
__func310_str3:
	.quad	L_.str._func310_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func310_str4:                   ## @.str._func310_str4
	.asciz	")"

	.section	__DATA,__const
	.globl	__func310_str4          ## @_func310_str4
	.p2align	3
__func310_str4:
	.quad	L_.str._func310_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func312_str1:                   ## @.str._func312_str1
	.asciz	"\n  %%%d = extractvalue "

	.section	__DATA,__const
	.globl	__func312_str1          ## @_func312_str1
	.p2align	3
__func312_str1:
	.quad	L_.str._func312_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func312_str2:                   ## @.str._func312_str2
	.asciz	", %u"

	.section	__DATA,__const
	.globl	__func312_str2          ## @_func312_str2
	.p2align	3
__func312_str2:
	.quad	L_.str._func312_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func312_str3:                   ## @.str._func312_str3
	.asciz	"\n  %%%d = getelementptr inbounds "

	.section	__DATA,__const
	.globl	__func312_str3          ## @_func312_str3
	.p2align	3
__func312_str3:
	.quad	L_.str._func312_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func312_str4:                   ## @.str._func312_str4
	.asciz	"* "

	.section	__DATA,__const
	.globl	__func312_str4          ## @_func312_str4
	.p2align	3
__func312_str4:
	.quad	L_.str._func312_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func312_str5:                   ## @.str._func312_str5
	.asciz	", i32 0"

	.section	__DATA,__const
	.globl	__func312_str5          ## @_func312_str5
	.p2align	3
__func312_str5:
	.quad	L_.str._func312_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func313_str1:                   ## @.str._func313_str1
	.asciz	"print/expr:: v.field == Nil\n"

	.section	__DATA,__const
	.globl	__func313_str1          ## @_func313_str1
	.p2align	3
__func313_str1:
	.quad	L_.str._func313_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func313_str2:                   ## @.str._func313_str2
	.asciz	"\n  %%%d = extractvalue "

	.section	__DATA,__const
	.globl	__func313_str2          ## @_func313_str2
	.p2align	3
__func313_str2:
	.quad	L_.str._func313_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func313_str3:                   ## @.str._func313_str3
	.asciz	", %u"

	.section	__DATA,__const
	.globl	__func313_str3          ## @_func313_str3
	.p2align	3
__func313_str3:
	.quad	L_.str._func313_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func313_str4:                   ## @.str._func313_str4
	.asciz	"\n  %%%d = getelementptr inbounds "

	.section	__DATA,__const
	.globl	__func313_str4          ## @_func313_str4
	.p2align	3
__func313_str4:
	.quad	L_.str._func313_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func313_str5:                   ## @.str._func313_str5
	.asciz	"* "

	.section	__DATA,__const
	.globl	__func313_str5          ## @_func313_str5
	.p2align	3
__func313_str5:
	.quad	L_.str._func313_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func313_str6:                   ## @.str._func313_str6
	.asciz	", i32 0, i32 %u"

	.section	__DATA,__const
	.globl	__func313_str6          ## @_func313_str6
	.p2align	3
__func313_str6:
	.quad	L_.str._func313_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func314_str1:                   ## @.str._func314_str1
	.asciz	"\n  %%%d = getelementptr inbounds "

	.section	__DATA,__const
	.globl	__func314_str1          ## @_func314_str1
	.p2align	3
__func314_str1:
	.quad	L_.str._func314_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func314_str2:                   ## @.str._func314_str2
	.asciz	"* "

	.section	__DATA,__const
	.globl	__func314_str2          ## @_func314_str2
	.p2align	3
__func314_str2:
	.quad	L_.str._func314_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func314_str3:                   ## @.str._func314_str3
	.asciz	"i32 0"

	.section	__DATA,__const
	.globl	__func314_str3          ## @_func314_str3
	.p2align	3
__func314_str3:
	.quad	L_.str._func314_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func316_str1:                   ## @.str._func316_str1
	.asciz	"\n  %%%d = xor "

	.section	__DATA,__const
	.globl	__func316_str1          ## @_func316_str1
	.p2align	3
__func316_str1:
	.quad	L_.str._func316_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func316_str2:                   ## @.str._func316_str2
	.asciz	", 1"

	.section	__DATA,__const
	.globl	__func316_str2          ## @_func316_str2
	.p2align	3
__func316_str2:
	.quad	L_.str._func316_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func316_str3:                   ## @.str._func316_str3
	.asciz	", -1"

	.section	__DATA,__const
	.globl	__func316_str3          ## @_func316_str3
	.p2align	3
__func316_str3:
	.quad	L_.str._func316_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func317_str1:                   ## @.str._func317_str1
	.asciz	"\n  %%%d = sub nsw "

	.section	__DATA,__const
	.globl	__func317_str1          ## @_func317_str1
	.p2align	3
__func317_str1:
	.quad	L_.str._func317_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func317_str2:                   ## @.str._func317_str2
	.asciz	" 0"

	.section	__DATA,__const
	.globl	__func317_str2          ## @_func317_str2
	.p2align	3
__func317_str2:
	.quad	L_.str._func317_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str1:                   ## @.str._func318_str1
	.asciz	"\n  %%%d = "

	.section	__DATA,__const
	.globl	__func318_str1          ## @_func318_str1
	.p2align	3
__func318_str1:
	.quad	L_.str._func318_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str2:                   ## @.str._func318_str2
	.asciz	"<cast>"

	.section	__DATA,__const
	.globl	__func318_str2          ## @_func318_str2
	.p2align	3
__func318_str2:
	.quad	L_.str._func318_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str3:                   ## @.str._func318_str3
	.asciz	"inttoptr"

	.section	__DATA,__const
	.globl	__func318_str3          ## @_func318_str3
	.p2align	3
__func318_str3:
	.quad	L_.str._func318_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str4:                   ## @.str._func318_str4
	.asciz	"bitcast"

	.section	__DATA,__const
	.globl	__func318_str4          ## @_func318_str4
	.p2align	3
__func318_str4:
	.quad	L_.str._func318_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str5:                   ## @.str._func318_str5
	.asciz	"bitcast"

	.section	__DATA,__const
	.globl	__func318_str5          ## @_func318_str5
	.p2align	3
__func318_str5:
	.quad	L_.str._func318_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str6:                   ## @.str._func318_str6
	.asciz	"inttoptr"

	.section	__DATA,__const
	.globl	__func318_str6          ## @_func318_str6
	.p2align	3
__func318_str6:
	.quad	L_.str._func318_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str7:                   ## @.str._func318_str7
	.asciz	"trunc"

	.section	__DATA,__const
	.globl	__func318_str7          ## @_func318_str7
	.p2align	3
__func318_str7:
	.quad	L_.str._func318_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str8:                   ## @.str._func318_str8
	.asciz	"sext"

	.section	__DATA,__const
	.globl	__func318_str8          ## @_func318_str8
	.p2align	3
__func318_str8:
	.quad	L_.str._func318_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str9:                   ## @.str._func318_str9
	.asciz	"zext"

	.section	__DATA,__const
	.globl	__func318_str9          ## @_func318_str9
	.p2align	3
__func318_str9:
	.quad	L_.str._func318_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str10:                  ## @.str._func318_str10
	.asciz	"bitcast"

	.section	__DATA,__const
	.globl	__func318_str10         ## @_func318_str10
	.p2align	3
__func318_str10:
	.quad	L_.str._func318_str10

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str11:                  ## @.str._func318_str11
	.asciz	"ptrtoint"

	.section	__DATA,__const
	.globl	__func318_str11         ## @_func318_str11
	.p2align	3
__func318_str11:
	.quad	L_.str._func318_str11

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str12:                  ## @.str._func318_str12
	.asciz	"trunc"

	.section	__DATA,__const
	.globl	__func318_str12         ## @_func318_str12
	.p2align	3
__func318_str12:
	.quad	L_.str._func318_str12

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str13:                  ## @.str._func318_str13
	.asciz	"zext"

	.section	__DATA,__const
	.globl	__func318_str13         ## @_func318_str13
	.p2align	3
__func318_str13:
	.quad	L_.str._func318_str13

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str14:                  ## @.str._func318_str14
	.asciz	"bitcast"

	.section	__DATA,__const
	.globl	__func318_str14         ## @_func318_str14
	.p2align	3
__func318_str14:
	.quad	L_.str._func318_str14

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str15:                  ## @.str._func318_str15
	.asciz	"e.type.kind = %d\n"

	.section	__DATA,__const
	.globl	__func318_str15         ## @_func318_str15
	.p2align	3
__func318_str15:
	.quad	L_.str._func318_str15

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str16:                  ## @.str._func318_str16
	.asciz	"printer/expr/cast :: e.type.kind"

	.section	__DATA,__const
	.globl	__func318_str16         ## @_func318_str16
	.p2align	3
__func318_str16:
	.quad	L_.str._func318_str16

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str17:                  ## @.str._func318_str17
	.asciz	"%s "

	.section	__DATA,__const
	.globl	__func318_str17         ## @_func318_str17
	.p2align	3
__func318_str17:
	.quad	L_.str._func318_str17

	.section	__TEXT,__cstring,cstring_literals
L_.str._func318_str18:                  ## @.str._func318_str18
	.asciz	" to "

	.section	__DATA,__const
	.globl	__func318_str18         ## @_func318_str18
	.p2align	3
__func318_str18:
	.quad	L_.str._func318_str18

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str1:                   ## @.str._func319_str1
	.asciz	"<oper>"

	.section	__DATA,__const
	.globl	__func319_str1          ## @_func319_str1
	.p2align	3
__func319_str1:
	.quad	L_.str._func319_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str2:                   ## @.str._func319_str2
	.asciz	"add"

	.section	__DATA,__const
	.globl	__func319_str2          ## @_func319_str2
	.p2align	3
__func319_str2:
	.quad	L_.str._func319_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str3:                   ## @.str._func319_str3
	.asciz	"sub"

	.section	__DATA,__const
	.globl	__func319_str3          ## @_func319_str3
	.p2align	3
__func319_str3:
	.quad	L_.str._func319_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str4:                   ## @.str._func319_str4
	.asciz	"mul"

	.section	__DATA,__const
	.globl	__func319_str4          ## @_func319_str4
	.p2align	3
__func319_str4:
	.quad	L_.str._func319_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str5:                   ## @.str._func319_str5
	.asciz	"sdiv"

	.section	__DATA,__const
	.globl	__func319_str5          ## @_func319_str5
	.p2align	3
__func319_str5:
	.quad	L_.str._func319_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str6:                   ## @.str._func319_str6
	.asciz	"udiv"

	.section	__DATA,__const
	.globl	__func319_str6          ## @_func319_str6
	.p2align	3
__func319_str6:
	.quad	L_.str._func319_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str7:                   ## @.str._func319_str7
	.asciz	"srem"

	.section	__DATA,__const
	.globl	__func319_str7          ## @_func319_str7
	.p2align	3
__func319_str7:
	.quad	L_.str._func319_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str8:                   ## @.str._func319_str8
	.asciz	"urem"

	.section	__DATA,__const
	.globl	__func319_str8          ## @_func319_str8
	.p2align	3
__func319_str8:
	.quad	L_.str._func319_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str9:                   ## @.str._func319_str9
	.asciz	"or"

	.section	__DATA,__const
	.globl	__func319_str9          ## @_func319_str9
	.p2align	3
__func319_str9:
	.quad	L_.str._func319_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str10:                  ## @.str._func319_str10
	.asciz	"xor"

	.section	__DATA,__const
	.globl	__func319_str10         ## @_func319_str10
	.p2align	3
__func319_str10:
	.quad	L_.str._func319_str10

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str11:                  ## @.str._func319_str11
	.asciz	"and"

	.section	__DATA,__const
	.globl	__func319_str11         ## @_func319_str11
	.p2align	3
__func319_str11:
	.quad	L_.str._func319_str11

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str12:                  ## @.str._func319_str12
	.asciz	"icmp eq"

	.section	__DATA,__const
	.globl	__func319_str12         ## @_func319_str12
	.p2align	3
__func319_str12:
	.quad	L_.str._func319_str12

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str13:                  ## @.str._func319_str13
	.asciz	"icmp ne"

	.section	__DATA,__const
	.globl	__func319_str13         ## @_func319_str13
	.p2align	3
__func319_str13:
	.quad	L_.str._func319_str13

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str14:                  ## @.str._func319_str14
	.asciz	"icmp slt"

	.section	__DATA,__const
	.globl	__func319_str14         ## @_func319_str14
	.p2align	3
__func319_str14:
	.quad	L_.str._func319_str14

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str15:                  ## @.str._func319_str15
	.asciz	"icmp ult"

	.section	__DATA,__const
	.globl	__func319_str15         ## @_func319_str15
	.p2align	3
__func319_str15:
	.quad	L_.str._func319_str15

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str16:                  ## @.str._func319_str16
	.asciz	"icmp sgt"

	.section	__DATA,__const
	.globl	__func319_str16         ## @_func319_str16
	.p2align	3
__func319_str16:
	.quad	L_.str._func319_str16

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str17:                  ## @.str._func319_str17
	.asciz	"icmp ugt"

	.section	__DATA,__const
	.globl	__func319_str17         ## @_func319_str17
	.p2align	3
__func319_str17:
	.quad	L_.str._func319_str17

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str18:                  ## @.str._func319_str18
	.asciz	"icmp sle"

	.section	__DATA,__const
	.globl	__func319_str18         ## @_func319_str18
	.p2align	3
__func319_str18:
	.quad	L_.str._func319_str18

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str19:                  ## @.str._func319_str19
	.asciz	"icmp ule"

	.section	__DATA,__const
	.globl	__func319_str19         ## @_func319_str19
	.p2align	3
__func319_str19:
	.quad	L_.str._func319_str19

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str20:                  ## @.str._func319_str20
	.asciz	"icmp sge"

	.section	__DATA,__const
	.globl	__func319_str20         ## @_func319_str20
	.p2align	3
__func319_str20:
	.quad	L_.str._func319_str20

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str21:                  ## @.str._func319_str21
	.asciz	"icmp uge"

	.section	__DATA,__const
	.globl	__func319_str21         ## @_func319_str21
	.p2align	3
__func319_str21:
	.quad	L_.str._func319_str21

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str22:                  ## @.str._func319_str22
	.asciz	"shl"

	.section	__DATA,__const
	.globl	__func319_str22         ## @_func319_str22
	.p2align	3
__func319_str22:
	.quad	L_.str._func319_str22

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str23:                  ## @.str._func319_str23
	.asciz	"ashr"

	.section	__DATA,__const
	.globl	__func319_str23         ## @_func319_str23
	.p2align	3
__func319_str23:
	.quad	L_.str._func319_str23

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str24:                  ## @.str._func319_str24
	.asciz	"lshr"

	.section	__DATA,__const
	.globl	__func319_str24         ## @_func319_str24
	.p2align	3
__func319_str24:
	.quad	L_.str._func319_str24

	.section	__TEXT,__cstring,cstring_literals
L_.str._func319_str25:                  ## @.str._func319_str25
	.asciz	"\n  %%%d = %s "

	.section	__DATA,__const
	.globl	__func319_str25         ## @_func319_str25
	.p2align	3
__func319_str25:
	.quad	L_.str._func319_str25

	.section	__TEXT,__cstring,cstring_literals
L_.str._func320_str1:                   ## @.str._func320_str1
	.asciz	"\n  store "

	.section	__DATA,__const
	.globl	__func320_str1          ## @_func320_str1
	.p2align	3
__func320_str1:
	.quad	L_.str._func320_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func320_str2:                   ## @.str._func320_str2
	.asciz	"* "

	.section	__DATA,__const
	.globl	__func320_str2          ## @_func320_str2
	.p2align	3
__func320_str2:
	.quad	L_.str._func320_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func322_str1:                   ## @.str._func322_str1
	.asciz	"\n  %%%d = inttoptr i64 "

	.section	__DATA,__const
	.globl	__func322_str1          ## @_func322_str1
	.p2align	3
__func322_str1:
	.quad	L_.str._func322_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func322_str2:                   ## @.str._func322_str2
	.asciz	" to "

	.section	__DATA,__const
	.globl	__func322_str2          ## @_func322_str2
	.p2align	3
__func322_str2:
	.quad	L_.str._func322_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func321_str1:                   ## @.str._func321_str1
	.asciz	"\n  %%%d = load "

	.section	__DATA,__const
	.globl	__func321_str1          ## @_func321_str1
	.p2align	3
__func321_str1:
	.quad	L_.str._func321_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func321_str2:                   ## @.str._func321_str2
	.asciz	"* "

	.section	__DATA,__const
	.globl	__func321_str2          ## @_func321_str2
	.p2align	3
__func321_str2:
	.quad	L_.str._func321_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func323_str1:                   ## @.str._func323_str1
	.asciz	"%d"

	.section	__DATA,__const
	.globl	__func323_str1          ## @_func323_str1
	.p2align	3
__func323_str1:
	.quad	L_.str._func323_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func323_str2:                   ## @.str._func323_str2
	.asciz	"%%%d"

	.section	__DATA,__const
	.globl	__func323_str2          ## @_func323_str2
	.p2align	3
__func323_str2:
	.quad	L_.str._func323_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func323_str3:                   ## @.str._func323_str3
	.asciz	"@%s"

	.section	__DATA,__const
	.globl	__func323_str3          ## @_func323_str3
	.p2align	3
__func323_str3:
	.quad	L_.str._func323_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func323_str4:                   ## @.str._func323_str4
	.asciz	"%%%d"

	.section	__DATA,__const
	.globl	__func323_str4          ## @_func323_str4
	.p2align	3
__func323_str4:
	.quad	L_.str._func323_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func323_str5:                   ## @.str._func323_str5
	.asciz	"<OperandInvalid>"

	.section	__DATA,__const
	.globl	__func323_str5          ## @_func323_str5
	.p2align	3
__func323_str5:
	.quad	L_.str._func323_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func324_str1:                   ## @.str._func324_str1
	.asciz	"\n%%%s = type "

	.section	__DATA,__const
	.globl	__func324_str1          ## @_func324_str1
	.p2align	3
__func324_str1:
	.quad	L_.str._func324_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func325_str1:                   ## @.str._func325_str1
	.asciz	"\n@%s = private unnamed_addr constant [%d x "

	.section	__DATA,__const
	.globl	__func325_str1          ## @_func325_str1
	.p2align	3
__func325_str1:
	.quad	L_.str._func325_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func325_str2:                   ## @.str._func325_str2
	.asciz	"] ["

	.section	__DATA,__const
	.globl	__func325_str2          ## @_func325_str2
	.p2align	3
__func325_str2:
	.quad	L_.str._func325_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func325_str3:                   ## @.str._func325_str3
	.asciz	"], align 16"

	.section	__DATA,__const
	.globl	__func325_str3          ## @_func325_str3
	.p2align	3
__func325_str3:
	.quad	L_.str._func325_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str1:                   ## @.str._func327_str1
	.asciz	"\n@.str.%s = private unnamed_addr constant [%d x i8] c\""

	.section	__DATA,__const
	.globl	__func327_str1          ## @_func327_str1
	.p2align	3
__func327_str1:
	.quad	L_.str._func327_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str2:                   ## @.str._func327_str2
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func327_str2          ## @_func327_str2
	.p2align	3
__func327_str2:
	.quad	L_.str._func327_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str3:                   ## @.str._func327_str3
	.asciz	"\r"

	.section	__DATA,__const
	.globl	__func327_str3          ## @_func327_str3
	.p2align	3
__func327_str3:
	.quad	L_.str._func327_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str4:                   ## @.str._func327_str4
	.asciz	"\t"

	.section	__DATA,__const
	.globl	__func327_str4          ## @_func327_str4
	.p2align	3
__func327_str4:
	.quad	L_.str._func327_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str5:                   ## @.str._func327_str5
	.asciz	"\013"

	.section	__DATA,__const
	.globl	__func327_str5          ## @_func327_str5
	.p2align	3
__func327_str5:
	.quad	L_.str._func327_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str6:                   ## @.str._func327_str6
	.asciz	"\007"

	.section	__DATA,__const
	.globl	__func327_str6          ## @_func327_str6
	.p2align	3
__func327_str6:
	.quad	L_.str._func327_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str7:                   ## @.str._func327_str7
	.asciz	"\b"

	.section	__DATA,__const
	.globl	__func327_str7          ## @_func327_str7
	.p2align	3
__func327_str7:
	.quad	L_.str._func327_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str8:                   ## @.str._func327_str8
	.asciz	"\\"

	.section	__DATA,__const
	.globl	__func327_str8          ## @_func327_str8
	.p2align	3
__func327_str8:
	.quad	L_.str._func327_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str9:                   ## @.str._func327_str9
	.asciz	"\""

	.section	__DATA,__const
	.globl	__func327_str9          ## @_func327_str9
	.p2align	3
__func327_str9:
	.quad	L_.str._func327_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str10:                  ## @.str._func327_str10
	.asciz	"\\%02X"

	.section	__DATA,__const
	.globl	__func327_str10         ## @_func327_str10
	.p2align	3
__func327_str10:
	.quad	L_.str._func327_str10

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str11:                  ## @.str._func327_str11
	.asciz	"%c"

	.section	__DATA,__const
	.globl	__func327_str11         ## @_func327_str11
	.p2align	3
__func327_str11:
	.quad	L_.str._func327_str11

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str12:                  ## @.str._func327_str12
	.asciz	"\\%02d\", align 1"

	.section	__DATA,__const
	.globl	__func327_str12         ## @_func327_str12
	.p2align	3
__func327_str12:
	.quad	L_.str._func327_str12

	.section	__TEXT,__cstring,cstring_literals
L_.str._func327_str13:                  ## @.str._func327_str13
	.asciz	"\n@%s = constant i8* getelementptr inbounds ([%d x i8], [%d x i8]* @.str.%s, i32 0, i32 0), align 8"

	.section	__DATA,__const
	.globl	__func327_str13         ## @_func327_str13
	.p2align	3
__func327_str13:
	.quad	L_.str._func327_str13

	.section	__TEXT,__cstring,cstring_literals
L_.str._func328_str1:                   ## @.str._func328_str1
	.asciz	"\n@%s = global "

	.section	__DATA,__const
	.globl	__func328_str1          ## @_func328_str1
	.p2align	3
__func328_str1:
	.quad	L_.str._func328_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func328_str2:                   ## @.str._func328_str2
	.asciz	"zeroinitializer"

	.section	__DATA,__const
	.globl	__func328_str2          ## @_func328_str2
	.p2align	3
__func328_str2:
	.quad	L_.str._func328_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func329_str1:                   ## @.str._func329_str1
	.asciz	"prn/funcdef t = Nil"

	.section	__DATA,__const
	.globl	__func329_str1          ## @_func329_str1
	.p2align	3
__func329_str1:
	.quad	L_.str._func329_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func329_str2:                   ## @.str._func329_str2
	.asciz	"\ndeclare"

	.section	__DATA,__const
	.globl	__func329_str2          ## @_func329_str2
	.p2align	3
__func329_str2:
	.quad	L_.str._func329_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func329_str3:                   ## @.str._func329_str3
	.asciz	"\n\ndefine"

	.section	__DATA,__const
	.globl	__func329_str3          ## @_func329_str3
	.p2align	3
__func329_str3:
	.quad	L_.str._func329_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func329_str4:                   ## @.str._func329_str4
	.asciz	"void"

	.section	__DATA,__const
	.globl	__func329_str4          ## @_func329_str4
	.p2align	3
__func329_str4:
	.quad	L_.str._func329_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func329_str5:                   ## @.str._func329_str5
	.asciz	" @%s ("

	.section	__DATA,__const
	.globl	__func329_str5          ## @_func329_str5
	.p2align	3
__func329_str5:
	.quad	L_.str._func329_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func330_str1:                   ## @.str._func330_str1
	.asciz	", "

	.section	__DATA,__const
	.globl	__func330_str1          ## @_func330_str1
	.p2align	3
__func330_str1:
	.quad	L_.str._func330_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func329_str6:                   ## @.str._func329_str6
	.asciz	", ..."

	.section	__DATA,__const
	.globl	__func329_str6          ## @_func329_str6
	.p2align	3
__func329_str6:
	.quad	L_.str._func329_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func329_str7:                   ## @.str._func329_str7
	.asciz	")"

	.section	__DATA,__const
	.globl	__func329_str7          ## @_func329_str7
	.p2align	3
__func329_str7:
	.quad	L_.str._func329_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func329_str8:                   ## @.str._func329_str8
	.asciz	" {"

	.section	__DATA,__const
	.globl	__func329_str8          ## @_func329_str8
	.p2align	3
__func329_str8:
	.quad	L_.str._func329_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func329_str9:                   ## @.str._func329_str9
	.asciz	"\n  ret void"

	.section	__DATA,__const
	.globl	__func329_str9          ## @_func329_str9
	.p2align	3
__func329_str9:
	.quad	L_.str._func329_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func329_str10:                  ## @.str._func329_str10
	.asciz	"\n}"

	.section	__DATA,__const
	.globl	__func329_str10         ## @_func329_str10
	.p2align	3
__func329_str10:
	.quad	L_.str._func329_str10

	.section	__TEXT,__cstring,cstring_literals
L_.str._func331_str1:                   ## @.str._func331_str1
	.asciz	"w"

	.section	__DATA,__const
	.globl	__func331_str1          ## @_func331_str1
	.p2align	3
__func331_str1:
	.quad	L_.str._func331_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func331_str2:                   ## @.str._func331_str2
	.asciz	"cannot create output file"

	.section	__DATA,__const
	.globl	__func331_str2          ## @_func331_str2
	.p2align	3
__func331_str2:
	.quad	L_.str._func331_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func331_str3:                   ## @.str._func331_str3
	.asciz	"; clang out2.ll && ./a.out\n\n"

	.section	__DATA,__const
	.globl	__func331_str3          ## @_func331_str3
	.p2align	3
__func331_str3:
	.quad	L_.str._func331_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func331_str4:                   ## @.str._func331_str4
	.asciz	"; llc out2.ll ; for create .s file from .ll\n"

	.section	__DATA,__const
	.globl	__func331_str4          ## @_func331_str4
	.p2align	3
__func331_str4:
	.quad	L_.str._func331_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func331_str5:                   ## @.str._func331_str5
	.asciz	"%%Enum = type i32\n"

	.section	__DATA,__const
	.globl	__func331_str5          ## @_func331_str5
	.p2align	3
__func331_str5:
	.quad	L_.str._func331_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func331_str6:                   ## @.str._func331_str6
	.asciz	"%%Bool = type i1\n"

	.section	__DATA,__const
	.globl	__func331_str6          ## @_func331_str6
	.p2align	3
__func331_str6:
	.quad	L_.str._func331_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func331_str7:                   ## @.str._func331_str7
	.asciz	"%%Unit = type i1\n"

	.section	__DATA,__const
	.globl	__func331_str7          ## @_func331_str7
	.p2align	3
__func331_str7:
	.quad	L_.str._func331_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func331_str8:                   ## @.str._func331_str8
	.asciz	"%%Str = type i8*\n"

	.section	__DATA,__const
	.globl	__func331_str8          ## @_func331_str8
	.p2align	3
__func331_str8:
	.quad	L_.str._func331_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func332_str1:                   ## @.str._func332_str1
	.asciz	"%%%s = type i%d\n"

	.section	__DATA,__const
	.globl	__func332_str1          ## @_func332_str1
	.p2align	3
__func332_str1:
	.quad	L_.str._func332_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func331_str9:                   ## @.str._func331_str9
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func331_str9          ## @_func331_str9
	.p2align	3
__func331_str9:
	.quad	L_.str._func331_str9

	.section	__TEXT,__cstring,cstring_literals
L_.str._func333_str1:                   ## @.str._func333_str1
	.asciz	"print_assembly: %s\n"

	.section	__DATA,__const
	.globl	__func333_str1          ## @_func333_str1
	.p2align	3
__func333_str1:
	.quad	L_.str._func333_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func333_str2:                   ## @.str._func333_str2
	.asciz	"\n; assembly: %s\n"

	.section	__DATA,__const
	.globl	__func333_str2          ## @_func333_str2
	.p2align	3
__func333_str2:
	.quad	L_.str._func333_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func333_str3:                   ## @.str._func333_str3
	.asciz	"\n\n;types:\n"

	.section	__DATA,__const
	.globl	__func333_str3          ## @_func333_str3
	.p2align	3
__func333_str3:
	.quad	L_.str._func333_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func333_str4:                   ## @.str._func333_str4
	.asciz	"\n\n;strings:\n"

	.section	__DATA,__const
	.globl	__func333_str4          ## @_func333_str4
	.p2align	3
__func333_str4:
	.quad	L_.str._func333_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func335_str1:                   ## @.str._func335_str1
	.asciz	"NIL: %s\n"

	.section	__DATA,__const
	.globl	__func335_str1          ## @_func335_str1
	.p2align	3
__func335_str1:
	.quad	L_.str._func335_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func333_str5:                   ## @.str._func333_str5
	.asciz	"\n\n;arrays:\n"

	.section	__DATA,__const
	.globl	__func333_str5          ## @_func333_str5
	.p2align	3
__func333_str5:
	.quad	L_.str._func333_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func333_str6:                   ## @.str._func333_str6
	.asciz	"\n\n;vars:\n"

	.section	__DATA,__const
	.globl	__func333_str6          ## @_func333_str6
	.p2align	3
__func333_str6:
	.quad	L_.str._func333_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func333_str7:                   ## @.str._func333_str7
	.asciz	"\n\n;funcs:\n"

	.section	__DATA,__const
	.globl	__func333_str7          ## @_func333_str7
	.p2align	3
__func333_str7:
	.quad	L_.str._func333_str7

	.section	__TEXT,__cstring,cstring_literals
L_.str._func333_str8:                   ## @.str._func333_str8
	.asciz	"\n\n;metadata:\n"

	.section	__DATA,__const
	.globl	__func333_str8          ## @_func333_str8
	.p2align	3
__func333_str8:
	.quad	L_.str._func333_str8

	.section	__TEXT,__cstring,cstring_literals
L_.str._func339_str1:                   ## @.str._func339_str1
	.asciz	"target datalayout = \"e-m:o-i64:64-f80:128-n8:16:32:64-S128\"\n"

	.section	__DATA,__const
	.globl	__func339_str1          ## @_func339_str1
	.p2align	3
__func339_str1:
	.quad	L_.str._func339_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func339_str2:                   ## @.str._func339_str2
	.asciz	"target triple = \"x86_64-apple-macosx10.14.0\"\n"

	.section	__DATA,__const
	.globl	__func339_str2          ## @_func339_str2
	.p2align	3
__func339_str2:
	.quad	L_.str._func339_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func339_str3:                   ## @.str._func339_str3
	.asciz	"target datalayout = \"e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64\"\n"

	.section	__DATA,__const
	.globl	__func339_str3          ## @_func339_str3
	.p2align	3
__func339_str3:
	.quad	L_.str._func339_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func339_str4:                   ## @.str._func339_str4
	.asciz	"target triple = \"thumbv7em-unknown-none-eabi\"\n"

	.section	__DATA,__const
	.globl	__func339_str4          ## @_func339_str4
	.p2align	3
__func339_str4:
	.quad	L_.str._func339_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func339_str5:                   ## @.str._func339_str5
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func339_str5          ## @_func339_str5
	.p2align	3
__func339_str5:
	.quad	L_.str._func339_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func340_str1:                   ## @.str._func340_str1
	.asciz	"\n;type_index:\n"

	.section	__DATA,__const
	.globl	__func340_str1          ## @_func340_str1
	.p2align	3
__func340_str1:
	.quad	L_.str._func340_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func341_str1:                   ## @.str._func341_str1
	.asciz	";* %s -> %p\n"

	.section	__DATA,__const
	.globl	__func341_str1          ## @_func341_str1
	.p2align	3
__func341_str1:
	.quad	L_.str._func341_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func342_str1:                   ## @.str._func342_str1
	.asciz	"\n;value_index:\n"

	.section	__DATA,__const
	.globl	__func342_str1          ## @_func342_str1
	.p2align	3
__func342_str1:
	.quad	L_.str._func342_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func343_str1:                   ## @.str._func343_str1
	.asciz	"\n;#%s -> %p {"

	.section	__DATA,__const
	.globl	__func343_str1          ## @_func343_str1
	.p2align	3
__func343_str1:
	.quad	L_.str._func343_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func343_str2:                   ## @.str._func343_str2
	.asciz	"\n;  v.kind = %s"

	.section	__DATA,__const
	.globl	__func343_str2          ## @_func343_str2
	.p2align	3
__func343_str2:
	.quad	L_.str._func343_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func343_str3:                   ## @.str._func343_str3
	.asciz	"\n;}\n"

	.section	__DATA,__const
	.globl	__func343_str3          ## @_func343_str3
	.p2align	3
__func343_str3:
	.quad	L_.str._func343_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str.MINOR_LIB_ENV_VAR:               ## @.str.MINOR_LIB_ENV_VAR
	.asciz	"MINOR_LIB"

	.section	__DATA,__const
	.globl	_MINOR_LIB_ENV_VAR      ## @MINOR_LIB_ENV_VAR
	.p2align	3
_MINOR_LIB_ENV_VAR:
	.quad	L_.str.MINOR_LIB_ENV_VAR

	.section	__TEXT,__cstring,cstring_literals
L_.str._func344_str1:                   ## @.str._func344_str1
	.asciz	"enviroment variable MINOR_LIB not defined"

	.section	__DATA,__const
	.globl	__func344_str1          ## @_func344_str1
	.p2align	3
__func344_str1:
	.quad	L_.str._func344_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func344_str2:                   ## @.str._func344_str2
	.asciz	"<asm0>"

	.section	__DATA,__const
	.globl	__func344_str2          ## @_func344_str2
	.p2align	3
__func344_str2:
	.quad	L_.str._func344_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func345_str1:                   ## @.str._func345_str1
	.asciz	"readConfig = %s\n"

	.section	__DATA,__const
	.globl	__func345_str1          ## @_func345_str1
	.p2align	3
__func345_str1:
	.quad	L_.str._func345_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func345_str2:                   ## @.str._func345_str2
	.asciz	"config"

	.section	__DATA,__const
	.globl	__func345_str2          ## @_func345_str2
	.p2align	3
__func345_str2:
	.quad	L_.str._func345_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func345_str3:                   ## @.str._func345_str3
	.asciz	"="

	.section	__DATA,__const
	.globl	__func345_str3          ## @_func345_str3
	.p2align	3
__func345_str3:
	.quad	L_.str._func345_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func345_str4:                   ## @.str._func345_str4
	.asciz	"%lld"

	.section	__DATA,__const
	.globl	__func345_str4          ## @_func345_str4
	.p2align	3
__func345_str4:
	.quad	L_.str._func345_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func345_str5:                   ## @.str._func345_str5
	.asciz	"%s = %lld\n"

	.section	__DATA,__const
	.globl	__func345_str5          ## @_func345_str5
	.p2align	3
__func345_str5:
	.quad	L_.str._func345_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func350_str1:                   ## @.str._func350_str1
	.asciz	"m2 v%d.%d\n"

	.section	__DATA,__const
	.globl	__func350_str1          ## @_func350_str1
	.p2align	3
__func350_str1:
	.quad	L_.str._func350_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func350_str2:                   ## @.str._func350_str2
	.asciz	"main"

	.section	__DATA,__const
	.globl	__func350_str2          ## @_func350_str2
	.p2align	3
__func350_str2:
	.quad	L_.str._func350_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func350_str3:                   ## @.str._func350_str3
	.asciz	"lines: %d\n"

	.section	__DATA,__const
	.globl	__func350_str3          ## @_func350_str3
	.p2align	3
__func350_str3:
	.quad	L_.str._func350_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func350_str4:                   ## @.str._func350_str4
	.asciz	"error : %d\n"

	.section	__DATA,__const
	.globl	__func350_str4          ## @_func350_str4
	.p2align	3
__func350_str4:
	.quad	L_.str._func350_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func350_str5:                   ## @.str._func350_str5
	.asciz	"main.ll"

	.section	__DATA,__const
	.globl	__func350_str5          ## @_func350_str5
	.p2align	3
__func350_str5:
	.quad	L_.str._func350_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func351_str1:                   ## @.str._func351_str1
	.asciz	"-arch="

	.section	__DATA,__const
	.globl	__func351_str1          ## @_func351_str1
	.p2align	3
__func351_str1:
	.quad	L_.str._func351_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func351_str2:                   ## @.str._func351_str2
	.asciz	"cortex-m3"

	.section	__DATA,__const
	.globl	__func351_str2          ## @_func351_str2
	.p2align	3
__func351_str2:
	.quad	L_.str._func351_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func351_str3:                   ## @.str._func351_str3
	.asciz	"x64"

	.section	__DATA,__const
	.globl	__func351_str3          ## @_func351_str3
	.p2align	3
__func351_str3:
	.quad	L_.str._func351_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func351_str4:                   ## @.str._func351_str4
	.asciz	"unknown architecture"

	.section	__DATA,__const
	.globl	__func351_str4          ## @_func351_str4
	.p2align	3
__func351_str4:
	.quad	L_.str._func351_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func351_str5:                   ## @.str._func351_str5
	.asciz	"-lib="

	.section	__DATA,__const
	.globl	__func351_str5          ## @_func351_str5
	.p2align	3
__func351_str5:
	.quad	L_.str._func351_str5

	.section	__TEXT,__cstring,cstring_literals
L_.str._func351_str6:                   ## @.str._func351_str6
	.asciz	"-conf="

	.section	__DATA,__const
	.globl	__func351_str6          ## @_func351_str6
	.p2align	3
__func351_str6:
	.quad	L_.str._func351_str6

	.section	__TEXT,__cstring,cstring_literals
L_.str._func352_str1:                   ## @.str._func352_str1
	.asciz	"usage:\n"

	.section	__DATA,__const
	.globl	__func352_str1          ## @_func352_str1
	.p2align	3
__func352_str1:
	.quad	L_.str._func352_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func352_str2:                   ## @.str._func352_str2
	.asciz	"  -lib=/path/to/lib/dir\n"

	.section	__DATA,__const
	.globl	__func352_str2          ## @_func352_str2
	.p2align	3
__func352_str2:
	.quad	L_.str._func352_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func352_str3:                   ## @.str._func352_str3
	.asciz	"  -arch=x86, cortex-m3\n"

	.section	__DATA,__const
	.globl	__func352_str3          ## @_func352_str3
	.p2align	3
__func352_str3:
	.quad	L_.str._func352_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func352_str4:                   ## @.str._func352_str4
	.asciz	"  m2 <target>\n\n"

	.section	__DATA,__const
	.globl	__func352_str4          ## @_func352_str4
	.p2align	3
__func352_str4:
	.quad	L_.str._func352_str4

	.section	__TEXT,__cstring,cstring_literals
L_.str._func354_str1:                   ## @.str._func354_str1
	.asciz	"* %s"

	.section	__DATA,__const
	.globl	__func354_str1          ## @_func354_str1
	.p2align	3
__func354_str1:
	.quad	L_.str._func354_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func354_str2:                   ## @.str._func354_str2
	.asciz	" "

	.section	__DATA,__const
	.globl	__func354_str2          ## @_func354_str2
	.p2align	3
__func354_str2:
	.quad	L_.str._func354_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func354_str3:                   ## @.str._func354_str3
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func354_str3          ## @_func354_str3
	.p2align	3
__func354_str3:
	.quad	L_.str._func354_str3

	.section	__TEXT,__cstring,cstring_literals
L_.str._func356_str1:                   ## @.str._func356_str1
	.asciz	"VAL: %s"

	.section	__DATA,__const
	.globl	__func356_str1          ## @_func356_str1
	.p2align	3
__func356_str1:
	.quad	L_.str._func356_str1

	.section	__TEXT,__cstring,cstring_literals
L_.str._func356_str2:                   ## @.str._func356_str2
	.asciz	" "

	.section	__DATA,__const
	.globl	__func356_str2          ## @_func356_str2
	.p2align	3
__func356_str2:
	.quad	L_.str._func356_str2

	.section	__TEXT,__cstring,cstring_literals
L_.str._func356_str3:                   ## @.str._func356_str3
	.asciz	"\n"

	.section	__DATA,__const
	.globl	__func356_str3          ## @_func356_str3
	.p2align	3
__func356_str3:
	.quad	L_.str._func356_str3

	.globl	_cfg                    ## @cfg
.zerofill __DATA,__common,_cfg,24,4
	.globl	_arch                   ## @arch
.zerofill __DATA,__common,_arch,2,1
	.globl	_settings               ## @settings
.zerofill __DATA,__common,_settings,8,3
	.globl	_lstate                 ## @lstate
.zerofill __DATA,__common,_lstate,296,4
	.globl	_lines                  ## @lines
.zerofill __DATA,__common,_lines,4,2
	.globl	_pdir                   ## @pdir
.zerofill __DATA,__common,_pdir,8,3
	.globl	_liblist                ## @liblist
.zerofill __DATA,__common,_liblist,24,4
	.globl	_warncnt                ## @warncnt
.zerofill __DATA,__common,_warncnt,4,2
	.globl	_errcnt                 ## @errcnt
.zerofill __DATA,__common,_errcnt,4,2
	.globl	_needs                  ## @needs
.zerofill __DATA,__common,_needs,1,0
	.globl	_typeUnknown            ## @typeUnknown
.zerofill __DATA,__common,_typeUnknown,8,3
	.globl	_typeUnit               ## @typeUnit
.zerofill __DATA,__common,_typeUnit,8,3
	.globl	_typeBool               ## @typeBool
.zerofill __DATA,__common,_typeBool,8,3
	.globl	_typeChar               ## @typeChar
.zerofill __DATA,__common,_typeChar,8,3
	.globl	_typeStr                ## @typeStr
.zerofill __DATA,__common,_typeStr,8,3
	.globl	_typeEnum               ## @typeEnum
.zerofill __DATA,__common,_typeEnum,8,3
	.globl	_typeBaseInt            ## @typeBaseInt
.zerofill __DATA,__common,_typeBaseInt,8,3
	.globl	_typeFreePtr            ## @typeFreePtr
.zerofill __DATA,__common,_typeFreePtr,8,3
	.globl	_typeNumeric            ## @typeNumeric
.zerofill __DATA,__common,_typeNumeric,8,3
	.globl	_uid                    ## @uid
.zerofill __DATA,__common,_uid,4,2
	.globl	_globalTypeIndex        ## @globalTypeIndex
.zerofill __DATA,__common,_globalTypeIndex,24,4
	.globl	_globalValueIndex       ## @globalValueIndex
.zerofill __DATA,__common,_globalValueIndex,24,4
	.globl	_func_uid               ## @func_uid
.zerofill __DATA,__common,_func_uid,4,2
	.globl	_str_uid                ## @str_uid
.zerofill __DATA,__common,_str_uid,4,2
	.globl	_arr_uid                ## @arr_uid
.zerofill __DATA,__common,_arr_uid,4,2
	.globl	_var_uid                ## @var_uid
.zerofill __DATA,__common,_var_uid,4,2
	.globl	_type_uid               ## @type_uid
.zerofill __DATA,__common,_type_uid,4,2
	.globl	_imports                ## @imports
.zerofill __DATA,__common,_imports,24,4
	.globl	_mctx                   ## @mctx
.zerofill __DATA,__common,_mctx,56,4
	.globl	_fctx                   ## @fctx
.zerofill __DATA,__common,_fctx,40,4
	.globl	_asm0                   ## @asm0
.zerofill __DATA,__common,_asm0,48,4
	.globl	_comments               ## @comments
.zerofill __DATA,__common,_comments,1,0
	.globl	_fout                   ## @fout
.zerofill __DATA,__common,_fout,8,3
	.globl	_lab                    ## @lab
.zerofill __DATA,__common,_lab,4,2
	.globl	_md                     ## @md
.zerofill __DATA,__common,_md,4,2
	.globl	_md_list                ## @md_list
.zerofill __DATA,__common,_md_list,24,4
	.globl	_if_id                  ## @if_id
.zerofill __DATA,__common,_if_id,4,2
	.globl	_global_while_id        ## @global_while_id
.zerofill __DATA,__common,_global_while_id,4,2
	.globl	_old_while_id           ## @old_while_id
.zerofill __DATA,__common,_old_while_id,4,2
	.globl	_blockno                ## @blockno
.zerofill __DATA,__common,_blockno,4,2
	.globl	_stmtno                 ## @stmtno
.zerofill __DATA,__common,_stmtno,4,2

.subsections_via_symbols
