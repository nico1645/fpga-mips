### Aanjhan Ranganathan <raanjhan@inf.ethz.ch>
### For Lab 8 Digital Technik 
### 2014

###   I/O addresses Reference
###  compatible to the compact modelling
###  0x00007FF0   LED output
###  0x00007FF4	  SPEED input

.data
pattern: .word 0x00200000,0x00004000,0x00000080,0x00000001,0x00000002,0x00000004,0x00000008,0x00000400,0x00020000,0x01000000,0x02000000,0x04000000
loopcnt: .word 0x001e8484
s3: .word 0x001e8484
s4: .word 0x002625A4
s2: .word 0x0016E364
s1: .word 0x000F4244

.text
   # lw $t3, loopcnt    # initialize a  large loopcounter (so that the snake does not crawl SUPERFAST)
   addi $t5,$0,48       # initialize the length of the display pattern (in bytes)
   
restart:   
   addi $t4,$0,0

forward:
   beq $t5,$t4, restart
   lw $t0,0($t4)
   sw  $t0, 0x7ff0($0) # send the value to the display
   
   addi $t4, $t4, 4 # increment to the next address
   addi $t2, $0, 0 # clear $t2 counter

wait:
   lw $t6, 0x7ff4($0)
   addi $t7, $0, 0
   beq $t6, $t7, speed1
   beq $t6, $t7, speed2
   beq $t6, $t7, speed3
   beq $t6, $t7, speed4
   beq $t2,$t3,forward	
   addi  $t2, $t2, 1     # increment counter
   j wait
speed1:
   addi $t7, $t7, 1
   lw $t1, s1
   addi $t3, $t1, 0
   j wait
speed2:
   addi $t7, $t7, 1
   lw $t1, s2
   addi $t3, $t1, 0
   j wait
speed3:
   addi $t7, $t7, 1
   lw $t1, s3
   addi $t3, $t1, 0
   j wait
speed4:
   addi $t7, $t7, 1
   lw $t1, s4
   addi $t3, $t1, 0
   j wait
   