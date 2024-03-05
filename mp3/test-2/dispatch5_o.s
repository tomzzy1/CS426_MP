	.text
	.file	"dispatch5_o.ll"
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
	movq	%rdi, (%rsp)
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.1:                                # %ok.0
	movq	(%rdi), %rax
	callq	*48(%rax)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.2:                                # %ok.1
	movq	(%rdi), %rcx
	movl	%eax, %esi
	callq	*56(%rcx)
	movq	(%rsp), %rax
	movq	16(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.3:                                # %ok.2
	movq	(%rdi), %rax
	callq	*48(%rax)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.4:                                # %ok.3
	movq	(%rdi), %rcx
	movl	%eax, %esi
	callq	*56(%rcx)
	movq	(%rsp), %rax
	movq	24(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.5:                                # %ok.4
	movq	(%rdi), %rax
	callq	*48(%rax)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.6:                                # %ok.5
	movq	(%rdi), %rcx
	movl	%eax, %esi
	callq	*56(%rcx)
	movq	(%rsp), %rax
	movq	40(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.7:                                # %ok.6
	movq	(%rdi), %rax
	callq	*48(%rax)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.8:                                # %ok.7
	movq	(%rdi), %rcx
	movl	%eax, %esi
	callq	*56(%rcx)
	movq	(%rsp), %rax
	movq	40(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.9:                                # %ok.8
	movq	_C_vtable_prototype@GOTPCREL(%rip), %rax
	callq	*48(%rax)
	movl	%eax, %ebp
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	%ebp, %esi
	callq	Int_init@PLT
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.10:                               # %ok.9
	movq	(%rdi), %rax
	movl	8(%rbx), %esi
	callq	*56(%rax)
	movq	(%rsp), %rax
	movq	40(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.11:                               # %ok.10
	movq	_B_vtable_prototype@GOTPCREL(%rip), %r15
	callq	*48(%r15)
	movl	%eax, %ebp
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	%ebp, %esi
	callq	Int_init@PLT
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.12:                               # %ok.11
	movq	(%rdi), %rax
	movl	8(%rbx), %esi
	callq	*56(%rax)
	movq	(%rsp), %rax
	movq	40(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.13:                               # %ok.12
	movq	_A_vtable_prototype@GOTPCREL(%rip), %r14
	callq	*48(%r14)
	movl	%eax, %ebp
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	%ebp, %esi
	callq	Int_init@PLT
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.14:                               # %ok.13
	movq	(%rdi), %rax
	movl	8(%rbx), %esi
	callq	*56(%rax)
	movq	(%rsp), %rax
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.15:                               # %ok.14
	movq	(%rdi), %rax
	callq	*48(%rax)
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.16:                               # %ok.15
	movq	(%rdi), %rcx
	movl	%eax, %esi
	callq	*56(%rcx)
	movq	(%rsp), %rax
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.17:                               # %ok.16
	callq	*48(%r15)
	movl	%eax, %ebp
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	%ebp, %esi
	callq	Int_init@PLT
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.18:                               # %ok.17
	movq	(%rdi), %rax
	movl	8(%rbx), %esi
	callq	*56(%rax)
	movq	(%rsp), %rax
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.19:                               # %ok.18
	callq	*48(%r14)
	movl	%eax, %ebp
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	%ebp, %esi
	callq	Int_init@PLT
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.20:                               # %ok.19
	movq	(%rdi), %rax
	movl	8(%rbx), %esi
	callq	*56(%rax)
	movq	(%rsp), %rax
	movq	8(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.21:                               # %ok.20
	callq	*48(%r14)
	movl	%eax, %ebp
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	%ebp, %esi
	callq	Int_init@PLT
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_23
# %bb.22:                               # %ok.21
	movq	(%rdi), %rax
	movl	8(%rbx), %esi
	callq	*56(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB1_23:                               # %abort
	.cfi_def_cfa_offset 48
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	_Main_vtable_prototype@GOTPCREL(%rip), %r14
	movl	4(%r14), %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB2_7
# %bb.1:                                # %ok.22
	movq	%rax, %rbx
	movq	%r14, (%rax)
	movq	%rax, (%rsp)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	callq	A_new@PLT
	testq	%rax, %rax
	je	.LBB2_7
# %bb.2:                                # %ok.23
	movq	%rax, 8(%rbx)
	callq	B_new@PLT
	testq	%rax, %rax
	je	.LBB2_7
# %bb.3:                                # %ok.24
	movq	%rax, 16(%rbx)
	callq	C_new@PLT
	testq	%rax, %rax
	je	.LBB2_7
# %bb.4:                                # %ok.25
	movq	%rax, 24(%rbx)
	callq	B_new@PLT
	testq	%rax, %rax
	je	.LBB2_7
# %bb.5:                                # %ok.26
	movq	%rax, 32(%rbx)
	callq	C_new@PLT
	testq	%rax, %rax
	je	.LBB2_7
# %bb.6:                                # %ok.27
	movq	%rax, 40(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB2_7:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end2:
	.size	Main_new, .Lfunc_end2-Main_new
	.cfi_endproc
                                        # -- End function
	.globl	A.f                             # -- Begin function A.f
	.p2align	4, 0x90
	.type	A.f,@function
A.f:                                    # @A.f
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	$5, %eax
	retq
.Lfunc_end3:
	.size	A.f, .Lfunc_end3-A.f
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
	je	.LBB4_2
# %bb.1:                                # %ok.0
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB4_2:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end4:
	.size	A_new, .Lfunc_end4-A_new
	.cfi_endproc
                                        # -- End function
	.globl	B_new                           # -- Begin function B_new
	.p2align	4, 0x90
	.type	B_new,@function
B_new:                                  # @B_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	_B_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB5_2
# %bb.1:                                # %ok.0
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB5_2:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end5:
	.size	B_new, .Lfunc_end5-B_new
	.cfi_endproc
                                        # -- End function
	.globl	C.f                             # -- Begin function C.f
	.p2align	4, 0x90
	.type	C.f,@function
C.f:                                    # @C.f
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	$6, %eax
	retq
.Lfunc_end6:
	.size	C.f, .Lfunc_end6-C.f
	.cfi_endproc
                                        # -- End function
	.globl	C_new                           # -- Begin function C_new
	.p2align	4, 0x90
	.type	C_new,@function
C_new:                                  # @C_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	_C_vtable_prototype@GOTPCREL(%rip), %rbx
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
	.size	C_new, .Lfunc_end7-C_new
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
	.long	0+48
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
	.long	0+8
	.quad	str.A
	.quad	A_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	A.f
	.size	_A_vtable_prototype, 56

	.type	str.B,@object                   # @str.B
str.B:
	.asciz	"B"
	.size	str.B, 2

	.type	_B_vtable_prototype,@object     # @_B_vtable_prototype
	.globl	_B_vtable_prototype
	.p2align	4
_B_vtable_prototype:
	.long	7                               # 0x7
	.long	0+8
	.quad	str.B
	.quad	B_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	A.f
	.size	_B_vtable_prototype, 56

	.type	str.C,@object                   # @str.C
str.C:
	.asciz	"C"
	.size	str.C, 2

	.type	_C_vtable_prototype,@object     # @_C_vtable_prototype
	.globl	_C_vtable_prototype
	.p2align	4
_C_vtable_prototype:
	.long	8                               # 0x8
	.long	0+8
	.quad	str.C
	.quad	C_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	C.f
	.size	_C_vtable_prototype, 56

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
	.asciz	"dispatch5_o.cl"
	.size	str.1, 15

	.type	String.1,@object                # @String.1
	.globl	String.1
	.p2align	3
String.1:
	.quad	_String_vtable_prototype
	.quad	str.1
	.size	String.1, 16

	.section	".note.GNU-stack","",@progbits
