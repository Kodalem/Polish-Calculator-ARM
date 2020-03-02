@@@@@@@@
@Function to find the lenght of the string to later use in "readstr"
@argument:r1 - the input of the string
@returns: r2 - the lenght of the string
@@@@@@@
lengstr:
	push {r0−r1,lr}
	mov r2, #0	@0=stdinput  (terminal)
	loop:
	ldrb r0, [r1] ,#1
	cmp r0, #0
	addne r2, #1
	bne loop
	pop {r0-r1, lr}
	bx lr
@@@@@@@
@ Reading the string from the terminal
@ Using:
@ r1 = Address of the string to store the result
readstr:
	push {r0−r7,lr}
	mov r0, #0	@0=stdinput  (terminal)
	bl lengstr
	mov r7, #3	@3=”read”systemcall
	svc #0	@makethesystemcall
	pop {r0−r7,lr}
	bx lr
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@Print an integer on the screen, followed
@by a new line.(uses C-library functrion)
@ r1 = integer to be printed
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global printf
printnum:
	push {r0−r3,lr}
	ldr r0, =fmt
	bl printf
	pop {r0−r3,lr}
	bx lr
@@@@@@@@@@@@@@@
@Convert input string to the integer
@
@ r1 = integer from the string
@@@@@@@@@@@@@@@
str-to-int:
	push {r0-r3, lr}

	bl readstr
	bl



	pop {r0−r3,lr}
	bx lr
@@@@@@@@@@@@@@@
@@ Checks if the during the int to str fuction, the string is negative.
@@ argument: r1 - the string of digits used
@@ return: r11 - negativity counter
@@@@@@@@@@@@@@@
negativitychecker:
	push {r0-r2, lr}
	ldrb r2, [r1] @@ TO ADDRESS!!!
	cmp r2, #45
	moveq r11, #1
	addeq r1, #1
	pop {r0−r3,lr}
	bx lr
@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@
dummy:
	push {r0-r3, lr}


	pop {r0−r3,lr}
	bx lr
@@@@@@@@@@@@@@@


