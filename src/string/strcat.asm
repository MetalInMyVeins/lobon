global strcat
global __strcat:function hidden
extern __memcpy
extern __strlen

strcat:
__strcat:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	mov	[rbp - 8], rdi
	mov	[rbp - 16], rsi

	call	__strlen
	; rax now contains the new index from where rsi
	; should start writing.
	
	mov	rdi, [rbp - 8]
	add	rdi, rax
	mov	[rbp - 24], rdi

	mov	rdi, [rbp - 16]
	call	__strlen
	inc	rax
	mov	rdx, rax

	mov	rsi, [rbp - 16]
	mov	rdi, [rbp - 24]
	call	__memcpy
	mov	rax, [rbp - 8]

	leave
	ret
