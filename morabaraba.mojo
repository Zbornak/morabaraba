# MORABARABA
# by Zbornak (2024), powered by Impi ai and Mojo
#     
#              (__)    
#       `------(><)
#        ||    (__)
#        ||w--||
#     
# A traditional 2-player strategy game from South Africa

from collections import Dict
from python import Python
from rules import print_rules
from intro import print_intro
from board_piece import Board_Piece
from board import draw_board
from random import randint

def main():
    var user_cows_remaining = 12
    var user_cows_in_play = 0
    var user_dead_cows = 0
    
    var impi_cows_remaining = 12
    var impi_cows_in_play = 0
    var impi_dead_cows = 0
    
    var possible_moves = Dict[String, Board_Piece]()
    possible_moves["a7"] = Board_Piece("a7")
    possible_moves["d7"] = Board_Piece("d7")
    possible_moves["g7"] = Board_Piece("g7")
    possible_moves["b6"] = Board_Piece("b6")
    possible_moves["d6"] = Board_Piece("d6")
    possible_moves["f6"] = Board_Piece("f6")
    possible_moves["c5"] = Board_Piece("c5")
    possible_moves["d5"] = Board_Piece("d5")
    possible_moves["e5"] = Board_Piece("e5")
    possible_moves["a4"] = Board_Piece("a4")
    possible_moves["b4"] = Board_Piece("b4")
    possible_moves["c4"] = Board_Piece("c4")
    possible_moves["e4"] = Board_Piece("e4")
    possible_moves["f4"] = Board_Piece("f4")
    possible_moves["g4"] = Board_Piece("g4")
    possible_moves["c3"] = Board_Piece("c3")
    possible_moves["d3"] = Board_Piece("d3")
    possible_moves["e3"] = Board_Piece("e3")
    possible_moves["b2"] = Board_Piece("b2")
    possible_moves["d2"] = Board_Piece("d2")
    possible_moves["f2"] = Board_Piece("f2")
    possible_moves["a1"] = Board_Piece("a1")
    possible_moves["d1"] = Board_Piece("d1")
    possible_moves["g1"] = Board_Piece("g1")

    print_intro()
    
    Python.add_to_path(".")
    py_input = Python.import_module("builtins").input
    
    try:
        draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
    except:
        print("error drawing board") 
    
    print("***PLACING PHASE***")
                     
    while user_cows_remaining > 0 and impi_cows_remaining > 0:
        # player makes their move       
        user_move_choice = py_input("make your move: ")
        choice = str(user_move_choice)
        # check to see if choice is valid and if you or impi aren't already on that spot
        if choice in possible_moves and possible_moves[choice].name != "⑁⚇" and possible_moves[choice].name != "⑁⚉":
            # change board position into a dark cow
            possible_moves[choice].name = "⑁⚇"
            
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
            except:
                print("error drawing board")
                
            user_cows_remaining -= 1
        else:
            print("invalid move, please try again") 
            continue
                   
        print(String("you chose {}").format(choice))
        print(String("you have {} cows remaining").format(user_cows_remaining))
                
        # impi makes it's move
        print("impi is considering its move...")
        
        # temporary impi 'ai'
        var impi_move_choice: String = "a1" 
        var chosen_letter: String = "a" 
        var chosen_num: String = "1" 
        
        var impi_choices = ["a1", "d1", "g1", "b2", "d2", "f2", "c3", "d3", "e3", "a4", "b4", "c4", "e4", "f4", "g4", "c5", "d5", "e5", "b6", "d6", "f6", "a7", "d7", "g7"]
        
        rnd = Python.import_module("random")
        
        chosen_location = str(rnd.choice(impi_choices))
        
        impi_move_choice = String("{}").format(chosen_location)
        
        # check to see if choice is valid and if you or impi aren't already on that spot
        if possible_moves[impi_move_choice].name != "⑁⚇" and possible_moves[impi_move_choice].name != "⑁⚉":
            # change board position into a light cow
            possible_moves[impi_move_choice].name = "⑁⚉"
            
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
            except:
                print("error drawing board")
            
            impi_cows_remaining -= 1
              
        print(String("Impi chose {0}").format(impi_move_choice)) 
        print(String("Impi has {} cows remaining").format(impi_cows_remaining))
    
    print("***MOOVING PHASE***")

    # end