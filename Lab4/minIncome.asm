minIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for both a0, a1
	bnez a1, minIncome_fileNotEmpty # minIncome function
	li a0, 0
	ret

 minIncome_fileNotEmpty:
 	li t2, 0
 	li a6, 0	#counter
 	addi a0, a0, 4	#t0 saves pointer to number location
 	sd ra, 0(sp)
 	min_income_loop:
 		bge a6, a5, return_min
 		addi a6, a6, 1
 		mv a4, a0
 		jal income_from_record
 		blt a0, t0, new_min_stock
 		addi a4, a4, 8
 		mv a0, a4
 		b min_income_loop
 	new_min_stock:
 		mv t0, a0
 		addi a4, a4, -4
 		mv t2, a4
 		addi a4, a4, 12
 		mv a0, a4
 		b min_income_loop
 	return_min:
 		ld ra 0(sp)
 		mv a0, t2
 	
	ret
#######################end of minIncome###############################################
