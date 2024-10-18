# MORABARABA
# by Zbornak (2024), powered by Impi ai
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
    user_cow_choice = py_input("dark or light cows (dark cows move first)? ")
    
    # player chooses which cows they want (light or dark)
    if user_cow_choice == "dark":
        print("you have chosen dark cows")
        try:
            draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
        except:
            print("error drawing board") 
    elif user_cow_choice == "light":
        print("you have chosen light cows")
        try:
            draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
        except:
            print("error drawing board")
    else:
        while user_cow_choice != "dark" and user_cow_choice != "light":
            print("invalid input, please try again")
            user_cow_choice = py_input("dark or light cows (dark cows move first)? ")
            if user_cow_choice == "dark":
                print("you have chosen dark cows")
                try:
                    draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
                except:
                    print("error drawing board")
            elif user_cow_choice == "light":
                print("you have chosen light cows")
                try:
                    draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
                except:
                    print("error drawing board")
         
    # player makes their move       
    if user_cow_choice == "dark":
        user_move_choice = py_input("make your move: ")
        choice = str(user_move_choice)
        if possible_moves.__contains__(choice):
            print("move accepted")
            # change board position into a dark cow
            possible_moves[choice].name = "⑁⚇"
            try:
                draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
            except:
                print("error drawing board")
        else:
            while choice not in possible_moves:
                print("invalid move, please try again") 
                user_move_choice = py_input("make your move: ")
                choice = str(user_move_choice)
                if possible_moves.__contains__(choice):
                    print("move accepted")
                    # change board position into a dark cow
                    possible_moves[choice].name = "⑁⚇"
                    try:
                        draw_board(possible_moves["a1"], possible_moves["a4"], possible_moves["a7"], possible_moves["b2"], possible_moves["b4"], possible_moves["b6"], possible_moves["c3"], possible_moves["c4"], possible_moves["c5"], possible_moves["d1"], possible_moves["d2"], possible_moves["d3"], possible_moves["d5"], possible_moves["d6"], possible_moves["d7"], possible_moves["e3"], possible_moves["e4"], possible_moves["e5"], possible_moves["f2"], possible_moves["f4"], possible_moves["f6"], possible_moves["g1"], possible_moves["g4"], possible_moves["g7"])
                    except:
                        print("error drawing board")              
    elif user_cow_choice == "light":
        print("impi is considering its move...")