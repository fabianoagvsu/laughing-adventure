	.globl monkeyTrouble sleepIn posNeg
	.text

# You can use these lines to run your program directly in MARS for
# troubleshooting. Change the values of $a0 and $a1 to try out your
# function with different arguments.
# As the code is written now, it will run all three functions. You can
# comment out a `jal` call if you do not want the function to run.
# ----------------------------------------------------------------------------
	addi $a0, $0, 1		# $a0 and $a1 are used to store function arguments
	addi $a1, $0, 1
	jal monkeyTrouble	# functions are called using `jal`

	addi $a0, $0, 1
	addi $a1, $0, 1
	jal sleepIn

	addi $a0, $0, 1
	addi $a1, $0, 1
	jal posNeg

	addi $v0, $0, 10	# syscall calls the operating system to perform various tasks
	syscall			# It looks in $v0 to determine what to do
				# In the case of $v0 == 10, syscall exits the program
				# Without this, MARS would keep running with the next line
				# of code
# ----------------------------------------------------------------------------
#
# Lines below here are where you will write your functions.
#
monkeyTrouble:
	and $t0, $a0, $a1 # a and b
	nor $t1, $a0, $a1 # (!a and !b)
	andi $t1, $t1, 1
	or  $v0, $t0, $t1 # (a and b) or (!a and !b)
	jr $ra

sleepIn:

	not $a0, $a0
	andi $a0, $a0, 1
	or $v0, $a0, $a1
	jr $ra

posNeg:
	slt $t0, $a0, $zero # 1 if a0 < 0
	slt $t1, $a1, $zero  # 1 is a1 > 0
	
	xor $t4, $t0, $t1 #if only t0 or t1 is true than t4 is true
	not $s1, $a2 # just flippin the negative and storing to one
	andi $s1, $s1, 1
	and $t4, $t4, $s1 # if t4 is true and negative is false 
	
	and $t2, $t0, $a2 #t0 is negative and negative is true
	and $t3, $t1, $a2 #t1 is negative and negative is true
	and $t2, $t2, $t3 #if both t2 and t3 are true
	
	or $v0, $t4, $t2 #if either t4 or t2 is true
	
	
	jr $ra
