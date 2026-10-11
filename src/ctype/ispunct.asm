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
	not	eax
	mov	[rbp - 8], eax

	mov	edi, [rbp - 4]
	call	__isalnum
	not	eax

	and	eax, [rbp - 8]
	cmp	eax, 0
	je	.end
	mov	eax, 1

.end:
	leave
	ret
