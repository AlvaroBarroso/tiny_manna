	.file	"tiny_manna.cpp"
	.text
	.section	.text._ZNSt6vectorIjSaIjEED2Ev,"axG",@progbits,_ZNSt6vectorIjSaIjEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIjSaIjEED2Ev
	.type	_ZNSt6vectorIjSaIjEED2Ev, @function
_ZNSt6vectorIjSaIjEED2Ev:
.LFB4208:
	.cfi_startproc
	endbr64
	movq	(%rdi), %r8
	testq	%r8, %r8
	je	.L1
	movq	16(%rdi), %rsi
	movq	%r8, %rdi
	subq	%r8, %rsi
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L1:
	ret
	.cfi_endproc
.LFE4208:
	.size	_ZNSt6vectorIjSaIjEED2Ev, .-_ZNSt6vectorIjSaIjEED2Ev
	.weak	_ZNSt6vectorIjSaIjEED1Ev
	.set	_ZNSt6vectorIjSaIjEED1Ev,_ZNSt6vectorIjSaIjEED2Ev
	.text
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB4740:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	movq	240(%rdi,%rax), %r12
	testq	%r12, %r12
	je	.L9
	cmpb	$0, 56(%r12)
	movq	%rdi, %rbp
	je	.L6
	movsbl	67(%r12), %esi
.L7:
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L6:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	movl	$10, %esi
	movq	%r12, %rdi
	call	*48(%rax)
	movsbl	%al, %esi
	jmp	.L7
.L9:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE4740:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.section	.rodata._ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_.str1.1,"aMS",@progbits,1
.LC0:
	.string	"vector::_M_realloc_insert"
	.section	.text._ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
	.type	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_, @function
_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_:
.LFB4416:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %r15
	movabsq	$2305843009213693951, %rdx
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
	movq	8(%rdi), %r12
	movq	(%rdi), %r14
	movq	%r12, %rax
	subq	%r14, %rax
	sarq	$2, %rax
	cmpq	%rdx, %rax
	je	.L30
	testq	%rax, %rax
	movl	$1, %edx
	movq	%rdi, %rbp
	movq	%rsi, %r13
	cmovne	%rax, %rdx
	xorl	%ecx, %ecx
	addq	%rdx, %rax
	movq	%rsi, %rdx
	setc	%cl
	subq	%r14, %rdx
	testq	%rcx, %rcx
	jne	.L23
	testq	%rax, %rax
	jne	.L15
	xorl	%ebx, %ebx
	xorl	%edi, %edi
.L21:
	movl	(%r15), %eax
	subq	%r13, %r12
	leaq	4(%rdi,%rdx), %r15
	movq	%rdi, %xmm0
	movl	%eax, (%rdi,%rdx)
	leaq	(%r15,%r12), %rax
	movq	%rax, %xmm1
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, (%rsp)
	testq	%rdx, %rdx
	jg	.L31
	testq	%r12, %r12
	jg	.L19
	testq	%r14, %r14
	jne	.L29
.L20:
	movdqa	(%rsp), %xmm2
	movq	%rbx, 16(%rbp)
	movups	%xmm2, 0(%rbp)
	addq	$24, %rsp
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
	.p2align 4,,10
	.p2align 3
.L31:
	.cfi_restore_state
	movq	%r14, %rsi
	call	memmove@PLT
	testq	%r12, %r12
	jg	.L19
.L29:
	movq	16(%rbp), %rsi
	movq	%r14, %rdi
	subq	%r14, %rsi
	call	_ZdlPvm@PLT
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	memcpy@PLT
	testq	%r14, %r14
	je	.L20
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L23:
	movabsq	$9223372036854775804, %rbx
.L14:
	movq	%rbx, %rdi
	movq	%rdx, (%rsp)
	call	_Znwm@PLT
	movq	(%rsp), %rdx
	movq	%rax, %rdi
	addq	%rax, %rbx
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L15:
	movabsq	$2305843009213693951, %rcx
	cmpq	%rcx, %rax
	cmova	%rcx, %rax
	leaq	0(,%rax,4), %rbx
	jmp	.L14
.L30:
	leaq	.LC0(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE4416:
	.size	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_, .-_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
	.section	.text._ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	.type	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_, @function
_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_:
.LFB4550:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %r15
	movabsq	$2305843009213693951, %rdx
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
	movq	8(%rdi), %r12
	movq	(%rdi), %r14
	movq	%r12, %rax
	subq	%r14, %rax
	sarq	$2, %rax
	cmpq	%rdx, %rax
	je	.L52
	testq	%rax, %rax
	movl	$1, %edx
	movq	%rdi, %rbp
	movq	%rsi, %r13
	cmovne	%rax, %rdx
	xorl	%ecx, %ecx
	addq	%rdx, %rax
	movq	%rsi, %rdx
	setc	%cl
	subq	%r14, %rdx
	testq	%rcx, %rcx
	jne	.L45
	testq	%rax, %rax
	jne	.L37
	xorl	%ebx, %ebx
	xorl	%edi, %edi
.L43:
	movl	(%r15), %eax
	subq	%r13, %r12
	leaq	4(%rdi,%rdx), %r15
	movq	%rdi, %xmm0
	movl	%eax, (%rdi,%rdx)
	leaq	(%r15,%r12), %rax
	movq	%rax, %xmm1
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, (%rsp)
	testq	%rdx, %rdx
	jg	.L53
	testq	%r12, %r12
	jg	.L41
	testq	%r14, %r14
	jne	.L51
.L42:
	movdqa	(%rsp), %xmm2
	movq	%rbx, 16(%rbp)
	movups	%xmm2, 0(%rbp)
	addq	$24, %rsp
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
	.p2align 4,,10
	.p2align 3
.L53:
	.cfi_restore_state
	movq	%r14, %rsi
	call	memmove@PLT
	testq	%r12, %r12
	jg	.L41
.L51:
	movq	16(%rbp), %rsi
	movq	%r14, %rdi
	subq	%r14, %rsi
	call	_ZdlPvm@PLT
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L41:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	memcpy@PLT
	testq	%r14, %r14
	je	.L42
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L45:
	movabsq	$9223372036854775804, %rbx
.L36:
	movq	%rbx, %rdi
	movq	%rdx, (%rsp)
	call	_Znwm@PLT
	movq	(%rsp), %rdx
	movq	%rax, %rdi
	addq	%rax, %rbx
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L37:
	movabsq	$2305843009213693951, %rcx
	cmpq	%rcx, %rax
	cmova	%rcx, %rax
	leaq	0(,%rax,4), %rbx
	jmp	.L36
.L52:
	leaq	.LC0(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE4550:
	.size	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_, .-_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"se acabo el tiempo\n"
.LC3:
	.string	"la actividad decayo a cero\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"estado inicial estable de la pila de arena..."
	.section	.rodata.str1.1
.LC10:
	.string	"LISTO"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"estado inicial desestabilizado de la pila de arena..."
	.align 8
.LC12:
	.string	"evolucion de la pila de arena..."
	.section	.rodata.str1.1
.LC13:
	.string	"activity.dat"
.LC15:
	.string	"\n"
.LC16:
	.string	"LISTO: "
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Tiempo promedio de ejecucion: "
	.section	.rodata.str1.1
.LC18:
	.string	" ns"
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Tiempo promedio de ejecucion de la parte 1: "
	.section	.rodata.str1.1
.LC20:
	.string	" ns represents"
.LC21:
	.string	"%"
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"Tiempo promedio de ejecucion de la parte 2: "
	.align 8
.LC23:
	.string	"Tiempo promedio de ejecucion de la parte 3: "
	.section	.text.unlikely,"ax",@progbits
.LCOLDB24:
	.section	.text.startup,"ax",@progbits
.LHOTB24:
	.p2align 4
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
	subq	$632, %rsp
	.cfi_def_cfa_offset 131760
	xorl	%edi, %edi
	leaq	_ZSt4cout(%rip), %r15
	movq	%fs:40, %rax
	movq	%rax, 131688(%rsp)
	xorl	%eax, %eax
	leaq	608(%rsp), %rbx
	leaq	66144(%rsp), %r12
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	.LC4(%rip), %rsi
	movq	%r15, %rdi
.LEHB0:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movdqa	.LC1(%rip), %xmm4
	movq	%rbx, %rax
	movdqa	.LC5(%rip), %xmm8
	movdqa	.LC6(%rip), %xmm7
	movdqa	.LC7(%rip), %xmm6
	movdqa	.LC8(%rip), %xmm5
	movapd	.LC9(%rip), %xmm3
.L55:
	movdqa	%xmm4, %xmm1
	addq	$16, %rax
	paddd	%xmm8, %xmm4
	movdqa	%xmm1, %xmm0
	movdqa	%xmm1, %xmm9
	movdqa	%xmm1, %xmm2
	paddd	%xmm6, %xmm0
	paddd	%xmm5, %xmm9
	pshufd	$238, %xmm0, %xmm10
	cvtdq2pd	%xmm0, %xmm11
	paddd	%xmm7, %xmm2
	mulpd	%xmm3, %xmm11
	cvtdq2pd	%xmm10, %xmm10
	mulpd	%xmm3, %xmm10
	cvttpd2dq	%xmm11, %xmm0
	cvttpd2dq	%xmm10, %xmm10
	punpcklqdq	%xmm10, %xmm0
	cvtdq2pd	%xmm9, %xmm10
	pshufd	$238, %xmm9, %xmm9
	mulpd	%xmm3, %xmm10
	cvtdq2pd	%xmm9, %xmm9
	mulpd	%xmm3, %xmm9
	cvttpd2dq	%xmm10, %xmm10
	cvttpd2dq	%xmm9, %xmm9
	punpcklqdq	%xmm9, %xmm10
	movdqa	%xmm0, %xmm9
	punpcklwd	%xmm10, %xmm0
	punpckhwd	%xmm10, %xmm9
	movdqa	%xmm0, %xmm10
	punpcklwd	%xmm9, %xmm0
	punpckhwd	%xmm9, %xmm10
	cvtdq2pd	%xmm1, %xmm9
	pshufd	$238, %xmm1, %xmm1
	mulpd	%xmm3, %xmm9
	cvtdq2pd	%xmm1, %xmm1
	punpcklwd	%xmm10, %xmm0
	cvtdq2pd	%xmm2, %xmm10
	mulpd	%xmm3, %xmm1
	mulpd	%xmm3, %xmm10
	cvttpd2dq	%xmm9, %xmm9
	cvttpd2dq	%xmm1, %xmm1
	punpcklqdq	%xmm1, %xmm9
	pshufd	$238, %xmm2, %xmm1
	cvtdq2pd	%xmm1, %xmm1
	mulpd	%xmm3, %xmm1
	cvttpd2dq	%xmm10, %xmm2
	movdqa	%xmm9, %xmm10
	cvttpd2dq	%xmm1, %xmm1
	punpcklqdq	%xmm1, %xmm2
	movdqa	%xmm9, %xmm1
	punpcklwd	%xmm2, %xmm1
	punpckhwd	%xmm2, %xmm10
	movdqa	%xmm1, %xmm2
	punpcklwd	%xmm10, %xmm1
	punpckhwd	%xmm10, %xmm2
	punpcklwd	%xmm2, %xmm1
	psubw	%xmm1, %xmm0
	movaps	%xmm0, -16(%rax)
	cmpq	%r12, %rax
	jne	.L55
	movl	$5, %edx
	movq	%r15, %rdi
	xorl	%ebp, %ebp
	xorl	%r13d, %r13d
	leaq	.LC10(%rip), %rsi
	xorl	%r14d, %r14d
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r15, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	leaq	.LC11(%rip), %rsi
	movq	%r15, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	pxor	%xmm0, %xmm0
	leaq	60(%rsp), %rax
	movq	$0, 80(%rsp)
	movq	%rax, (%rsp)
	movaps	%xmm0, 64(%rsp)
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L56:
	addq	$1, %rbp
	cmpq	$32768, %rbp
	je	.L150
.L62:
	cmpw	$1, (%rbx,%rbp,2)
	jne	.L56
	xorl	%eax, %eax
	movw	%ax, (%rbx,%rbp,2)
	call	rand@PLT
	andl	$2, %eax
	leal	-1(%rbp,%rax,2), %eax
	cmpl	$32768, %eax
	je	.L151
	cmpl	$-1, %eax
	je	.L59
	movl	%eax, 60(%rsp)
.L58:
	cmpq	%r13, %r14
	je	.L60
.L154:
	movl	%eax, (%r14)
	addq	$1, %rbp
	addq	$4, %r14
	movq	%r14, 72(%rsp)
	cmpq	$32768, %rbp
	jne	.L62
.L150:
	movq	64(%rsp), %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	xorl	%eax, %eax
	subq	%rdi, %rsi
	sarq	$2, %rsi
	je	.L66
.L63:
	movslq	(%rdi,%rax,4), %rax
	addw	$1, 608(%rsp,%rax,2)
	leal	1(%rdx), %eax
	movq	%rax, %rdx
	cmpq	%rsi, %rax
	jb	.L63
.L66:
	testq	%rdi, %rdi
	je	.L65
	movq	%r13, %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L65:
	movl	$5, %edx
	leaq	.LC10(%rip), %rsi
	movq	%r15, %rdi
	xorl	%r13d, %r13d
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r15, %rdi
	movabsq	$8589934597, %rbp
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	leaq	.LC12(%rip), %rsi
	movq	%r15, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r15, %rdi
	call	_ZNSo5flushEv@PLT
	leaq	96(%rsp), %rax
	movl	$16, %edx
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, 16(%rsp)
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@PLT
.LEHE0:
	movl	$0, (%rsp)
	pxor	%xmm0, %xmm0
	movq	$0, 80(%rsp)
	movq	$0, 8(%rsp)
	movaps	%xmm0, 64(%rsp)
.L67:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r14
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	xorl	%esi, %esi
	movl	$65536, %edx
	movq	%r12, %rdi
	movq	%rax, 24(%rsp)
	call	memset@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	24(%rsp), %rcx
	movq	8+time_recorder_p1(%rip), %rsi
	subq	%rcx, %rax
	cmpq	16+time_recorder_p1(%rip), %rsi
	movl	%eax, 60(%rsp)
	je	.L70
	movl	%eax, (%rsi)
	addq	$4, %rsi
	movq	%rsi, 8+time_recorder_p1(%rip)
.L71:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	generator(%rip), %rdx
	xorl	%edi, %edi
	movq	%rax, %r9
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L72:
	addq	$1, %rdi
	cmpq	$32768, %rdi
	je	.L152
.L74:
	movzwl	(%rbx,%rdi,2), %esi
	cmpw	$1, %si
	jbe	.L72
	movl	%edi, %r8d
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L73:
	imulq	$48271, %rdx, %r10
	addl	$1, %ecx
	movq	%r10, %rax
	mulq	%rbp
	movq	%r10, %rax
	subq	%rdx, %rax
	shrq	%rax
	addq	%rax, %rdx
	shrq	$30, %rdx
	movq	%rdx, %rax
	salq	$31, %rax
	subq	%rdx, %rax
	movq	%r10, %rdx
	subq	%rax, %rdx
	movl	%edx, %eax
	andl	$1, %eax
	leal	32767(%r8,%rax,2), %eax
	andl	$32767, %eax
	addw	$1, 66144(%rsp,%rax,2)
	cmpl	%esi, %ecx
	jne	.L73
	addq	$1, %rdi
	cmpq	$32768, %rdi
	jne	.L74
.L152:
	movq	%r9, 24(%rsp)
	movq	%rdx, generator(%rip)
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	24(%rsp), %r9
	movq	8+time_recorder_p2(%rip), %rsi
	subq	%r9, %rax
	cmpq	16+time_recorder_p2(%rip), %rsi
	movl	%eax, 56(%rsp)
	je	.L75
	movl	%eax, (%rsi)
	addq	$4, %rsi
	movq	%rsi, 8+time_recorder_p2(%rip)
.L76:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%r12, %rdx
	leaq	131680(%rsp), %rcx
	movq	%rax, %rsi
	movq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L77:
	movdqa	(%rax), %xmm1
	movdqa	(%rdx), %xmm0
	addq	$16, %rdx
	addq	$16, %rax
	pcmpeqw	.LC14(%rip), %xmm1
	psubw	%xmm1, %xmm0
	movaps	%xmm0, -16(%rax)
	cmpq	%rcx, %rdx
	jne	.L77
	movq	%rsi, 24(%rsp)
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	24(%rsp), %rsi
	subq	%rsi, %rax
	movq	8+time_recorder_p3(%rip), %rsi
	cmpq	16+time_recorder_p3(%rip), %rsi
	movl	%eax, 52(%rsp)
	je	.L78
	movl	%eax, (%rsi)
	addq	$4, %rsi
	movq	%rsi, 8+time_recorder_p3(%rip)
.L79:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r14, %rax
	movl	%eax, 60(%rsp)
	cmpq	%r13, 8(%rsp)
	je	.L80
	movl	%eax, 0(%r13)
	addq	$4, %r13
	movq	%r13, 72(%rsp)
.L81:
	movq	%rbx, %rax
	pxor	%xmm1, %xmm1
	pxor	%xmm4, %xmm4
	.p2align 4,,10
	.p2align 3
.L82:
	movdqa	(%rax), %xmm0
	psubusw	.LC14(%rip), %xmm0
	movdqa	%xmm4, %xmm3
	addq	$16, %rax
	pcmpeqw	%xmm4, %xmm0
	pandn	.LC14(%rip), %xmm0
	pcmpgtw	%xmm0, %xmm3
	movdqa	%xmm0, %xmm2
	punpcklwd	%xmm3, %xmm2
	punpckhwd	%xmm3, %xmm0
	paddd	%xmm2, %xmm1
	paddd	%xmm0, %xmm1
	cmpq	%rax, %r12
	jne	.L82
	movdqa	%xmm1, %xmm0
	movq	16(%rsp), %rdi
	psrldq	$8, %xmm0
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, %xmm0
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm1
	movd	%xmm1, %esi
	movd	%xmm1, %r14d
.LEHB1:
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	movl	$1, %edx
	leaq	.LC15(%rip), %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	addl	$1, (%rsp)
	movl	(%rsp), %eax
	testl	%r14d, %r14d
	jle	.L121
	cmpl	$7999, %eax
	jle	.L67
.L121:
	movl	$7, %edx
	leaq	.LC16(%rip), %rsi
	movq	%r15, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	testl	%r14d, %r14d
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rax
	movq	%r15, %rdi
	cmove	%rax, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movq	64(%rsp), %rbp
	cmpq	%r13, %rbp
	je	.L111
	movq	%r13, %rax
	movq	%rbp, %rdx
	subq	%rbp, %rax
	subq	$4, %rax
	movq	%rax, %rcx
	shrq	$2, %rcx
	addq	$1, %rcx
	cmpq	$8, %rax
	jbe	.L112
	movq	%rcx, %rax
	pxor	%xmm0, %xmm0
	shrq	$2, %rax
	salq	$4, %rax
	addq	%rbp, %rax
.L87:
	movdqu	(%rdx), %xmm6
	addq	$16, %rdx
	paddd	%xmm6, %xmm0
	cmpq	%rdx, %rax
	jne	.L87
	movdqa	%xmm0, %xmm1
	movq	%rcx, %rsi
	psrldq	$8, %xmm1
	andq	$-4, %rsi
	paddd	%xmm1, %xmm0
	leaq	0(%rbp,%rsi,4), %rdx
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	cmpq	%rcx, %rsi
	je	.L85
.L86:
	leaq	4(%rdx), %rcx
	addl	(%rdx), %eax
	cmpq	%rcx, %r13
	je	.L85
	leaq	8(%rdx), %rcx
	addl	4(%rdx), %eax
	cmpq	%rcx, %r13
	je	.L85
	addl	8(%rdx), %eax
.L85:
	movq	%r13, %rcx
	cltq
	xorl	%edx, %edx
	movq	%r15, %rdi
	subq	%rbp, %rcx
	leaq	.LC17(%rip), %rsi
	sarq	$2, %rcx
	divq	%rcx
	movl	$30, %edx
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%ebx, %esi
	movq	%r15, %rdi
	call	_ZNSolsEi@PLT
	movl	$3, %edx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movq	8+time_recorder_p1(%rip), %rdx
	movq	time_recorder_p1(%rip), %rcx
	cmpq	%rdx, %rcx
	je	.L113
	leaq	-4(%rdx), %rax
	movq	%rcx, %rsi
	subq	%rcx, %rax
	movq	%rax, %rdi
	shrq	$2, %rdi
	addq	$1, %rdi
	cmpq	$8, %rax
	jbe	.L114
	movq	%rdi, %rax
	pxor	%xmm0, %xmm0
	shrq	$2, %rax
	salq	$4, %rax
	addq	%rcx, %rax
.L92:
	movdqu	(%rsi), %xmm7
	addq	$16, %rsi
	paddd	%xmm7, %xmm0
	cmpq	%rax, %rsi
	jne	.L92
	movdqa	%xmm0, %xmm1
	movq	%rdi, %r8
	psrldq	$8, %xmm1
	andq	$-4, %r8
	paddd	%xmm1, %xmm0
	leaq	(%rcx,%r8,4), %rsi
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	cmpq	%rdi, %r8
	je	.L90
.L91:
	leaq	4(%rsi), %rdi
	addl	(%rsi), %eax
	cmpq	%rdi, %rdx
	je	.L90
	leaq	8(%rsi), %rdi
	addl	4(%rsi), %eax
	cmpq	%rdi, %rdx
	je	.L90
	addl	8(%rsi), %eax
.L90:
	subq	%rcx, %rdx
	cltq
	movq	%rdx, %rcx
	xorl	%edx, %edx
	sarq	$2, %rcx
	divq	%rcx
	movq	8+time_recorder_p2(%rip), %rdx
	movq	time_recorder_p2(%rip), %rcx
	movq	%rax, (%rsp)
	movl	%eax, %r12d
	cmpq	%rdx, %rcx
	je	.L115
	leaq	-4(%rdx), %rax
	movq	%rcx, %rsi
	subq	%rcx, %rax
	movq	%rax, %rdi
	shrq	$2, %rdi
	addq	$1, %rdi
	cmpq	$8, %rax
	jbe	.L116
	movq	%rdi, %rax
	pxor	%xmm0, %xmm0
	shrq	$2, %rax
	salq	$4, %rax
	addq	%rcx, %rax
.L97:
	movdqu	(%rsi), %xmm6
	addq	$16, %rsi
	paddd	%xmm6, %xmm0
	cmpq	%rsi, %rax
	jne	.L97
	movdqa	%xmm0, %xmm1
	movq	%rdi, %r8
	psrldq	$8, %xmm1
	andq	$-4, %r8
	paddd	%xmm1, %xmm0
	leaq	(%rcx,%r8,4), %rsi
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	cmpq	%rdi, %r8
	je	.L95
.L96:
	leaq	4(%rsi), %rdi
	addl	(%rsi), %eax
	cmpq	%rdi, %rdx
	je	.L95
	leaq	8(%rsi), %rdi
	addl	4(%rsi), %eax
	cmpq	%rdi, %rdx
	je	.L95
	addl	8(%rsi), %eax
.L95:
	subq	%rcx, %rdx
	cltq
	movq	%rdx, %rcx
	xorl	%edx, %edx
	sarq	$2, %rcx
	divq	%rcx
	movq	8+time_recorder_p3(%rip), %rdx
	movq	time_recorder_p3(%rip), %rcx
	movq	%rax, 32(%rsp)
	movl	%eax, 24(%rsp)
	cmpq	%rdx, %rcx
	je	.L117
	leaq	-4(%rdx), %rax
	movq	%rcx, %rsi
	subq	%rcx, %rax
	movq	%rax, %rdi
	shrq	$2, %rdi
	addq	$1, %rdi
	cmpq	$8, %rax
	jbe	.L118
	movq	%rdi, %rax
	pxor	%xmm0, %xmm0
	shrq	$2, %rax
	salq	$4, %rax
	addq	%rcx, %rax
.L102:
	movdqu	(%rsi), %xmm7
	addq	$16, %rsi
	paddd	%xmm7, %xmm0
	cmpq	%rsi, %rax
	jne	.L102
	movdqa	%xmm0, %xmm1
	movq	%rdi, %r8
	psrldq	$8, %xmm1
	andq	$-4, %r8
	paddd	%xmm1, %xmm0
	leaq	(%rcx,%r8,4), %rsi
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	cmpq	%r8, %rdi
	je	.L100
.L101:
	leaq	4(%rsi), %rdi
	addl	(%rsi), %eax
	cmpq	%rdi, %rdx
	je	.L100
	leaq	8(%rsi), %rdi
	addl	4(%rsi), %eax
	cmpq	%rdi, %rdx
	je	.L100
	addl	8(%rsi), %eax
.L100:
	subq	%rcx, %rdx
	cltq
	leaq	.LC19(%rip), %rsi
	movq	%r15, %rdi
	movq	%rdx, %rcx
	xorl	%edx, %edx
	sarq	$2, %rcx
	divq	%rcx
	movl	$44, %edx
	movq	%rax, 40(%rsp)
	movl	%eax, %r14d
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	_ZNSolsEi@PLT
	leaq	.LC20(%rip), %r13
	movl	$14, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	movq	%r13, %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	pxor	%xmm5, %xmm5
	pxor	%xmm0, %xmm0
	movq	%r12, %rdi
	cvtsi2ssl	%ebx, %xmm5
	cvtsi2ssl	(%rsp), %xmm0
	movss	%xmm5, (%rsp)
	divss	%xmm5, %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	leaq	.LC21(%rip), %rbx
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	movq	%rbx, %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$44, %edx
	leaq	.LC22(%rip), %rsi
	movq	%r15, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	24(%rsp), %esi
	movq	%r15, %rdi
	call	_ZNSolsEi@PLT
	movl	$14, %edx
	movq	%r13, %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	pxor	%xmm0, %xmm0
	movq	%r12, %rdi
	cvtsi2ssl	32(%rsp), %xmm0
	divss	(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$44, %edx
	leaq	.LC23(%rip), %rsi
	movq	%r15, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%r14d, %esi
	movq	%r15, %rdi
	call	_ZNSolsEi@PLT
	movl	$14, %edx
	movq	%r13, %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	pxor	%xmm0, %xmm0
	movq	%r12, %rdi
	cvtsi2ssl	40(%rsp), %xmm0
	divss	(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
.LEHE1:
	testq	%rbp, %rbp
	je	.L105
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	subq	%rbp, %rsi
	call	_ZdlPvm@PLT
.L105:
	movq	16(%rsp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@PLT
	movq	131688(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L153
	addq	$131704, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.L151:
	.cfi_restore_state
	movl	$0, 60(%rsp)
	xorl	%eax, %eax
	cmpq	%r13, %r14
	jne	.L154
.L60:
	movq	(%rsp), %rdx
	leaq	64(%rsp), %rdi
	movq	%r14, %rsi
.LEHB2:
	call	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
.LEHE2:
	movq	72(%rsp), %r14
	movq	80(%rsp), %r13
	jmp	.L56
.L59:
	movl	$32767, 60(%rsp)
	movl	$32767, %eax
	jmp	.L58
.L80:
	movq	8(%rsp), %rsi
	leaq	60(%rsp), %rdx
	leaq	64(%rsp), %rdi
.LEHB3:
	call	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	movq	80(%rsp), %rax
	movq	72(%rsp), %r13
	movq	%rax, 8(%rsp)
	jmp	.L81
.L78:
	leaq	52(%rsp), %rdx
	leaq	time_recorder_p3(%rip), %rdi
	call	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	jmp	.L79
.L75:
	leaq	56(%rsp), %rdx
	leaq	time_recorder_p2(%rip), %rdi
	call	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	jmp	.L76
.L70:
	leaq	60(%rsp), %rdx
	leaq	time_recorder_p1(%rip), %rdi
	call	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
.LEHE3:
	jmp	.L71
.L111:
	xorl	%eax, %eax
	jmp	.L85
.L112:
	xorl	%eax, %eax
	jmp	.L86
.L113:
	xorl	%eax, %eax
	jmp	.L90
.L114:
	xorl	%eax, %eax
	jmp	.L91
.L115:
	xorl	%eax, %eax
	jmp	.L95
.L116:
	xorl	%eax, %eax
	jmp	.L96
.L117:
	xorl	%eax, %eax
	jmp	.L100
.L118:
	xorl	%eax, %eax
	jmp	.L101
.L153:
	call	__stack_chk_fail@PLT
.L119:
	endbr64
	movq	%rax, %rbp
	jmp	.L106
.L120:
	endbr64
	movq	%rax, %rbp
	jmp	.L68
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
	.uleb128 .L119-.LFB3848
	.uleb128 0
	.uleb128 .LEHB2-.LFB3848
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L120-.LFB3848
	.uleb128 0
	.uleb128 .LEHB3-.LFB3848
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L119-.LFB3848
	.uleb128 0
.LLSDACSE3848:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3848
	.type	main.cold, @function
main.cold:
.LFSB3848:
.L106:
	.cfi_def_cfa_offset 131760
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	64(%rsp), %rdi
	movq	80(%rsp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L107
	call	_ZdlPvm@PLT
.L107:
	movq	16(%rsp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@PLT
	movq	%rbp, %rdi
.LEHB4:
	call	_Unwind_Resume@PLT
.L68:
	movq	64(%rsp), %rdi
	movq	80(%rsp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L69
	call	_ZdlPvm@PLT
.L69:
	movq	%rbp, %rdi
	call	_Unwind_Resume@PLT
.LEHE4:
	.cfi_endproc
.LFE3848:
	.section	.gcc_except_table
.LLSDAC3848:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3848-.LLSDACSBC3848
.LLSDACSBC3848:
	.uleb128 .LEHB4-.LCOLDB24
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSEC3848:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE24:
	.section	.text.startup
.LHOTE24:
	.p2align 4
	.type	_GLOBAL__sub_I_generator, @function
_GLOBAL__sub_I_generator:
.LFB4736:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	__dso_handle(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	_ZStL8__ioinit(%rip), %rbp
	movq	%rbp, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	movq	%r12, %rdx
	movq	%rbp, %rsi
	leaq	_ZNSt6vectorIjSaIjEED1Ev(%rip), %rbp
	call	__cxa_atexit@PLT
	pxor	%xmm0, %xmm0
	movq	%r12, %rdx
	movq	%rbp, %rdi
	leaq	time_recorder_p1(%rip), %rsi
	movaps	%xmm0, time_recorder_p1(%rip)
	movq	$1, generator(%rip)
	movq	$0, 16+time_recorder_p1(%rip)
	call	__cxa_atexit@PLT
	pxor	%xmm0, %xmm0
	movq	%r12, %rdx
	movq	%rbp, %rdi
	leaq	time_recorder_p2(%rip), %rsi
	movaps	%xmm0, time_recorder_p2(%rip)
	movq	$0, 16+time_recorder_p2(%rip)
	call	__cxa_atexit@PLT
	pxor	%xmm0, %xmm0
	movq	%r12, %rdx
	movq	%rbp, %rdi
	movaps	%xmm0, time_recorder_p3(%rip)
	leaq	time_recorder_p3(%rip), %rsi
	movq	$0, 16+time_recorder_p3(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE4736:
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC5:
	.long	8
	.long	8
	.long	8
	.long	8
	.align 16
.LC6:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC7:
	.long	1
	.long	1
	.long	1
	.long	1
	.align 16
.LC8:
	.long	5
	.long	5
	.long	5
	.long	5
	.align 16
.LC9:
	.long	1910401453
	.long	1072467594
	.long	1910401453
	.long	1072467594
	.align 16
.LC14:
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
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
