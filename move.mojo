from python import Python
from collections import Dict
from board_piece import Board_Piece
from board import draw_board
from mills import check_for_mill
from rules import print_rules
from sys import exit

def allowed_adjacent_moves(move_from: String) -> List[String]:
    var adjacent_moves = Dict[String, List[String]]()
    
    adjacent_moves["a7"] = List[String]("d7", "b6", "a4")
    adjacent_moves["a4"] = List[String]("a7", "b4", "a1")
    adjacent_moves["a1"] = List[String]("a4", "b2", "d1")
    adjacent_moves["b6"] = List[String]("a7", "d6", "c5", "b4")
    adjacent_moves["b4"] = List[String]("a4", "b6", "b2", "c4")
    adjacent_moves["b2"] = List[String]("a1", "b4", "d2", "c3")
    adjacent_moves["c5"] = List[String]("b6", "d5", "c4")
    adjacent_moves["c4"] = List[String]("b4", "c5", "c3")
    adjacent_moves["c3"] = List[String]("b2", "c4", "d3")
    adjacent_moves["d7"] = List[String]("a7", "d6", "g7")
    adjacent_moves["d6"] = List[String]("d7", "b6", "d5", "f6")
    adjacent_moves["d5"] = List[String]("d6", "c5", "e5")
    adjacent_moves["d3"] = List[String]("c3", "e3", "d2")
    adjacent_moves["d2"] = List[String]("d3", "b2", "f2", "d1")
    adjacent_moves["d1"] = List[String]("a1", "d2", "g1")
    adjacent_moves["e5"] = List[String]("d5", "f6", "e4")
    adjacent_moves["e4"] = List[String]("e5", "f4", "e3")
    adjacent_moves["e3"] = List[String]("e4", "d3", "f2")
    adjacent_moves["f6"] = List[String]("g7", "d6", "e5", "f4")
    adjacent_moves["f4"] = List[String]("f6", "e4", "f2", "g4")
    adjacent_moves["f2"] = List[String]("e3", "f4", "g1", "d2")
    adjacent_moves["g7"] = List[String]("d7", "f6", "g4")
    adjacent_moves["g4"] = List[String]("g7", "f4", "g1")
    adjacent_moves["g1"] = List[String]("d1", "f2", "g4")
    
    if move_from in adjacent_moves:
        return adjacent_moves[move_from]
    else:
        return List[String]()
    
def check_move(move_from: String, move_to: String) -> Bool:
    var allowed_moves = allowed_adjacent_moves(move_from)
    if move_to in allowed_moves:
        return True
    return False
    
def move_cow(player: String, opponent: String, inout possible_moves: Dict[String, Board_Piece], mill_list: List[List[String]]) -> String:
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
            if possible_moves[move_from].ownership == player and possible_moves[move_to].ownership == "unowned" and check_move(move_from, move_to):
                possible_moves[move_from].ownership = "unowned"
                possible_moves[move_from].name = move_from
                # change board piece to no longer in play
                possible_moves[move_from].in_play = False
                possible_moves[move_from].in_mill = False
                
                possible_moves[move_to].ownership = player
                possible_moves[move_to].name = "⑁⚇" if player == "player1" else "⑁⚉"
                # change board piece to in play
                possible_moves[move_to].in_play = True
                
                # take other cows out of mill using mill list
                #### incorrectly toggles all mill lists where move_from appears
                for mill in mill_list:
                    if move_from in mill[]:
                        possible_moves[mill[][0]].in_mill = False
                        possible_moves[mill[][1]].in_mill = False
                        possible_moves[mill[][2]].in_mill = False
                ###
                
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
            
        