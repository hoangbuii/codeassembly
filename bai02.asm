.data 
	st_a: .asciiz "Nhap a:"
	st_b: .asciiz  "\nNhap b:"
	st_vn: .asciiz "Phuong trinh vo ngiem."
	st_vsn: .asciiz "Phuong trinh vo so nghiem."
	st_cn: .asciiz  "Phuong trinh co nghiem: x = "
	minus_1: .float -1
.text 
	#Hien loi nhac nhap a
	la $a0, st_a
	li $v0, 4
	syscall
	#Nhap vao a luu vao $f1
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	#Hien loi nhac nhap b
	la $a0, st_b
	li $v0, 4
	syscall
	#Nhap vao b luu vao $f2
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	#set f3 = 0, f4 = 1
	l.s $f4, minus_1 
	li $t2, 0
	mtc1 $t1, $f3
	
	
	#if a==0
	c.eq.s $f1, $f3
	bc1t A_0
	#a != 0
	li $v0, 4
	la $a0, st_cn
	syscall
	mul.s $f5, $f2, $f4
	div.s $f12,$f5, $f1
	li $v0, 2
	syscall
	j EXIT
	#a == 0
A_0:
	#if b == 0
	c.eq.s $f2, $f3
	bc1t B_0
	#b!=0
	li $v0, 4
	la $a0, st_vn
	syscall
	j EXIT
	#b == 0;
	B_0:
	li $v0, 4
	la $a0, st_vsn
	syscall
	
EXIT:	li $v0, 10
	syscall
	
			
					