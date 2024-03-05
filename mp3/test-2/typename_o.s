	.text
	.file	"typename_o.ll"
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
	.globl	Main.func                       # -- Begin function Main.func
	.p2align	4, 0x90
	.type	Main.func,@function
Main.func:                              # @Main.func
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	callq	Derived_new@PLT
	testq	%rax, %rax
	je	.LBB1_3
# %bb.1:                                # %ok.0
	je	.LBB1_3
# %bb.2:                                # %ok.1
	movq	(%rax), %rcx
	movq	String.1@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	callq	*56(%rcx)
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.LBB1_3:                                # %abort
	.cfi_def_cfa_offset 16
	callq	abort@PLT
.Lfunc_end1:
	.size	Main.func, .Lfunc_end1-Main.func
	.cfi_endproc
                                        # -- End function
	.globl	Main.main                       # -- Begin function Main.main
	.p2align	4, 0x90
	.type	Main.main,@function
Main.main:                              # @Main.main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	testq	%rdi, %rdi
	je	.LBB2_3
# %bb.1:                                # %ok.2
	movq	(%rdi), %rax
	callq	*80(%rax)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB2_3
# %bb.2:                                # %ok.3
	movq	(%rdi), %rcx
	movq	%rax, %rsi
	callq	*48(%rcx)
	movq	(%rsp), %rax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.LBB2_3:                                # %abort
	.cfi_def_cfa_offset 16
	callq	abort@PLT
.Lfunc_end2:
	.size	Main.main, .Lfunc_end2-Main.main
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
	je	.LBB3_2
# %bb.1:                                # %ok.4
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB3_2:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end3:
	.size	Main_new, .Lfunc_end3-Main_new
	.cfi_endproc
                                        # -- End function
	.globl	Base.identify                   # -- Begin function Base.identify
	.p2align	4, 0x90
	.type	Base.identify,@function
Base.identify:                          # @Base.identify
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rdx, (%rsp)
	testq	%rsi, %rsi
	je	.LBB4_4
# %bb.1:                                # %ok.0
	movq	(%rsi), %rax
	movq	%rsi, %rdi
	callq	*32(%rax)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB4_4
# %bb.2:                                # %ok.1
	movq	(%rdi), %rcx
	movq	%rax, %rsi
	callq	*56(%rcx)
	testq	%rax, %rax
	je	.LBB4_4
# %bb.3:                                # %ok.2
	movq	(%rax), %rcx
	movq	String.2@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	callq	*56(%rcx)
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB4_4:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end4:
	.size	Base.identify, .Lfunc_end4-Base.identify
	.cfi_endproc
                                        # -- End function
	.globl	Base.test                       # -- Begin function Base.test
	.p2align	4, 0x90
	.type	Base.test,@function
Base.test:                              # @Base.test
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	callq	Main_new@PLT
	testq	%rax, %rax
	je	.LBB5_13
# %bb.1:                                # %ok.3
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB5_13
# %bb.2:                                # %ok.4
	movq	(%rsp), %rdx
	movq	(%rdi), %rcx
	movq	%rax, %rsi
	callq	*48(%rcx)
	movq	%rax, %r14
	callq	Derived_new@PLT
	testq	%rax, %rax
	je	.LBB5_13
# %bb.3:                                # %ok.5
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB5_13
# %bb.4:                                # %ok.6
	movq	(%rsp), %rdx
	movq	(%rdi), %rcx
	movq	%rax, %rsi
	callq	*48(%rcx)
	movq	%rax, %rbx
	callq	Base_new@PLT
	testq	%rax, %rax
	je	.LBB5_13
# %bb.5:                                # %ok.7
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB5_13
# %bb.6:                                # %ok.8
	movq	(%rsp), %rdx
	movq	(%rdi), %rcx
	movq	%rax, %rsi
	callq	*48(%rcx)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB5_13
# %bb.7:                                # %ok.9
	movq	(%rdi), %rcx
	movq	%rax, %rsi
	callq	*56(%rcx)
	testq	%rax, %rax
	je	.LBB5_13
# %bb.8:                                # %ok.10
	movq	(%rax), %rcx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	*56(%rcx)
	testq	%rax, %rax
	je	.LBB5_13
# %bb.9:                                # %ok.11
	movq	(%rax), %rcx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	*56(%rcx)
	movq	%rax, (%rsp)
	callq	Derived_new@PLT
	testq	%rax, %rax
	je	.LBB5_13
# %bb.10:                               # %ok.12
	movq	%rax, 16(%rsp)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB5_13
# %bb.11:                               # %ok.13
	movq	(%rsp), %rdx
	movq	(%rdi), %rcx
	movq	%rax, %rsi
	callq	*48(%rcx)
	movq	%rax, (%rsp)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB5_13
# %bb.12:                               # %ok.14
	movq	(%rdi), %rcx
	movq	%rdi, %rsi
	movq	%rax, %rdx
	callq	*48(%rcx)
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB5_13:                               # %abort
	.cfi_def_cfa_offset 48
	callq	abort@PLT
.Lfunc_end5:
	.size	Base.test, .Lfunc_end5-Base.test
	.cfi_endproc
                                        # -- End function
	.globl	Base_new                        # -- Begin function Base_new
	.p2align	4, 0x90
	.type	Base_new,@function
Base_new:                               # @Base_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	_Base_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB6_2
# %bb.1:                                # %ok.15
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB6_2:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end6:
	.size	Base_new, .Lfunc_end6-Base_new
	.cfi_endproc
                                        # -- End function
	.globl	Derived_new                     # -- Begin function Derived_new
	.p2align	4, 0x90
	.type	Derived_new,@function
Derived_new:                            # @Derived_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	_Derived_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB7_2
# %bb.1:                                # %ok.0
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB7_2:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end7:
	.size	Derived_new, .Lfunc_end7-Derived_new
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
	.quad	Main.func
	.quad	Main.main
	.size	_Main_vtable_prototype, 96

	.type	str.Base,@object                # @str.Base
str.Base:
	.asciz	"Base"
	.size	str.Base, 5

	.type	_Base_vtable_prototype,@object  # @_Base_vtable_prototype
	.globl	_Base_vtable_prototype
	.p2align	4
_Base_vtable_prototype:
	.long	6                               # 0x6
	.long	0+8
	.quad	str.Base
	.quad	Base_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	Base.identify
	.quad	Base.test
	.size	_Base_vtable_prototype, 64

	.type	str.Derived,@object             # @str.Derived
str.Derived:
	.asciz	"Derived"
	.size	str.Derived, 8

	.type	_Derived_vtable_prototype,@object # @_Derived_vtable_prototype
	.globl	_Derived_vtable_prototype
	.p2align	4
_Derived_vtable_prototype:
	.long	7                               # 0x7
	.long	0+8
	.quad	str.Derived
	.quad	Derived_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	Base.identify
	.quad	Base.test
	.size	_Derived_vtable_prototype, 64

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
	.zero	1
	.size	str.1, 1

	.type	String.1,@object                # @String.1
	.globl	String.1
	.p2align	3
String.1:
	.quad	_String_vtable_prototype
	.quad	str.1
	.size	String.1, 16

	.type	str.2,@object                   # @str.2
str.2:
	.asciz	"\n"
	.size	str.2, 2

	.type	String.2,@object                # @String.2
	.globl	String.2
	.p2align	3
String.2:
	.quad	_String_vtable_prototype
	.quad	str.2
	.size	String.2, 16

	.type	str.3,@object                   # @str.3
str.3:
	.asciz	"typename_o.cl"
	.size	str.3, 14

	.type	String.3,@object                # @String.3
	.globl	String.3
	.p2align	3
String.3:
	.quad	_String_vtable_prototype
	.quad	str.3
	.size	String.3, 16

	.section	".note.GNU-stack","",@progbits
