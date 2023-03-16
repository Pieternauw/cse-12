totalIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for  a0
	bnez a1, totalIncome_fileNotEmpty # totalIncome function
	li a0, 0
	ret

totalIncome_fileNotEmpty:
	# Start your coding from here!
	li t1, 0
	addi a0, a0, 4
	mv t0, a0
	mv a4, a1
	#store return address (calling another function so has to be done)
	sd ra, 0(sp)
	total_loop:
		bge a3, a4, end_total_loop
		mv a0, t0
		addi a3, a3, 1
		jal income_from_record
		add t1, t1, a0
		addi t0, t0, 8
		b total_loop
	end_total_loop:
		mv a0, t1
		ld ra 0(sp)

	#if no student code entered, a0 just returns 0 always :(
# End your  coding  here!
	
	ret
#######################end of nameOfMaxIncome_totalIncome###############################################
