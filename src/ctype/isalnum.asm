global isalnum
global __isalnum:function hidden
extern __isalpha
extern __isdigit

isalnum:
__isalnum:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	[rbp - 4], edi
	call	__isalpha
	cmp	eax, 1
	je	.true

	mov	edi, [rbp - 4]
	call	__isdigit
	cmp	eax, 1
	je	.true

	xor	eax, eax
	jmp	.end

.true:
	mov	eax, 1

.end:
	leave
	ret
