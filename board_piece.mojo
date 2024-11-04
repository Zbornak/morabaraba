from collections import InlineArray
from collections import List

@value
struct Board_Piece:
    var name: String
    var ownership: String
    var in_mill: Bool
    var member_of: List[InlineArray[String, 3]]

    fn __init__(inout self, owned name: String, owned ownership: String, owned in_mill: Bool, owned member_of: List[InlineArray[String, 3]]):
        self.name = name^
        self.ownership = ownership^
        self.in_mill = in_mill
        self.member_of = member_of^
        
    # be able to check name for equality
    fn __eq__(self, other: String) -> Bool:
    	return self.name == other
