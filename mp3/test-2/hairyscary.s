	.text
	.file	"hairyscary.ll"
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
	.globl	Bazz.printh                     # -- Begin function Bazz.printh
	.p2align	4, 0x90
	.type	Bazz.printh,@function
Bazz.printh:                            # @Bazz.printh
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	testq	%rdi, %rdi
	je	.LBB1_2
# %bb.1:                                # %ok.0
	movl	8(%rdi), %esi
	movq	(%rdi), %rax
	callq	*56(%rax)
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.LBB1_2:                                # %abort
	.cfi_def_cfa_offset 16
	callq	abort@PLT
.Lfunc_end1:
	.size	Bazz.printh, .Lfunc_end1-Bazz.printh
	.cfi_endproc
                                        # -- End function
	.globl	Bazz.doh                        # -- Begin function Bazz.doh
	.p2align	4, 0x90
	.type	Bazz.doh,@function
Bazz.doh:                               # @Bazz.doh
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	8(%rdi), %eax
	movl	%eax, -12(%rsp)
	incl	8(%rdi)
	movl	-12(%rsp), %eax
	retq
.Lfunc_end2:
	.size	Bazz.doh, .Lfunc_end2-Bazz.doh
	.cfi_endproc
                                        # -- End function
	.globl	Bazz_new                        # -- Begin function Bazz_new
	.p2align	4, 0x90
	.type	Bazz_new,@function
Bazz_new:                               # @Bazz_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	_Bazz_vtable_prototype@GOTPCREL(%rip), %rbp
	movl	4(%rbp), %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB3_11
# %bb.1:                                # %ok.1
	movq	%rax, %rbx
	movq	%rbp, (%rax)
	movq	%rax, 8(%rsp)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$1, 8(%rax)
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.LBB3_11
# %bb.2:                                # %ok.2
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	cmpl	$8, %ecx
	jl	.LBB3_7
# %bb.3:                                # %src_gte_br.8.0
	jle	.LBB3_4
.LBB3_7:                                # %br_exit.8.0
	cmpl	$7, %ecx
	jl	.LBB3_12
# %bb.8:                                # %src_gte_br.7.0
	cmpl	$8, %ecx
	jle	.LBB3_9
.LBB3_12:                               # %br_exit.7.0
	cmpl	$6, %ecx
	jl	.LBB3_15
# %bb.13:                               # %src_gte_br.6.0
	cmpl	$8, %ecx
	jle	.LBB3_14
.LBB3_15:                               # %br_exit.6.0
	cmpl	$5, %ecx
	jl	.LBB3_11
# %bb.16:                               # %src_gte_br.5.0
	cmpl	$8, %ecx
	jg	.LBB3_11
# %bb.17:                               # %src_lte_mc.5.0
	movq	%rax, 40(%rsp)
	callq	Foo_new@PLT
	testq	%rax, %rax
	jne	.LBB3_5
	jmp	.LBB3_11
.LBB3_4:                                # %src_lte_mc.8.0
	movq	%rax, 16(%rsp)
	jmp	.LBB3_5
.LBB3_9:                                # %src_lte_mc.7.0
	movq	%rax, 32(%rsp)
	callq	Bar_new@PLT
	testq	%rax, %rax
	jne	.LBB3_5
	jmp	.LBB3_11
.LBB3_14:                               # %src_lte_mc.6.0
	movq	%rax, 24(%rsp)
	callq	Razz_new@PLT
	testq	%rax, %rax
	je	.LBB3_11
.LBB3_5:                                # %ok.5
	movq	%rax, (%rsp)
	movq	(%rsp), %rax
	movq	%rax, 16(%rbx)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB3_11
# %bb.6:                                # %ok.6
	movq	(%rdi), %rax
	callq	*80(%rax)
	movl	%eax, %r14d
	callq	Int_new@PLT
	movq	%rax, %rbp
	movq	%rax, %rdi
	movl	%r14d, %esi
	callq	Int_init@PLT
	movq	%rbp, 24(%rbx)
	movq	%rbx, %rax
	addq	$48, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB3_11:                               # %abort
	.cfi_def_cfa_offset 80
	callq	abort@PLT
.Lfunc_end3:
	.size	Bazz_new, .Lfunc_end3-Bazz_new
	.cfi_endproc
                                        # -- End function
	.globl	Foo.doh                         # -- Begin function Foo.doh
	.p2align	4, 0x90
	.type	Foo.doh,@function
Foo.doh:                                # @Foo.doh
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	8(%rdi), %eax
	movl	%eax, -12(%rsp)
	addl	$2, 8(%rdi)
	movl	-12(%rsp), %eax
	retq
.Lfunc_end4:
	.size	Foo.doh, .Lfunc_end4-Foo.doh
	.cfi_endproc
                                        # -- End function
	.globl	Foo_new                         # -- Begin function Foo_new
	.p2align	4, 0x90
	.type	Foo_new,@function
Foo_new:                                # @Foo_new
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	_Foo_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB5_19
# %bb.1:                                # %ok.0
	movq	%rax, %r15
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movl	$0, 40(%rax)
	movl	$1, 8(%rax)
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.LBB5_19
# %bb.2:                                # %ok.1
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	cmpl	$8, %ecx
	jl	.LBB5_15
# %bb.3:                                # %src_gte_br.8.0
	jle	.LBB5_4
.LBB5_15:                               # %br_exit.8.0
	cmpl	$7, %ecx
	jl	.LBB5_20
# %bb.16:                               # %src_gte_br.7.0
	cmpl	$8, %ecx
	jle	.LBB5_17
.LBB5_20:                               # %br_exit.7.0
	cmpl	$6, %ecx
	jl	.LBB5_23
# %bb.21:                               # %src_gte_br.6.0
	cmpl	$8, %ecx
	jle	.LBB5_22
.LBB5_23:                               # %br_exit.6.0
	cmpl	$5, %ecx
	jl	.LBB5_19
# %bb.24:                               # %src_gte_br.5.0
	cmpl	$8, %ecx
	jg	.LBB5_19
# %bb.25:                               # %src_lte_mc.5.0
	movq	%rax, 80(%rsp)
	callq	Foo_new@PLT
	testq	%rax, %rax
	jne	.LBB5_5
	jmp	.LBB5_19
.LBB5_4:                                # %src_lte_mc.8.0
	movq	%rax, 56(%rsp)
	jmp	.LBB5_5
.LBB5_17:                               # %src_lte_mc.7.0
	movq	%rax, 72(%rsp)
	callq	Bar_new@PLT
	testq	%rax, %rax
	jne	.LBB5_5
	jmp	.LBB5_19
.LBB5_22:                               # %src_lte_mc.6.0
	movq	%rax, 64(%rsp)
	callq	Razz_new@PLT
	testq	%rax, %rax
	je	.LBB5_19
.LBB5_5:                                # %ok.4
	movq	%rax, 16(%rsp)
	movq	16(%rsp), %rax
	movq	%rax, 16(%r15)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB5_19
# %bb.6:                                # %ok.5
	movq	(%rdi), %rax
	callq	*80(%rax)
	movl	%eax, %ebp
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	%ebp, %esi
	callq	Int_init@PLT
	movq	%rbx, 24(%r15)
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.LBB5_19
# %bb.7:                                # %ok.6
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	cmpl	$8, %ecx
	jl	.LBB5_26
# %bb.8:                                # %src_gte_br.8.1
	jle	.LBB5_9
.LBB5_26:                               # %br_exit.8.1
	cmpl	$7, %ecx
	jl	.LBB5_30
# %bb.27:                               # %src_gte_br.7.1
	cmpl	$8, %ecx
	jle	.LBB5_28
.LBB5_30:                               # %br_exit.7.1
	cmpl	$6, %ecx
	jl	.LBB5_19
# %bb.31:                               # %src_gte_br.6.1
	cmpl	$8, %ecx
	jg	.LBB5_19
# %bb.32:                               # %src_lte_mc.6.1
	movq	%rax, 40(%rsp)
	callq	Razz_new@PLT
	jmp	.LBB5_29
.LBB5_9:                                # %src_lte_mc.8.1
	movq	%rax, 32(%rsp)
	jmp	.LBB5_10
.LBB5_28:                               # %src_lte_mc.7.1
	movq	%rax, 48(%rsp)
	callq	Bar_new@PLT
.LBB5_29:                               # %src_lte_mc.7.1
	testq	%rax, %rax
	je	.LBB5_19
.LBB5_10:                               # %ok.8
	movq	%rax, 24(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, 32(%r15)
	movq	8(%rsp), %rax
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB5_19
# %bb.11:                               # %ok.9
	movq	(%rdi), %rax
	callq	*88(%rax)
	movl	%eax, %ebp
	movq	8(%rsp), %rax
	movq	16(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB5_19
# %bb.12:                               # %ok.10
	movq	(%rdi), %rax
	callq	*88(%rax)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB5_19
# %bb.13:                               # %ok.11
	movl	%eax, %r14d
	movq	(%rdi), %rax
	callq	*88(%rax)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB5_19
# %bb.14:                               # %ok.12
	addl	%r14d, %ebp
	addl	%eax, %ebp
	movq	(%rdi), %rax
	callq	*80(%rax)
	addl	%ebp, %eax
	movl	%eax, 40(%r15)
	movq	%r15, %rax
	addq	$88, %rsp
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
.LBB5_19:                               # %abort
	.cfi_def_cfa_offset 128
	callq	abort@PLT
.Lfunc_end5:
	.size	Foo_new, .Lfunc_end5-Foo_new
	.cfi_endproc
                                        # -- End function
	.globl	Razz_new                        # -- Begin function Razz_new
	.p2align	4, 0x90
	.type	Razz_new,@function
Razz_new:                               # @Razz_new
	.cfi_startproc
# %bb.0:                                # %entry
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
	subq	$112, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	_Razz_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB6_22
# %bb.1:                                # %ok.0
	movq	%rax, %r12
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movl	$0, 40(%rax)
	movq	$0, 48(%rax)
	movl	$0, 56(%rax)
	movl	$1, 8(%rax)
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.LBB6_22
# %bb.2:                                # %ok.1
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	cmpl	$8, %ecx
	jl	.LBB6_18
# %bb.3:                                # %src_gte_br.8.0
	jle	.LBB6_4
.LBB6_18:                               # %br_exit.8.0
	cmpl	$7, %ecx
	jl	.LBB6_23
# %bb.19:                               # %src_gte_br.7.0
	cmpl	$8, %ecx
	jle	.LBB6_20
.LBB6_23:                               # %br_exit.7.0
	cmpl	$6, %ecx
	jl	.LBB6_26
# %bb.24:                               # %src_gte_br.6.0
	cmpl	$8, %ecx
	jle	.LBB6_25
.LBB6_26:                               # %br_exit.6.0
	cmpl	$5, %ecx
	jl	.LBB6_22
# %bb.27:                               # %src_gte_br.5.0
	cmpl	$8, %ecx
	jg	.LBB6_22
# %bb.28:                               # %src_lte_mc.5.0
	movq	%rax, 104(%rsp)
	callq	Foo_new@PLT
	testq	%rax, %rax
	jne	.LBB6_5
	jmp	.LBB6_22
.LBB6_4:                                # %src_lte_mc.8.0
	movq	%rax, 80(%rsp)
	jmp	.LBB6_5
.LBB6_20:                               # %src_lte_mc.7.0
	movq	%rax, 96(%rsp)
	callq	Bar_new@PLT
	testq	%rax, %rax
	jne	.LBB6_5
	jmp	.LBB6_22
.LBB6_25:                               # %src_lte_mc.6.0
	movq	%rax, 88(%rsp)
	callq	Razz_new@PLT
	testq	%rax, %rax
	je	.LBB6_22
.LBB6_5:                                # %ok.4
	movq	%rax, 16(%rsp)
	movq	16(%rsp), %rax
	movq	%rax, 16(%r12)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB6_22
# %bb.6:                                # %ok.5
	movq	(%rdi), %rax
	callq	*80(%rax)
	movl	%eax, %ebp
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	%ebp, %esi
	callq	Int_init@PLT
	movq	%rbx, 24(%r12)
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.LBB6_22
# %bb.7:                                # %ok.6
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	cmpl	$8, %ecx
	jl	.LBB6_29
# %bb.8:                                # %src_gte_br.8.1
	jle	.LBB6_9
.LBB6_29:                               # %br_exit.8.1
	cmpl	$7, %ecx
	jl	.LBB6_33
# %bb.30:                               # %src_gte_br.7.1
	cmpl	$8, %ecx
	jle	.LBB6_31
.LBB6_33:                               # %br_exit.7.1
	cmpl	$6, %ecx
	jl	.LBB6_22
# %bb.34:                               # %src_gte_br.6.1
	cmpl	$8, %ecx
	jg	.LBB6_22
# %bb.35:                               # %src_lte_mc.6.1
	movq	%rax, 64(%rsp)
	callq	Razz_new@PLT
	jmp	.LBB6_32
.LBB6_9:                                # %src_lte_mc.8.1
	movq	%rax, 56(%rsp)
	jmp	.LBB6_10
.LBB6_31:                               # %src_lte_mc.7.1
	movq	%rax, 72(%rsp)
	callq	Bar_new@PLT
.LBB6_32:                               # %src_lte_mc.7.1
	testq	%rax, %rax
	je	.LBB6_22
.LBB6_10:                               # %ok.8
	movq	%rax, 24(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, 32(%r12)
	movq	8(%rsp), %rax
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB6_22
# %bb.11:                               # %ok.9
	movq	(%rdi), %rax
	callq	*88(%rax)
	movl	%eax, %ebp
	movq	8(%rsp), %rax
	movq	16(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB6_22
# %bb.12:                               # %ok.10
	movq	(%rdi), %rax
	callq	*88(%rax)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB6_22
# %bb.13:                               # %ok.11
	movl	%eax, %r14d
	movq	(%rdi), %rax
	callq	*88(%rax)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB6_22
# %bb.14:                               # %ok.12
	addl	%r14d, %ebp
	addl	%eax, %ebp
	movq	(%rdi), %rax
	callq	*80(%rax)
	addl	%ebp, %eax
	movl	%eax, 40(%r12)
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.LBB6_22
# %bb.15:                               # %ok.13
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	cmpl	$8, %ecx
	jl	.LBB6_36
# %bb.16:                               # %src_gte_br.8.2
	jle	.LBB6_17
.LBB6_36:                               # %br_exit.8.2
	cmpl	$7, %ecx
	jl	.LBB6_22
# %bb.37:                               # %src_gte_br.7.2
	cmpl	$8, %ecx
	jg	.LBB6_22
# %bb.38:                               # %src_lte_mc.7.2
	movq	%rax, 48(%rsp)
	callq	Bar_new@PLT
	testq	%rax, %rax
	jne	.LBB6_39
	jmp	.LBB6_22
.LBB6_17:                               # %src_lte_mc.8.2
	movq	%rax, 40(%rsp)
.LBB6_39:                               # %ok.14
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, 48(%r12)
	movq	8(%rsp), %rax
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB6_22
# %bb.40:                               # %ok.15
	movq	_Bazz_vtable_prototype@GOTPCREL(%rip), %rax
	callq	*88(%rax)
	movl	%eax, %ebp
	movq	8(%rsp), %rax
	movq	16(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB6_22
# %bb.41:                               # %ok.16
	movq	(%rdi), %rax
	callq	*88(%rax)
	movl	%eax, %r14d
	movq	8(%rsp), %rax
	movq	48(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB6_22
# %bb.42:                               # %ok.17
	movq	(%rdi), %rax
	callq	*88(%rax)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB6_22
# %bb.43:                               # %ok.18
	movl	%eax, %r15d
	movq	(%rdi), %rax
	callq	*88(%rax)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB6_22
# %bb.44:                               # %ok.19
	addl	%r14d, %ebp
	addl	%r15d, %ebp
	addl	%eax, %ebp
	movq	(%rdi), %rax
	callq	*80(%rax)
	addl	%ebp, %eax
	movl	%eax, 56(%r12)
	movq	%r12, %rax
	addq	$112, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB6_22:                               # %abort
	.cfi_def_cfa_offset 160
	callq	abort@PLT
.Lfunc_end6:
	.size	Razz_new, .Lfunc_end6-Razz_new
	.cfi_endproc
                                        # -- End function
	.globl	Bar_new                         # -- Begin function Bar_new
	.p2align	4, 0x90
	.type	Bar_new,@function
Bar_new:                                # @Bar_new
	.cfi_startproc
# %bb.0:                                # %entry
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
	subq	$112, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	_Bar_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB7_22
# %bb.1:                                # %ok.0
	movq	%rax, %r12
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movl	$0, 40(%rax)
	movq	$0, 48(%rax)
	movq	$0, 56(%rax)
	movq	$0, 64(%rax)
	movl	$1, 8(%rax)
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.LBB7_22
# %bb.2:                                # %ok.1
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	cmpl	$8, %ecx
	jl	.LBB7_18
# %bb.3:                                # %src_gte_br.8.0
	jle	.LBB7_4
.LBB7_18:                               # %br_exit.8.0
	cmpl	$7, %ecx
	jl	.LBB7_23
# %bb.19:                               # %src_gte_br.7.0
	cmpl	$8, %ecx
	jle	.LBB7_20
.LBB7_23:                               # %br_exit.7.0
	cmpl	$6, %ecx
	jl	.LBB7_26
# %bb.24:                               # %src_gte_br.6.0
	cmpl	$8, %ecx
	jle	.LBB7_25
.LBB7_26:                               # %br_exit.6.0
	cmpl	$5, %ecx
	jl	.LBB7_22
# %bb.27:                               # %src_gte_br.5.0
	cmpl	$8, %ecx
	jg	.LBB7_22
# %bb.28:                               # %src_lte_mc.5.0
	movq	%rax, 104(%rsp)
	callq	Foo_new@PLT
	testq	%rax, %rax
	jne	.LBB7_5
	jmp	.LBB7_22
.LBB7_4:                                # %src_lte_mc.8.0
	movq	%rax, 80(%rsp)
	jmp	.LBB7_5
.LBB7_20:                               # %src_lte_mc.7.0
	movq	%rax, 96(%rsp)
	callq	Bar_new@PLT
	testq	%rax, %rax
	jne	.LBB7_5
	jmp	.LBB7_22
.LBB7_25:                               # %src_lte_mc.6.0
	movq	%rax, 88(%rsp)
	callq	Razz_new@PLT
	testq	%rax, %rax
	je	.LBB7_22
.LBB7_5:                                # %ok.4
	movq	%rax, 16(%rsp)
	movq	16(%rsp), %rax
	movq	%rax, 16(%r12)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.6:                                # %ok.5
	movq	(%rdi), %rax
	callq	*80(%rax)
	movl	%eax, %ebp
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	%ebp, %esi
	callq	Int_init@PLT
	movq	%rbx, 24(%r12)
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.LBB7_22
# %bb.7:                                # %ok.6
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	cmpl	$8, %ecx
	jl	.LBB7_29
# %bb.8:                                # %src_gte_br.8.1
	jle	.LBB7_9
.LBB7_29:                               # %br_exit.8.1
	cmpl	$7, %ecx
	jl	.LBB7_33
# %bb.30:                               # %src_gte_br.7.1
	cmpl	$8, %ecx
	jle	.LBB7_31
.LBB7_33:                               # %br_exit.7.1
	cmpl	$6, %ecx
	jl	.LBB7_22
# %bb.34:                               # %src_gte_br.6.1
	cmpl	$8, %ecx
	jg	.LBB7_22
# %bb.35:                               # %src_lte_mc.6.1
	movq	%rax, 64(%rsp)
	callq	Razz_new@PLT
	jmp	.LBB7_32
.LBB7_9:                                # %src_lte_mc.8.1
	movq	%rax, 56(%rsp)
	jmp	.LBB7_10
.LBB7_31:                               # %src_lte_mc.7.1
	movq	%rax, 72(%rsp)
	callq	Bar_new@PLT
.LBB7_32:                               # %src_lte_mc.7.1
	testq	%rax, %rax
	je	.LBB7_22
.LBB7_10:                               # %ok.8
	movq	%rax, 24(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, 32(%r12)
	movq	8(%rsp), %rax
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.11:                               # %ok.9
	movq	(%rdi), %rax
	callq	*88(%rax)
	movl	%eax, %ebp
	movq	8(%rsp), %rax
	movq	16(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.12:                               # %ok.10
	movq	(%rdi), %rax
	callq	*88(%rax)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.13:                               # %ok.11
	movl	%eax, %r14d
	movq	(%rdi), %rax
	callq	*88(%rax)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.14:                               # %ok.12
	addl	%r14d, %ebp
	addl	%eax, %ebp
	movq	(%rdi), %rax
	callq	*80(%rax)
	addl	%ebp, %eax
	movl	%eax, 40(%r12)
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.LBB7_22
# %bb.15:                               # %ok.13
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	cmpl	$8, %ecx
	jl	.LBB7_36
# %bb.16:                               # %src_gte_br.8.2
	jle	.LBB7_17
.LBB7_36:                               # %br_exit.8.2
	cmpl	$7, %ecx
	jl	.LBB7_22
# %bb.37:                               # %src_gte_br.7.2
	cmpl	$8, %ecx
	jg	.LBB7_22
# %bb.38:                               # %src_lte_mc.7.2
	movq	%rax, 48(%rsp)
	callq	Bar_new@PLT
	testq	%rax, %rax
	jne	.LBB7_39
	jmp	.LBB7_22
.LBB7_17:                               # %src_lte_mc.8.2
	movq	%rax, 40(%rsp)
.LBB7_39:                               # %ok.14
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, 48(%r12)
	movq	8(%rsp), %rax
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.40:                               # %ok.15
	movq	_Bazz_vtable_prototype@GOTPCREL(%rip), %rax
	callq	*88(%rax)
	movl	%eax, %ebp
	movq	8(%rsp), %rax
	movq	16(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.41:                               # %ok.16
	movq	(%rdi), %rax
	callq	*88(%rax)
	movl	%eax, %r14d
	movq	8(%rsp), %rax
	movq	48(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.42:                               # %ok.17
	movq	(%rdi), %rax
	callq	*88(%rax)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.43:                               # %ok.18
	movl	%eax, %r15d
	movq	(%rdi), %rax
	callq	*88(%rax)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.44:                               # %ok.19
	addl	%r14d, %ebp
	addl	%r15d, %ebp
	addl	%eax, %ebp
	movq	(%rdi), %rax
	callq	*80(%rax)
	addl	%ebp, %eax
	movl	%eax, 56(%r12)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.45:                               # %ok.20
	movq	(%rdi), %rax
	callq	*88(%rax)
	movl	%eax, 60(%r12)
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB7_22
# %bb.46:                               # %ok.21
	movq	(%rdi), %rax
	callq	*80(%rax)
	movl	%eax, %ebx
	callq	Int_new@PLT
	movq	%rax, %rbp
	movq	%rax, %rdi
	movl	%ebx, %esi
	callq	Int_init@PLT
	movq	%rbp, 64(%r12)
	movq	%r12, %rax
	addq	$112, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB7_22:                               # %abort
	.cfi_def_cfa_offset 160
	callq	abort@PLT
.Lfunc_end7:
	.size	Bar_new, .Lfunc_end7-Bar_new
	.cfi_endproc
                                        # -- End function
	.globl	Main.main                       # -- Begin function Main.main
	.p2align	4, 0x90
	.type	Main.main,@function
Main.main:                              # @Main.main
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	String.1@GOTPCREL(%rip), %rax
	retq
.Lfunc_end8:
	.size	Main.main, .Lfunc_end8-Main.main
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
	je	.LBB9_6
# %bb.1:                                # %ok.0
	movq	%rax, %rbx
	movq	%r14, (%rax)
	movq	%rax, (%rsp)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	callq	Bazz_new@PLT
	testq	%rax, %rax
	je	.LBB9_6
# %bb.2:                                # %ok.1
	movq	%rax, 8(%rbx)
	callq	Foo_new@PLT
	testq	%rax, %rax
	je	.LBB9_6
# %bb.3:                                # %ok.2
	movq	%rax, 16(%rbx)
	callq	Razz_new@PLT
	testq	%rax, %rax
	je	.LBB9_6
# %bb.4:                                # %ok.3
	movq	%rax, 24(%rbx)
	callq	Bar_new@PLT
	testq	%rax, %rax
	je	.LBB9_6
# %bb.5:                                # %ok.4
	movq	%rax, 32(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB9_6:                                # %abort
	.cfi_def_cfa_offset 32
	callq	abort@PLT
.Lfunc_end9:
	.size	Main_new, .Lfunc_end9-Main_new
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

	.type	str.Bazz,@object                # @str.Bazz
str.Bazz:
	.asciz	"Bazz"
	.size	str.Bazz, 5

	.type	_Bazz_vtable_prototype,@object  # @_Bazz_vtable_prototype
	.globl	_Bazz_vtable_prototype
	.p2align	4
_Bazz_vtable_prototype:
	.long	5                               # 0x5
	.long	0+32
	.quad	str.Bazz
	.quad	Bazz_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	IO_out_string
	.quad	IO_out_int
	.quad	IO_in_string
	.quad	IO_in_int
	.quad	Bazz.printh
	.quad	Bazz.doh
	.size	_Bazz_vtable_prototype, 96

	.type	str.Foo,@object                 # @str.Foo
str.Foo:
	.asciz	"Foo"
	.size	str.Foo, 4

	.type	_Foo_vtable_prototype,@object   # @_Foo_vtable_prototype
	.globl	_Foo_vtable_prototype
	.p2align	4
_Foo_vtable_prototype:
	.long	6                               # 0x6
	.long	0+48
	.quad	str.Foo
	.quad	Foo_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	IO_out_string
	.quad	IO_out_int
	.quad	IO_in_string
	.quad	IO_in_int
	.quad	Bazz.printh
	.quad	Foo.doh
	.size	_Foo_vtable_prototype, 96

	.type	str.Razz,@object                # @str.Razz
str.Razz:
	.asciz	"Razz"
	.size	str.Razz, 5

	.type	_Razz_vtable_prototype,@object  # @_Razz_vtable_prototype
	.globl	_Razz_vtable_prototype
	.p2align	4
_Razz_vtable_prototype:
	.long	7                               # 0x7
	.long	0+64
	.quad	str.Razz
	.quad	Razz_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	IO_out_string
	.quad	IO_out_int
	.quad	IO_in_string
	.quad	IO_in_int
	.quad	Bazz.printh
	.quad	Foo.doh
	.size	_Razz_vtable_prototype, 96

	.type	str.Bar,@object                 # @str.Bar
str.Bar:
	.asciz	"Bar"
	.size	str.Bar, 4

	.type	_Bar_vtable_prototype,@object   # @_Bar_vtable_prototype
	.globl	_Bar_vtable_prototype
	.p2align	4
_Bar_vtable_prototype:
	.long	8                               # 0x8
	.long	0+72
	.quad	str.Bar
	.quad	Bar_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	IO_out_string
	.quad	IO_out_int
	.quad	IO_in_string
	.quad	IO_in_int
	.quad	Bazz.printh
	.quad	Foo.doh
	.size	_Bar_vtable_prototype, 96

	.type	str.Main,@object                # @str.Main
str.Main:
	.asciz	"Main"
	.size	str.Main, 5

	.type	_Main_vtable_prototype,@object  # @_Main_vtable_prototype
	.globl	_Main_vtable_prototype
	.p2align	4
_Main_vtable_prototype:
	.long	9                               # 0x9
	.long	0+40
	.quad	str.Main
	.quad	Main_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	Main.main
	.size	_Main_vtable_prototype, 56

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
	.asciz	"do nothing"
	.size	str.1, 11

	.type	String.1,@object                # @String.1
	.globl	String.1
	.p2align	3
String.1:
	.quad	_String_vtable_prototype
	.quad	str.1
	.size	String.1, 16

	.type	str.2,@object                   # @str.2
str.2:
	.asciz	"hairyscary.cl"
	.size	str.2, 14

	.type	String.2,@object                # @String.2
	.globl	String.2
	.p2align	3
String.2:
	.quad	_String_vtable_prototype
	.quad	str.2
	.size	String.2, 16

	.section	".note.GNU-stack","",@progbits
