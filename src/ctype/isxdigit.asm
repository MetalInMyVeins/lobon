global isxdigit
global __isxdigit:function hidden

isxdigit:
__isxdigit:
.mark1:
	cmp	edi, 48
	jge	.pot1
.mark2:
	cmp	edi, 97
	jge	.pot2
.mark3:
	cmp	edi, 65
	jge	.pot3

.pot1:
	cmp	edi, 57
	jle	.true
	jmp	.mark2

.pot2:
	cmp	edi, 102
	jle	.true
	jmp	.mark3

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
