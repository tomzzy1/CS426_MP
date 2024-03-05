	.text
	.file	"rotate.ll"
	.globl	rotate                          # -- Begin function rotate
	.p2align	4, 0x90
	.type	rotate,@function
rotate:                                 # @rotate
	.cfi_startproc
# %bb.0:                                # %entry
	movb	%sil, %dl
	movb	%dil, %al
	andb	$7, %dl
	movb	%dl, %cl
	movb	%al, %sil
	shrb	%cl, %sil
	movb	%sil, -1(%rsp)                  # 1-byte Spill
	movb	$8, %cl
	subb	%dl, %cl
	shlb	%cl, %al
	movb	-1(%rsp), %cl                   # 1-byte Reload
	orb	%cl, %al
	retq
.Lfunc_end0:
	.size	rotate, .Lfunc_end0-rotate
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$251, %edi
	movl	$3, %esi
	callq	rotate@PLT
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
