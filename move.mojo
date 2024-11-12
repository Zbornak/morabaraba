from python import Python
from collections import Dict
from board_piece import Board_Piece
from board import draw_board
from mills import check_for_mill
from rules import print_rules
from sys import exit

def move_cow(player: String, opponent: String, inout possible_moves: Dict[String, Board_Piece]):
    Python.add_to_path(".")
    py_input = Python.import_module("builtins").input
    
    var name = "player one" if player == "player1" else "player two"
	
    while True:
        py_move_choice = py_input(String("{} make your move: ").format(name))
        move_choice = str(py_move_choice)
        
        var move_from: String = ""
        var move_to: String = ""
        
        # chick if player inputed a string of length 3 and the middle word is 'to'
        words = move_choice.split(" ")    
        if len(words) == 3 and words[1] == "to":
            move_from = words[0]
            move_to = words[2]
        else:
            print("invalid")
        
        # check if player input is valid
        if move_from in possible_moves and move_to in possible_moves:
            if possible_moves[move_from].ownership == player and possible_moves[move_to].ownership == "unowned":
                possible_moves[move_from].ownership = "unowned"
                possible_moves[move_from].name = move_from
                # change board piece to no longer in play
                possible_moves[move_from].in_play = False
                
                possible_moves[move_to].ownership = player
                possible_moves[move_to].name = "⑁⚇" if player == "player1" else "⑁⚉"
                # change board piece to in play
                possible_moves[move_to].in_play = True
                
                try:
                    draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
                except:
                    print("error drawing board")
                    
                print(String("{} has moved their cow from {} to {}").format(name, move_from, move_to))
                break  
            else:
                print("please use structure: 'current position' to 'new position', eg. f2 to g1")
        elif move_choice == "rules":
            print_rules()
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
            except:
                print("error drawing board")
        elif move_choice == "exit":
            exit()
        else:
            print("please use structure: 'current position' to 'new position', eg. f2 to g1")

    return 0
            
        