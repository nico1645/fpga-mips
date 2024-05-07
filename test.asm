abs_diff_color:                         # abs_diff_color
        lw $s4, 0($sp)		# Loading argument 4
        lw $s5, 4($sp)		# Loading argument 5
        addi   $sp, $sp, -4	# Pushing $ra into stack
        sw      $ra, 4($sp)
        move $s7, $zero		# Variable for summing persistent between function calls
        move $s0, $a0		# Persist between function call
        move $s1, $a1		# Persist between function call
        move $s2, $a2		# Persist between function call
        move $s3, $a3		# Persist between function call
       
       	sub $a0, $s0, $s3	# Sub R1 - R2
        jal abs			# Abs of $a0 stored in $v0
        add $s7, $s7, $v0	# Adding abs(R1-R2) to the total sum
        
        sub $a0, $s1, $s4	# Sub G1 - G2
        jal abs			# Abs of $a0 stored in $v0
        add $s7, $s7, $v0	# Adding abs(G1-G2) to the total sum
        
        sub $a0, $s2, $s5	# Sub B1 - B2
        jal abs			# Abs of $a0 stored in $v0
        add $s7, $s7, $v0	# Adding abs(B1-B2) to the total sum
        
        move $v0, $s7		# Set $v0 to the contents of $s7
        lw	$ra, 4($sp)	# Retrieve $ra from stack
        addi   $sp, $sp, 24
        jr      $ra
abs:
	sra $t0,$a0,31    # Filled with 0xFFFFFFF if negative else 0x0000000
	xor $v0,$a0,$t0   # Flipping bits if negative number
	sub $v0,$v0,$t0   # Subtracting 1 if it is negative complement
	jr $ra
main:                                   # Assuming function is called with the following  arguments abs_diff_color(1,2,3,4,5,6)
        addi   $sp, $sp, -8		# Space for the the last two arguments passed via stack
        addi   $t1, $zero, 6
        sw      $t1, 0($sp)
        addi   $t1, $zero, 5
        sw      $t1, 4($sp)
        addi   $4, $zero, 1
        addi   $5, $zero, 2
        addi   $6, $zero, 3
        addi   $7, $zero, 4
        jal     abs_diff_color
        addi   $sp, $sp, 8
