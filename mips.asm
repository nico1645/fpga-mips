	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.text
	.file	"test.c"
	.globl	abs                             # -- Begin function abs
	.p2align	2
	.type	abs,@function
	.set	nomicromips
	.set	nomips16
	.ent	abs
abs:                                    # @abs
	.frame	$fp,16,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -16
	sw	$ra, 12($sp)                    # 4-byte Folded Spill
	sw	$fp, 8($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	sw	$4, 4($fp)
	lw	$1, 4($fp)
	blez	$1, $BB0_3
	nop
# %bb.1:
	j	$BB0_2
	nop
$BB0_2:
	lw	$1, 4($fp)
	sw	$1, 0($fp)                      # 4-byte Folded Spill
	j	$BB0_4
	nop
$BB0_3:
	lw	$1, 4($fp)
	addiu	$2, $zero, 0
	negu	$1, $1
	sw	$1, 0($fp)                      # 4-byte Folded Spill
	j	$BB0_4
	nop
$BB0_4:
	lw	$2, 0($fp)                      # 4-byte Folded Reload
	move	$sp, $fp
	lw	$fp, 8($sp)                     # 4-byte Folded Reload
	lw	$ra, 12($sp)                    # 4-byte Folded Reload
	addiu	$sp, $sp, 16
	jr	$ra
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	abs
$func_end0:
	.size	abs, ($func_end0)-abs
                                        # -- End function
	.globl	abs_diff                        # -- Begin function abs_diff
	.p2align	2
	.type	abs_diff,@function
	.set	nomicromips
	.set	nomips16
	.ent	abs_diff
abs_diff:                               # @abs_diff
	.frame	$fp,40,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -40
	sw	$ra, 36($sp)                    # 4-byte Folded Spill
	sw	$fp, 32($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	sw	$4, 28($fp)
	sw	$5, 24($fp)
	lw	$1, 28($fp)
	lw	$2, 24($fp)
	subu	$4, $1, $2
	jal	abs
	nop
	sw	$2, 20($fp)
	lw	$2, 20($fp)
	move	$sp, $fp
	lw	$fp, 32($sp)                    # 4-byte Folded Reload
	lw	$ra, 36($sp)                    # 4-byte Folded Reload
	addiu	$sp, $sp, 40
	jr	$ra
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	abs_diff
$func_end1:
	.size	abs_diff, ($func_end1)-abs_diff
                                        # -- End function
	.globl	recursive_sum                   # -- Begin function recursive_sum
	.p2align	2
	.type	recursive_sum,@function
	.set	nomicromips
	.set	nomips16
	.ent	recursive_sum
recursive_sum:                          # @recursive_sum
	.frame	$fp,40,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -40
	sw	$ra, 36($sp)                    # 4-byte Folded Spill
	sw	$fp, 32($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	sw	$4, 24($fp)
	sw	$5, 20($fp)
	lw	$1, 20($fp)
	bnez	$1, $BB2_3
	nop
# %bb.1:
	j	$BB2_2
	nop
$BB2_2:
	sw	$zero, 28($fp)
	j	$BB2_4
	nop
$BB2_3:
	lw	$4, 24($fp)
	lw	$1, 20($fp)
	addiu	$5, $1, -1
	jal	recursive_sum
	nop
	lw	$3, 24($fp)
	lw	$1, 20($fp)
	sll	$1, $1, 2
	addu	$1, $1, $3
	lw	$1, -4($1)
	addu	$1, $2, $1
	sw	$1, 28($fp)
	j	$BB2_4
	nop
$BB2_4:
	lw	$2, 28($fp)
	move	$sp, $fp
	lw	$fp, 32($sp)                    # 4-byte Folded Reload
	lw	$ra, 36($sp)                    # 4-byte Folded Reload
	addiu	$sp, $sp, 40
	jr	$ra
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	recursive_sum
$func_end2:
	.size	recursive_sum, ($func_end2)-recursive_sum
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.frame	$fp,160,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -160
	sw	$ra, 156($sp)                   # 4-byte Folded Spill
	sw	$fp, 152($sp)                   # 4-byte Folded Spill
	move	$fp, $sp
	sw	$zero, 148($fp)
	addiu	$1, $zero, 9
	sw	$1, 108($fp)
	lui	$1, %hi($__const.main.left_image)
	addiu	$2, $1, %lo($__const.main.left_image)
	sw	$2, 20($fp)                     # 4-byte Folded Spill
	lw	$3, 32($2)
	sw	$3, 104($fp)
	lw	$3, 28($2)
	sw	$3, 100($fp)
	lw	$3, 24($2)
	sw	$3, 96($fp)
	lw	$3, 20($2)
	sw	$3, 92($fp)
	lw	$3, 16($2)
	sw	$3, 88($fp)
	lw	$3, 12($2)
	sw	$3, 84($fp)
	lw	$3, 8($2)
	sw	$3, 80($fp)
	lw	$2, 4($2)
	sw	$2, 76($fp)
	lw	$1, %lo($__const.main.left_image)($1)
	sw	$1, 72($fp)
	lui	$1, %hi($__const.main.right_image)
	addiu	$2, $1, %lo($__const.main.right_image)
	sw	$2, 24($fp)                     # 4-byte Folded Spill
	lw	$3, 32($2)
	sw	$3, 68($fp)
	lw	$3, 28($2)
	sw	$3, 64($fp)
	lw	$3, 24($2)
	sw	$3, 60($fp)
	lw	$3, 20($2)
	sw	$3, 56($fp)
	lw	$3, 16($2)
	sw	$3, 52($fp)
	lw	$3, 12($2)
	sw	$3, 48($fp)
	lw	$3, 8($2)
	sw	$3, 44($fp)
	lw	$2, 4($2)
	sw	$2, 40($fp)
	lw	$1, %lo($__const.main.right_image)($1)
	sw	$1, 36($fp)
	sw	$zero, 32($fp)
	j	$BB3_1
	nop
$BB3_1:                                 # =>This Inner Loop Header: Depth=1
	lw	$1, 32($fp)
	lw	$2, 108($fp)
	sltu	$1, $1, $2
	beqz	$1, $BB3_5
	nop
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	j	$BB3_3
	nop
$BB3_3:                                 #   in Loop: Header=BB3_1 Depth=1
	lw	$1, 32($fp)
	sll	$2, $1, 2
	addiu	$1, $fp, 72
	addu	$1, $1, $2
	lw	$4, 0($1)
	addiu	$1, $fp, 36
	addu	$1, $1, $2
	lw	$5, 0($1)
	jal	abs_diff
	nop
	lw	$1, 32($fp)
	sll	$3, $1, 2
	addiu	$1, $fp, 112
	addu	$1, $1, $3
	sw	$2, 0($1)
	j	$BB3_4
	nop
$BB3_4:                                 #   in Loop: Header=BB3_1 Depth=1
	lw	$1, 32($fp)
	addiu	$1, $1, 1
	sw	$1, 32($fp)
	j	$BB3_1
	nop
$BB3_5:
	lw	$5, 108($fp)
	addiu	$4, $fp, 112
	jal	recursive_sum
	nop
	sw	$2, 28($fp)
	addiu	$2, $zero, 0
	move	$sp, $fp
	lw	$fp, 152($sp)                   # 4-byte Folded Reload
	lw	$ra, 156($sp)                   # 4-byte Folded Reload
	addiu	$sp, $sp, 160
	jr	$ra
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	main
$func_end3:
	.size	main, ($func_end3)-main
                                        # -- End function
	.type	$__const.main.left_image,@object # @__const.main.left_image
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
$__const.main.left_image:
	.4byte	5                               # 0x5
	.4byte	16                              # 0x10
	.4byte	7                               # 0x7
	.4byte	1                               # 0x1
	.4byte	1                               # 0x1
	.4byte	13                              # 0xd
	.4byte	2                               # 0x2
	.4byte	8                               # 0x8
	.4byte	10                              # 0xa
	.size	$__const.main.left_image, 36

	.type	$__const.main.right_image,@object # @__const.main.right_image
	.p2align	2, 0x0
$__const.main.right_image:
	.4byte	4                               # 0x4
	.4byte	15                              # 0xf
	.4byte	8                               # 0x8
	.4byte	0                               # 0x0
	.4byte	2                               # 0x2
	.4byte	12                              # 0xc
	.4byte	3                               # 0x3
	.4byte	7                               # 0x7
	.4byte	11                              # 0xb
	.size	$__const.main.right_image, 36

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym abs
	.addrsig_sym abs_diff
	.addrsig_sym recursive_sum
	.text
