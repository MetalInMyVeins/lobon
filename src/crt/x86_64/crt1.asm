global _start
extern main

%define SYS_exit 60

section .text

_start:
	mov	edi, [rsp]
	lea	rsi, [rsp + 8]
	lea	rdx, [rsp + 16 + rdi * 8]
	and	rsp, -16
	xor	ebp, ebp
	call	main

	mov	edi, eax
	mov	eax, SYS_exit
	syscall
