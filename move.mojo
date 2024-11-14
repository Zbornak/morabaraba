from python import Python
from collections import Dict
from board_piece import Board_Piece
from board import draw_board
from mills import check_for_mill
from rules import print_rules
from sys import exit

def allowed_adjacent_moves(position: Board_Piece, inout possible_moves: Dict[String, Board_Piece]) -> List[Board_Piece]:
    var allowed_moves_list = List[Board_Piece]()
    
    if position.name == "a7":
        allowed_moves_list.append(possible_moves["d7"])
        allowed_moves_list.append(possible_moves["b6"])
        allowed_moves_list.append(possible_moves["a4"])
    elif position.name == "a4":
        allowed_moves_list.append(possible_moves["a7"])
        allowed_moves_list.append(possible_moves["b4"])
        allowed_moves_list.append(possible_moves["a1"])
    elif position.name == "a1":
        allowed_moves_list.append(possible_moves["a4"])
        allowed_moves_list.append(possible_moves["b2"])
        allowed_moves_list.append(possible_moves["d1"])
    elif position.name == "b6":
        allowed_moves_list.append(possible_moves["a7"])
        allowed_moves_list.append(possible_moves["d6"])
        allowed_moves_list.append(possible_moves["c5"])
        allowed_moves_list.append(possible_moves["b4"])
    elif position.name == "b4":
        allowed_moves_list.append(possible_moves["a4"])
        allowed_moves_list.append(possible_moves["b6"])
        allowed_moves_list.append(possible_moves["b2"])
        allowed_moves_list.append(possible_moves["c4"])
    elif position.name == "b2":
        allowed_moves_list.append(possible_moves["a1"])
        allowed_moves_list.append(possible_moves["b4"])
        allowed_moves_list.append(possible_moves["d2"])
        allowed_moves_list.append(possible_moves["c3"])
    elif position.name == "c5":
        allowed_moves_list.append(possible_moves["b6"])
        allowed_moves_list.append(possible_moves["d5"])
        allowed_moves_list.append(possible_moves["c4"])
    elif position.name == "c4":
        allowed_moves_list.append(possible_moves["b4"])
        allowed_moves_list.append(possible_moves["c5"])
        allowed_moves_list.append(possible_moves["c3"])
    elif position.name == "c3":
        allowed_moves_list.append(possible_moves["b2"])
        allowed_moves_list.append(possible_moves["c4"])
        allowed_moves_list.append(possible_moves["d3"])
    elif position.name == "d7":
        allowed_moves_list.append(possible_moves["a7"])
        allowed_moves_list.append(possible_moves["d6"])
        allowed_moves_list.append(possible_moves["g7"])
    elif position.name == "d6":
        allowed_moves_list.append(possible_moves["d7"])
        allowed_moves_list.append(possible_moves["b6"])
        allowed_moves_list.append(possible_moves["d5"])
        allowed_moves_list.append(possible_moves["f6"])
    elif position.name == "d5":
        allowed_moves_list.append(possible_moves["d6"])
        allowed_moves_list.append(possible_moves["c5"])
        allowed_moves_list.append(possible_moves["e5"])
    elif position.name == "d3":
        allowed_moves_list.append(possible_moves["c3"])
        allowed_moves_list.append(possible_moves["e3"])
        allowed_moves_list.append(possible_moves["d2"])
    elif position.name == "d2":
        allowed_moves_list.append(possible_moves["d3"])
        allowed_moves_list.append(possible_moves["b2"])
        allowed_moves_list.append(possible_moves["f2"])
        allowed_moves_list.append(possible_moves["d1"])
    elif position.name == "d1":
        allowed_moves_list.append(possible_moves["a1"])
        allowed_moves_list.append(possible_moves["d2"])
        allowed_moves_list.append(possible_moves["g1"])
    elif position.name == "e5":
        allowed_moves_list.append(possible_moves["d5"])
        allowed_moves_list.append(possible_moves["f6"])
        allowed_moves_list.append(possible_moves["e4"])
    elif position.name == "e4":
        allowed_moves_list.append(possible_moves["e5"])
        allowed_moves_list.append(possible_moves["f4"])
        allowed_moves_list.append(possible_moves["e3"])
    elif position.name == "e3":
        allowed_moves_list.append(possible_moves["e4"])
        allowed_moves_list.append(possible_moves["d3"])
        allowed_moves_list.append(possible_moves["f2"])
    elif position.name == "f6":
        allowed_moves_list.append(possible_moves["g7"])
        allowed_moves_list.append(possible_moves["d6"])
        allowed_moves_list.append(possible_moves["e5"])
        allowed_moves_list.append(possible_moves["f4"])
    elif position.name == "f4":
        allowed_moves_list.append(possible_moves["f6"])
        allowed_moves_list.append(possible_moves["e4"])
        allowed_moves_list.append(possible_moves["f2"])
        allowed_moves_list.append(possible_moves["g4"])
    elif position.name == "f2":
        allowed_moves_list.append(possible_moves["e3"])
        allowed_moves_list.append(possible_moves["f4"])
        allowed_moves_list.append(possible_moves["g1"])
        allowed_moves_list.append(possible_moves["d2"])
    elif position.name == "g7":
        allowed_moves_list.append(possible_moves["d7"])
        allowed_moves_list.append(possible_moves["f6"])
        allowed_moves_list.append(possible_moves["g4"])
    elif position.name == "g4":
        allowed_moves_list.append(possible_moves["g7"])
        allowed_moves_list.append(possible_moves["f4"])
        allowed_moves_list.append(possible_moves["g1"])
    elif position.name == "g1":
        allowed_moves_list.append(possible_moves["d1"])
        allowed_moves_list.append(possible_moves["f2"])
        allowed_moves_list.append(possible_moves["g4"])
        
    return allowed_moves_list
    
def check_move(chosen move: String, allowed_moves: List[Board_Piece]) -> Bool:
    return False
    

def move_cow(player: String, opponent: String, inout possible_moves: Dict[String, Board_Piece]) -> String:
    Python.add_to_path(".")
    py_input = Python.import_module("builtins").input
    
    var name = "player one" if player == "player1" else "player two"
    
    var move_from: String = ""
    var move_to: String = ""
	
    while True:
        py_move_choice = py_input(String("{} make your move: ").format(name))
        move_choice = str(py_move_choice)
        
        # check if player inputed a string of length 3 and the middle word is 'to'
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
                possible_moves[move_from].in_mill = False
                
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
                print("not an allowed move")       
                
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
    
    return move_to
            
        