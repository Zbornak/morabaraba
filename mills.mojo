from board_piece import Board_Piece
from collections import InlineArray

# All possible mills(20)
var mill_12 = InlineArray[String, 3]("d5", "d6", "d7")
var mill_1 = InlineArray[String, 3]("e5", "f6", "g7")
var mill_3 = InlineArray[String, 3]("e4", "f4", "g4")
var mill_5 = InlineArray[String, 3]("e3", "f2", "g1")
var mill_6 = InlineArray[String, 3]("d1", "d2", "d3")
var mill_7 = InlineArray[String, 3]("a1", "b2", "c3")
var mill_9 = InlineArray[String, 3]("a4", "b4", "c4")
var mill_11 = InlineArray[String, 3]("c5", "b6", "a7")
var mill_TH = InlineArray[String, 3]("a7", "d7", "g7")
var mill_BH = InlineArray[String, 3]("a1", "d1", "g1")
var mill_VL = InlineArray[String, 3]("a1", "a4", "a7")
var mill_VR = InlineArray[String, 3]("g1", "g4", "g7")
var mill_MT = InlineArray[String, 3]("b6", "d6", "f6")
var mill_MB = InlineArray[String, 3]("b2", "d2", "f2")
var mill_ML = InlineArray[String, 3]("b2", "b4", "b6")
var mill_MR = InlineArray[String, 3]("f2", "f4", "f6")
var mill_CT = InlineArray[String, 3]("c5", "d5", "e5")
var mill_CB = InlineArray[String, 3]("c3", "d3", "e3")
var mill_CL = InlineArray[String, 3]("c3", "c4", "c5")
var mill_CR = InlineArray[String, 3]("e3", "e4", "e5")

var mill_list = List(mill_12, mill_1, mill_3, mill_5, mill_6, mill_7, mill_9, mill_11, mill_TH, mill_BH, mill_VL, mill_VR, mill_MT, mill_MB, mill_ML, mill_MR, mill_CT, mill_CB, mill_CL, mill_CR)

fn test_for_mill() -> Bool:
    