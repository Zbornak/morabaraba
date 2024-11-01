def move_player_cow():
	user_input = input("make your move: ")
	
	words = user_input.split(" ")
	
	# check if player input is valid
	if len(words) < 3 or len(words) > 3 or words[1] != "to":
		print("invalid, please use structure: 'current position' to 'new position', eg. f2 to g1")
	else:
		print("move accepted")
		# check if move choice is valid
		
		
		
def move_impi_cow():
	print("hello, mojo")