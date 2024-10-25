from collections import List

def remove_item(inout row: List[String], item: String):
    for i in range(len(row)):
        if row[i] == item:
            var removed_item = row.pop(i)
            break

def test_for_mill(move: String, inout mill_list: List[List[String]]) -> Bool:
    for i in range(len(mill_list)):
        remove_item(mill_list[i], move)
        
        if not mill_list[i]:
            var removed_item = mill_list.pop(i)
            return True
    
    return False