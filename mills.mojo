from collections import List
from collections import Dict
from board_piece import Board_Piece

def remove_item(player: String, inout row: List[String], item: String, inout move_dictionary: Dict[String, Board_Piece]):
    for i in range(len(row)):
        if row[i] == item and move_dictionary[item].owner == player:
            var removed_item = row.pop(i)
            break

def test_for_mill(player: String, move: String, inout mill_list: List[List[String]], inout move_dictionary: Dict[String, Board_Piece]) -> Bool:
    for i in range(len(mill_list)):
        remove_item(player, mill_list[i], move, move_dictionary)
        
        if not mill_list[i]:
            if move_dictionary[move].owner == player:
                # remove mill array from main list to stop player getting a mill every turn after getting 1 mill
                var removed_item = mill_list.pop(i)
                return True
    
    return False