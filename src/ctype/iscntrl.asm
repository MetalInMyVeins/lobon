global iscntrl
global __iscntrl:function hidden

iscntrl:
__iscntrl:
	cmp	edi, 32
	jl	.true
	xor	eax, eax
	jmp	.end

.true:
	mov	eax, 1

.end:
	ret
