from python import Python

def move_cow(player: String, opponent: String):
    Python.add_to_path(".")
    py_input = Python.import_module("builtins").input
    
    var name = "player one" if player == "player1" else "player two"
	
    py_move_choice = py_input(String("{} make your move: ").format(name))
    move_choice = str(py_move_choice)
	
    words = move_choice.split(" ")
	
    # check if player input is valid
    if len(words) < 3 or len(words) > 3 or words[1] != "to":
        print("invalid, please use structure: 'current position' to 'new position', eg. f2 to g1")
    else:
        print("move accepted")
        
    # check if move choice is valid