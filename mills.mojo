from board_piece import Board_Piece
from collections import List
from collections import Dict

@value
struct Mill:
    var mill: List[String]
    var counter: Int

    fn __init__(inout self, owned mill: List[String], owned counter: Int):
        self.mill = mill^
        self.counter = counter
        

def check_for_mill(move: String, inout mill_list: List[Mill], inout possible_moves: Dict[String, Board_Piece]) -> Bool:    
    for i in range(len(mill_list)):
        if move in mill_list[i].mill:
            mill_list[i].counter += 1
            if mill_list[i].counter > 2:
                possible_moves[move].in_mill = True
                return True
    return False
                
fn shoot_cow():
    print("MOO")