@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Read a s t r i n g from the t e rmi n al .
@ ( onl y the f i r s t 99 c h a r a c t e r s a r e read )
@
@ arguments : r1 : a d d r e s s of s t r i n g used to
@ storeresult
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
readstr:
push {r0−r7,lr}
mov r0, #0	@0=stdinput(terminal)
mov r2, #100	@maxnumofbytestoread
mov r7, #3	@3=”read”systemcall
svc #0	@makethesystemcall
pop {r0−r7,lr}
bx lr
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@Printanintegeronthescreen,followed
@byanewline.(usesClibraryfunctrion)
@
@arguments:r1:integertobeprinted
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.globalprintf
printnum:
	push {r0−r3,lr}
	ldr r0, =fmt
	bl printf
	pop {r0−r3,lr}
	bx lr
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.globalmain
main:
	ldr r1, =input
	bl readstr	@readinputfromterminal
	ldrb r1,[r1]	@loadthefirstcharacter
	@intor1
	bl printnum	@printtheASCIIcodeof
	@thefirstcharacter
	mov r7,#1
	svc #0
.data
fmt: .asciz”%d\n”
input: .space100
