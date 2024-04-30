abs:                                    # @abs
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	sra	$1, $4, 31
	xor	$2, $4, $1
	subu	$2, $2, $1
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 8
abs_diff:                               # @abs_diff
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	subu	$1, $4, $5
	sra	$2, $1, 31
	xor	$1, $1, $2
	subu	$2, $1, $2
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 8
recursive_sum:                          # @recursive_sum
# %bb.0:
	beqz	$5, $BB2_2
	nop
# %bb.1:
	addiu	$sp, $sp, -32
	sw	$ra, 28($sp)                    # 4-byte Folded Spill
	sw	$fp, 24($sp)                    # 4-byte Folded Spill
	sw	$17, 20($sp)                    # 4-byte Folded Spill
	sw	$16, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addiu	$17, $5, -1
	move	$16, $4
	jal	recursive_sum
	move	$5, $17
	sll	$1, $17, 2
	addu	$1, $16, $1
	lw	$1, 0($1)
	addu	$2, $1, $2
	move	$sp, $fp
	lw	$16, 16($sp)                    # 4-byte Folded Reload
	lw	$17, 20($sp)                    # 4-byte Folded Reload
	lw	$fp, 24($sp)                    # 4-byte Folded Reload
	lw	$ra, 28($sp)                    # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 32
$BB2_2:
	jr	$ra
	addiu	$2, $zero, 0
main:                                   # @main
# %bb.0:
	addiu	$sp, $sp, -64
	sw	$ra, 60($sp)                    # 4-byte Folded Spill
	sw	$fp, 56($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addiu	$1, $zero, 1
	addiu	$4, $fp, 20
	addiu	$5, $zero, 9
	sw	$1, 52($fp)
	sw	$1, 48($fp)
	sw	$1, 44($fp)
	sw	$1, 40($fp)
	sw	$1, 36($fp)
	sw	$1, 32($fp)
	sw	$1, 28($fp)
	sw	$1, 24($fp)
	jal	recursive_sum
	sw	$1, 20($fp)
	addiu	$2, $zero, 0
	move	$sp, $fp
	lw	$fp, 56($sp)                    # 4-byte Folded Reload
	lw	$ra, 60($sp)                    # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 64
