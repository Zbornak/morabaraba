# 0. (0,0),               (0,3),               (0,6)
# 1.        (1,1),        (1,3),        (1,5)
# 2.               (2,2), (2,3), (2,4)
# 3. (3,0), (3,1), (3,2),        (3,4), (3,5), (3,6)
# 4.               (4,2), (4,3), (4,4)
# 5.        (5,1),        (5,3),        (5,5)
# 6. (6,0),               (6,3),               (6,6)

from memory.unsafe import Unsafe
from sys.primitives import StaticTuple

alias BOARD_SIZE = 7
alias EMPTY = 0

struct Board:
    var grid: StaticTuple[BOARD_SIZE, StaticTuple[BOARD_SIZE, Int]]

    fn init(inout self):
        self.grid = StaticTuple[BOARD_SIZE, StaticTuple[BOARD_SIZE, Int]].create_uninitialized()
        for i in range(BOARD_SIZE):
            self.grid[i] = StaticTuple[BOARD_SIZE, Int].create_uninitialized()
            for j in range(BOARD_SIZE):
                self.grid[i][j] = EMPTY

    fn is_valid_position(self, row: Int, col: Int) -> Bool:
        if row < 0 or row >= BOARD_SIZE or col < 0 or col >= BOARD_SIZE:
            return False
        if (row == 0 or row == 6) and (col == 0 or col == 3 or col == 6):
            return True
        if (row == 1 or row == 5) and (col == 1 or col == 3 or col == 5):
            return True
        if (row == 2 or row == 4) and (col == 2 or col == 3 or col == 4):
            return True
        if row == 3 and col != 3:
            return True
        return False

    fn print_board(self):
        for i in range(BOARD_SIZE):
            for j in range(BOARD_SIZE):
                if self.is_valid_position(i, j):
                    print(String("{:^3}").format(self.grid[i][j]), end="")
                else:
                    print("   ", end="")
            print()