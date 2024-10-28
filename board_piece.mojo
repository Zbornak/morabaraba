@value
struct Board_Piece:
    var name: String

    fn __init__(inout self, owned name: String):
        self.name = name^
        
    # be able to check name for equality
    fn __eq__(self, other: String) -> Bool:
    	return self.name == other
