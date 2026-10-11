global ispunct
global __ispunct:function hidden
extern __isspace
extern __isalnum

ispunct:
__ispunct:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	[rbp - 4], edi
	call	__isspace
	cmp	eax, 0
	jg	.false

	mov	edi, [rbp - 4]
	call	__isalnum
	cmp	eax, 0
	jg	.false

	mov	eax, 1
	jmp	.end

.false:
	xor	eax, eax

.end:
	leave
	ret
