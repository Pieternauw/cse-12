maxIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0: heap memory pointer to actual  location of the record stock name in the file buffer

	#if empty file, return 0 for both a0, a1
	bnez a1, maxIncome_fileNotEmpty # maxIncome Function
	li a0, 0
	ret

 maxIncome_fileNotEmpty:
	# Start your coding from here!
	li t0, 0
 	mv a6, a1
 	addi a0, a0, 4	#t0 saves pointer to number location
 	sd ra, 0(sp)
 	max_income_loop:
 		bge a5, a6, return_max
 		addi a5, a5, 1
 		mv a4, a0
 		jal income_from_record
 		bgt a0, t0, new_max_stock
 		addi a4, a4, 8
 		mv a0, a4
 		b max_income_loop
 	new_max_stock:
 		mv t0, a0
 		addi a4, a4, -4
 		mv t2, a4
 		addi a4, a4, 12
 		mv a0, a4
 		b max_income_loop
 	return_max:
 		ld ra 0(sp)
 		mv a0, t2
# End your  coding  here!
	
	ret
#######################end of maxIncome###############################################
