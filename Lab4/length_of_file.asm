
length_of_file:
#function to find length of data read from file
#arguments: a1=bufferAdress holding file data
#return file length in a0
	
#Start your coding here

li a0, 0
#if no student code provided, this function just returns 0 in a0
iterateThroughFile:
	lbu t0 (a1) 
	#check null character and exit
	beqz t0, fileExit
	addi a1, a1, 1
	addi t1, t1, 1
	b iterateThroughFile
fileExit:
	mv a0, t1
#End your coding here
ret
#######################end of length_of_file###############################################	
