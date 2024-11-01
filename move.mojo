def move_cow():
	user_input = input("make your move: ")
	
	words = user_input.split(" ")
	
	if len(words) < 3 or len(words) > 3 or words[1] != "to":
		print("invalid, please use structure: 'current position' to 'new position', eg. f2 to g1")
	else:
		print("move accepted")
		
	print(words[0])
	print(words[1])
	print(words[2])