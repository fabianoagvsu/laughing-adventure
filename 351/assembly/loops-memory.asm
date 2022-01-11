	.globl indexOf max sum13 sum67
	.text
	
	addi $a0, $0, 1
	addi $a1, $0, 1
	jal indexOf

	addi $a0, $0, 1
	addi $a1, $0, 1
	jal max

	addi $a0, $a0, 1
	addi $a1, $0, 1
	jal sum13
	
	addi $a0, $a0, 1
	addi $a1, $0, 1
	jal sum67
	
	addi $v0, $0, 10	# syscall calls the operating system to perform various tasks
	syscall			# It looks in $v0 to determine what to do
				# In the case of $v0 == 10, syscall exits the program
				# Without this, MARS would keep running with the next line
				# of code
				
# ------------------------------------------

indexOf:
	addi $s0, $0, 0 #s0 is 0
	and $v0, $v0, $0 #clear v0
	#addi $s1, $0, -1 # for -1
	addi $s2, $0, 1 #s2 is 1
	addi $s3, $0, 0 #counter
	addi $t6, $a1, 0
loop4:
	
	lw  $t3, ($t6) 
	addi $t6, $t6, 4
	
	slti $t4, $t3, 0
	beq $t4, $s2, uniqueDone
	seq $t5, $a0, $t3
	beq $t5, $s2, tbd
	addi $s3, $s3, 1
	addi $s0, $s0, 1
	j loop4

uniqueDone:
	addi $v0, $v0, -1
	jr $ra
tbd:
	add $v0, $s3, $0
	j done
#end of index of
max: 
	addi $s0, $0, 0 # i = 0
	#and $v0, $v0, $0 #v0 is max
	addi $v0, $0, -40000
	addi $s2, $0, 1 #hard coded one
maxloop: 
	slt $t2, $s0, $a1 
	beq $t2, $0, done
	sll $t2, $s0, 2 
	add $t2, $t2, $a0
	lw $t3, 0($t2)
	sge $t4, $t3, $v0
	beq $t4, $s2 secondmax

fin:
	addi $s0, $s0, 1
	j maxloop

secondmax:
	and $v0, $v0, $0
	add $v0, $t3, $0
	j fin
	
doneTwo: 
	jr $ra	


sum13: 
	addi $s0, $0, 0 # i = 0
	addi $s2, $0, 13 # x = 13
	and $v0, $v0, $0 
	addi $s1, $0, 1 #a check to 1
	addi $s3, $0, 0 #is our flip
loop3: 
	slt $t2, $s0, $a1 
	beq $t2, $0, done
	sll $t2, $s0, 2 
	add $t2, $t2, $a0
	lw $t3, 0($t2)
	
	seq $t4, $s2, $t3
	beq $t4, $s1, found13
	seq $t5, $t4, $s3 #t5 is true if previous value is not 13
	bne $t5, $s1 set13
	add $v0, $t3, $v0
	
fin13: 
	addi $s0, $s0, 1
	j loop3

set13: 
	and $s3, $s3, $0
	j fin13

found13: 
	addi $s3, $s3, 1
	j fin13
	
	
	

sum67: 
	addi $s0, $0, 0 # i = 0
	addi $t0, $0, 6 # x = 6
	addi $t1, $0, 7 # y = 7
	addi $t5, $0, 0 # found 6
	addi $t6, $0, 1 # a 1 to check 
	and $v0, $v0, $0
loop:
	slt $t2, $s0, $a1 
	beq $t2, $0, done
	sll $t2, $s0, 2 
	add $t2, $t2, $a0
	lw $t3, 0($t2)
	seq $t4, $t3, $t0
	beq $t4, $t6, setSix
	seq $t7, $t1, $t3
	and $t8, $t5, $t7
	beq $t8, $t6 seven
	beq $t5, $t6 six
	add $v0, $t3, $v0
	
six: 
	addi $s0, $s0, 1
	j loop
	
seven: 
	and $t5, $t5, $0
	j six
	

setSix:
	addi $t5, $t4, 0
	j six

done: 
	jr $ra	
	
