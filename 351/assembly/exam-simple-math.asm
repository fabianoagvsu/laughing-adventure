.globl do_math

.text

addi $a0, $0, 1		# $a0 and $a1 are used to store function arguments
addi $a1, $0, 1
addi $a2, $0, 1
addi $a3, $0, 1
jal do_math

do_math:
	andi $v0, $v0 0
	add $a0, $a0, $a1 #add a and b, store in a
	sub $a2, $a2, $a3 #subtract d from c, store in c
	sub $v0, $a0, $a2 #subtract c from a, store in return
    	jr $ra
