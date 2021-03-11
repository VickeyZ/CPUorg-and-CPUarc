# mips
initial:
    lui     	$6, 0x666           	# $6 = 0x06660000
    addi	$1, $0, 2		# $1 = $0 + 2 = 2
    nop
    nop
    nop
    nop
    addi	$2, $1, 14		# $2 = $1 + 14 = 16
    sw		$1, 8($2)		# store 2 to address 24
l1:
    ori     	$3, $1, 4           	# $3 = $1 | 4 = 6
    sll     	$1, $1, 4           	# $1 = $1 << 4 = 32
    nop
    nop
    nop
    nop
    lw		$4, -8($1)		# $4 = *(32-8) = *24 = 2
    sra     	$1, $1, 1           	# $1 = $1 >> 1 = 16
    nop
    nop
    nop
    nop
    beq		$1, $2, l2	        # if $1 == $2 then go to l2
    nop
    nop
    nop
    nop
    addi	$6, $6, -1		# $6 = $6 - 1
l2:
    addi	$1, $0, 2		# $1 = $0 + 2 = 2
    nop
    nop
    nop
    nop
    bne		$4, $1, l1	        # if $1 == $4 then go to l1  
    nop
    nop
    nop
    nop
exit:
    add		$7, $2, $2		# $7 = $2 + $2 = 32


# If finally $7 = 32 and $6 = 0x06660000, your CPU will be considered to be well done!