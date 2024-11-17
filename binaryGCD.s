#######################################################################
#  Filename     : binaryGCD.s
#  Architecture : MIPS Assembly
#  Author       : R. Harrison
#  Description  : Assembly version of greated common denomiator solver
#

.globl main
.data
.text

main:
	and		$a0, $0, $0									# $a0 = $0 & $0
	and		$a1, $0, $0									# $a1 = $0 & $0

	ori		$a0, $0, 12									# $a0 = $0 | 12
	ori		$a1, $0, 780								# $a1 = $0 | 780
	jal		binaryGCD									# jump to binaryGCD and save position to $ra, gcd(12, 780)
	move 	$s1, $v0									# $s1 = $v0, 12

	and		$a0, $0, $0									# $a0 = $0 & $0
	and		$a1, $0, $0									# $a1 = $0 & $0

	ori		$a0, $0, 780								# $a0 = $0 | 780
	ori		$a1, $0, 12									# $a1 = $0 | 12
	jal		binaryGCD									# jump to binaryGCD and save position to $ra, gcd(780, 12)
	move 	$s2, $v0									# $s2 = $v0, 12

	and		$a0, $0, $0									# $a0 = $0 & $0
	and		$a1, $0, $0									# $a1 = $0 & $0

	ori		$a0, $0, 2048								# $a0 = $0 | 2048
	ori		$a1, $0, 16384								# $a1 = $0 | 16384
	jal		binaryGCD									# jump to binaryGCD and save position to $ra, gcd(2048, 16384)
	move 	$s3, $v0									# $s3 = $v0, 2048

	and		$a0, $0, $0									# $a0 = $0 & $0
	and		$a1, $0, $0									# $a1 = $0 & $0

	lui    	$a0, 0x1DCD        							# Load upper 16 bits (0x1DCD) into $t0
	ori    	$a0, $a0, 0x794F  							# Combine with lower 16 bits (0x794F)
	ori		$a1, $0, 709								# $a1 = $0 | 709
	jal		binaryGCD									# jump to binaryGCD and save position to $ra, gcd(500005199, 709)
	move 	$s4, $v0									# $s4 = $v0, 1

	and		$a0, $0, $0									# $a0 = $0 & $0
	and		$a1, $0, $0									# $a1 = $0 & $0

	lui    	$a0, 0x0008        							# Load upper 16 bits (0x0008) into $t0
	ori    	$a0, $a0, 0x75A0  							# Combine with lower 16 bits (0x75A0)
	lui    	$a1, 0x0009        							# Load upper 16 bits (0x0009) into $t0
	ori    	$a1, $a1, 0xFF60  							# Combine with lower 16 bits (0xFF60)
	jal		binaryGCD									# jump to binaryGCD and save position to $ra, gcd(554400, 655200)
	move 	$s5, $v0									# $s5 = $v0, 50400

	and		$a0, $0, $0									# $a0 = $0 & $0
	and		$a1, $0, $0									# $a1 = $0 & $0

	lui    	$a0, 0x0010        							# Load upper 16 bits (0x0010) into $t0
	ori    	$a0, $a0, 0x0000  							# Combine with lower 16 bits (0x0000)
	lui    	$a1, 0x0002        							# Load upper 16 bits (0x0002) into $t0
	ori    	$a1, $a1, 0x0000  							# Combine with lower 16 bits (0x0000)
	jal		binaryGCD									# jump to binaryGCD and save position to $ra, gcd(1048576, 131072)
	move 	$s6, $v0									# $s6 = $v0, 131072

	and		$a0, $0, $0									# $a0 = $0 & $0
	and		$a1, $0, $0									# $a1 = $0 & $0

	ori		$a0, $0, 0									# $a0 = $0 | 0
	ori		$a1, $0, 12345								# $a1 = $0 | 12345
	jal		binaryGCD									# jump to binaryGCD and save position to $ra, gcd(0, 12345)
	move 	$s7, $v0									# $s7 = $v0, 12345

	ori 	$v0, $0, 10
	syscall
binaryGCD:
	beq		$a0, $0, binaryGCD_edgeCase1				# if $a0 == $0 then goto binaryGCD_edgeCase1
	beq		$a1, $0, binaryGCD_edgeCase2				# if $a0 == $0 then goto binaryGCD_edgeCase2
	move 	$t0, $a0									# $t0 = a0 (a)
	move 	$t1, $a1									# $t1 = a1 (b)

	and		$t2, $0, $0									# $t2 = $0 & $0
binaryGCD_forLoopStart:		
	addi	$t2, $t2, 1									# $t2 = $t2 + 1 (++k)
	or		$t3, $t0, $t1								# $t3 = $t1 | $t2
	andi	$t3, $t3, 1									# $t3 = $t3 & 1
	bne		$t3, $0, binaryGCD_whileLoopBegin			# if $t3 != $0 then goto binaryGCD_whileLoopBegin

	srl		$t0, $t0, 1									# $t0 = $t0 >> 1 (a >>= 1)
	srl		$t1, $t1, 1									# $t1 = $t1 >> 1 (b >>= 1)
	beq		$0, $0, binaryGCD_forLoopStart				# if $0 == $0 then goto binaryGCD_forLoopStart (jump replacemnt)
binaryGCD_whileLoopBegin:			
	andi	$t3, $t0, 1									# $t3 = $t0 & 1
	bne		$t3, $0, binaryGCD_nested_whileLoopBegin	# if $t3 != $0 then goto binaryGCD_nested_whileLoopBegin (skip the initial check for while loop)

	srl		$t0, $t0, 1									# $t0 = $t0 >> 1 (a >>= 1)
	beq		$0, $0, binaryGCD_whileLoopBegin			# if $0 == $0 then goto binaryGCD_whileLoopBegin (jump replacemnt)
binaryGCD_doWhileBegin:	
	beq		$t1, $0, binaryGCD_sllWhileLoopBegin		# if $t1 == $0 then goto binaryGCD_sllWhileLoopBegin (jump replacemnt) (b != 0)
binaryGCD_nested_whileLoopBegin:		
	andi	$t3, $t1, 1									# $t3 = $t1 & 1 (b & 1)
	bne		$t3, $0, binaryGCD_nested_continue1			# if $t3 != $0 then goto binaryGCD_nested_continue1

	srl		$t1, $t1, 1									# $t1 = $t1 >> 1 (b >>= 1)
	beq		$0, $0, binaryGCD_nested_whileLoopBegin		# if $0 == $0 then goto binaryGCD_whileLoopBegin (jump replacemnt)
binaryGCD_nested_continue1:		
	slt		$t3, $t1, $t0								# $t3 = ($t1 < $t0) ? 1 : 0 (b < a)
	or		$t4, $0, $0									# $t4 = $0 | 1
	beq		$t3, $t4, binaryGCD_nested_continue2		# if $t3 == $t4 then goto target (b < a) == false

	move 	$t4, $t0									# $t4 = $0 (temp = a)
	move 	$t0, $t1									# $t0 = $t1 (a = b)
	move 	$t1, $t4									# $t1 = $t4 (b = temp (a))
binaryGCD_nested_continue2:
	sub		$t1, $t1, $t0								# $t1 = $t1 - $t0 (b = b - a)
	
	beq		$0, $0, binaryGCD_doWhileBegin				# if $0 == $0 then goto binaryGCD_doWhileBegin (jump replacemnt)
binaryGCD_sllWhileLoopBegin:
	addi	$t2, $t2, -1								# $t2 = $t2 - 1
	beq		$t2, $0, binaryGCD_return					# if $t2 == $0 then goto binaryGCD_return
	
	sll		$t0, $t0, 1									# $t0 = $t0 << 1 (a <<= 1)
	beq		$0, $0, binaryGCD_sllWhileLoopBegin			# if $0 == $0 then goto binaryGCD_sllWhileLoopBegin (jump replacemnt)
binaryGCD_return:
	move 	$v0, $t0									# $v0 = $t0 ( v0 = (a << k))
	jr		$ra											# jump to $ra
binaryGCD_edgeCase1:						
	move 	$v0, $a1									# $v0 = a1
	jr		$ra											# jump to $ra
binaryGCD_edgeCase2:						
	move 	$v0, $a0									# $v0 = a0
	jr		$ra											# jump to $ra
	