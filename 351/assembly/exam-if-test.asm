.globl if_test

.text

addi $a0, $0, 1		# $a0 and $a1 are used to store function arguments
addi $a1, $0, 1

if_test:
	andi $v0, $v0 0
	addi $t2, $0, 1 #temp 1
	addi $t0, $a0, 2 #t0 is a temp for a+2
	slt $t1, $t0, $a1 #if a+2 is less than b, t1 is 1
	beq $t1, $t2 else #if a+2 < b = 1, beq 1 = 1, branch to else
	addi $t3, $a0, 3 #use a t3 as temp
	j ret #should jump to ret
	
else: #if a+2 is less than b, temp = b*2
	sll $t3, $a1, 1 #shifting left 1 should multiply by 2
	
ret: #in either case, return b-temp
	sub $v0, $a1, $t3 #store b-temp in return
    	jr $ra