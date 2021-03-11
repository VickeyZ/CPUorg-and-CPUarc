Begin:
    # Reg[1-5]: Used to record data
    addi	$1,     $0,     123 		# $1 = 123  Data
    addi	$2,     $1,     111 		# $2 = 234  Data
    addi	$3,     $2,     111 		# $3 = 345  Data
    addi	$4,     $3,     111 		# $4 = 456  Data
    addi	$5,     $4,     111 		# $5 = 567  Data
    # Reg[6-10]: Used to store test address
    addi	$6,     $0,     0x0 		
    addi	$7,     $0,     0x4 		
    addi	$8,     $0,     0x94 		
    addi	$9,     $0,     0x98
    addi	$10,    $0,     0x404
    # Reg[20]: Used to record score
    addi	$20,    $0,     0			# $20 = 0   
Test_Hit:
    sw		$1,     0($6)		        # &(0x0) = 123
    sw		$2,     0($7)		        # &(0x4) = 234
    lw		$11,    0($6)		        # $11 = 123
    sw		$3,     0($8)		        # &(0x94) = 345
    sw		$4,     0($9)		        # &(0x98) = 567
    lw		$13,    0($8)		        # $13 = 345
    lw		$12,    0($7)		        # $12 = 234
    lw		$14,    0($9)		        # $14 = 456
    sub		$11,    $11,    $13		    # $11 = $11 - $13 = -222
    sub		$12,    $12,    $14		    # $12 = $12 - $14 = -222
    bne		$11,    $12,    Test_Replacement    # if Not Equal: Skip $20++
    addi	$20,    $20,    1			# $20++
Test_Replacement:
    sw		$5,     0($10)		        # &(04004) = 567
    lw      $11,    0($7)               # $11 = &(0x4) = 234
    lw      $12,    0($10)              # $12 = &(0x4004) = 567
    addi    $11,    $11,    333         # $11 = $11 + 333 = 567     
    bne		$11,    $12,    Test_Dirty_Block    # if Not Equal: Skip $20++
    addi	$20,    $20,    1			# $20++
Test_Dirty_Block:
    lw      $11,    0($6)               # $11 = &(0x0) = 123
    lw      $12,    0($10)              # $12 = &(0x4004) = 567
    addi	$11,    $11,    444		    # $11 = $11 + 444 = 567
    bne		$11,    $12,    End          # if Not Equal: Skip $20++
    addi	$20,    $20,    1			# $20++
End:
    #------------Useless Loop-----------------
    addi	$21,    $0,     3			
    bne		$21,    $20,    End	
    #------------Useless Loop-----------------
    
