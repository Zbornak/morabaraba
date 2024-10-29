from collections import List
from collections import Dict
from board_piece import Board_Piece

def remove_item(inout row: List[String], item: String):
    for i in range(len(row)):
        if row[i] == item:
            var removed_item = row.pop(i)
            break

def test_for_mill(move: String, inout mill_list: List[List[String]]) -> Bool:
    for i in range(len(mill_list)):
        remove_item(mill_list[i], move)
        
        if not mill_list[i]:
            # remove mill array from main list to stop player getting a mill every turn after getting 1 mill
            var removed_item = mill_list.pop(i)
            return True
    
    return False
    
def react_to_mill(inout choice: String, inout possible_moves: Dict[String, Board_Piece], inout dead_cows: Int, inout cows_in_play: Int) -> Bool:
    if choice in possible_moves and possible_moves[choice].name != "⑁⚇" and possible_moves[choice].name == "⑁⚉":
        possible_moves[choice].name = choice
        print(String("you have shot Impi's cow at position {}").format(choice))
        dead_cows += 1
        cows_in_play -= 1
        
        return True
        
    else:
        return False
    
    
    