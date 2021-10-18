.data
	arr: .space 1000
	numberOfItems: .word 0
	st_sum: .asciiz "Tong la: "
.text
	jal init
	
	jal show
	
	li $v0, 4
	la $a0, st_sum
	syscall
	jal sum
	mtc1 $v0, $f12
	li $v0, 2
	syscall
	
	li $v0, 10
	syscall
init:
	.data
		st_1: .asciiz "Nhap so phan tu: "
		st_2: .asciiz "\nNhap phan tu thu "
		st_3: .asciiz ": "
	.text
		#Nhap so phan tu cua mang
		li $v0, 4
		la $a0, st_1
		syscall
		li $v0, 5
		syscall
		sw $v0, numberOfItems
		move $t0, $v0
		#Nhap tung phan tu
		la $t1, arr
		move $t2, $zero
	LOOP_INIT:	
		beq $t2, $t0, EXIT_INIT
		li $v0, 4
		la $a0, st_2
		syscall
		li $v0, 1
		move $a0, $t2
		syscall
		li $v0, 4
		la $a0, st_3
		syscall
		li $v0, 6
		syscall
		sll $t4, $t2, 2
		add $t3, $t1, $t4
		s.s $f0, 0($t3)
		addi $t2, $t2, 1
		j LOOP_INIT 
	EXIT_INIT:	
		jr $ra
show:
	.data
		st: .asciiz "\n"
	.text
		lw $t0, numberOfItems
		move $t2, $zero
		la $t1, arr
	LOOP_SHOW:
		beq $t0, $t2, EXIT_SHOW
		sll $t4, $t2, 2
		add $t3, $t1, $t4
		l.s $f12, 0($t3)
		li $v0, 2
		syscall
		li $v0, 4
		la $a0, st
		syscall
		addi $t2, $t2, 1
		j LOOP_SHOW
	EXIT_SHOW:
		jr $ra
		
sum:
	.data
	.text
		lw $t0, numberOfItems
		move $t2, $zero
		la $t1, arr
		move $t5, $zero
		mtc1 $t5, $f1
	LOOP_SUM:
		beq $t0, $t2, EXIT_SUM
		sll $t4, $t2, 2
		add $t3, $t1, $t4
		l.s $f12, 0($t3)
		add.s $f1, $f1, $f2
		addi $t2, $t2, 1
		j LOOP_SUM
	EXIT_SUM:
		mfc1 $v0, $f1 
		jr $ra
	