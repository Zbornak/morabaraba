from python import Python
from collections import Dict
from board_piece import Board_Piece
from board import draw_board
from mills import check_for_mill
from rules import print_rules
from sys import exit

def allowed_adjacent_moves(position: String) -> List[String]:
    var allowed_moves_list = List[String]()
    
    if position == "a7":
        allowed_moves_list.append("d7")
        allowed_moves_list.append("b6")
        allowed_moves_list.append("a4")
    elif position == "a4":
        allowed_moves_list.append("a7")
        allowed_moves_list.append("b4")
        allowed_moves_list.append("a1")
    elif position == "a1":
        allowed_moves_list.append("a4")
        allowed_moves_list.append("b2")
        allowed_moves_list.append("d1")
    elif position == "b6":
        allowed_moves_list.append("a7")
        allowed_moves_list.append("d6")
        allowed_moves_list.append("c5")
        allowed_moves_list.append("b4")
    elif position == "b4":
        allowed_moves_list.append("a4")
        allowed_moves_list.append("b6")
        allowed_moves_list.append("b2")
        allowed_moves_list.append("c4")
    elif position == "b2":
        allowed_moves_list.append("a1")
        allowed_moves_list.append("b4")
        allowed_moves_list.append("d2")
        allowed_moves_list.append("c3")
    elif position == "c5":
        allowed_moves_list.append("b6")
        allowed_moves_list.append("d5")
        allowed_moves_list.append("c4")
    elif position == "c4":
        allowed_moves_list.append("b4")
        allowed_moves_list.append("c5")
        allowed_moves_list.append("c3")
    elif position == "c3":
        allowed_moves_list.append("b2")
        allowed_moves_list.append("c4")
        allowed_moves_list.append("d3")
    elif position == "d7":
        allowed_moves_list.append("a7")
        allowed_moves_list.append("d6")
        allowed_moves_list.append("g7")
    elif position == "d6":
        allowed_moves_list.append("d7")
        allowed_moves_list.append("b6")
        allowed_moves_list.append("d5")
        allowed_moves_list.append("f6")
    elif position == "d5":
        allowed_moves_list.append("d6")
        allowed_moves_list.append("c5")
        allowed_moves_list.append("e5")
    elif position == "d3":
        allowed_moves_list.append("c3")
        allowed_moves_list.append("e3")
        allowed_moves_list.append("d2")
    elif position == "d2":
        allowed_moves_list.append("d3")
        allowed_moves_list.append("b2")
        allowed_moves_list.append("f2")
        allowed_moves_list.append("d1")
    elif position == "d1":
        allowed_moves_list.append("a1")
        allowed_moves_list.append("d2")
        allowed_moves_list.append("g1")
    elif position == "e5":
        allowed_moves_list.append("d5")
        allowed_moves_list.append("f6")
        allowed_moves_list.append("e4")
    elif position == "e4":
        allowed_moves_list.append("e5")
        allowed_moves_list.append("f4")
        allowed_moves_list.append("e3")
    elif position == "e3":
        allowed_moves_list.append("e4")
        allowed_moves_list.append("d3")
        allowed_moves_list.append("f2")
    elif position == "f6":
        allowed_moves_list.append("g7")
        allowed_moves_list.append("d6")
        allowed_moves_list.append("e5")
        allowed_moves_list.append("f4")
    elif position == "f4":
        allowed_moves_list.append("f6")
        allowed_moves_list.append("e4")
        allowed_moves_list.append("f2")
        allowed_moves_list.append("g4")
    elif position == "f2":
        allowed_moves_list.append("e3")
        allowed_moves_list.append("f4")
        allowed_moves_list.append("g1")
        allowed_moves_list.append("d2")
    elif position == "g7":
        allowed_moves_list.append("d7")
        allowed_moves_list.append("f6")
        allowed_moves_list.append("g4")
    elif position == "g4":
        allowed_moves_list.append("g7")
        allowed_moves_list.append("f4")
        allowed_moves_list.append("g1")
    elif position == "g1":
        allowed_moves_list.append("d1")
        allowed_moves_list.append("f2")
        allowed_moves_list.append("g4")
        
    return allowed_moves_list
    
def allowed_adjacent_moves(position: String) -> List[String]:
    adjacent_moves = {
        "a7": ["d7", "b6", "a4"],
        "a4": ["a7", "b4", "a1"],
        "a1": ["a4", "b2", "d1"],
        "b6": ["a7", "d6", "c5", "b4"],
        "b4": ["a4", "b6", "b2", "c4"],
        "b2": ["a1", "b4", "d2", "c3"],
        "c5": ["b6", "d5", "c4"],
        "c4": ["b4", "c5", "c3"],
        "c3": ["b2", "c4", "d3"],
        "d7": ["a7", "d6", "g7"],
        "d6": ["d7", "b6", "d5", "f6"],
        "d5": ["d6", "c5", "e5"],
        "d3": ["c3", "e3", "d2"],
        "d2": ["d3", "b2", "f2", "d1"],
        "d1": ["a1", "d2", "g1"],
        "e5": ["d5", "f6", "e4"],
        "e4": ["e5", "f4", "e3"],
        "e3": ["e4", "d3", "f2"],
        "f6": ["g7", "d6", "e5", "f4"],
        "f4": ["f6", "e4", "f2", "g4"],
        "f2": ["e3", "f4", "g1", "d2"],
        "g7": ["d7", "f6", "g4"],
        "g4": ["g7", "f4", "g1"],
        "g1": ["d1", "f2", "g4"]
    }
    
    return List[String](adjacent_moves.get(position, []))
    
def check_move(chosen_move: String) -> Bool:
    var allowed_moves = allowed_adjacent_moves(chosen_move)
    if chosen_move in allowed_moves:
        return True

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
            
        