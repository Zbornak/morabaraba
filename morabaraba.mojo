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
from mills import test_for_mill
from mills import react_to_mill
from move import move_player_cow

def main():
    var player1_cows_remaining = 12
    var player1_cows_in_play = 0
    var player1_dead_cows = 0
    
    var player2_cows_remaining = 12
    var player2_in_play = 0
    var player2_dead_cows = 0
    
    # All possible mills(20)
    var mill_12 = InlineArray[String, 3]("d5", "d6", "d7")
    var mill_1 = InlineArray[String, 3]("e5", "f6", "g7")
    var mill_3 = InlineArray[String, 3]("e4", "f4", "g4")
    var mill_5 = InlineArray[String, 3]("e3", "f2", "g1")
    var mill_6 = InlineArray[String, 3]("d1", "d2", "d3")
    var mill_7 = InlineArray[String, 3]("a1", "b2", "c3")
    var mill_9 = InlineArray[String, 3]("a4", "b4", "c4")
    var mill_11 = InlineArray[String, 3]("c5", "b6", "a7")
    var mill_TH = InlineArray[String, 3]("a7", "d7", "g7")
    var mill_BH = InlineArray[String, 3]("a1", "d1", "g1")
    var mill_VL = InlineArray[String, 3]("a1", "a4", "a7")
    var mill_VR = InlineArray[String, 3]("g1", "g4", "g7")
    var mill_MT = InlineArray[String, 3]("b6", "d6", "f6")
    var mill_MB = InlineArray[String, 3]("b2", "d2", "f2")
    var mill_ML = InlineArray[String, 3]("b2", "b4", "b6")
    var mill_MR = InlineArray[String, 3]("f2", "f4", "f6")
    var mill_CT = InlineArray[String, 3]("c5", "d5", "e5")
    var mill_CB = InlineArray[String, 3]("c3", "d3", "e3")
    var mill_CL = InlineArray[String, 3]("c3", "c4", "c5")
    var mill_CR = InlineArray[String, 3]("e3", "e4", "e5")
    
    var mill_list = List(mill_12, mill_1, mill_3, mill_5, mill_6, mill_7, mill_9, mill_11, mill_TH, mill_BH, mill_VL, mill_VR, mill_MT, mill_MB, mill_ML, mill_MR, mill_CT, mill_CB, mill_CL, mill_CR)
    
    var possible_moves = Dict[String, Board_Piece]()
    possible_moves["a7"] = Board_Piece("a7", "unowned", False, List(mill_11, mill_TH, mill_VL))
    possible_moves["d7"] = Board_Piece("d7", "unowned", False, List(mill_12, mill_TH))
    possible_moves["g7"] = Board_Piece("g7", "unowned", False, List(mill_1, mill_TH, mill_VR))
    possible_moves["b6"] = Board_Piece("b6", "unowned", False, List(mill_11, mill_MT, mill_ML))
    possible_moves["d6"] = Board_Piece("d6", "unowned", False, List(mill_12, mill_MT))
    possible_moves["f6"] = Board_Piece("f6", "unowned", False, List(mill_1, mill_MR))
    possible_moves["c5"] = Board_Piece("c5", "unowned", False, List(mill_11, mill_CL))
    possible_moves["d5"] = Board_Piece("d5", "unowned", False, List(mill_12, mill_CT))
    possible_moves["e5"] = Board_Piece("e5", "unowned", False, List(mill_1, mill_CT, mill_CR))
    possible_moves["a4"] = Board_Piece("a4", "unowned", False, List(mill_9, mill_VL))
    possible_moves["b4"] = Board_Piece("b4", "unowned", False, List(mill_9, mill_ML))
    possible_moves["c4"] = Board_Piece("c4", "unowned", False, List(mill_9, mill_CL))
    possible_moves["e4"] = Board_Piece("e4", "unowned", False, List(mill_3, mill_CR))
    possible_moves["f4"] = Board_Piece("f4", "unowned", False, List(mill_3, mill_MR))
    possible_moves["g4"] = Board_Piece("g4", "unowned", False, List(mill_3, mill_VR))
    possible_moves["c3"] = Board_Piece("c3", "unowned", False, List(mill_7, mill_CB, mill_CL))
    possible_moves["d3"] = Board_Piece("d3", "unowned", False, List(mill_6, mill_CB))
    possible_moves["e3"] = Board_Piece("e3", "unowned", False, List(mill_5, mill_CB, mill_CR))
    possible_moves["b2"] = Board_Piece("b2", "unowned", False, List(mill_7, mill_MB, mill_ML))
    possible_moves["d2"] = Board_Piece("d2", "unowned", False, List(mill_6, mill_MB))
    possible_moves["f2"] = Board_Piece("f2", "unowned", False, List(mill_5, mill_MB, mill_MR))
    possible_moves["a1"] = Board_Piece("a1", "unowned", False, List(mill_7, mill_BH, mill_VL))
    possible_moves["d1"] = Board_Piece("d1", "unowned", False, List(mill_6, mill_BH))
    possible_moves["g1"] = Board_Piece("g1", "unowned", False, List(mill_5, mill_BH, mill_VR))
    
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
        print(String("player one has {} cows remaining").format(player1_move_choice))
        
        # test for a mill
        while True:
            if not test_for_mill(player1_move_choice, mill_list, possible_moves):
                break
    
            while True:
                py_player1_shot_choice = py_input("you have a mill, choose a cow to shoot: ")
                player1_shot_choice = str(py_player1_shot_choice)
                
                if react_to_mill("player1", "player2", player1_shot_choice, possible_moves, player2_dead_cows, player2_cows_in_play):
                    print(String("{0} is now marked as {1}").format(player1_shot_choice, possible_moves[player1_shot_choice].ownership))
                    
                    # exit inner loop if a valid move is made
                    break  
                
                else:
                    print("invalid move, remember you can only shoot opponent's cows (not currently in a mill)")
    
            # valid move was made, break the outer loop
            break
        # END OF PLAYER 1 MOVE
                
        # START OF PLAYER 2 MOVE      
        py_player2_move_choice = py_input("player two make your move: ")
        player2_move_choice = str(py_player2_move_choice)
        
        # check to see if choice is valid and if you or player 1 aren't already on that spot
        if player2_move_choice in possible_moves and possible_moves[player2_move_choice].ownership == "unowned":
            # change board position into a dark cow
            possible_moves[player2_move_choice].name = "⑁⚇"
            
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
        print(String("player 2 has {} cows remaining").format(player1_move_choice))
        
        # test for a mill
        while True:
            if not test_for_mill(player2_move_choice, mill_list, possible_moves):
                break
    
            while True:
                py_player2_shot_choice = py_input("you have a mill, choose a cow to shoot: ")
                player2_shot_choice = str(py_player2_shot_choice)
                
                if react_to_mill("player2", "player1", player2_shot_choice, possible_moves, player1_dead_cows, player1_cows_in_play):
                    print(String("{0} is now marked as {1}").format(player2_shot_choice, possible_moves[player2_shot_choice].ownership))
                    
                    # exit inner loop if a valid move is made
                    break  
                
                else:
                    print("invalid move, remember you can only shoot opponent's cows (not currently in a mill)")
    
            # valid move was made, break the outer loop
            break
        # END OF PLAYER 2 MOVE
    
    print("all living cows are now in play")
    print("")
    print("***MOOVING PHASE***")
    
    print("to make a move, type 'current cow position' to 'new cow position' eg. f2 to g1")
    print("remember you can only move your cows to adjacent empty board positions")
    move_player_cow()

    # end of program