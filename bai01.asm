.data
	st_1: .asciiz "Nhap mot so nguyen:"
	st_2: .asciiz "So vua duoc nhap la:"
	st_3: .asciiz "\nNhap mot so thuc:"
.text
	#Hien loi nhac nhap so nguyen
	la $a0, st_1
	li $v0, 4
	syscall
	#Nhap so nguyen va luu vao s0
	li $v0, 5
	syscall
	move $s0, $v0
	#Hien thong bao da nhap
	la $a0, st_2
	li $v0, 4
	syscall
	#In so nguyen
	li $v0, 1
	move $a0, $s0
	syscall
	
	#Hien loi nhac nhap so thuc
	la $a0, st_3
	li $v0, 4
	syscall
	#Nhap so nguyen va luu vao s0
	li $v0, 6
	syscall
	#Hien thong bao da nhap
	la $a0, st_2
	li $v0, 4
	syscall
	#In so thuc
	li $v0, 2
	mov.s $f12, $f0
	syscall
	
	#Ket thuc
	li $v0, 10
	syscall
	
