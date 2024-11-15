from board_piece import Board_Piece
from collections import Dict

# change color depending on if cow is in a mill or not
fn set_color(no_mill_color: String, mill_color: String, piece: Board_Piece) -> String:
    if piece.in_mill:
        return mill_color
    else:
        return no_mill_color

fn draw_board(bp1: Board_Piece, bp2: Board_Piece, bp3: Board_Piece, bp4: Board_Piece, bp5: Board_Piece, bp6: Board_Piece, bp7: Board_Piece, bp8: Board_Piece, bp9: Board_Piece, bp10: Board_Piece, bp11: Board_Piece, bp12: Board_Piece, bp13: Board_Piece, bp14: Board_Piece, bp15: Board_Piece, bp16: Board_Piece, bp17: Board_Piece, bp18: Board_Piece, bp19: Board_Piece, bp20: Board_Piece, bp21: Board_Piece, bp22: Board_Piece, bp23: Board_Piece, bp24: Board_Piece, possible_moves: Dict[String, Board_Piece]) raises:
    var cyan = "\033[96m"
    var mill = "\033[93m"
    var reset = "\033[0m"
    
    print(String("""
                  LIVE BOARD                                    REFERENCE BOARD
    
    {2}---------------{14}---------------{23}            a7---------------d7---------------g7
    | ⟍              |              ⟋ |             | ⟍              |              ⟋ |
    |   ⟍            |            ⟋   |             |   ⟍            |            ⟋   |
    |    {5}----------{13}----------{20}   |             |    b6----------d6----------f6   |
    |    | ⟍         |         ⟋ |    |             |    | ⟍         |         ⟋ |    |
    |    |   ⟍       |       ⟋   |    |             |    |   ⟍       |       ⟋   |    |
    |    |    {8}-----{12}-----{17}   |    |             |    |    c5-----d5-----e5   |    |
    |    |    |             |    |    |             |    |    |             |    |    |
    |    |    |             |    |    |             |    |    |             |    |    |
    {1}---{4}---{7}            {16}---{19}---{22}            a4---b4---c4            e4---f4---g4
    |    |    |             |    |    |             |    |    |             |    |    |
    |    |    |             |    |    |             |    |    |             |    |    |
    |    |   {6}------{11}-----{15}   |    |             |    |   c3------d3-----e3   |    |
    |    |   ⟋       |        ⟍  |    |             |    |   ⟋       |        ⟍  |    |
    |    | ⟋         |          ⟍|    |             |    | ⟋         |          ⟍|    |
    |    {3}----------{10}----------{18}   |             |    b2----------d2----------f2   |
    |   ⟋            |             ⟍  |             |   ⟋            |             ⟍  |
    | ⟋              |               ⟍|             | ⟋              |               ⟍|   
    {0}---------------{9}---------------{21}            a1---------------d1---------------g1
                                              """).format(
        set_color(cyan, mill, bp1) + bp1.name + reset, set_color(cyan, mill, bp2) + bp2.name + reset, set_color(cyan, mill, bp3) + bp3.name + reset, 
        set_color(cyan, mill, bp4) + bp4.name + reset, set_color(cyan, mill, bp5) + bp5.name + reset, set_color(cyan, mill, bp6) + bp6.name + reset, 
        set_color(cyan, mill, bp7) + bp7.name + reset, set_color(cyan, mill, bp8) + bp8.name + reset, set_color(cyan, mill, bp9) + bp9.name + reset, 
        set_color(cyan, mill, bp10) + bp10.name + reset, set_color(cyan, mill, bp11) + bp11.name + reset, set_color(cyan, mill, bp12) + bp12.name + reset, 
        set_color(cyan, mill, bp13) + bp13.name + reset, set_color(cyan, mill, bp14) + bp14.name + reset, set_color(cyan, mill, bp15) + bp15.name + reset,
        set_color(cyan, mill, bp16) + bp16.name + reset, set_color(cyan, mill, bp17) + bp17.name + reset, set_color(cyan, mill, bp18) + bp18.name + reset, 
        set_color(cyan, mill, bp19) + bp19.name + reset, set_color(cyan, mill, bp20) + bp20.name + reset, set_color(cyan, mill, bp21) + bp21.name + reset, 
        set_color(cyan, mill, bp22) + bp22.name + reset, set_color(cyan, mill, bp23) + bp23.name + reset, set_color(cyan, mill, bp24) + bp24.name + reset))