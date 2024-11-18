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
from python import Python
from rules import print_rules
from intro import print_intro
from board_piece import Board_Piece
from board import draw_board
from random import randint
from move import move_cow
from fly import fly_cow
from mills import check_for_mill
from mills import shoot_cow

def main():
    var player1_cows_remaining = 12
    var player1_cows_in_play = 0
    var player1_dead_cows = 0
    
    var player2_cows_remaining = 12
    var player2_cows_in_play = 0
    var player2_dead_cows = 0 
    
    # All possible mills(20)
    var mill_12 = List(String("d5"), String("d6"), String("d7"))
    var mill_1 = List(String("e5"), String("f6"), String("g7"))
    var mill_3 = List(String("e4"), String("f4"), String("g4"))
    var mill_5 = List(String("e3"), String("f2"), String("g1"))
    var mill_6 = List(String("d1"), String("d2"), String("d3"))
    var mill_7 = List(String("a1"), String("b2"), String("c3"))
    var mill_9 = List(String("a4"), String("b4"), String("c4"))
    var mill_11 = List(String("c5"), String("b6"), String("a7"))
    var mill_TH = List(String("a7"), String("d7"), String("g7"))
    var mill_BH = List(String("a1"), String("d1"), String("g1"))
    var mill_VL = List(String("a1"), String("a4"), String("a7"))
    var mill_VR = List(String("g1"), String("g4"), String("g7"))
    var mill_MT = List(String("b6"), String("d6"), String("f6"))
    var mill_MB = List(String("b2"), String("d2"), String("f2"))
    var mill_ML = List(String("b2"), String("b4"), String("b6"))
    var mill_MR = List(String("f2"), String("f4"), String("f6"))
    var mill_CT = List(String("c5"), String("d5"), String("e5"))
    var mill_CB = List(String("c3"), String("d3"), String("e3"))
    var mill_CL = List(String("c3"), String("c4"), String("c5"))
    var mill_CR = List(String("e3"), String("e4"), String("e5"))
    
    var mill_list = List(mill_12, mill_1, mill_3, mill_5, mill_6, mill_7, mill_9, mill_11, mill_TH, mill_BH, mill_VL, mill_VR, mill_MT, mill_MB, mill_ML, mill_MR, mill_CT, mill_CB, mill_CL, mill_CR)
    
    var possible_moves = Dict[String, Board_Piece]()
    possible_moves["a7"] = Board_Piece("a7", "unowned", False, False)
    possible_moves["d7"] = Board_Piece("d7", "unowned", False, False)
    possible_moves["g7"] = Board_Piece("g7", "unowned", False, False)
    possible_moves["b6"] = Board_Piece("b6", "unowned", False, False)
    possible_moves["d6"] = Board_Piece("d6", "unowned", False, False)
    possible_moves["f6"] = Board_Piece("f6", "unowned", False, False)
    possible_moves["c5"] = Board_Piece("c5", "unowned", False, False)
    possible_moves["d5"] = Board_Piece("d5", "unowned", False, False)
    possible_moves["e5"] = Board_Piece("e5", "unowned", False, False)
    possible_moves["a4"] = Board_Piece("a4", "unowned", False, False)
    possible_moves["b4"] = Board_Piece("b4", "unowned", False, False)
    possible_moves["c4"] = Board_Piece("c4", "unowned", False, False)
    possible_moves["e4"] = Board_Piece("e4", "unowned", False, False)
    possible_moves["f4"] = Board_Piece("f4", "unowned", False, False)
    possible_moves["g4"] = Board_Piece("g4", "unowned", False, False)
    possible_moves["c3"] = Board_Piece("c3", "unowned", False, False)
    possible_moves["d3"] = Board_Piece("d3", "unowned", False, False)
    possible_moves["e3"] = Board_Piece("e3", "unowned", False, False)
    possible_moves["b2"] = Board_Piece("b2", "unowned", False, False)
    possible_moves["d2"] = Board_Piece("d2", "unowned", False, False)
    possible_moves["f2"] = Board_Piece("f2", "unowned", False, False)
    possible_moves["a1"] = Board_Piece("a1", "unowned", False, False)
    possible_moves["d1"] = Board_Piece("d1", "unowned", False, False)
    possible_moves["g1"] = Board_Piece("g1", "unowned", False, False)
    
    print_intro()
    
    Python.add_to_path(".")
    py_input = Python.import_module("builtins").input
    
    try:
        draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
    except:
        print("error drawing board") 
    
    print("sawubona, izilokotho ezinhle!")
    print("***PLACING PHASE***")
    print("player one controls the dark cows (⑁⚇), player two has the light cows (⑁⚉)")
    print("player one goes first")
                     
    while player1_cows_remaining > 0 and player2_cows_remaining > 0: # 6 for testing, 0 in production
        # START OF PLAYER 1 MOVE      
        py_player1_move_choice = py_input("player one make your move: ")
        player1_move_choice = str(py_player1_move_choice)
        
        # check to see if choice is valid and if you or player 2 aren't already on that spot
        if player1_move_choice in possible_moves and possible_moves[player1_move_choice].ownership == "unowned":
            # change board position into a dark cow
            possible_moves[player1_move_choice].name = "⑁⚇"
            
            # change board status from unowned to player 1
            possible_moves[player1_move_choice].ownership = "player1"
            
            # change board piece to in play
            possible_moves[player1_move_choice].in_play = True
            
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
            except:
                print("error drawing board")
                
            player1_cows_remaining -= 1
            player1_cows_in_play += 1
            
        elif player1_move_choice == "rules":
            print_rules()
            
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
            except:
                print("error drawing board")
                
            continue
            
        elif player1_move_choice == "exit":
            return 1
        
        else:
            print("invalid move, please try again") 
            continue
                   
        print(String("player one chose {}").format(player1_move_choice))
        # print(String("{0} is now marked as owned by {1}").format(player1_move_choice, possible_moves[player1_move_choice].ownership))
        print(String("player one has {} cows remaining").format(player1_cows_remaining))
        print(String("player one has {} dead cow/s").format(player1_dead_cows))
        
        # test for a mill
        if check_for_mill(player1_move_choice, "player1", "player2", mill_list, possible_moves):
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
            except:
                print("error drawing board")
                
            print("player one has a mill")
            shoot_cow("player1", "player2", possible_moves)
            player2_dead_cows += 1
            player2_cows_in_play -= 1
        # END OF PLAYER 1 MOVE
                
        # START OF PLAYER 2 MOVE      
        py_player2_move_choice = py_input("player two make your move: ")
        player2_move_choice = str(py_player2_move_choice)
        
        while True:
            # check to see if choice is valid and if you or player 1 aren't already on that spot
            if player2_move_choice in possible_moves and possible_moves[player2_move_choice].ownership == "unowned":
                # change board position into a dark cow
                possible_moves[player2_move_choice].name = "⑁⚉"
                
                # change board status from unowned to player 2
                possible_moves[player2_move_choice].ownership = "player2"
                
                # change board piece to in play
                possible_moves[player2_move_choice].in_play = True
                
                try:
                    draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
                except:
                    print("error drawing board")
                    
                player2_cows_remaining -= 1
                player2_cows_in_play += 1
                
                break
                
            elif player2_move_choice == "rules":
                print_rules()
                
                try:
                    draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
                except:
                    print("error drawing board")
                
            elif player2_move_choice == "exit":
                return 1
            
            else:
                print("invalid move, please try again") 
                
            py_player2_move_choice = py_input("player two make your move: ")
            player2_move_choice = str(py_player2_move_choice)
                   
        print(String("player two chose {}").format(player2_move_choice))
        print(String("player two has {} cows remaining").format(player2_cows_remaining))
        print(String("player two has {} dead cow/s").format(player2_dead_cows))
        
        # test for a mill
        if check_for_mill(player2_move_choice, "player2", "player1", mill_list, possible_moves):
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
            except:
                print("error drawing board")
                
            print("player two has a mill")
            shoot_cow("player2", "player1", possible_moves)
            player1_dead_cows += 1
            player1_cows_in_play -= 1
        # END OF PLAYER 2 MOVE
    
    print("all living cows are now in play")
    print("")
    print("***MOVING PHASE***")
    
    print("to make a move, type 'current cow position' to 'new cow position' eg. f2 to g1")
    print("remember you can only move your cows to adjacent empty board positions")
    
    # START OF MOVING PHASE
    while player1_dead_cows < 9 or player2_dead_cows < 9:
        var move_to: String = ""
        # PLAYER ONE MOVE
        move_to = move_cow("player1", "player2", possible_moves, mill_list)
        # test for a mill
        if check_for_mill(move_to, "player1", "player2", mill_list, possible_moves):
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
            except:
                print("error drawing board")
                
            print("player one has a mill")
            shoot_cow("player1", "player2", possible_moves)
            player2_dead_cows += 1
            player2_cows_in_play -= 1
        # END OF PLAYER ONE MOVE
        
        # PLAYER TWO MOVE
        move_to = move_cow("player2", "player1", possible_moves, mill_list)
        # test for a mill
        if check_for_mill(move_to, "player2", "player1", mill_list, possible_moves):
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
            except:
                print("error drawing board")
                
            print("player two has a mill")
            shoot_cow("player2", "player1", possible_moves)
            player2_dead_cows += 1
            player2_cows_in_play -= 1
        # END OF PLAYER TWO MOVE
    # END OF MOVING PHASE
    
    # START OF FLYING PHASE
    # variables to keep track of move count (if a player doesn't shoot a cow within 10 moves it is a draw)
    var player1_move_count = 0
    var player2_move_count = 0
    
    print("a player has only three cows remaining")
    print("***FLYING PHASE***")
    
    # check to see who can fly
    if player1_dead_cows > 9:
        print("player one your cows can now fly to any free space")
    elif player2_dead_cows > 9:
        print("player two your cows can now fly to any free space")
        
    while player1_dead_cows < 10 or player2_dead_cows < 10:
        # PLAYER ONE MOVE
        fly_to = move_cow("player1", "player2", possible_moves, mill_list) if player1_dead_cows < 9 else fly_cow("player1", "player2", possible_moves, mill_list)
        player1_move_count += 1
        # test for a mill
        if check_for_mill(fly_to, "player1", "player2", mill_list, possible_moves):
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
            except:
                print("error drawing board")
                
            print("player one has a mill")
            shoot_cow("player1", "player2", possible_moves)
            player2_dead_cows += 1
            player2_cows_in_play -= 1
            player1_move_count -= 1
        # END OF PLAYER ONE MOVE
        
        # check to see who can fly
        if player1_dead_cows > 9 and player2_dead_cows > 9:
            print("both players' cows can now fly")
        
        # PLAYER TWO MOVE
        fly_to = move_cow("player2", "player1", possible_moves, mill_list) if player2_dead_cows < 9 else fly_cow("player2", "player1", possible_moves, mill_list)
        player2_move_count += 1
        # test for a mill
        if check_for_mill(fly_to, "player2", "player1", mill_list, possible_moves):
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"], possible_moves)
            except:
                print("error drawing board")
                
            print("player two has a mill")
            shoot_cow("player2", "player1", possible_moves)
            player2_dead_cows += 1
            player2_cows_in_play -= 1
            player2_move_count -= 1
        # END OF PLAYER TWO MOVE
        
        # check to see who can fly
        if player1_dead_cows > 9 and player2_dead_cows > 9:
            print("both players' cows can now fly")
    # END OF FLYING PHASE
    
    if player1_dead_cows == 10:
        print("player two only has two cows remaining")
        print("player one is the winner. ukuhalalisela!")
    elif player2_dead_cows == 10:
        print("player one only has two cows remaining")
        print("player two is the winner. ukuhalalisela!")
    elif player1_move_count == 10:
        print("player one hasn't shot a cow in ten moves")
        print("it's a draw")
    elif player2_move_count == 10:
        print("player two hasn't shot a cow in ten moves")
        print("it's a draw")
        
    print("thank-you for playing, hamba kahle")
    # end of program