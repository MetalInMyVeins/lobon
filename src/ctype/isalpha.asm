global isalpha
global __isalpha:function hidden
extern __islower
extern __isupper

isalpha:
__isalpha:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	dword [rbp - 4], edi
	call	__islower

	cmp	eax, 1
	je	.end

	mov	dword [rbp - 4], edi
	call	__isupper

	cmp	eax, 1
	je	.end

	xor	eax, eax

.end:
	leave
	ret
