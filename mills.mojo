from collections import List
from collections import Dict
from collections import InlineArray
from board_piece import Board_Piece

# def remove_item(inout row: List[String], item: String):
#     for i in range(len(row)):
#         if row[i] == item:
#             var removed_item = row.pop(i)
#             break
# 
# def test_for_mill(move: String, inout mill_list: List[List[String]], inout possible_moves: Dict[String, Board_Piece]) -> Bool:
#     for i in range(len(mill_list)):
#         remove_item(mill_list[i], move)
#         
#         # mark board position as in mill if position is alone in mill list
#         if len(mill_list[i]) == 0:
#             possible_moves[move].in_mill = True
#         
#         if not mill_list[i]:
#             # remove mill array from main list to stop player getting a mill every turn after getting 1 mill
#             var removed_item = mill_list.pop(i)
#             return True
#     
#     return False
    
def react_to_mill(player: String, opponent: String, inout choice: String, inout possible_moves: Dict[String, Board_Piece], inout dead_cows: Int, inout cows_in_play: Int) -> Bool:
    if not possible_moves[choice].in_mill:
        if choice in possible_moves and possible_moves[choice].ownership == player:
            possible_moves[choice].name = choice
            
            # change board piece status from impi to unowned
            possible_moves[choice].ownership = "unowned"
            
            print(String("you have shot {0}'s cow at position {1}").format(opponent, choice))
            dead_cows += 1
            cows_in_play -= 1
            
            return True
            
        else:
            return False
    else:
        print("you cannot shoot a cow in a mill, please make another choice")
        return False
    
    
    