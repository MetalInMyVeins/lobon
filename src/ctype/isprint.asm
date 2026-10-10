global isprint
global __isprint:function hidden

isprint:
__isprint:
	cmp	edi, 32
	jl	.false
	cmp	edi, 126
	jg	.false
	mov	eax, 1
	jmp	.end

.false:
	xor	eax, eax

.end:
	ret
