# MORABARABA
# by Zbornak (2024), powered by Impi AI and Mojo
#     
#              (__)    
#       `------(><)
#        ||    (__)
#        ||w--||
#     
# A traditional 2-player strategy game from South Africa

from collections import Dict
from collections import List
from collections import InlineArray
from python import Python
from rules import print_rules
from intro import print_intro
from board_piece import Board_Piece
from board import draw_board
from random import randint
from move import move_cow

def main():
    var player1_cows_remaining = 12
    var player1_cows_in_play = 0
    var player1_dead_cows = 0
    
    var player2_cows_remaining = 12
    var player2_cows_in_play = 0
    var player2_dead_cows = 0
    
    var possible_moves = Dict[String, Board_Piece]()
    possible_moves["a7"] = Board_Piece("a7", "unowned", False)
    possible_moves["d7"] = Board_Piece("d7", "unowned", False)
    possible_moves["g7"] = Board_Piece("g7", "unowned", False)
    possible_moves["b6"] = Board_Piece("b6", "unowned", False)
    possible_moves["d6"] = Board_Piece("d6", "unowned", False)
    possible_moves["f6"] = Board_Piece("f6", "unowned", False)
    possible_moves["c5"] = Board_Piece("c5", "unowned", False)
    possible_moves["d5"] = Board_Piece("d5", "unowned", False)
    possible_moves["e5"] = Board_Piece("e5", "unowned", False)
    possible_moves["a4"] = Board_Piece("a4", "unowned", False)
    possible_moves["b4"] = Board_Piece("b4", "unowned", False)
    possible_moves["c4"] = Board_Piece("c4", "unowned", False)
    possible_moves["e4"] = Board_Piece("e4", "unowned", False)
    possible_moves["f4"] = Board_Piece("f4", "unowned", False)
    possible_moves["g4"] = Board_Piece("g4", "unowned", False)
    possible_moves["c3"] = Board_Piece("c3", "unowned", False)
    possible_moves["d3"] = Board_Piece("d3", "unowned", False)
    possible_moves["e3"] = Board_Piece("e3", "unowned", False)
    possible_moves["b2"] = Board_Piece("b2", "unowned", False)
    possible_moves["d2"] = Board_Piece("d2", "unowned", False)
    possible_moves["f2"] = Board_Piece("f2", "unowned", False)
    possible_moves["a1"] = Board_Piece("a1", "unowned", False)
    possible_moves["d1"] = Board_Piece("d1", "unowned", False)
    possible_moves["g1"] = Board_Piece("g1", "unowned", False)
    
    print_intro()
    
    Python.add_to_path(".")
    py_input = Python.import_module("builtins").input
    
    try:
        draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
    except:
        print("error drawing board") 
    
    print("***PLACING PHASE***")
    print("player one controls the dark cows (⑁⚇), player two has the light cows (⑁⚉)")
    print("player one goes first")
                     
    while player1_cows_remaining > 0 and player2_cows_remaining > 0:
        # START OF PLAYER 1 MOVE      
        py_player1_move_choice = py_input("player one make your move: ")
        player1_move_choice = str(py_player1_move_choice)
        
        # check to see if choice is valid and if you or player 2 aren't already on that spot
        if player1_move_choice in possible_moves and possible_moves[player1_move_choice].ownership == "unowned":
            # change board position into a dark cow
            possible_moves[player1_move_choice].name = "⑁⚇"
            
            # change board status from unowned to player 1
            possible_moves[player1_move_choice].ownership = "player1"
            
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
            except:
                print("error drawing board")
                
            player1_cows_remaining -= 1
            player1_cows_in_play += 1
            
        elif player1_move_choice == "rules":
            print_rules()
            
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
            except:
                print("error drawing board")
                
            continue
            
        elif player1_move_choice == "exit":
            return 1
        
        else:
            print("invalid move, please try again") 
            continue
                   
        print(String("player one chose {}").format(player1_move_choice))
        print(String("{0} is now marked as owned by {1}").format(player1_move_choice, possible_moves[player1_move_choice].ownership))
        print(String("player one has {} cows remaining").format(player1_cows_remaining))
        
        # test for a mill
        # END OF PLAYER 1 MOVE
                
        # START OF PLAYER 2 MOVE      
        py_player2_move_choice = py_input("player two make your move: ")
        player2_move_choice = str(py_player2_move_choice)
        
        # check to see if choice is valid and if you or player 1 aren't already on that spot
        if player2_move_choice in possible_moves and possible_moves[player2_move_choice].ownership == "unowned":
            # change board position into a dark cow
            possible_moves[player2_move_choice].name = "⑁⚉"
            
            # change board status from unowned to player 2
            possible_moves[player2_move_choice].ownership = "player2"
            
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
            except:
                print("error drawing board")
                
            player2_cows_remaining -= 1
            player2_cows_in_play += 1
            
        elif player2_move_choice == "rules":
            print_rules()
            
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
            except:
                print("error drawing board")
                
            continue
            
        elif player2_move_choice == "exit":
            return 1
        
        else:
            print("invalid move, please try again") 
            continue
                   
        print(String("player two chose {}").format(player1_move_choice))
        print(String("{0} is now marked as owned by {1}").format(player1_move_choice, possible_moves[player1_move_choice].ownership))
        print(String("player two has {} cows remaining").format(player2_cows_remaining))
        
        # test for a mill
        # END OF PLAYER 2 MOVE
    
    print("all living cows are now in play")
    print("")
    print("***MOOVING PHASE***")
    
    print("to make a move, type 'current cow position' to 'new cow position' eg. f2 to g1")
    print("remember you can only move your cows to adjacent empty board positions")
    move_cow()

    # end of program