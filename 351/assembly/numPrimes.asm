	.globl numPrimes
	.text

	addi $a0, $0, 1 #array
	addi $a1, $0, 1 #array size
	jal numPrimes

	syscall


numPrimes:
	and $v0 $v0 $0 #zero out v0
	addi $sp, $sp, -12 #allocate space for 3 reg
	sw $ra, 0($sp) #save original jump location
	sw $a0, 4($sp) #save original v0, because isprime overwrites it ( really dont know where isprime puts its 1 or 
	sw $s0, 8($sp) #save s0, cus we overwrite it
	and $s0 $s0 $0 #zero out for use as loop counter
	
loop:
	lw $a0, 4($sp) #load original a0
	beq $s0 $a1 done #if counter is at end of array, break
	addi $s0 $s0 1 #increment counter by 1
	jal isPrime #jal to factorial if it exists, and receive it in our a0
	beqz $a0 noInc #if the return value of a0 is 0, no prime was found, do not increment
	addi $v0 $v0 1 #increment return value if a prime was found
noInc:
	j loop
done:
	lw $ra, 0($sp) #load original jump location
	lw $s0, 8($sp) #load original s0
	addi $sp, $sp, 12 #deallocate
	jr $ra
	
	#