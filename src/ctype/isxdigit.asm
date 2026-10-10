global isxdigit
global __isxdigit:function hidden

isxdigit:
__isxdigit:
	cmp	edi, 48
	jge	.pot1
	cmp	edi, 97
	jge	.pot2
	cmp	edi, 65
	jge	.pot3

.pot1:
	cmp	edi, 57
	jle	.true
	jg	.false

.pot2:
	cmp	edi, 102
	jle	.true
	jg	.false

.pot3:
	cmp	edi, 70
	jle	.true
	jg	.false

.true:
	mov	eax, 1
	jmp	.end

.false:
	xor	eax, eax

.end:
	ret
