from board_piece import Board_Piece
from collections import Dict

fn draw_board(bp1: Board_Piece, bp2: Board_Piece, bp3: Board_Piece, bp4: Board_Piece, bp5: Board_Piece, bp6: Board_Piece, bp7: Board_Piece, bp8: Board_Piece, bp9: Board_Piece, bp10: Board_Piece, bp11: Board_Piece, bp12: Board_Piece, bp13: Board_Piece, bp14: Board_Piece, bp15: Board_Piece, bp16: Board_Piece, bp17: Board_Piece, bp18: Board_Piece, bp19: Board_Piece, bp20: Board_Piece, bp21: Board_Piece, bp22: Board_Piece, bp23: Board_Piece, bp24: Board_Piece, possible_moves: Dict[String, Board_Piece]) raises:
    
    print(String("""
    {2}---------------{14}---------------{23}
    | ⟍              |              ⟋ |
    |   ⟍            |            ⟋   |
    |    {5}----------{13}----------{20}   |
    |    | ⟍         |         ⟋ |    |
    |    |   ⟍       |       ⟋   |    |
    |    |    {8}-----{12}-----{17}   |    |
    |    |    |             |    |    |
    |    |    |             |    |    |
    {1}---{4}---{7}            {16}---{19}---{22}
    |    |    |             |    |    |
    |    |    |             |    |    |
    |    |   {6}------{11}-----{15}   |    |
    |    |   ⟋       |        ⟍  |    |
    |    | ⟋         |          ⟍|    |
    |    {3}----------{10}----------{18}   |
    |   ⟋            |             ⟍  |
    | ⟋              |               ⟍|     
    {0}---------------{9}---------------{21}
                                              """).format(bp1.name, bp2.name, bp3.name, bp4.name, bp5.name, bp6.name, bp7.name, bp8.name, bp9.name, bp10.name, bp11.name, bp12.name, bp13.name, bp14.name, bp15.name, bp16.name, bp17.name, bp18.name, bp19.name, bp20.name, bp21.name, bp22.name, bp23.name, bp24.name))
