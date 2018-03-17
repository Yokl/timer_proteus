org 0h
	jmp start
	iM equ r5
	iS equ r6

org 30h
start:
	mov iM,#0
	mov iS,#0
	mov P2,#0
	mov P3,#0
	mov r0,#0
	mov r1,#0
	clr p1.1
	clr p1.2
	setb p1.0
loop:

	cjne r0,#0h,rr7
	cjne r1,#14h,rr7
	setb P1.1
rr7:	cjne r0,#0h,rr8
	cjne r1,#0Ah,rr8
	setb P1.2
rr8:
	call delay
	
	mov a,r0
	add a,#1h
	mov r0,a
	cjne r0,#03Ch,rr1
	mov r0,#0
	mov a,#0
	mov p2,a
	mov iS,a
	jmp rr2
rr1:	mov a,iS
	add a,#1
	da a
	mov iS,a
	mov p2,a
	jmp loop

rr2:	mov a,r1
	add a,#1h
	mov r1,a
	cjne r1,#03Ch,rr3
	mov r1,#0
	mov a,#0
	mov p3,a
	mov iM,a
	jmp loop
rr3:	mov a,iM
	add a,#1
	da a
	mov iM,a
	mov p3,a
	jmp loop	

delay:
	mov a,r2
	push acc
	mov a,r3
	push acc
	mov a,r4
	push acc
	mov r2,#8    ;49
M1:	mov r3,#10   ;100
M2:	mov r4,#100
M3:	djnz r4,M3
	jnb P1.0, M4
	djnz r3,M2
	djnz r2,M1
	pop acc
	mov r4,acc
	pop acc
	mov r3,acc
	pop acc
	mov r2,acc
	jmp M5
M4:	mov iM,#0
	mov iS,#0
	mov P2,#0
	mov P3,#0
	mov r0,#0
	mov r1,#0
	clr P1.2
	pop acc
	mov r4,acc
	pop acc
	mov r3,acc
	pop acc
	mov r2,acc
M5:	ret
END