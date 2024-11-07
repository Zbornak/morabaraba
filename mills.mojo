from board_piece import Board_Piece
from collections import List
from collections import Dict

def check_for_mill(move: String, player: String, mill_list: List[List[String]], inout possible_moves: Dict[String, Board_Piece]) -> Bool:    
    var move_mill_list = List[List[String]]()
    var pos0: Bool = False
    var pos1: Bool = False
    var pos2: Bool = False
    
    # add all mill lists that contain the player's move
    for mill in mill_list:
        if move in mill[]:
            move_mill_list.append(mill[])
            
    # toggle cows that are in a mill and controlled by player to true
    for found_mill in move_mill_list:
        for i in found_mill[]:
            if possible_moves[i[]].ownership == player:
                possible_moves[i[]].in_mill = True
        
        # check that all positions in mill are set to true
        pos0 = possible_moves[found_mill[][0]].in_mill
        pos1 = possible_moves[found_mill[][1]].in_mill
        pos2 = possible_moves[found_mill[][2]].in_mill
            
        if pos0 and pos1 and pos2:
            return True
    
    return False
                
fn shoot_cow():
    print("MOO")