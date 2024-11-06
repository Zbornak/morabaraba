@value
struct Mill:
    var mill: List[String]
    var counter: Int

    fn __init__(inout self, owned name: String, owned counter: Int):
        self.name = name^
        self.counter = counter
        
    # be able to check name for equality
    fn __eq__(self, other: String) -> Bool:
    	return self.name == other