from board_piece import Board_Piece
from collections import List
from collections import Dict
from python import Python
from rules import print_rules
from board import draw_board
from sys import exit

def check_for_mill(move: String, player: String, mill_list: List[List[String]], inout possible_moves: Dict[String, Board_Piece]) -> Bool:    
    for mill in mill_list:
        if move in mill[]:
            if (possible_moves[mill[][0]].ownership == player and possible_moves[mill[][1]].ownership == player and possible_moves[mill[][2]].ownership == player):
                possible_moves[mill[][0]].in_mill = True
                possible_moves[mill[][1]].in_mill = True
                possible_moves[mill[][2]].in_mill = True
                return True
            else:
                possible_moves[mill[][0]].in_mill = False
                possible_moves[mill[][1]].in_mill = False
                possible_moves[mill[][2]].in_mill = False
    
    return False
                
def shoot_cow(player: String, opponent: String, inout possible_moves: Dict[String, Board_Piece]):
    Python.add_to_path(".")
    py_input = Python.import_module("builtins").input
    
    while True:
        py_shot_choice = py_input("choose a cow to shoot: ")
        shot_choice = str(py_shot_choice)
        
        if shot_choice in possible_moves:
            if possible_moves[shot_choice].ownership == opponent and possible_moves[shot_choice].in_mill == False:
                possible_moves[shot_choice].name = shot_choice
                possible_moves[shot_choice].ownership = "unowned"
                
                try:
                    draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
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
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
            except:
                print("error drawing board")
        elif shot_choice == "exit":
            exit()
        else:
            print("invalid move, please try again")

    return 0