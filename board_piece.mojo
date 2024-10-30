@value
struct Board_Piece:
    var name: String
    var ownership: String
    var in_mill: Bool

    fn __init__(inout self, owned name: String, owned ownership: String, owned in_mill: Bool):
        self.name = name^
        self.ownership = ownership^
        self.in_mill = in_mill
        
    # be able to check name for equality
    fn __eq__(self, other: String) -> Bool:
    	return self.name == other
