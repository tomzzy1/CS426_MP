	.text
	.file	"copy_o2.ll"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	Main_new@PLT
	movq	%rax, %rdi
	callq	Main.main@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	Main.main                       # -- Begin function Main.main
	.p2align	4, 0x90
	.type	Main.main,@function
Main.main:                              # @Main.main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, (%rsp)
	callq	A_new@PLT
	testq	%rax, %rax
	je	.LBB1_9
# %bb.1:                                # %ok.0
	movq	%rax, 16(%rsp)
	movq	$0, 8(%rsp)
	je	.LBB1_9
# %bb.2:                                # %ok.1
	movq	(%rax), %rcx
	movq	%rax, %rdi
	callq	*40(%rcx)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB1_9
# %bb.3:                                # %ok.2
	movq	(%rax), %rcx
	movq	%rax, %rdi
	movl	$21, %esi
	callq	*56(%rcx)
	movq	16(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_9
# %bb.4:                                # %ok.3
	movq	(%rdi), %rax
	callq	*48(%rax)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_9
# %bb.5:                                # %ok.4
	movq	(%rdi), %rcx
	movl	%eax, %esi
	callq	*56(%rcx)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_9
# %bb.6:                                # %ok.5
	movq	(%rdi), %rax
	movq	String.1@GOTPCREL(%rip), %rsi
	callq	*48(%rax)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_9
# %bb.7:                                # %ok.6
	movq	(%rdi), %rax
	callq	*48(%rax)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_9
# %bb.8:                                # %ok.7
	movq	(%rdi), %rcx
	movl	%eax, %esi
	callq	*56(%rcx)
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB1_9:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end1:
	.size	Main.main, .Lfunc_end1-Main.main
	.cfi_endproc
                                        # -- End function
	.globl	Main_new                        # -- Begin function Main_new
	.p2align	4, 0x90
	.type	Main_new,@function
Main_new:                               # @Main_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	_Main_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB2_2
# %bb.1:                                # %ok.8
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB2_2:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end2:
	.size	Main_new, .Lfunc_end2-Main_new
	.cfi_endproc
                                        # -- End function
	.globl	A.getAnswerToAll                # -- Begin function A.getAnswerToAll
	.p2align	4, 0x90
	.type	A.getAnswerToAll,@function
A.getAnswerToAll:                       # @A.getAnswerToAll
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	8(%rdi), %eax
	retq
.Lfunc_end3:
	.size	A.getAnswerToAll, .Lfunc_end3-A.getAnswerToAll
	.cfi_endproc
                                        # -- End function
	.globl	A.setAnswerToAll                # -- Begin function A.setAnswerToAll
	.p2align	4, 0x90
	.type	A.setAnswerToAll,@function
A.setAnswerToAll:                       # @A.setAnswerToAll
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -16(%rsp)
	movl	%esi, -4(%rsp)
	movl	%esi, 8(%rdi)
	movq	-16(%rsp), %rax
	retq
.Lfunc_end4:
	.size	A.setAnswerToAll, .Lfunc_end4-A.setAnswerToAll
	.cfi_endproc
                                        # -- End function
	.globl	A_new                           # -- Begin function A_new
	.p2align	4, 0x90
	.type	A_new,@function
A_new:                                  # @A_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	_A_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB5_2
# %bb.1:                                # %ok.0
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	movl	$42, 8(%rax)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB5_2:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end5:
	.size	A_new, .Lfunc_end5-A_new
	.cfi_endproc
                                        # -- End function
	.type	str.Object,@object              # @str.Object
	.section	.rodata,"a",@progbits
str.Object:
	.asciz	"Object"
	.size	str.Object, 7

	.type	_Object_vtable_prototype,@object # @_Object_vtable_prototype
	.globl	_Object_vtable_prototype
	.p2align	4
_Object_vtable_prototype:
	.long	0                               # 0x0
	.long	0+8
	.quad	str.Object
	.quad	Object_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	_Object_vtable_prototype, 48

	.type	str.Int,@object                 # @str.Int
str.Int:
	.asciz	"Int"
	.size	str.Int, 4

	.type	_Int_vtable_prototype,@object   # @_Int_vtable_prototype
	.globl	_Int_vtable_prototype
	.p2align	4
_Int_vtable_prototype:
	.long	1                               # 0x1
	.long	0+16
	.quad	str.Int
	.quad	Int_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	_Int_vtable_prototype, 48

	.type	str.Bool,@object                # @str.Bool
str.Bool:
	.asciz	"Bool"
	.size	str.Bool, 5

	.type	_Bool_vtable_prototype,@object  # @_Bool_vtable_prototype
	.globl	_Bool_vtable_prototype
	.p2align	4
_Bool_vtable_prototype:
	.long	2                               # 0x2
	.long	0+16
	.quad	str.Bool
	.quad	Bool_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	_Bool_vtable_prototype, 48

	.type	str.String,@object              # @str.String
str.String:
	.asciz	"String"
	.size	str.String, 7

	.type	_String_vtable_prototype,@object # @_String_vtable_prototype
	.globl	_String_vtable_prototype
	.p2align	4
_String_vtable_prototype:
	.long	3                               # 0x3
	.long	0+16
	.quad	str.String
	.quad	String_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	String_length
	.quad	String_concat
	.quad	String_substr
	.size	_String_vtable_prototype, 72

	.type	str.IO,@object                  # @str.IO
str.IO:
	.asciz	"IO"
	.size	str.IO, 3

	.type	_IO_vtable_prototype,@object    # @_IO_vtable_prototype
	.globl	_IO_vtable_prototype
	.p2align	4
_IO_vtable_prototype:
	.long	4                               # 0x4
	.long	0+8
	.quad	str.IO
	.quad	IO_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	IO_out_string
	.quad	IO_out_int
	.quad	IO_in_string
	.quad	IO_in_int
	.size	_IO_vtable_prototype, 80

	.type	str.Main,@object                # @str.Main
str.Main:
	.asciz	"Main"
	.size	str.Main, 5

	.type	_Main_vtable_prototype,@object  # @_Main_vtable_prototype
	.globl	_Main_vtable_prototype
	.p2align	4
_Main_vtable_prototype:
	.long	5                               # 0x5
	.long	0+8
	.quad	str.Main
	.quad	Main_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	IO_out_string
	.quad	IO_out_int
	.quad	IO_in_string
	.quad	IO_in_int
	.quad	Main.main
	.size	_Main_vtable_prototype, 88

	.type	str.A,@object                   # @str.A
str.A:
	.asciz	"A"
	.size	str.A, 2

	.type	_A_vtable_prototype,@object     # @_A_vtable_prototype
	.globl	_A_vtable_prototype
	.p2align	4
_A_vtable_prototype:
	.long	6                               # 0x6
	.long	0+16
	.quad	str.A
	.quad	A_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	A.getAnswerToAll
	.quad	A.setAnswerToAll
	.size	_A_vtable_prototype, 64

	.type	str.0,@object                   # @str.0
str.0:
	.asciz	"<basic class>"
	.size	str.0, 14

	.type	String.0,@object                # @String.0
	.globl	String.0
	.p2align	3
String.0:
	.quad	_String_vtable_prototype
	.quad	str.0
	.size	String.0, 16

	.type	str.1,@object                   # @str.1
str.1:
	.asciz	" "
	.size	str.1, 2

	.type	String.1,@object                # @String.1
	.globl	String.1
	.p2align	3
String.1:
	.quad	_String_vtable_prototype
	.quad	str.1
	.size	String.1, 16

	.type	str.2,@object                   # @str.2
str.2:
	.asciz	"copy_o2.cl"
	.size	str.2, 11

	.type	String.2,@object                # @String.2
	.globl	String.2
	.p2align	3
String.2:
	.quad	_String_vtable_prototype
	.quad	str.2
	.size	String.2, 16

	.section	".note.GNU-stack","",@progbits
