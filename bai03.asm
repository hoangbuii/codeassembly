.data
	st_a: .asciiz "Nhap a:"
	st_b: .asciiz "\nNhap b:"
	st_kq: .asciiz  "USCLN la:"
.text
	#Nhap a
	la $a0, st_a
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Nhap b
	la $a0, st_b
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	
LOOP:	beq $t1, $t2, EXIT
	slt $t0, $t1, $t2
	beq $t0, $zero, AGB
	sub $t2, $t2, $t1
	j LOOP
AGB:	sub $t1, $t1, $t2
	j LOOP
EXIT:	la $a0, st_kq
	li $v0, 4
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 10
	syscall