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
from mills import test_for_mill
from mills import react_to_mill

def main():
    var user_cows_remaining = 12
    var user_cows_in_play = 0
    var user_dead_cows = 0
    
    var impi_cows_remaining = 12
    var impi_cows_in_play = 0
    var impi_dead_cows = 0
    
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
    
    # All possible mills(20)
    var mill_12 = List[String]("d5", "d6", "d7")
    var mill_1 = List[String]("e5", "f6", "g7")
    var mill_3 = List[String]("e4", "f4", "g4")
    var mill_5 = List[String]("e3", "f2", "g1")
    var mill_6 = List[String]("d1", "d2", "d3")
    var mill_7 = List[String]("a1", "b2", "c3")
    var mill_9 = List[String]("a4", "b4", "c4")
    var mill_11 = List[String]("c5", "b6", "a7")
    var mill_TH = List[String]("a7", "d7", "g7")
    var mill_BH = List[String]("a1", "d1", "g1")
    var mill_VL = List[String]("a1", "a4", "a7")
    var mill_VR = List[String]("g1", "g4", "g7")
    var mill_MT = List[String]("b6", "d6", "f6")
    var mill_MB = List[String]("b2", "d2", "f2")
    var mill_ML = List[String]("b2", "b4", "b6")
    var mill_MR = List[String]("f2", "f4", "f6")
    var mill_CT = List[String]("c5", "d5", "e5")
    var mill_CB = List[String]("c3", "d3", "e3")
    var mill_CL = List[String]("c3", "c4", "c5")
    var mill_CR = List[String]("e3", "e4", "e5")
    var player_mill_list = List(mill_12, mill_1, mill_3, mill_5, mill_6, mill_7, mill_9, mill_11, mill_TH, mill_BH, mill_VL, mill_VR, mill_MT, mill_MB, mill_ML, mill_MR, mill_CT, mill_CB, mill_CL, mill_CR)

    var impi_mill_12 = List[String]("d5", "d6", "d7")
    var impi_mill_1 = List[String]("e5", "f6", "g7")
    var impi_mill_3 = List[String]("e4", "f4", "g4")
    var impi_mill_5 = List[String]("e3", "f2", "g1")
    var impi_mill_6 = List[String]("d1", "d2", "d3")
    var impi_mill_7 = List[String]("a1", "b2", "c3")
    var impi_mill_9 = List[String]("a4", "b4", "c4")
    var impi_mill_11 = List[String]("c5", "b6", "a7")
    var impi_mill_TH = List[String]("a7", "d7", "g7")
    var impi_mill_BH = List[String]("a1", "d1", "g1")
    var impi_mill_VL = List[String]("a1", "a4", "a7")
    var impi_mill_VR = List[String]("g1", "g4", "g7")
    var impi_mill_MT = List[String]("b6", "d6", "f6")
    var impi_mill_MB = List[String]("b2", "d2", "f2")
    var impi_mill_ML = List[String]("b2", "b4", "b6")
    var impi_mill_MR = List[String]("f2", "f4", "f6")
    var impi_mill_CT = List[String]("c5", "d5", "e5")
    var impi_mill_CB = List[String]("c3", "d3", "e3")
    var impi_mill_CL = List[String]("c3", "c4", "c5")
    var impi_mill_CR = List[String]("e3", "e4", "e5")
    var impi_mill_list = List(impi_mill_12, impi_mill_1, impi_mill_3, impi_mill_5, impi_mill_6, impi_mill_7, impi_mill_9, impi_mill_11, impi_mill_TH, impi_mill_BH, impi_mill_VL, impi_mill_VR, impi_mill_MT, impi_mill_MB, impi_mill_ML, impi_mill_MR, impi_mill_CT, impi_mill_CB, impi_mill_CL, impi_mill_CR)
    
    print_intro()
    
    Python.add_to_path(".")
    py_input = Python.import_module("builtins").input
    
    try:
        draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
    except:
        print("error drawing board") 
    
    print("***PLACING PHASE***")
    print("you control the dark cows (⑁⚇), Impi has the light cows (⑁⚉)")
    print("you go first")
                     
    while user_cows_remaining > 0 and impi_cows_remaining > 0:
        # START OF PLAYER MOVE      
        user_move_choice = py_input("make your move: ")
        choice = str(user_move_choice)
        
        # check to see if choice is valid and if you or impi aren't already on that spot
        if choice in possible_moves and possible_moves[choice].ownership == "unowned":
            # change board position into a dark cow
            possible_moves[choice].name = "⑁⚇"
            
            # change board status from unowned to player
            possible_moves[choice].ownership = "player"
            
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
            except:
                print("error drawing board")
                
            user_cows_remaining -= 1
            user_cows_in_play += 1
            
        elif choice == "rules":
            print_rules()
            
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
            except:
                print("error drawing board")
                
            continue
            
        elif choice == "exit":
            return 1
        
        else:
            print("invalid move, please try again") 
            continue
                   
        print(String("you chose {}").format(choice))
        print(String("{0} is now marked as owned by {1}").format(choice, possible_moves[choice].ownership))
        print(String("you have {} cows remaining").format(user_cows_remaining))
        
        # test for a mill
        while True:
            if not test_for_mill(choice, player_mill_list, possible_moves):
                break
    
            while True:
                py_user_shot_choice = py_input("you have a mill, choose a cow to shoot: ")
                user_shot_choice = str(py_user_shot_choice)
                
                if react_to_mill(user_shot_choice, possible_moves, impi_dead_cows, impi_cows_in_play):
                    print(String("{0} is now marked as {1}").format(user_shot_choice, possible_moves[user_shot_choice].ownership))
                    
                    # exit inner loop if a valid move is made
                    break  
                
                else:
                    print("invalid move, remember you can only shoot Impi's cows which are not currently in a mill")
    
            # valid move was made, break the outer loop
            break
        # END OF PLAYER MOVE
                
        # START OF IMPI MOVE
        print("impi is considering its move...")
        
        var impi_move_choice: String = ""
        
        while True:
            # temporary impi 'ai' 
            var chosen_letter: String = "a" 
            var chosen_num: String = "1" 
            
            var impi_choices = ["a1", "d1", "g1", "b2", "d2", "f2", "c3", "d3", "e3", "a4", "b4", "c4", "e4", "f4", "g4", "c5", "d5", "e5", "b6", "d6", "f6", "a7", "d7", "g7"]
            
            rnd = Python.import_module("random")
            
            chosen_location = str(rnd.choice(impi_choices))
            
            impi_move_choice = String("{}").format(chosen_location)
            
            # check to see if choice is valid and if you or impi aren't already on that spot
            if possible_moves[impi_move_choice].ownership == "unowned":
                # change board position into a light cow
                possible_moves[impi_move_choice].name = "⑁⚉"
                
                # change board piece status from unowned to impi
                possible_moves[impi_move_choice].ownership = "impi"
            
                impi_cows_remaining -= 1
                impi_cows_in_play += 1
                
                try:
                    draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
                except:
                    print("error drawing board")
                    
                break
                
            # test to see if counter is correct if impi chooses an invalid position   
            # print("Impi has made the wrong move, choosing again...")   
              
        print(String("Impi chose {0}").format(impi_move_choice)) 
        print(String("{0} is now marked as owned by {1}").format(impi_move_choice, possible_moves[impi_move_choice].ownership))
        print(String("Impi has {} cows remaining").format(impi_cows_remaining))
        
        # test for a mill
        if test_for_mill(impi_move_choice, impi_mill_list, possible_moves):
            print("impi has a mill")
            var impi_shot_choice: String = ""
            
            for item in possible_moves.items():
                if item[].value.name == "⑁⚇":
                    impi_shot_choice = item[].key
                    possible_moves[impi_shot_choice].name = impi_shot_choice
                    
                    # change board piece status from player to unowned
                    possible_moves[impi_shot_choice].ownership = "unowned"
                    
                    # stop impi from shooting all player cows after 1 mill
                    break
                    
            print(String("Impi has shot your cow at position {}").format(impi_shot_choice))
            print(String("{0} is now marked as {1}").format(impi_shot_choice, possible_moves[impi_shot_choice].ownership))
            user_dead_cows += 1
            user_cows_in_play -= 1
            
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
            except:
                print("error drawing board") 
                
        # END OF IMPI MOVE
    
    print("all living cows are now in play")
    print("")
    print("***MOOVING PHASE***")
    
    print("to make a move, type 'current cow position' to 'new cow position' eg. c4 to g1")
    print("remember you can only move your cows to adjacent empty board positions")
    print("make your move: ")

    # end of program