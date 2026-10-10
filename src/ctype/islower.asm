global islower
global __islower:function hidden

islower:
__islower:
	cmp	edi, 97
	jl	.false
	cmp	edi, 122
	jg	.false
	mov	eax, 1
	jmp	.end

.false:
	xor	eax, eax

.end:
	ret
