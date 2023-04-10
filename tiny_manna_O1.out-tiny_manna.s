	.file	"tiny_manna.cpp"
	.text
	.section	.text._ZNSt6vectorIjSaIjEED2Ev,"axG",@progbits,_ZNSt6vectorIjSaIjEED5Ev,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEED2Ev
	.type	_ZNSt6vectorIjSaIjEED2Ev, @function
_ZNSt6vectorIjSaIjEED2Ev:
.LFB4208:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L4
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	16(%rdi), %rsi
	subq	%rax, %rsi
	movq	%rax, %rdi
	call	_ZdlPvm@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
.L4:
	ret
	.cfi_endproc
.LFE4208:
	.size	_ZNSt6vectorIjSaIjEED2Ev, .-_ZNSt6vectorIjSaIjEED2Ev
	.weak	_ZNSt6vectorIjSaIjEED1Ev
	.set	_ZNSt6vectorIjSaIjEED1Ev,_ZNSt6vectorIjSaIjEED2Ev
	.section	.text._ZNSt12_Vector_baseIjSaIjEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEED5Ev,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIjSaIjEED2Ev
	.type	_ZNSt12_Vector_baseIjSaIjEED2Ev, @function
_ZNSt12_Vector_baseIjSaIjEED2Ev:
.LFB4205:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L10
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	16(%rdi), %rsi
	subq	%rax, %rsi
	movq	%rax, %rdi
	call	_ZdlPvm@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
.L10:
	ret
	.cfi_endproc
.LFE4205:
	.size	_ZNSt12_Vector_baseIjSaIjEED2Ev, .-_ZNSt12_Vector_baseIjSaIjEED2Ev
	.weak	_ZNSt12_Vector_baseIjSaIjEED1Ev
	.set	_ZNSt12_Vector_baseIjSaIjEED1Ev,_ZNSt12_Vector_baseIjSaIjEED2Ev
	.section	.text._ZNSt12_Vector_baseIiSaIiEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseIiSaIiEED5Ev,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseIiSaIiEED2Ev
	.type	_ZNSt12_Vector_baseIiSaIiEED2Ev, @function
_ZNSt12_Vector_baseIiSaIiEED2Ev:
.LFB4223:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L16
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	16(%rdi), %rsi
	subq	%rax, %rsi
	movq	%rax, %rdi
	call	_ZdlPvm@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
.L16:
	ret
	.cfi_endproc
.LFE4223:
	.size	_ZNSt12_Vector_baseIiSaIiEED2Ev, .-_ZNSt12_Vector_baseIiSaIiEED2Ev
	.weak	_ZNSt12_Vector_baseIiSaIiEED1Ev
	.set	_ZNSt12_Vector_baseIiSaIiEED1Ev,_ZNSt12_Vector_baseIiSaIiEED2Ev
	.section	.rodata._ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_.str1.1,"aMS",@progbits,1
.LC0:
	.string	"vector::_M_realloc_insert"
	.section	.text._ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
	.type	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_, @function
_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_:
.LFB4415:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rsi, (%rsp)
	movq	%rdx, 8(%rsp)
	movq	8(%rdi), %r12
	movq	(%rdi), %r13
	movq	%r12, %rdx
	subq	%r13, %rdx
	sarq	$2, %rdx
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdx
	je	.L34
	movq	%rdi, %rbx
	testq	%rdx, %rdx
	movl	$1, %eax
	cmovne	%rdx, %rax
	addq	%rdx, %rax
	jc	.L21
	movabsq	$2305843009213693951, %r14
	cmpq	%r14, %rax
	cmovbe	%rax, %r14
	movq	(%rsp), %r15
	subq	%r13, %r15
	movl	$0, %ebp
	testq	%rax, %rax
	je	.L22
	jmp	.L29
.L34:
	leaq	.LC0(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.L35:
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	memmove@PLT
	leaq	4(%rbp,%r15), %r15
	subq	(%rsp), %r12
	testq	%r12, %r12
	jg	.L24
	addq	%r12, %r15
	movq	16(%rbx), %rsi
	subq	%r13, %rsi
	jmp	.L28
.L21:
	movq	(%rsp), %r15
	subq	%r13, %r15
	movabsq	$2305843009213693951, %r14
.L29:
	leaq	0(,%r14,4), %rdi
	call	_Znwm@PLT
	movq	%rax, %rbp
.L22:
	movq	8(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 0(%rbp,%r15)
	testq	%r15, %r15
	jg	.L35
	leaq	4(%rbp,%r15), %r15
	subq	(%rsp), %r12
	testq	%r12, %r12
	jle	.L26
.L24:
	movq	%r12, %rdx
	movq	(%rsp), %rsi
	movq	%r15, %rdi
	call	memcpy@PLT
.L26:
	addq	%r12, %r15
	testq	%r13, %r13
	je	.L27
	movq	16(%rbx), %rsi
	subq	%r13, %rsi
.L28:
	movq	%r13, %rdi
	call	_ZdlPvm@PLT
.L27:
	movq	%rbp, (%rbx)
	movq	%r15, 8(%rbx)
	leaq	0(%rbp,%r14,4), %rax
	movq	%rax, 16(%rbx)
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4415:
	.size	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_, .-_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
	.section	.text._ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	.type	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_, @function
_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_:
.LFB4548:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rsi, (%rsp)
	movq	%rdx, 8(%rsp)
	movq	8(%rdi), %r12
	movq	(%rdi), %r13
	movq	%r12, %rdx
	subq	%r13, %rdx
	sarq	$2, %rdx
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdx
	je	.L51
	movq	%rdi, %rbx
	testq	%rdx, %rdx
	movl	$1, %eax
	cmovne	%rdx, %rax
	addq	%rdx, %rax
	jc	.L38
	movabsq	$2305843009213693951, %r14
	cmpq	%r14, %rax
	cmovbe	%rax, %r14
	movq	(%rsp), %r15
	subq	%r13, %r15
	movl	$0, %ebp
	testq	%rax, %rax
	je	.L39
	jmp	.L46
.L51:
	leaq	.LC0(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.L52:
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	memmove@PLT
	leaq	4(%rbp,%r15), %r15
	subq	(%rsp), %r12
	testq	%r12, %r12
	jg	.L41
	addq	%r12, %r15
	movq	16(%rbx), %rsi
	subq	%r13, %rsi
	jmp	.L45
.L38:
	movq	(%rsp), %r15
	subq	%r13, %r15
	movabsq	$2305843009213693951, %r14
.L46:
	leaq	0(,%r14,4), %rdi
	call	_Znwm@PLT
	movq	%rax, %rbp
.L39:
	movq	8(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 0(%rbp,%r15)
	testq	%r15, %r15
	jg	.L52
	leaq	4(%rbp,%r15), %r15
	subq	(%rsp), %r12
	testq	%r12, %r12
	jle	.L43
.L41:
	movq	%r12, %rdx
	movq	(%rsp), %rsi
	movq	%r15, %rdi
	call	memcpy@PLT
.L43:
	addq	%r12, %r15
	testq	%r13, %r13
	je	.L44
	movq	16(%rbx), %rsi
	subq	%r13, %rsi
.L45:
	movq	%r13, %rdi
	call	_ZdlPvm@PLT
.L44:
	movq	%rbp, (%rbx)
	movq	%r15, 8(%rbx)
	leaq	0(%rbp,%r14,4), %rax
	movq	%rax, 16(%rbx)
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4548:
	.size	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_, .-_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	.section	.text._ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_,"axG",@progbits,_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_
	.type	_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_, @function
_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_:
.LFB4421:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	8(%rdi), %rax
	cmpq	16(%rdi), %rax
	je	.L54
	movl	(%rsi), %edx
	movl	%edx, (%rax)
	addq	$4, 8(%rdi)
.L55:
	movq	8(%rbx), %rax
	subq	$4, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L54:
	.cfi_restore_state
	movq	%rsi, %rdx
	movq	%rax, %rsi
	call	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	jmp	.L55
	.cfi_endproc
.LFE4421:
	.size	_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_, .-_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"se acabo el tiempo\n"
.LC2:
	.string	"la actividad decayo a cero\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"estado inicial estable de la pila de arena..."
	.section	.rodata.str1.1
.LC5:
	.string	"LISTO"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"estado inicial desestabilizado de la pila de arena..."
	.align 8
.LC7:
	.string	"evolucion de la pila de arena..."
	.section	.rodata.str1.1
.LC8:
	.string	"activity.dat"
.LC9:
	.string	"\n"
.LC10:
	.string	"LISTO: "
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Tiempo promedio de ejecucion: "
	.section	.rodata.str1.1
.LC12:
	.string	" ns"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"Tiempo promedio de ejecucion de la parte 1: "
	.section	.rodata.str1.1
.LC14:
	.string	" ns represents"
.LC15:
	.string	"%"
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"Tiempo promedio de ejecucion de la parte 2: "
	.align 8
.LC17:
	.string	"Tiempo promedio de ejecucion de la parte 3: "
	.text
	.globl	main
	.type	main, @function
main:
.LFB3848:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3848
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	-131072(%rsp), %r11
	.cfi_def_cfa 11, 131128
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$600, %rsp
	.cfi_def_cfa_offset 131728
	movq	%fs:40, %rax
	movq	%rax, 131656(%rsp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	.LC3(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB0:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	576(%rsp), %r13
	movq	%r13, %rcx
	movl	$0, %eax
	movsd	.LC4(%rip), %xmm1
.L58:
	movl	%eax, %esi
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %edx
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%esi, %xmm0
	mulsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %esi
	subl	%esi, %edx
	movw	%dx, (%rcx)
	addq	$2, %rcx
	cmpl	$32768, %eax
	jne	.L58
	leaq	.LC5(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rbx
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	leaq	.LC6(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.LEHE0:
	movq	$0, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 48(%rsp)
	movq	%r13, %rbp
	movl	$0, %ebx
	leaq	28(%rsp), %r12
	jmp	.L65
.L60:
	cmpl	$-1, %eax
	movl	$32767, %edx
	cmove	%edx, %eax
	movl	%eax, 28(%rsp)
.L61:
	movq	40(%rsp), %rsi
	cmpq	48(%rsp), %rsi
	je	.L63
	movl	28(%rsp), %eax
	movl	%eax, (%rsi)
	addq	$4, %rsi
	movq	%rsi, 40(%rsp)
.L59:
	addl	$1, %ebx
	addq	$2, %rbp
	cmpl	$32768, %ebx
	je	.L112
.L65:
	cmpw	$1, 0(%rbp)
	jne	.L59
	movw	$0, 0(%rbp)
	call	rand@PLT
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	leal	-1(%rbx,%rax,2), %eax
	cmpl	$32768, %eax
	jne	.L60
	movl	$0, 28(%rsp)
	jmp	.L61
.L63:
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
.LEHB1:
	call	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
.LEHE1:
	jmp	.L59
.L112:
	movq	32(%rsp), %rsi
	movq	40(%rsp), %rax
	subq	%rsi, %rax
	sarq	$2, %rax
	je	.L66
	movl	$0, %ecx
	movl	$0, %edx
.L67:
	movslq	(%rsi,%rdx,4), %rdx
	addw	$1, 576(%rsp,%rdx,2)
	addl	$1, %ecx
	movl	%ecx, %edx
	cmpq	%rax, %rdx
	jb	.L67
.L66:
	leaq	32(%rsp), %rdi
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev
	leaq	.LC5(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rbx
	movq	%rbx, %rdi
.LEHB2:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	leaq	.LC7(%rip), %rsi
	movq	%rbx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rbx, %rdi
	call	_ZNSo5flushEv@PLT
	leaq	64(%rsp), %rdi
	movl	$16, %edx
	leaq	.LC8(%rip), %rsi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@PLT
	movq	$0, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 48(%rsp)
	movl	$0, %r14d
	leaq	.LC9(%rip), %r15
	jmp	.L68
.L95:
	endbr64
	movq	%rax, %rbx
	leaq	32(%rsp), %rdi
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev
	movq	%rbx, %rdi
	call	_Unwind_Resume@PLT
.LEHE2:
.L114:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, (%rsp)
	movl	$0, %ebp
	jmp	.L73
.L71:
	addq	$1, %rbp
	cmpq	$32768, %rbp
	je	.L113
.L73:
	movzwl	576(%rsp,%rbp,2), %r12d
	cmpw	$1, %r12w
	jbe	.L71
	movzwl	%r12w, %r12d
	movl	$0, %ebx
.L72:
	call	rand@PLT
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	leal	32767(%rbp,%rax,2), %eax
	cltd
	shrl	$17, %edx
	addl	%edx, %eax
	andl	$32767, %eax
	subl	%edx, %eax
	cltq
	addw	$1, 66112(%rsp,%rax,2)
	addl	$1, %ebx
	cmpl	%r12d, %ebx
	jne	.L72
	jmp	.L71
.L113:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	(%rsp), %rax
	movl	%eax, 24(%rsp)
	leaq	24(%rsp), %rsi
	leaq	time_recorder_p2(%rip), %rdi
.LEHB3:
	call	_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rbx
	leaq	66112(%rsp), %rdx
	leaq	131648(%rsp), %rsi
	movq	%r13, %rax
.L74:
	cmpw	$1, (%rax)
	sete	%cl
	movzbl	%cl, %ecx
	addw	(%rdx), %cx
	movw	%cx, (%rax)
	addq	$2, %rdx
	addq	$2, %rax
	cmpq	%rsi, %rdx
	jne	.L74
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%rbx, %rax
	movl	%eax, 20(%rsp)
	leaq	20(%rsp), %rsi
	leaq	time_recorder_p3(%rip), %rdi
	call	_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	8(%rsp), %rax
	movl	%eax, 28(%rsp)
	leaq	28(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_
	leaq	65536(%r13), %rdx
	movq	%r13, %rax
	movl	$0, %ebx
.L76:
	cmpw	$2, (%rax)
	sbbl	$-1, %ebx
	addq	$2, %rax
	cmpq	%rax, %rdx
	jne	.L76
	leaq	64(%rsp), %rdi
	movl	%ebx, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	movl	$1, %edx
	movq	%r15, %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	addl	$1, %r14d
	testl	%ebx, %ebx
	jle	.L96
	cmpl	$7999, %r14d
	jg	.L96
.L68:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, 8(%rsp)
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rbx
	leaq	66112(%rsp), %rax
	leaq	131648(%rsp), %rdx
.L70:
	movw	$0, (%rax)
	addq	$2, %rax
	cmpq	%rdx, %rax
	jne	.L70
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%rbx, %rax
	movl	%eax, 28(%rsp)
	leaq	28(%rsp), %rsi
	leaq	time_recorder_p1(%rip), %rdi
	call	_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_
	jmp	.L114
.L96:
	leaq	.LC10(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	testl	%ebx, %ebx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rax
	cmovle	%rax, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rsi
	cmpq	%rdx, %rsi
	je	.L90
	movq	%rsi, %rcx
	movl	$0, %eax
.L80:
	addl	(%rcx), %eax
	addq	$4, %rcx
	cmpq	%rdx, %rcx
	jne	.L80
.L79:
	cltq
	subq	%rsi, %rdx
	movq	%rdx, %rcx
	sarq	$2, %rcx
	movl	$0, %edx
	divq	%rcx
	movq	%rax, %r13
	leaq	.LC11(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	jmp	.L115
.L90:
	movl	$0, %eax
	jmp	.L79
.L115:
	movq	%rax, %rdi
	movl	%r13d, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	leaq	.LC12(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movq	8+time_recorder_p1(%rip), %rdx
	movq	time_recorder_p1(%rip), %rsi
	cmpq	%rdx, %rsi
	je	.L91
	movq	%rsi, %rcx
	movl	$0, %eax
.L82:
	addl	(%rcx), %eax
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	.L82
.L81:
	cltq
	subq	%rsi, %rdx
	movq	%rdx, %rcx
	sarq	$2, %rcx
	movl	$0, %edx
	divq	%rcx
	movq	%rax, %r12
	movl	%eax, %r15d
	movq	8+time_recorder_p2(%rip), %rdx
	movq	time_recorder_p2(%rip), %rsi
	cmpq	%rdx, %rsi
	je	.L92
	movq	%rsi, %rcx
	movl	$0, %eax
.L84:
	addl	(%rcx), %eax
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	.L84
.L83:
	cltq
	subq	%rsi, %rdx
	movq	%rdx, %rcx
	sarq	$2, %rcx
	movl	$0, %edx
	divq	%rcx
	movq	%rax, %rbp
	movl	%eax, %r14d
	movq	8+time_recorder_p3(%rip), %rdx
	movq	time_recorder_p3(%rip), %rsi
	cmpq	%rdx, %rsi
	je	.L93
	movq	%rsi, %rcx
	movl	$0, %eax
.L86:
	addl	(%rcx), %eax
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	.L86
.L85:
	cltq
	subq	%rsi, %rdx
	movq	%rdx, %rcx
	sarq	$2, %rcx
	movl	$0, %edx
	divq	%rcx
	movq	%rax, %rbx
	movl	%eax, 8(%rsp)
	leaq	.LC13(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	jmp	.L116
.L91:
	movl	$0, %eax
	jmp	.L81
.L92:
	movl	$0, %eax
	jmp	.L83
.L93:
	movl	$0, %eax
	jmp	.L85
.L116:
	movq	%rax, %rdi
	movl	%r15d, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	leaq	.LC14(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	pxor	%xmm2, %xmm2
	cvtsi2ssl	%r13d, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%r12d, %xmm0
	movss	%xmm2, (%rsp)
	divss	%xmm2, %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC15(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	leaq	.LC16(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	movl	%r14d, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	leaq	.LC14(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%ebp, %xmm0
	divss	(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC15(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	leaq	.LC17(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	movl	8(%rsp), %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	leaq	.LC14(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%ebx, %xmm0
	divss	(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC15(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
.LEHE3:
	leaq	32(%rsp), %rdi
	call	_ZNSt12_Vector_baseIjSaIjEED2Ev
	leaq	64(%rsp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@PLT
	movq	131656(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L117
	movl	$0, %eax
	addq	$131672, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L94:
	.cfi_restore_state
	endbr64
	movq	%rax, %rbx
	leaq	32(%rsp), %rdi
	call	_ZNSt12_Vector_baseIjSaIjEED2Ev
	leaq	64(%rsp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@PLT
	movq	%rbx, %rdi
.LEHB4:
	call	_Unwind_Resume@PLT
.LEHE4:
.L117:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE3848:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA3848:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3848-.LLSDACSB3848
.LLSDACSB3848:
	.uleb128 .LEHB0-.LFB3848
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB3848
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L95-.LFB3848
	.uleb128 0
	.uleb128 .LEHB2-.LFB3848
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB3848
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L94-.LFB3848
	.uleb128 0
	.uleb128 .LEHB4-.LFB3848
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSE3848:
	.text
	.size	main, .-main
	.type	_GLOBAL__sub_I_generator, @function
_GLOBAL__sub_I_generator:
.LFB4733:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	leaq	_ZStL8__ioinit(%rip), %rbp
	movq	%rbp, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rbx
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	call	__cxa_atexit@PLT
	movq	$1, generator(%rip)
	movq	$0, time_recorder_p1(%rip)
	movq	$0, 8+time_recorder_p1(%rip)
	movq	$0, 16+time_recorder_p1(%rip)
	movq	%rbx, %rdx
	leaq	time_recorder_p1(%rip), %rsi
	leaq	_ZNSt6vectorIjSaIjEED1Ev(%rip), %rbp
	movq	%rbp, %rdi
	call	__cxa_atexit@PLT
	movq	$0, time_recorder_p2(%rip)
	movq	$0, 8+time_recorder_p2(%rip)
	movq	$0, 16+time_recorder_p2(%rip)
	movq	%rbx, %rdx
	leaq	time_recorder_p2(%rip), %rsi
	movq	%rbp, %rdi
	call	__cxa_atexit@PLT
	movq	$0, time_recorder_p3(%rip)
	movq	$0, 8+time_recorder_p3(%rip)
	movq	$0, 16+time_recorder_p3(%rip)
	movq	%rbx, %rdx
	leaq	time_recorder_p3(%rip), %rsi
	movq	%rbp, %rdi
	call	__cxa_atexit@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4733:
	.size	_GLOBAL__sub_I_generator, .-_GLOBAL__sub_I_generator
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_generator
	.globl	time_recorder_p3
	.bss
	.align 16
	.type	time_recorder_p3, @object
	.size	time_recorder_p3, 24
time_recorder_p3:
	.zero	24
	.globl	time_recorder_p2
	.align 16
	.type	time_recorder_p2, @object
	.size	time_recorder_p2, 24
time_recorder_p2:
	.zero	24
	.globl	time_recorder_p1
	.align 16
	.type	time_recorder_p1, @object
	.size	time_recorder_p1, 24
time_recorder_p1:
	.zero	24
	.globl	generator
	.align 8
	.type	generator, @object
	.size	generator, 8
generator:
	.zero	8
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	1910401453
	.long	1072467594
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
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
