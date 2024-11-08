from board_piece import Board_Piece
from collections import List
from collections import Dict
from python import Python
from rules import print_rules
from board import draw_board
from sys import exit

def check_for_mill(move: String, player: String, mill_list: List[List[String]], inout possible_moves: Dict[String, Board_Piece]) -> Bool:    
    var move_mill_list = List[List[String]]()
    var pos0: Bool = False
    var pos1: Bool = False
    var pos2: Bool = False
    
    # add all mill lists that contain the player's move
    for mill in mill_list:
        if move in mill[]:
            move_mill_list.append(mill[])
            
    # toggle cows that are in a mill and controlled by player to true
    for found_mill in move_mill_list:
        for i in found_mill[]:
            if possible_moves[i[]].ownership == player:
                possible_moves[i[]].in_mill = True
            else:
                possible_moves[i[]].in_mill = False
        
        # check that all positions in mill are set to true
        pos0 = possible_moves[found_mill[][0]].in_mill
        pos1 = possible_moves[found_mill[][1]].in_mill
        pos2 = possible_moves[found_mill[][2]].in_mill
            
        if pos0 and pos1 and pos2:
            return True
    
    return False
                
def shoot_cow(player: String, opponent: String, inout possible_moves: Dict[String, Board_Piece]):
    Python.add_to_path(".")
    py_input = Python.import_module("builtins").input
    
    while True:
        py_shot_choice = py_input("choose a cow to shoot: ")
        shot_choice = str(py_shot_choice)
        
        if shot_choice in possible_moves:
            if possible_moves[shot_choice].ownership == opponent:
                possible_moves[shot_choice].in_mill = False
                possible_moves[shot_choice].name = shot_choice
                possible_moves[shot_choice].ownership = "unowned"
                try:
                    draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
                except:
                    print("error drawing board")
                print("MOO")
                print(String("you have shot your opponent's cow at {}").format(shot_choice))
                break
            else:
                print("invalid move, please try again")
        elif shot_choice == "rules":
            print_rules()
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
            except:
                print("error drawing board")
        elif shot_choice == "exit":
            exit()
        else:
            print("invalid move, please try again")

    return 0