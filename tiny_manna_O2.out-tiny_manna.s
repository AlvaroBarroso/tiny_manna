	.file	"tiny_manna.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1634:
	.cfi_startproc
	endbr64
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE1634:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB4739:
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
	je	.L5
	movsbl	67(%r12), %esi
.L6:
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
.L5:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L6
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L6
.L9:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE4739:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
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
	je	.L10
	movq	16(%rdi), %rsi
	movq	%r8, %rdi
	subq	%r8, %rsi
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L10:
	ret
	.cfi_endproc
.LFE4208:
	.size	_ZNSt6vectorIjSaIjEED2Ev, .-_ZNSt6vectorIjSaIjEED2Ev
	.weak	_ZNSt6vectorIjSaIjEED1Ev
	.set	_ZNSt6vectorIjSaIjEED1Ev,_ZNSt6vectorIjSaIjEED2Ev
	.section	.text._ZNSt12_Vector_baseIjSaIjEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseIjSaIjEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt12_Vector_baseIjSaIjEED2Ev
	.type	_ZNSt12_Vector_baseIjSaIjEED2Ev, @function
_ZNSt12_Vector_baseIjSaIjEED2Ev:
.LFB4205:
	.cfi_startproc
	endbr64
	movq	(%rdi), %r8
	testq	%r8, %r8
	je	.L12
	movq	16(%rdi), %rsi
	movq	%r8, %rdi
	subq	%r8, %rsi
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L12:
	ret
	.cfi_endproc
.LFE4205:
	.size	_ZNSt12_Vector_baseIjSaIjEED2Ev, .-_ZNSt12_Vector_baseIjSaIjEED2Ev
	.weak	_ZNSt12_Vector_baseIjSaIjEED1Ev
	.set	_ZNSt12_Vector_baseIjSaIjEED1Ev,_ZNSt12_Vector_baseIjSaIjEED2Ev
	.section	.text._ZNSt12_Vector_baseIiSaIiEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseIiSaIiEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt12_Vector_baseIiSaIiEED2Ev
	.type	_ZNSt12_Vector_baseIiSaIiEED2Ev, @function
_ZNSt12_Vector_baseIiSaIiEED2Ev:
.LFB4223:
	.cfi_startproc
	endbr64
	movq	(%rdi), %r8
	testq	%r8, %r8
	je	.L14
	movq	16(%rdi), %rsi
	movq	%r8, %rdi
	subq	%r8, %rsi
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L14:
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
	.p2align 4
	.weak	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
	.type	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_, @function
_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_:
.LFB4415:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %rcx
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
	movq	(%rdi), %r15
	movq	%r12, %rax
	subq	%r15, %rax
	sarq	$2, %rax
	cmpq	%rdx, %rax
	je	.L36
	testq	%rax, %rax
	movl	$1, %edx
	movq	%rsi, %r14
	movq	%rdi, %rbp
	cmovne	%rax, %rdx
	xorl	%esi, %esi
	addq	%rdx, %rax
	movq	%r14, %rdx
	setc	%sil
	subq	%r15, %rdx
	testq	%rsi, %rsi
	jne	.L29
	testq	%rax, %rax
	jne	.L21
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
.L27:
	movq	%r12, %r8
	movl	(%rcx), %eax
	leaq	4(%r13,%rdx), %r9
	subq	%r14, %r8
	movl	%eax, 0(%r13,%rdx)
	leaq	(%r9,%r8), %r12
	testq	%rdx, %rdx
	jg	.L37
	testq	%r8, %r8
	jg	.L25
	testq	%r15, %r15
	jne	.L35
.L26:
	movq	%r13, 0(%rbp)
	movq	%r12, 8(%rbp)
	movq	%rbx, 16(%rbp)
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
.L37:
	.cfi_restore_state
	movq	%r15, %rsi
	movq	%r13, %rdi
	movq	%r8, 8(%rsp)
	movq	%r9, (%rsp)
	call	memmove@PLT
	movq	8(%rsp), %r8
	movq	(%rsp), %r9
	testq	%r8, %r8
	jg	.L25
.L35:
	movq	16(%rbp), %rsi
	movq	%r15, %rdi
	subq	%r15, %rsi
	call	_ZdlPvm@PLT
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%r8, %rdx
	movq	%r14, %rsi
	movq	%r9, %rdi
	call	memcpy@PLT
	testq	%r15, %r15
	je	.L26
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L29:
	movabsq	$9223372036854775804, %rbx
.L20:
	movq	%rbx, %rdi
	movq	%rcx, 8(%rsp)
	movq	%rdx, (%rsp)
	call	_Znwm@PLT
	movq	(%rsp), %rdx
	movq	8(%rsp), %rcx
	movq	%rax, %r13
	addq	%rax, %rbx
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L21:
	movabsq	$2305843009213693951, %rsi
	cmpq	%rsi, %rax
	cmova	%rsi, %rax
	leaq	0(,%rax,4), %rbx
	jmp	.L20
.L36:
	leaq	.LC0(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE4415:
	.size	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_, .-_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
	.section	.text._ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	.type	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_, @function
_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_:
.LFB4548:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %rcx
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
	movq	(%rdi), %r15
	movq	%r12, %rax
	subq	%r15, %rax
	sarq	$2, %rax
	cmpq	%rdx, %rax
	je	.L58
	testq	%rax, %rax
	movl	$1, %edx
	movq	%rsi, %r14
	movq	%rdi, %rbp
	cmovne	%rax, %rdx
	xorl	%esi, %esi
	addq	%rdx, %rax
	movq	%r14, %rdx
	setc	%sil
	subq	%r15, %rdx
	testq	%rsi, %rsi
	jne	.L51
	testq	%rax, %rax
	jne	.L43
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
.L49:
	movq	%r12, %r8
	movl	(%rcx), %eax
	leaq	4(%r13,%rdx), %r9
	subq	%r14, %r8
	movl	%eax, 0(%r13,%rdx)
	leaq	(%r9,%r8), %r12
	testq	%rdx, %rdx
	jg	.L59
	testq	%r8, %r8
	jg	.L47
	testq	%r15, %r15
	jne	.L57
.L48:
	movq	%r13, 0(%rbp)
	movq	%r12, 8(%rbp)
	movq	%rbx, 16(%rbp)
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
.L59:
	.cfi_restore_state
	movq	%r15, %rsi
	movq	%r13, %rdi
	movq	%r8, 8(%rsp)
	movq	%r9, (%rsp)
	call	memmove@PLT
	movq	8(%rsp), %r8
	movq	(%rsp), %r9
	testq	%r8, %r8
	jg	.L47
.L57:
	movq	16(%rbp), %rsi
	movq	%r15, %rdi
	subq	%r15, %rsi
	call	_ZdlPvm@PLT
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L47:
	movq	%r8, %rdx
	movq	%r14, %rsi
	movq	%r9, %rdi
	call	memcpy@PLT
	testq	%r15, %r15
	je	.L48
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L51:
	movabsq	$9223372036854775804, %rbx
.L42:
	movq	%rbx, %rdi
	movq	%rcx, 8(%rsp)
	movq	%rdx, (%rsp)
	call	_Znwm@PLT
	movq	(%rsp), %rdx
	movq	8(%rsp), %rcx
	movq	%rax, %r13
	addq	%rax, %rbx
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L43:
	movabsq	$2305843009213693951, %rsi
	cmpq	%rsi, %rax
	cmova	%rsi, %rax
	leaq	0(,%rax,4), %rbx
	jmp	.L42
.L58:
	leaq	.LC0(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE4548:
	.size	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_, .-_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
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
	.section	.text.unlikely,"ax",@progbits
.LCOLDB18:
	.section	.text.startup,"ax",@progbits
.LHOTB18:
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
	subq	$648, %rsp
	.cfi_def_cfa_offset 131776
	xorl	%edi, %edi
	leaq	_ZSt4cout(%rip), %r15
	movq	%fs:40, %rax
	movq	%rax, 131704(%rsp)
	xorl	%eax, %eax
	leaq	624(%rsp), %r13
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	.LC3(%rip), %rsi
	movq	%r15, %rdi
.LEHB0:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movsd	.LC4(%rip), %xmm1
	movq	%r13, %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L61:
	movl	%eax, %esi
	pxor	%xmm0, %xmm0
	addl	$1, %eax
	addq	$2, %rcx
	cvtsi2sdl	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %edx
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%esi, %xmm0
	mulsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %esi
	subl	%esi, %edx
	movw	%dx, -2(%rcx)
	cmpl	$32768, %eax
	jne	.L61
	leaq	.LC5(%rip), %rbp
	movq	%r15, %rdi
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	movq	%rbp, %rsi
	leaq	76(%rsp), %r12
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	leaq	.LC6(%rip), %rsi
	movq	%r15, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	80(%rsp), %rax
	movq	$0, 80(%rsp)
	movq	$0, 88(%rsp)
	movq	$0, 96(%rsp)
	movq	%rax, 24(%rsp)
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L62:
	addq	$1, %rbx
	cmpq	$32768, %rbx
	je	.L130
.L68:
	cmpw	$1, 0(%r13,%rbx,2)
	jne	.L62
	xorl	%eax, %eax
	movw	%ax, 0(%r13,%rbx,2)
	call	rand@PLT
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	leal	-1(%rbx,%rax,2), %eax
	cmpl	$32768, %eax
	je	.L131
	cmpl	$-1, %eax
	movl	$32767, %edx
	cmove	%edx, %eax
	movl	%eax, 76(%rsp)
	cmpq	%r14, 96(%rsp)
	je	.L66
.L135:
	movl	76(%rsp), %eax
	addq	$4, %r14
	addq	$1, %rbx
	movl	%eax, -4(%r14)
	movq	%r14, 88(%rsp)
	cmpq	$32768, %rbx
	jne	.L68
.L130:
	movq	80(%rsp), %rcx
	xorl	%edx, %edx
	xorl	%eax, %eax
	subq	%rcx, %r14
	sarq	$2, %r14
	je	.L71
.L69:
	movslq	(%rcx,%rax,4), %rax
	addw	$1, 624(%rsp,%rax,2)
	leal	1(%rdx), %eax
	movq	%rax, %rdx
	cmpq	%r14, %rax
	jb	.L69
.L71:
	movq	24(%rsp), %rdi
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	leaq	.LC7(%rip), %rsi
	movq	%r15, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%r15, %rdi
	call	_ZNSo5flushEv@PLT
	leaq	112(%rsp), %rax
	movl	$16, %edx
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, 48(%rsp)
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@PLT
.LEHE0:
	leaq	66160(%rsp), %rax
	movq	$0, 80(%rsp)
	movq	%rax, 16(%rsp)
	leaq	76(%rsp), %rax
	movq	$0, 88(%rsp)
	movq	$0, 96(%rsp)
	movl	$0, 12(%rsp)
	movq	%rax, 56(%rsp)
.L70:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, 40(%rsp)
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	movl	$65536, %edx
	movq	%rax, %rbx
	call	memset@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	8+time_recorder_p1(%rip), %rsi
	subq	%rbx, %rax
	cmpq	16+time_recorder_p1(%rip), %rsi
	movl	%eax, 76(%rsp)
	je	.L73
	movl	%eax, (%rsi)
	addq	$4, %rsi
	movq	%rsi, 8+time_recorder_p1(%rip)
.L74:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	xorl	%ebp, %ebp
	movq	%rax, 32(%rsp)
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L133:
	addq	$1, %rbp
	cmpq	$32768, %rbp
	je	.L132
.L76:
	movzwl	0(%r13,%rbp,2), %ebx
	cmpw	$1, %bx
	jbe	.L133
	movl	%ebp, %r12d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L78:
	call	rand@PLT
	addl	$1, %r14d
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	leal	32767(%r12,%rax,2), %eax
	andl	$32767, %eax
	addw	$1, 66160(%rsp,%rax,2)
	cmpl	%ebx, %r14d
	jne	.L78
	addq	$1, %rbp
	cmpq	$32768, %rbp
	jne	.L76
.L132:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	8+time_recorder_p2(%rip), %rsi
	subq	32(%rsp), %rax
	cmpq	16+time_recorder_p2(%rip), %rsi
	movl	%eax, 72(%rsp)
	je	.L80
	movl	%eax, (%rsi)
	addq	$4, %rsi
	movq	%rsi, 8+time_recorder_p2(%rip)
.L81:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	16(%rsp), %rdx
	leaq	131696(%rsp), %rsi
	movq	%rax, %rbx
	movq	%r13, %rax
	.p2align 4,,10
	.p2align 3
.L82:
	xorl	%ecx, %ecx
	cmpw	$1, (%rax)
	sete	%cl
	addq	$2, %rdx
	addw	-2(%rdx), %cx
	addq	$2, %rax
	movw	%cx, -2(%rax)
	cmpq	%rdx, %rsi
	jne	.L82
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	8+time_recorder_p3(%rip), %rsi
	subq	%rbx, %rax
	cmpq	16+time_recorder_p3(%rip), %rsi
	movl	%eax, 68(%rsp)
	je	.L83
	movl	%eax, (%rsi)
	addq	$4, %rsi
	movq	%rsi, 8+time_recorder_p3(%rip)
.L84:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	40(%rsp), %rax
	movq	88(%rsp), %rsi
	movl	%eax, 76(%rsp)
	cmpq	96(%rsp), %rsi
	je	.L85
	leaq	4(%rsi), %rbp
	movl	%eax, (%rsi)
	movq	%rbp, 88(%rsp)
.L86:
	leaq	65536(%r13), %rdx
	movq	%r13, %rax
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L88:
	cmpw	$2, (%rax)
	sbbl	$-1, %ebx
	addq	$2, %rax
	cmpq	%rax, %rdx
	jne	.L88
	movq	48(%rsp), %rdi
	movl	%ebx, %esi
.LEHB1:
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	movl	$1, %edx
	leaq	.LC9(%rip), %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	addl	$1, 12(%rsp)
	movl	12(%rsp), %eax
	testl	%ebx, %ebx
	jle	.L109
	cmpl	$7999, %eax
	jle	.L70
.L109:
	leaq	.LC10(%rip), %rsi
	movq	%r15, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	testl	%ebx, %ebx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rax
	cmove	%rax, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movq	80(%rsp), %rsi
	cmpq	%rbp, %rsi
	je	.L103
	movq	%rsi, %rdx
	xorl	%eax, %eax
.L92:
	addl	(%rdx), %eax
	addq	$4, %rdx
	cmpq	%rdx, %rbp
	jne	.L92
.L91:
	movq	%rbp, %rcx
	cltq
	xorl	%edx, %edx
	movq	%r15, %rdi
	subq	%rsi, %rcx
	leaq	.LC11(%rip), %rsi
	sarq	$2, %rcx
	divq	%rcx
	movq	%rax, %r14
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	movl	%r14d, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	leaq	.LC12(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movq	8+time_recorder_p1(%rip), %rdx
	movq	time_recorder_p1(%rip), %rsi
	cmpq	%rdx, %rsi
	je	.L104
	movq	%rsi, %rcx
	xorl	%eax, %eax
.L94:
	addl	(%rcx), %eax
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	.L94
.L93:
	subq	%rsi, %rdx
	cltq
	movq	time_recorder_p2(%rip), %rsi
	movq	%rdx, %rcx
	xorl	%edx, %edx
	sarq	$2, %rcx
	divq	%rcx
	movq	8+time_recorder_p2(%rip), %rdx
	movq	%rax, %rbp
	movl	%eax, %r13d
	cmpq	%rdx, %rsi
	je	.L105
	movq	%rsi, %rcx
	xorl	%eax, %eax
.L96:
	addl	(%rcx), %eax
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	.L96
.L95:
	subq	%rsi, %rdx
	cltq
	movq	time_recorder_p3(%rip), %rsi
	movq	%rdx, %rcx
	xorl	%edx, %edx
	sarq	$2, %rcx
	divq	%rcx
	movq	8+time_recorder_p3(%rip), %rdx
	movl	%eax, 16(%rsp)
	movq	%rax, %rbx
	cmpq	%rdx, %rsi
	je	.L106
	movq	%rsi, %rcx
	xorl	%eax, %eax
.L98:
	addl	(%rcx), %eax
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	.L98
.L97:
	subq	%rsi, %rdx
	cltq
	leaq	.LC13(%rip), %rsi
	movq	%r15, %rdi
	movq	%rdx, %rcx
	xorl	%edx, %edx
	sarq	$2, %rcx
	divq	%rcx
	movq	%rax, 32(%rsp)
	movl	%eax, %r12d
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	movl	%r13d, %esi
	call	_ZNSolsEi@PLT
	leaq	.LC14(%rip), %r13
	movq	%rax, %rdi
	movq	%r13, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	pxor	%xmm2, %xmm2
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	cvtsi2ssl	%r14d, %xmm2
	cvtsi2ssl	%ebp, %xmm0
	movss	%xmm2, 12(%rsp)
	divss	%xmm2, %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	leaq	.LC15(%rip), %rbp
	movq	%rax, %rdi
	movq	%rbp, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	leaq	.LC16(%rip), %rsi
	movq	%r15, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	16(%rsp), %esi
	movq	%rax, %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	movq	%r13, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	cvtsi2ssl	%ebx, %xmm0
	divss	12(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movq	%rbp, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	leaq	.LC17(%rip), %rsi
	movq	%r15, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	movl	%r12d, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	movq	%r13, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	cvtsi2ssl	32(%rsp), %xmm0
	divss	12(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	movq	%rbp, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
.LEHE1:
	movq	24(%rsp), %rdi
	call	_ZNSt12_Vector_baseIjSaIjEED2Ev
	movq	48(%rsp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@PLT
	movq	131704(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L134
	addq	$131720, %rsp
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
.L131:
	.cfi_restore_state
	movl	$0, 76(%rsp)
	cmpq	%r14, 96(%rsp)
	jne	.L135
.L66:
	movq	24(%rsp), %rdi
	movq	%r12, %rdx
	movq	%r14, %rsi
.LEHB2:
	call	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
.LEHE2:
	movq	88(%rsp), %r14
	jmp	.L62
.L85:
	movq	56(%rsp), %rdx
	movq	24(%rsp), %rdi
.LEHB3:
	call	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	movq	88(%rsp), %rbp
	jmp	.L86
.L83:
	leaq	68(%rsp), %rdx
	leaq	time_recorder_p3(%rip), %rdi
	call	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	jmp	.L84
.L80:
	leaq	72(%rsp), %rdx
	leaq	time_recorder_p2(%rip), %rdi
	call	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	jmp	.L81
.L73:
	movq	56(%rsp), %rdx
	leaq	time_recorder_p1(%rip), %rdi
	call	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
.LEHE3:
	jmp	.L74
.L103:
	xorl	%eax, %eax
	jmp	.L91
.L104:
	xorl	%eax, %eax
	jmp	.L93
.L105:
	xorl	%eax, %eax
	jmp	.L95
.L106:
	xorl	%eax, %eax
	jmp	.L97
.L134:
	call	__stack_chk_fail@PLT
.L107:
	endbr64
	movq	%rax, %rbp
	jmp	.L99
.L108:
	endbr64
	movq	%rax, %rbp
	jmp	.L72
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
	.uleb128 .L107-.LFB3848
	.uleb128 0
	.uleb128 .LEHB2-.LFB3848
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L108-.LFB3848
	.uleb128 0
	.uleb128 .LEHB3-.LFB3848
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L107-.LFB3848
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
.L99:
	.cfi_def_cfa_offset 131776
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	24(%rsp), %rdi
	call	_ZNSt12_Vector_baseIjSaIjEED2Ev
	movq	48(%rsp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@PLT
	movq	%rbp, %rdi
.LEHB4:
	call	_Unwind_Resume@PLT
.L72:
	movq	24(%rsp), %rdi
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev
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
	.uleb128 .LEHB4-.LCOLDB18
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSEC3848:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE18:
	.section	.text.startup
.LHOTE18:
	.p2align 4
	.type	_GLOBAL__sub_I_generator, @function
_GLOBAL__sub_I_generator:
.LFB4733:
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
	movq	%r12, %rdx
	movq	%rbp, %rdi
	leaq	time_recorder_p1(%rip), %rsi
	movq	$1, generator(%rip)
	movq	$0, time_recorder_p1(%rip)
	movq	$0, 8+time_recorder_p1(%rip)
	movq	$0, 16+time_recorder_p1(%rip)
	call	__cxa_atexit@PLT
	movq	%r12, %rdx
	movq	%rbp, %rdi
	leaq	time_recorder_p2(%rip), %rsi
	movq	$0, time_recorder_p2(%rip)
	movq	$0, 8+time_recorder_p2(%rip)
	movq	$0, 16+time_recorder_p2(%rip)
	call	__cxa_atexit@PLT
	movq	%r12, %rdx
	movq	%rbp, %rdi
	movq	$0, time_recorder_p3(%rip)
	movq	$0, 8+time_recorder_p3(%rip)
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
