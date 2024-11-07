from board_piece import Board_Piece
from collections import List
from collections import Dict

def check_for_mill(move: String, player: String, mill_list: List[List[String]], inout possible_moves: Dict[String, Board_Piece]) -> Bool:    
    var move_mill_list = List[List[String]]()
    
    for mill in mill_list:
        if move in mill[]:
            move_mill_list.append(mill[])
            
    for found_mill in move_mill_list:
        for i in found_mill[]:
            if i == move and possible_moves[move].ownership == player:
                possible_moves[move].in_mill = True
                
        var pos0 = str(found_mill[][0])
        var pos1 = str(found_mill[][1])
        var pos2 = str(found_mill[][2])
        
        if possible_moves[pos0].in_mill and possible_moves[pos1].in_mill and possible_moves[pos2].in_mill:
            return True

    return False
                
fn shoot_cow():
    print("MOO")