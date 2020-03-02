.globalmain
main:
	ldr r1,=num @loadtheaddressofthe
@string of digits into r1
	mov r0, #0			@initializetheresull
	mov r10, #10		@wewillneedtomultiply
@checkifthenumberisnegative
	ldrb r2, [r1]		@storethefirstcharacter
@ofthestringinr2
	cmp r2, #45			@checkifthefirstcharacter
@is’−’(ASCIIcode45)
	moveq r11, #1		@ifitis,store1inr11
	addeq r1, #1		@andadvancer1tothenext
@character
	movne r11, #0		@...otherwise,store0inr11
loop:
	ldrb r2, [r1], #1	@loadthecurrentcharacter
	@andadvancer1
	cmp r2, #0 			@ifwereachedtheendofthe
	beq finish 		@string(ASCIIcode0),stop
	mul r0, r10		@r0=r0∗10
	sub r2, #48		@r2=numbercorrespondingto

@thedigit(’0’is48inASCII)
	add r0, r2			@afterthis,r0=r0∗10+r2
	b loop				@repeattheloop
finish:
	cmp r11, #1		@ifthe’−’characterwasfound,
	rsbeq r0, #0	@reversethesign:r0=−r0
	mov r7, #1
	svc #0

.data
num: .asciz ”−107”@digitstringtobe
@convertedtonumber
