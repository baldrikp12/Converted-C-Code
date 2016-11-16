# Kenneth Baldridge
# Convert C code for min int in array into MIPS code
#########################################
# Code in C
#
#	int find_min(int list[], int n) {
#	     int min, i; 
#	     min = list[0];
#	     for (i = 1; i  n; i++) {
#	          if (list[i]  min) 
#	               min = list[i];
#	     } 
#	     return min; 
#	}
#########################################

.data
.macro done
	li $v0,10
	syscall
.end_macro

array: .word 5, 2, 0, 4, 1, 6	# Our test array
array_size: .word 6		# The size of our test array

.text
la $a0, array		# Set the register location of our array
lw $a1, array_size	# Set a register location for the size of our array

###############################################################
# Everything above this is just used for me to work this out. #
###############################################################

lw   $t0, 0($a0)	# Load the first integer of our array
li   $t1, 1		# Initialize our loop counter to 1
loop:			# Label to get us back to the beginning of our loop
beq  $t1, $a1, exit	# Is our loop counter equal to the size of the array? yes-GoTo Exit, no-next line
addi $a0, $a0, 4	# Move to the next integer in our array.
addi $t1, $t1, 1	# Increment our loop counter
lw   $t2, 0($a0)	# Load the current integer in our array into temp register
bge  $t2, $t0, if_loop	# Is this greater than the previously loaded integer in our $t0 register? yes-jump to label end_if, no-next line
move $t0, $t2		# Load integer into $t0
if_loop:		# Kepp on moving, buddy.
j    loop		# Jump to Loop 
exit:			# Exit... No turning back now.
done