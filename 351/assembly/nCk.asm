	.globl nCk
	.text
	
	addi $a0, $0, 5 #n
	addi $a1, $0, 3 #k
	jal nCk 
	
	#addi $v0, $0, 10	# syscall calls the operating system to perform various tasks
	syscall			# It looks in $v0 to determine what to do
				# In the case of $v0 == 10, syscall exits the program
				# Without this, MARS would keep running with the next line
				# of code				
				# n choose k = (n-1 choose k) + (n-1 choose k-1)
				
nCk: 
	addi $sp, $sp, -16 #this is for taking ra into a stack for data save
	sw $s0, 4($sp) #save original s0
	sw $s1, 8($sp) #save og s1
	sw $s2, 12($sp) #save og s2
	sw $ra, 0($sp) #save original jump location
	
	
	#this is constant values
	add $s0, $0, $a0 #storing original value of a0 in s0
	add $s1, $0, $a1 #store a1 in s1
	and $s2, $s2, 0 #empty s2 for storage of return
	and $v0, $v0, 0 #empty v0
	addi $t1, $0, 1 #temp 1
	
	slt $t0, $a0, $a1 #t0 is 1 if n < k
	beq $t0, $t1, negative #if n < k, return -1
	slti $t0, $a1, 0 #if k is neg
	beq $t0, $t1, negative
	slti $t0, $a0, 0 #or n is neg
	beq $t0, $t1, negative #return -1
	beq $t1, $a1, lessthan #checking to see if a1 = 1 
	beq $a1, $0, choose1 #if k==0, end case v0 = 1
	beq $a0, $a1, choose1  #if n==k, end case v0 = 1
	#beq $a1 $t1 lessthan  #if k is 1, return 1
	
	subi $a0, $a0, 1 #decrement n
	jal nCk #loop
	add $s2 $v0 $0
	#addi $v0, $v0, 1 #increment v0
	#add $v0, $a0, $v0 #n-1
	#add $v0, $a1, $v0 #k
	#somewhere around here it goes wrong
	and $a0, $a0, $0
	and $a1, $a1, $0
	add $a0 $s0 $0
	add $a1 $s1 $0
	subi $a1, $a1, 1 #k-1
	subi $a0, $a0, 1 #decrement n
	jal nCk #loop part 2
	add $v0 $s2 $v0
	lw $ra, 0($sp) #load og jump loc
	lw $s0, 4($sp) #load og s0
	lw $s1 8($sp) #load s1
	lw $s2 12($sp) #load s2
	addi $sp, $sp, 16 #deallocate
	jr $ra
	#addi $v0, $v0, 1 #increment v0
	#add $v0, $a0, $v0 #n-1
	#add $v0, $a1, $v0 #k-1
	
#foo(a-1,b) + foo(a-1,b-1)
#subi a0 a0 1
#jal foo
#subi a1 a1 1
#add s2 v0 0
#jal foo
#add v0 s2 v0
choose1:
	addi $v0, $v0, 1 #add 1 to v
	lw $ra, 0($sp) #load og jump loc
	lw $s0, 4($sp) #load og s0
	lw $s1 8($sp) #load s1
	lw $s2 12($sp) #load s2
	addi $sp, $sp, 16 #deallocate
	jr $ra #return	
	
lessthan: 
	add $v0, $v0, $a0 #add a0 contents to v
	lw $ra, 0($sp) #load og jump loc
	lw $s0, 4($sp) #load og s0
	lw $s1 8($sp) #load s1
	lw $s2 12($sp) #load s2
	addi $sp, $sp, 16 #deallocate
	jr $ra #return
		
negative: 
	addi $v0, $v0, -1 #same thing as less than, except neg
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1 8($sp) #load s1
	lw $s2 12($sp) #load s2
	addi $sp, $sp, 16
	jr $ra
