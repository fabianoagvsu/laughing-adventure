	.globl makes10 intMax close10 dateFashion
	.text
	
# ----------------------------------------------------------------------------
	addi $a0, $0, 1		# $a0 and $a1 are used to store function arguments
	addi $a1, $0, 1
	jal makes10	# functions are called using `jal`

	addi $a0, $0, 1
	addi $a1, $0, 1
	addi $a2, $0, 1
	jal intMax

	addi $a0, $0, 1
	addi $a1, $0, 1
	jal close10

	addi $a0, $0, 1
	addi $a1, $0, 1
	jal dateFashion

	addi $v0, $0, 10	# syscall calls the operating system to perform various tasks
	syscall			# It looks in $v0 to determine what to do
				# In the case of $v0 == 10, syscall exits the program
				# Without this, MARS would keep running with the next line
				# of code
# ------------------------------------------
	
makes10:
	addi $s0, $0, 1
	and $v0, $v0, $0
	addi $a2, $0, 10
	seq $t0, $a0, $a2
	seq $t1, $a1, $a2	
	or $t2, $t0, $t1
	add $t3, $a0, $a1
	seq $t5, $t3, $a2
	or $t4, $t2, $t5
	bne $t4, $s0, L1
	add $v0, $s0, $0
	jr $ra
L1:	
	jr $ra	
	
intMax:
	addi $s0, $0, 1
	and $v0, $v0, $0
	slt $t0, $a0, $a1
	beq $t0, $s0, bLarger
	#a larger
	slt $t1, $a0, $a2
	beq $t1, $s0, cLarger
	#a larger
	add $v0, $a0, $0
	jr $ra
	 
bLarger: 	
	slt $t1, $a1, $a2
	beq $t1, $s0, cLarger
	#b larger
	add $v0, $a1, $0
	jr $ra
cLarger:
	add $v0, $a2, $0
	jr $ra
	
	
close10:
	and $v0, $v0, $0
	addi $s0, $0, 1
	addi $t0 $a0 -10
	addi $t1 $a1 -10
	abs $t0, $t0
	abs $t1, $t1
	
	seq $t2, $t1, $t0
	beq $s0, $t2 equal
	
	slt $t3, $t1, $t0
	bne $s0, $t3 bSmaller
	
	add $v0, $a1, $0
	jr $ra
	
bSmaller: 
	add $v0, $a0, $0
	jr $ra
	
equal:
	jr $ra

dateFashion:
	and $v0, $v0, $0
	addi $s0, $0, 7
	addi $s1, $0, 3
	addi $s2, $0, 1
	
	slt $t0, $a0, $s1
	slt $t1, $a1, $s1
	
	or $t2, $t1, $t0
	beq $t2, $s2 two
	
	slt $t0, $s0, $a0
	slt $t1, $s0, $a1	
	
	or $t2, $t1, $t0
	beq $t2, $s2 eight
	
	addi $v0, $v0, 1
	jr $ra
two: 
	jr $ra

eight: 
	addi $v0, $v0, 2
	jr $ra
	
	#always return 0 if a0 or a1 is 2 or less
	#if a0 or a1 is 8 or greater than return 2
	#if neither return 1
	
	