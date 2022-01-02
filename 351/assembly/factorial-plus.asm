	.globl factorialPlus
	.text

	addi $a0, $0, 1
	jal factorialPlus

	addi $v0, $0, 10
	syscall


factorialPlus:
	and $v0 $v0 $0 #zero out v0
	addi $sp, $sp, -8 #allocate space for 2 reg
	sw $ra, 0($sp) #save original jump location
	sw $a0, 4($sp) #save original s0
	jal factorial #jal to factorial if it exists, and receive it in our a0
	lw $t0, 4($sp) #load og a0 into temp register
	add $v0 $a0 $t0 #add factorial's a and our old a
	lw $ra, 0($sp) #load og jump loc
	addi $sp, $sp, 8 #deallocate
	jr $ra #return