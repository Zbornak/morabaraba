@value
struct Board_Piece:
    var name: String

    fn __init__(inout self, owned name: String):
        self.name = name^
