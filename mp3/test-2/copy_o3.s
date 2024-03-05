	.text
	.file	"copy_o3.ll"
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$72, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, (%rsp)
	movq	$0, 8(%rsp)
	movq	$0, 32(%rsp)
	callq	AA_new@PLT
	testq	%rax, %rax
	je	.LBB1_22
# %bb.1:                                # %ok.0
	movq	%rax, 8(%rsp)
	je	.LBB1_22
# %bb.2:                                # %ok.1
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	cmpl	$7, %ecx
	jl	.LBB1_6
# %bb.3:                                # %src_gte_br.7.0
	jle	.LBB1_4
.LBB1_6:                                # %br_exit.7.0
	testl	%ecx, %ecx
	js	.LBB1_22
# %bb.7:                                # %src_gte_br.0.0
	cmpl	$7, %ecx
	jg	.LBB1_22
# %bb.8:                                # %src_lte_mc.0.0
	movq	%rax, 56(%rsp)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_22
# %bb.9:                                # %ok.3
	movq	(%rdi), %rax
	movq	String.2@GOTPCREL(%rip), %rsi
	callq	*48(%rax)
	movq	%rax, 24(%rsp)
	jmp	.LBB1_10
.LBB1_4:                                # %src_lte_mc.7.0
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	je	.LBB1_22
# %bb.5:                                # %ok.2
	movq	(%rax), %rcx
	movq	%rax, %rdi
	movl	$42, %esi
	callq	*48(%rcx)
	movl	%eax, %ebp
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	%ebp, %esi
	callq	Int_init@PLT
	movq	%rbx, 24(%rsp)
.LBB1_10:                               # %case.exit.0
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_22
# %bb.11:                               # %ok.4
	movq	(%rdi), %rax
	callq	*40(%rax)
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	je	.LBB1_22
# %bb.12:                               # %ok.5
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	cmpl	$7, %ecx
	jl	.LBB1_17
# %bb.13:                               # %src_gte_br.7.1
	jle	.LBB1_14
.LBB1_17:                               # %br_exit.7.1
	testl	%ecx, %ecx
	js	.LBB1_22
# %bb.18:                               # %src_gte_br.0.1
	cmpl	$7, %ecx
	jg	.LBB1_22
# %bb.19:                               # %src_lte_mc.0.1
	movq	%rax, 40(%rsp)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_22
# %bb.20:                               # %ok.8
	movq	(%rdi), %rax
	movq	String.1@GOTPCREL(%rip), %rsi
	callq	*48(%rax)
	jmp	.LBB1_21
.LBB1_14:                               # %src_lte_mc.7.1
	movq	%rax, 48(%rsp)
	testq	%rax, %rax
	je	.LBB1_22
# %bb.15:                               # %ok.6
	movq	(%rax), %rcx
	movq	%rax, %rdi
	callq	*56(%rcx)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_22
# %bb.16:                               # %ok.7
	movq	(%rdi), %rcx
	movl	%eax, %esi
	callq	*56(%rcx)
.LBB1_21:                               # %case.exit.1
	movq	%rax, 16(%rsp)
	movq	(%rsp), %rax
	addq	$72, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB1_22:                               # %abort
	.cfi_def_cfa_offset 96
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
# %bb.1:                                # %ok.9
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
	je	.LBB3_2
# %bb.1:                                # %ok.0
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	movl	$0, 8(%rax)
	movb	$0, 12(%rax)
	movl	$0, 24(%rax)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB3_2:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end3:
	.size	A_new, .Lfunc_end3-A_new
	.cfi_endproc
                                        # -- End function
	.globl	AA.set                          # -- Begin function AA.set
	.p2align	4, 0x90
	.type	AA.set,@function
AA.set:                                 # @AA.set
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%esi, %eax
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movl	%esi, 12(%rdi)
	retq
.Lfunc_end4:
	.size	AA.set, .Lfunc_end4-AA.set
	.cfi_endproc
                                        # -- End function
	.globl	AA.get                          # -- Begin function AA.get
	.p2align	4, 0x90
	.type	AA.get,@function
AA.get:                                 # @AA.get
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	12(%rdi), %eax
	retq
.Lfunc_end5:
	.size	AA.get, .Lfunc_end5-AA.get
	.cfi_endproc
                                        # -- End function
	.globl	AA_new                          # -- Begin function AA_new
	.p2align	4, 0x90
	.type	AA_new,@function
AA_new:                                 # @AA_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	_AA_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB6_2
# %bb.1:                                # %ok.0
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	movb	$0, 8(%rax)
	movl	$0, 12(%rax)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB6_2:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end6:
	.size	AA_new, .Lfunc_end6-AA_new
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
	.long	0+32
	.quad	str.A
	.quad	A_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	_A_vtable_prototype, 48

	.type	str.AA,@object                  # @str.AA
str.AA:
	.asciz	"AA"
	.size	str.AA, 3

	.type	_AA_vtable_prototype,@object    # @_AA_vtable_prototype
	.globl	_AA_vtable_prototype
	.p2align	4
_AA_vtable_prototype:
	.long	7                               # 0x7
	.long	0+16
	.quad	str.AA
	.quad	AA_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	AA.set
	.quad	AA.get
	.size	_AA_vtable_prototype, 64

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
	.asciz	"Error2\n"
	.size	str.1, 8

	.type	String.1,@object                # @String.1
	.globl	String.1
	.p2align	3
String.1:
	.quad	_String_vtable_prototype
	.quad	str.1
	.size	String.1, 16

	.type	str.2,@object                   # @str.2
str.2:
	.asciz	"Error1\n"
	.size	str.2, 8

	.type	String.2,@object                # @String.2
	.globl	String.2
	.p2align	3
String.2:
	.quad	_String_vtable_prototype
	.quad	str.2
	.size	String.2, 16

	.type	str.3,@object                   # @str.3
str.3:
	.asciz	"copy_o3.cl"
	.size	str.3, 11

	.type	String.3,@object                # @String.3
	.globl	String.3
	.p2align	3
String.3:
	.quad	_String_vtable_prototype
	.quad	str.3
	.size	String.3, 16

	.section	".note.GNU-stack","",@progbits
