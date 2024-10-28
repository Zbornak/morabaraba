@value
struct Board_Piece:
    var name: String
    # unowned, player, impi
    var owner: String

    fn __init__(inout self, owned name: String, owned owner: String):
        self.name = name^
        self.owner = owner^
        
    # be able to check name for equality
    fn __eq__(self, other: String) -> Bool:
    	return self.name == other
